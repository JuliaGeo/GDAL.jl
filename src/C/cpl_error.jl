# Julia wrapper for header: /usr/local/include/cpl_error.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0




"""
    CPLEmergencyError(const char * pszMessage) -> void

Fatal error when things are bad.

### Parameters
* **pszMessage**: the error message to report.
"""
function CPLEmergencyError(arg1::Ptr{UInt8})
    ccall((:CPLEmergencyError,libgdal),Void,(Ptr{UInt8},),arg1)
end


"""
    CPLErrorReset() -> void

Erase any traces of previous errors.
"""
function CPLErrorReset()
    ccall((:CPLErrorReset,libgdal),Void,())
end


"""
    CPLGetLastErrorNo() -> int

Fetch the last error number.

### Returns
the error number of the last error to occur, or CPLE_None (0) if there are no posted errors.
"""
function CPLGetLastErrorNo()
    ccall((:CPLGetLastErrorNo,libgdal),Cint,())
end


"""
    CPLGetLastErrorType() -> CPLErr

Fetch the last error type.

### Returns
the error type of the last error to occur, or CE_None (0) if there are no posted errors.
"""
function CPLGetLastErrorType()
    ccall((:CPLGetLastErrorType,libgdal),CPLErr,())
end


"""
    CPLGetLastErrorMsg() -> const char *

Get the last error message.

### Returns
the last error message, or NULL if there is no posted error message.
"""
function CPLGetLastErrorMsg()
    ccall((:CPLGetLastErrorMsg,libgdal),Ptr{UInt8},())
end


"""
    CPLGetErrorHandlerUserData(void) -> void *

Fetch the user data for the error context.

### Returns
the user data pointer for the error context
"""
function CPLGetErrorHandlerUserData()
    ccall((:CPLGetErrorHandlerUserData,libgdal),Ptr{Void},())
end


"""
    CPLErrorSetState(CPLErr eErrClass,
                     int err_no,
                     const char * pszMsg) -> void

Restore an error state, without emitting an error.
"""
function CPLErrorSetState(eErrClass::CPLErr,err_no::Cint,pszMsg::Ptr{UInt8})
    ccall((:CPLErrorSetState,libgdal),Void,(CPLErr,Cint,Ptr{UInt8}),eErrClass,err_no,pszMsg)
end


"""
    CPLCleanupErrorMutex() -> void
"""
function CPLCleanupErrorMutex()
    ccall((:CPLCleanupErrorMutex,libgdal),Void,())
end


"""
    CPLLoggingErrorHandler(CPLErr eErrClass,
                           int nError,
                           const char * pszErrorMsg) -> void
"""
function CPLLoggingErrorHandler(arg1::CPLErr,arg2::Cint,arg3::Ptr{UInt8})
    ccall((:CPLLoggingErrorHandler,libgdal),Void,(CPLErr,Cint,Ptr{UInt8}),arg1,arg2,arg3)
end


"""
    CPLDefaultErrorHandler(CPLErr eErrClass,
                           int nError,
                           const char * pszErrorMsg) -> void
"""
function CPLDefaultErrorHandler(arg1::CPLErr,arg2::Cint,arg3::Ptr{UInt8})
    ccall((:CPLDefaultErrorHandler,libgdal),Void,(CPLErr,Cint,Ptr{UInt8}),arg1,arg2,arg3)
end


"""
    CPLQuietErrorHandler(CPLErr eErrClass,
                         int nError,
                         const char * pszErrorMsg) -> void
"""
function CPLQuietErrorHandler(arg1::CPLErr,arg2::Cint,arg3::Ptr{UInt8})
    ccall((:CPLQuietErrorHandler,libgdal),Void,(CPLErr,Cint,Ptr{UInt8}),arg1,arg2,arg3)
end


"""
    CPLTurnFailureIntoWarning(int bOn) -> void
"""
function CPLTurnFailureIntoWarning(bOn::Cint)
    ccall((:CPLTurnFailureIntoWarning,libgdal),Void,(Cint,),bOn)
end


"""
    CPLSetErrorHandler(CPLErrorHandler pfnErrorHandlerNew) -> CPLErrorHandler

Install custom error handler.

### Parameters
* **pfnErrorHandlerNew**: new error handler function.

### Returns
returns the previously installed error handler.
"""
function CPLSetErrorHandler(arg1::CPLErrorHandler)
    ccall((:CPLSetErrorHandler,libgdal),CPLErrorHandler,(CPLErrorHandler,),arg1)
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
function CPLSetErrorHandlerEx(arg1::CPLErrorHandler,arg2::Ptr{Void})
    ccall((:CPLSetErrorHandlerEx,libgdal),CPLErrorHandler,(CPLErrorHandler,Ptr{Void}),arg1,arg2)
end


"""
    CPLPushErrorHandler(CPLErrorHandler pfnErrorHandlerNew) -> void

Push a new CPLError handler.

### Parameters
* **pfnErrorHandlerNew**: new error handler function.
"""
function CPLPushErrorHandler(arg1::CPLErrorHandler)
    ccall((:CPLPushErrorHandler,libgdal),Void,(CPLErrorHandler,),arg1)
end


"""
    CPLPushErrorHandlerEx(CPLErrorHandler pfnErrorHandlerNew,
                          void * pUserData) -> void

Push a new CPLError handler with user data on the error context.

### Parameters
* **pfnErrorHandlerNew**: new error handler function.
* **pUserData**: User data to put on the error context.
"""
function CPLPushErrorHandlerEx(arg1::CPLErrorHandler,arg2::Ptr{Void})
    ccall((:CPLPushErrorHandlerEx,libgdal),Void,(CPLErrorHandler,Ptr{Void}),arg1,arg2)
end


"""
    CPLPopErrorHandler() -> void

Pop error handler off stack.
"""
function CPLPopErrorHandler()
    ccall((:CPLPopErrorHandler,libgdal),Void,())
end


"""
    _CPLAssert(const char * pszExpression,
               const char * pszFile,
               int iLine) -> void

Report failure of a logical assertion.
"""
function _CPLAssert(arg1::Ptr{UInt8},arg2::Ptr{UInt8},arg3::Cint)
    ccall((:_CPLAssert,libgdal),Void,(Ptr{UInt8},Ptr{UInt8},Cint),arg1,arg2,arg3)
end
