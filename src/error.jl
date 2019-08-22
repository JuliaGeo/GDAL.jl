
struct GDALError <: Exception
    class::CPLErr
    code::Cint
    msg::String
end

function GDALError()
    class = cplgetlasterrortype()
    code = cplgetlasterrorno()
    msg = cplgetlasterrormsg()
    cplerrorreset()
    GDALError(class, code, msg)
end

const throw_class = (CE_Failure, CE_Fatal)

function Base.showerror(io::IO, err::GDALError)
    err = string("GDALError (", err.class, ", code ", err.code, "):\n\t", err.msg)
    println(io, err)
end

function gdaljl_errorhandler(class::CPLErr, errno::Cint, errmsg::Cstring)
    # function signature needs to match the one in __init__, and the signature
    # of the callback for a custom error handler in the GDAL docs
    if class in throw_class
        msg = unsafe_string(errmsg)
        cplerrorreset()
        throw(GDALError(class, errno, msg))
    end
    return C_NULL
end

"Throw an error if a pointer is null and GDAL reports an error"
function failsafe(ptr)
    if ptr == C_NULL && cplgetlasterrortype() in throw_class
        throw(GDALError())
    end
    ptr
end
