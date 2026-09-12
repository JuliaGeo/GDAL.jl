
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
    # return C_NULL to suppress any error printing by gdal
    return C_NULL
end

"""
    check_errors

Whether wrapped GDAL calls inspect GDAL's error state, as a process-global
`Ref{Bool}` that defaults to `true`.

Every wrapper in `libgdal.jl` ends in `aftercare`, which calls `CPLGetLastErrorType`
and throws a `GDALError` on `CE_Failure`. That is one extra `ccall` per GDAL call,
which loops issuing millions of calls can opt out of:

    GDAL.check_errors[] = false
    # ... accessors whose failure the caller handles itself
    GDAL.check_errors[] = true

`without_error_checks` wraps that pattern and restores the flag on exception.

Two consequences are worth planning for:

- The flag is process-global, so every thread and task stops checking for as long
  as it is `false`.
- GDAL keeps accumulating its error state while checks are off, so the first checked
  call afterwards may throw a `GDALError` describing a failure from the unchecked
  region. Call `cplerrorreset()` to discard it.
"""
const check_errors = Ref(true)

"Check the last error type and throw a GDALError if it is a failure"
function maybe_throw()
    # Short-circuit: with checks enabled this is the original behaviour plus one
    # load; with checks disabled the CPLGetLastErrorType ccall is skipped.
    if check_errors[] && cplgetlasterrortype() >= CE_Failure
        throw(GDALError())
    end
    nothing
end

"""
    without_error_checks(f)

Run `f()` with GDAL error checking disabled, restoring `check_errors` to its previous
value afterwards, including when `f` throws.

    GDAL.without_error_checks() do
        for i in 1:n
            GDAL.ogr_f_getfid(features[i])
        end
    end

See `check_errors` for the scope of the flag and for the error state GDAL keeps
while checks are off.
"""
function without_error_checks(f)
    old = check_errors[]
    check_errors[] = false
    try
        f()
    finally
        check_errors[] = old
    end
end

"""
Handle anything returned from GDAL

When values are returned from GDAL, always check if there was a failure using `maybe_throw`.
If the failure was thrown by GDAL itself, it will not even get to `aftercare` and end up in
`gdaljl_errorhandler`. However in many cases even though GDAL sets the error state to `CE_Failure`
it will not throw the error. However we always do, to make sure not failure goes unnoticed.
If an error might be expected, one can use `try .. catch` to handle this.
`check_errors` turns the check off for loops that check failures themselves.

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
