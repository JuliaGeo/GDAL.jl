# Julia wrapper for header: /home/martijn/bin/gdal/include/cpl_progress.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0



"""
    GDALDummyProgress(double,
                      const char *,
                      void *) -> int

Stub progress function.
"""
function GDALDummyProgress(arg1::Cdouble,arg2::Ptr{UInt8},arg3::Ptr{Void})
    ccall((:GDALDummyProgress,libgdal),Cint,(Cdouble,Ptr{UInt8},Ptr{Void}),arg1,arg2,arg3)
end


"""
    GDALTermProgress(double dfComplete,
                     const char * pszMessage,
                     void *) -> int

Simple progress report to terminal.

### Parameters
* **dfComplete**: completion ratio from 0.0 to 1.0.
* **pszMessage**: optional message.
* **pProgressArg**: ignored callback data argument.

### Returns
Always returns TRUE indicating the process should continue.
"""
function GDALTermProgress(arg1::Cdouble,arg2::Ptr{UInt8},arg3::Ptr{Void})
    ccall((:GDALTermProgress,libgdal),Cint,(Cdouble,Ptr{UInt8},Ptr{Void}),arg1,arg2,arg3)
end


"""
    GDALScaledProgress(double dfComplete,
                       const char * pszMessage,
                       void * pData) -> int

Scaled progress transformer.
"""
function GDALScaledProgress(arg1::Cdouble,arg2::Ptr{UInt8},arg3::Ptr{Void})
    ccall((:GDALScaledProgress,libgdal),Cint,(Cdouble,Ptr{UInt8},Ptr{Void}),arg1,arg2,arg3)
end


"""
    GDALCreateScaledProgress(double dfMin,
                             double dfMax,
                             GDALProgressFunc pfnProgress,
                             void * pData) -> void *

Create scaled progress transformer.

### Parameters
* **dfMin**: the value to which 0.0 in the sub operation is mapped.
* **dfMax**: the value to which 1.0 is the sub operation is mapped.
* **pfnProgress**: the overall progress function.
* **pData**: the overall progress function callback data.

### Returns
pointer to pass as pProgressArg to sub functions. Should be freed with GDALDestroyScaledProgress().
"""
function GDALCreateScaledProgress(arg1::Cdouble,arg2::Cdouble,arg3::GDALProgressFunc,arg4::Ptr{Void})
    ccall((:GDALCreateScaledProgress,libgdal),Ptr{Void},(Cdouble,Cdouble,GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4)
end


"""
    GDALDestroyScaledProgress(void * pData) -> void

Cleanup scaled progress handle.

### Parameters
* **pData**: scaled progress handle returned by GDALCreateScaledProgress().
"""
function GDALDestroyScaledProgress(arg1::Ptr{Void})
    ccall((:GDALDestroyScaledProgress,libgdal),Void,(Ptr{Void},),arg1)
end
