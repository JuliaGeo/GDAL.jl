
errortype = Dict{UInt32, ASCIIString}(
    0 => "None",
    1 => "Debug",
    2 => "Warning",
    3 => "Failure",
    4 => "Fatal"
)

type GDALError <: Exception
    class::AbstractString
    code::Int
    msg::AbstractString
end

GDALError() = GDALError("", 0, "")
GDALError(msg::AbstractString) = GDALError("", 0, msg)

function Base.showerror(io::IO, err::GDALError)
    if err == GDALError()
        print(io, "GDALError")
    elseif err.class == "" && err.code == 0
        print(io, "GDALError\n\t$(err.msg)")
    else
        print(io, "GDALError ($(err.class), code $(err.code)):\n\t$(err.msg)")
    end
end

function gdaljl_errorhandler(errtype::UInt32, errno::Cint, errmsg::Ptr{UInt8})
    throw(GDALError(errortype[errtype], errno, bytestring(errmsg)))
    # it currently never returns but cfunction needs a guaranteed return type
    # return NULL to come back to the default behavior
    return C_NULL
end

function checknull(ptr)
    if ptr == C_NULL
        throw(GDALError("GDAL returned nothing"))
    end
    ptr
end
