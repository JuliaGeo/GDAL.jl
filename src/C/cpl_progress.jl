# Julia wrapper for header: cpl_progress.h
# Automatically generated using Clang.jl

"""
    GDALDummyProgress(double,
                      const char *,
                      void *) -> int

Stub progress function.
"""
function GDALDummyProgress(arg1, arg2, arg3)
    ccall((:GDALDummyProgress, libgdal), Cint, (Cdouble, Cstring, Ptr{Cvoid}), arg1, arg2, arg3)
end

"""
    GDALTermProgress(double dfComplete,
                     const char * pszMessage,
                     void * pProgressArg) -> int

Simple progress report to terminal.

### Parameters
* **dfComplete**: completion ratio from 0.0 to 1.0.
* **pszMessage**: optional message.
* **pProgressArg**: ignored callback data argument.

### Returns
Always returns TRUE indicating the process should continue.
"""
function GDALTermProgress(arg1, arg2, arg3)
    ccall((:GDALTermProgress, libgdal), Cint, (Cdouble, Cstring, Ptr{Cvoid}), arg1, arg2, arg3)
end

"""
    GDALScaledProgress(double dfComplete,
                       const char * pszMessage,
                       void * pData) -> int

Scaled progress transformer.
"""
function GDALScaledProgress(arg1, arg2, arg3)
    ccall((:GDALScaledProgress, libgdal), Cint, (Cdouble, Cstring, Ptr{Cvoid}), arg1, arg2, arg3)
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
function GDALCreateScaledProgress(arg1, arg2, arg3, arg4)
    ccall((:GDALCreateScaledProgress, libgdal), Ptr{Cvoid}, (Cdouble, Cdouble, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4)
end

"""
    GDALDestroyScaledProgress(void * pData) -> void

Cleanup scaled progress handle.

### Parameters
* **pData**: scaled progress handle returned by GDALCreateScaledProgress().
"""
function GDALDestroyScaledProgress(arg1)
    ccall((:GDALDestroyScaledProgress, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end
