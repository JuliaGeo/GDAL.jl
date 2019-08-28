
struct GDALError <: Exception
    class::CPLErr
    code::Cint
    msg::String
    # reset GDAL's error stack on construction
    function GDALError(class, code, msg)
        cplerrorreset()
        new(class, code, msg)
    end
end

function GDALError()
    class = cplgetlasterrortype()
    code = cplgetlasterrorno()
    msg = cplgetlasterrormsg()
    GDALError(class, code, msg)
end

function Base.showerror(io::IO, err::GDALError)
    err = string("GDALError (", err.class, ", code ", err.code, "):\n\t", err.msg)
    println(io, err)
end

"""The custom GDAL error handling function that we set in __init__

This function will get called by GDAL itself when it decides it wants to throw
an error. We turn the error into a GDALError and throw it from Julia. This allows
us to get GDALErrors that look similar to the ones that we throw when our own error
checking code decides it should throw.
"""
function gdaljl_errorhandler(class::CPLErr, errno::Cint, errmsg::Cstring)
    # function signature needs to match the one in __init__, and the signature
    # of the callback for a custom error handler in the GDAL docs
    if class === CE_Failure
        throw(GDALError(class, errno, unsafe_string(errmsg)))
    end
    return C_NULL
end

"Check the last error type and throw a GDALError if it is a failure"
function maybe_throw()
    if cplgetlasterrortype() === CE_Failure
        throw(GDALError())
    end
    nothing
end

"""
Handle anything returned from GDAL

When values are returned from GDAL, always check if there was a failure using `maybe_throw`.
If the failure was thrown by GDAL itself, it will not even get to `aftercare` and end up in
`gdaljl_errorhandler`. However in many cases even though GDAL sets the error state to `CE_Failure`
it will not throw the error. However we always do, to make sure not failure goes unnoticed.
If an error might be expected, one can use `try .. catch` to handle this.

Depending on the return type, we do extra work.
"""
function aftercare(x)
    maybe_throw()
    x
end

"For string pointers, load them to String, and free them if we should."
function aftercare(ptr::Cstring, free::Bool)
    maybe_throw()
    if ptr == C_NULL
        return nothing
    else
        s = unsafe_string(ptr)
        free && vsifree(convert(Ptr{Cvoid}, ptr))
        return s
    end
end

"""
For string list pointers, load them to Vector{String}

That is it expects a `StringList`, in the sense of the CPL functions,
as a null-terminated array of strings.
"""
function aftercare(ptr::Ptr{Cstring})
    maybe_throw()
    strings = Vector{String}()
    if ptr == C_NULL
        return strings
    end
    i = 1
    cstring = unsafe_load(ptr, i)
    while cstring != C_NULL
        push!(strings, unsafe_string(cstring))
        i += 1
        cstring = unsafe_load(ptr, i)
    end
    # TODO it seems that, like aftercare(::Cstring), we need to
    # free the memory ourselves with CSLDestroy (not currently wrapped)
    # not sure if that is true for some or all functions
    strings
end
