# Julia wrapper for header: /usr/local/include/cpl_progress.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function GDALDummyProgress(arg1::Cdouble,arg2::Ptr{UInt8},arg3::Ptr{Void})
    ccall((:GDALDummyProgress,libgdal),Cint,(Cdouble,Ptr{UInt8},Ptr{Void}),arg1,arg2,arg3)
end

function GDALTermProgress(arg1::Cdouble,arg2::Ptr{UInt8},arg3::Ptr{Void})
    ccall((:GDALTermProgress,libgdal),Cint,(Cdouble,Ptr{UInt8},Ptr{Void}),arg1,arg2,arg3)
end

function GDALScaledProgress(arg1::Cdouble,arg2::Ptr{UInt8},arg3::Ptr{Void})
    ccall((:GDALScaledProgress,libgdal),Cint,(Cdouble,Ptr{UInt8},Ptr{Void}),arg1,arg2,arg3)
end

function GDALCreateScaledProgress(arg1::Cdouble,arg2::Cdouble,arg3::GDALProgressFunc,arg4::Ptr{Void})
    ccall((:GDALCreateScaledProgress,libgdal),Ptr{Void},(Cdouble,Cdouble,GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4)
end

function GDALDestroyScaledProgress(arg1::Ptr{Void})
    ccall((:GDALDestroyScaledProgress,libgdal),Void,(Ptr{Void},),arg1)
end
