# Wrappers copy a returned string in `aftercare`, after the ccall has returned. Check that
# what the string can point into is still alive then, by forcing the collection that the
# allocations in `aftercare` can trigger. It is run in a separate process by strings.jl.

using GDAL
using Test

@eval GDAL function maybe_throw()
    GC.gc()
    if cplgetlasterrortype() >= CE_Failure
        throw(GDALError())
    end
    nothing
end

# an argument whose finalizer frees the GDAL object that owns the returned string
mutable struct Owner
    ptr::Ptr{Cvoid}
end
Base.unsafe_convert(::Type{Ptr{Cvoid}}, o::Owner) = o.ptr
owner(ptr) = finalizer(o -> GDAL.ogr_f_destroy(o.ptr), Owner(ptr))

# an argument that `cconvert` turns into a temporary, like a String for a SubString, here
# with a finalizer that overwrites the bytes to not depend on the memory being reused
struct Converted
    s::String
end
mutable struct Temporary
    bytes::Vector{UInt8}
end
function Base.cconvert(::Type{Cstring}, c::Converted)
    finalizer(Temporary([codeunits(c.s); 0x00])) do t
        fill!(t.bytes, UInt8('#'))
        t.bytes[end] = 0x00
    end
end
Base.cconvert(::Type{Cstring}, t::Temporary) = t
Base.unsafe_convert(::Type{Cstring}, t::Temporary) = Cstring(pointer(t.bytes))

@noinline fieldstring(ptr) = GDAL.ogr_f_getfieldasstring(owner(ptr), 0)
@noinline fieldstringlist(ptr) = GDAL.ogr_f_getfieldasstringlist(owner(ptr), 1)
@noinline lowercased(s) = GDAL.cplstrlwr(s)
@noinline filename(s) = GDAL.cplgetfilename(s)

@testset "String lifetime" begin
    fd = GDAL.ogr_fd_create("layer")
    GDAL.ogr_fd_addfielddefn(fd, GDAL.ogr_fld_create("name", GDAL.OFTString))
    GDAL.ogr_fd_addfielddefn(fd, GDAL.ogr_fld_create("names", GDAL.OFTStringList))
    function feature()
        f = GDAL.ogr_f_create(fd)
        GDAL.ogr_f_setfieldstring(f, 0, "a string owned by the feature")
        GDAL.ogr_f_setfieldstringlist(f, 1, ["a list owned by", "the feature"])
        return f
    end
    @test fieldstring(feature()) == "a string owned by the feature"
    @test fieldstringlist(feature()) == ["a list owned by", "the feature"]

    @test lowercased(Converted("ABCDEFGH")) == "abcdefgh"
    @test filename(Converted("/dir/file.tif")) == "file.tif"
    @test lowercased(SubString("ABCDEFGH-", 1, 8)) == "abcdefgh"
end
