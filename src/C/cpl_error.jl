# Julia wrapper for header: /usr/local/include/cpl_error.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0



function CPLEmergencyError(arg1::Ptr{UInt8})
    ccall((:CPLEmergencyError,libgdal),Void,(Ptr{UInt8},),arg1)
end

function CPLErrorReset()
    ccall((:CPLErrorReset,libgdal),Void,())
end

function CPLGetLastErrorNo()
    ccall((:CPLGetLastErrorNo,libgdal),Cint,())
end

function CPLGetLastErrorType()
    ccall((:CPLGetLastErrorType,libgdal),CPLErr,())
end

function CPLGetLastErrorMsg()
    ccall((:CPLGetLastErrorMsg,libgdal),Ptr{UInt8},())
end

function CPLGetErrorHandlerUserData()
    ccall((:CPLGetErrorHandlerUserData,libgdal),Ptr{Void},())
end

function CPLErrorSetState(eErrClass::CPLErr,err_no::Cint,pszMsg::Ptr{UInt8})
    ccall((:CPLErrorSetState,libgdal),Void,(CPLErr,Cint,Ptr{UInt8}),eErrClass,err_no,pszMsg)
end

function CPLCleanupErrorMutex()
    ccall((:CPLCleanupErrorMutex,libgdal),Void,())
end

function CPLLoggingErrorHandler(arg1::CPLErr,arg2::Cint,arg3::Ptr{UInt8})
    ccall((:CPLLoggingErrorHandler,libgdal),Void,(CPLErr,Cint,Ptr{UInt8}),arg1,arg2,arg3)
end

function CPLDefaultErrorHandler(arg1::CPLErr,arg2::Cint,arg3::Ptr{UInt8})
    ccall((:CPLDefaultErrorHandler,libgdal),Void,(CPLErr,Cint,Ptr{UInt8}),arg1,arg2,arg3)
end

function CPLQuietErrorHandler(arg1::CPLErr,arg2::Cint,arg3::Ptr{UInt8})
    ccall((:CPLQuietErrorHandler,libgdal),Void,(CPLErr,Cint,Ptr{UInt8}),arg1,arg2,arg3)
end

function CPLTurnFailureIntoWarning(bOn::Cint)
    ccall((:CPLTurnFailureIntoWarning,libgdal),Void,(Cint,),bOn)
end

function CPLSetErrorHandler(arg1::CPLErrorHandler)
    ccall((:CPLSetErrorHandler,libgdal),CPLErrorHandler,(CPLErrorHandler,),arg1)
end

function CPLSetErrorHandlerEx(arg1::CPLErrorHandler,arg2::Ptr{Void})
    ccall((:CPLSetErrorHandlerEx,libgdal),CPLErrorHandler,(CPLErrorHandler,Ptr{Void}),arg1,arg2)
end

function CPLPushErrorHandler(arg1::CPLErrorHandler)
    ccall((:CPLPushErrorHandler,libgdal),Void,(CPLErrorHandler,),arg1)
end

function CPLPushErrorHandlerEx(arg1::CPLErrorHandler,arg2::Ptr{Void})
    ccall((:CPLPushErrorHandlerEx,libgdal),Void,(CPLErrorHandler,Ptr{Void}),arg1,arg2)
end

function CPLPopErrorHandler()
    ccall((:CPLPopErrorHandler,libgdal),Void,())
end

function _CPLAssert(arg1::Ptr{UInt8},arg2::Ptr{UInt8},arg3::Cint)
    ccall((:_CPLAssert,libgdal),Void,(Ptr{UInt8},Ptr{UInt8},Cint),arg1,arg2,arg3)
end
