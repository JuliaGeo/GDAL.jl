

"""
    CPLEmergencyError(const char * pszMessage) -> void

Fatal error when things are bad.

### Parameters
* **pszMessage**: the error message to report.
"""
function emergencyerror(arg1)
    ccall((:CPLEmergencyError, libgdal), Cvoid, (Cstring,), arg1)
end


"""
    CPLErrorReset() -> void

Erase any traces of previous errors.
"""
function errorreset()
    ccall((:CPLErrorReset, libgdal), Cvoid, ())
end


"""
    CPLGetLastErrorNo() -> CPLErrorNum

Fetch the last error number.

### Returns
the error number of the last error to occur, or CPLE_None (0) if there are no posted errors.
"""
function getlasterrorno()
    ccall((:CPLGetLastErrorNo, libgdal), CPLErrorNum, ())
end


"""
    CPLGetLastErrorType() -> CPLErr

Fetch the last error type.

### Returns
the error type of the last error to occur, or CE_None (0) if there are no posted errors.
"""
function getlasterrortype()
    ccall((:CPLGetLastErrorType, libgdal), CPLErr, ())
end


"""
    CPLGetLastErrorMsg() -> const char *

Get the last error message.

### Returns
the last error message, or NULL if there is no posted error message.
"""
function getlasterrormsg()
    unsafe_string(ccall((:CPLGetLastErrorMsg, libgdal), Cstring, ()))
end


"""
    CPLGetErrorHandlerUserData(void) -> void *

Fetch the user data for the error context.

### Returns
the user data pointer for the error context
"""
function geterrorhandleruserdata()
    ccall((:CPLGetErrorHandlerUserData, libgdal), Ptr{Cvoid}, ())
end


"""
    CPLErrorSetState(CPLErr eErrClass,
                     CPLErrorNum err_no,
                     const char * pszMsg) -> void

Restore an error state, without emitting an error.
"""
function errorsetstate(eErrClass::CPLErr, err_no::CPLErrorNum, pszMsg)
    ccall((:CPLErrorSetState, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), eErrClass, err_no, pszMsg)
end


"""
    CPLCleanupErrorMutex() -> void
"""
function cleanuperrormutex()
    ccall((:CPLCleanupErrorMutex, libgdal), Cvoid, ())
end


"""
    CPLLoggingErrorHandler(CPLErr eErrClass,
                           CPLErrorNum nError,
                           const char * pszErrorMsg) -> void

Error handler that logs into the file defined by the CPL_LOG configuration option, or stderr otherwise.
"""
function loggingerrorhandler(arg1::CPLErr, arg2::CPLErrorNum, arg3)
    ccall((:CPLLoggingErrorHandler, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), arg1, arg2, arg3)
end


"""
    CPLDefaultErrorHandler(CPLErr eErrClass,
                           CPLErrorNum nError,
                           const char * pszErrorMsg) -> void

Default error handler.
"""
function defaulterrorhandler(arg1::CPLErr, arg2::CPLErrorNum, arg3)
    ccall((:CPLDefaultErrorHandler, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), arg1, arg2, arg3)
end


"""
    CPLQuietErrorHandler(CPLErr eErrClass,
                         CPLErrorNum nError,
                         const char * pszErrorMsg) -> void

Error handler that does not do anything, except for debug messages.
"""
function quieterrorhandler(arg1::CPLErr, arg2::CPLErrorNum, arg3)
    ccall((:CPLQuietErrorHandler, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), arg1, arg2, arg3)
end


"""
    CPLTurnFailureIntoWarning(int bOn) -> void

Whether failures should be turned into warnings.
"""
function turnfailureintowarning(bOn::Integer)
    ccall((:CPLTurnFailureIntoWarning, libgdal), Cvoid, (Cint,), bOn)
end


"""
    CPLSetErrorHandler(CPLErrorHandler pfnErrorHandlerNew) -> CPLErrorHandler

Install custom error handler.

### Parameters
* **pfnErrorHandlerNew**: new error handler function.

### Returns
returns the previously installed error handler.
"""
function seterrorhandler(arg1::Ref{CPLErrorHandler})
    failsafe(ccall((:CPLSetErrorHandler, libgdal), Ptr{CPLErrorHandler}, (Ptr{Cvoid},), arg1))
end


"""
    CPLSetErrorHandlerEx(CPLErrorHandler pfnErrorHandlerNew,
                         void * pUserData) -> CPLErrorHandler

Install custom error handle with user's data.

### Parameters
* **pfnErrorHandlerNew**: new error handler function.
* **pUserData**: User data to carry along with the error context.

### Returns
returns the previously installed error handler.
"""
function seterrorhandlerex(arg1::Ref{CPLErrorHandler}, arg2)
    failsafe(ccall((:CPLSetErrorHandlerEx, libgdal), Ptr{CPLErrorHandler}, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2))
end


"""
    CPLPushErrorHandler(CPLErrorHandler pfnErrorHandlerNew) -> void

Push a new CPLError handler.

### Parameters
* **pfnErrorHandlerNew**: new error handler function.
"""
function pusherrorhandler(arg1::Ref{CPLErrorHandler})
    ccall((:CPLPushErrorHandler, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    CPLPushErrorHandlerEx(CPLErrorHandler pfnErrorHandlerNew,
                          void * pUserData) -> void

Push a new CPLError handler with user data on the error context.

### Parameters
* **pfnErrorHandlerNew**: new error handler function.
* **pUserData**: User data to put on the error context.
"""
function pusherrorhandlerex(arg1::Ref{CPLErrorHandler}, arg2)
    ccall((:CPLPushErrorHandlerEx, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    CPLSetCurrentErrorHandlerCatchDebug(int bCatchDebug) -> void

Set if the current error handler should intercept debug messages, or if they should be processed by the previous handler.

### Parameters
* **bCatchDebug**: FALSE if the current error handler should not intercept debug messages
"""
function setcurrenterrorhandlercatchdebug(bCatchDebug::Integer)
    ccall((:CPLSetCurrentErrorHandlerCatchDebug, libgdal), Cvoid, (Cint,), bCatchDebug)
end


"""
    CPLPopErrorHandler() -> void

Pop error handler off stack.
"""
function poperrorhandler()
    ccall((:CPLPopErrorHandler, libgdal), Cvoid, ())
end


"""
    _CPLAssert(const char * pszExpression,
               const char * pszFile,
               int iLine) -> void

Report failure of a logical assertion.
"""
function _cplassert(arg1, arg2, arg3::Integer)
    ccall((:_CPLAssert, libgdal), Cvoid, (Cstring, Cstring, Cint), arg1, arg2, arg3)
end
