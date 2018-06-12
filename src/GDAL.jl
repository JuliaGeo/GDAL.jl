__precompile__()

module GDAL

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("GDAL not installed properly, run Pkg.build(\"GDAL\"), restart Julia and try again")
end
include(depsjl_path)

# import these for their dynamic libraries, which libgdal needs
import CodecZlib
import Proj4
import LibGEOS

module C
    import GDAL: libgdal

    include("C/misc.jl")
    include("C/common.jl")
    include("C/cpl_conv.jl")
    include("C/cpl_error.jl")
    include("C/cpl_minixml.jl")
    include("C/cpl_progress.jl")
    include("C/cpl_virtualmem.jl")
    include("C/cpl_vsi.jl")
    include("C/gdal.jl")
    include("C/gdal_alg.jl")
    include("C/gdal_vrt.jl")
    include("C/gdal_utils.jl")
    include("C/gdalwarper.jl")
    include("C/ogr_api.jl")
    include("C/ogr_core.jl")
    include("C/ogr_srs_api.jl")
end

include("C/misc.jl")
include("types.jl")
include("common.jl")
include("gdal_h.jl")
include("gdal_alg.jl")
include("gdal_vrt.jl")
include("gdal_utils.jl")
include("ogr_api.jl")
include("ogr_srs_api.jl")
include("cpl_error.jl")

include("error.jl")

function __init__()
    Libdl.dlopen(CodecZlib.libz)
    Libdl.dlopen(Proj4.libproj)
    Libdl.dlopen(LibGEOS.libgeos_cpp)
    Libdl.dlopen(LibGEOS.libgeos)
    h = Libdl.dlopen(libgdal)
    finfo = Libdl.dlsym(h, :GDALVersionInfo)
    fconf = Libdl.dlsym(h, :CPLSetConfigOption)
    ferrh = Libdl.dlsym(h, :CPLSetErrorHandler)

    # Always check your dependencies from `deps.jl`
    check_deps()

    # register custom error handler
    funcptr = cfunction(gdaljl_errorhandler, Ptr{Void}, (CPLErr, Cint, Cstring))
    ccall(ferrh, Ptr{Void}, (Ptr{Void},), funcptr)

    # get GDAL version number
    versionstring = unsafe_string(ccall(finfo, Cstring, (Cstring,), "RELEASE_NAME"))
    global const GDALVERSION = convert(VersionNumber, versionstring)

    # set the GDAL_DATA variable
    GDAL_DATA = abspath(@__DIR__, "..", "deps", "usr", "share", "gdal")
    ccall(fconf, Void, (Cstring, Cstring), "GDAL_DATA", GDAL_DATA)
end

"""
Load a null-terminated list of strings

That is it expects a `StringList`, in the sense of the CPL functions,
as a null-terminated array of strings.
"""
function unsafe_loadstringlist(ptr::Ptr{Cstring})
    strings = Vector{String}()
    (ptr == C_NULL) && return strings
    i = 1
    cstring = unsafe_load(ptr, i)
    while cstring != C_NULL
        push!(strings, unsafe_string(cstring))
        i += 1
        cstring = unsafe_load(ptr, i)
    end
    strings
end

end # module
