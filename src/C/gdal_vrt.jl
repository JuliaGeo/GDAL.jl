# Julia wrapper for header: gdal_vrt.h
# Automatically generated using Clang.jl

"""
    VRTCreate(int,
              int) -> VRTDatasetH
"""
function VRTCreate(arg1, arg2)
    ccall((:VRTCreate, libgdal), VRTDatasetH, (Cint, Cint), arg1, arg2)
end

"""
    VRTFlushCache(VRTDatasetH) -> void
"""
function VRTFlushCache(arg1)
    ccall((:VRTFlushCache, libgdal), Cvoid, (VRTDatasetH,), arg1)
end

"""
    VRTSerializeToXML(VRTDatasetH,
                      const char *) -> CPLXMLNode *
"""
function VRTSerializeToXML(arg1, arg2)
    ccall((:VRTSerializeToXML, libgdal), Ptr{CPLXMLNode}, (VRTDatasetH, Cstring), arg1, arg2)
end

"""
    VRTAddBand(VRTDatasetH,
               GDALDataType,
               char **) -> int
"""
function VRTAddBand(arg1, arg2, arg3)
    ccall((:VRTAddBand, libgdal), Cint, (VRTDatasetH, GDALDataType, Ptr{Cstring}), arg1, arg2, arg3)
end

"""
    VRTAddSource(VRTSourcedRasterBandH,
                 VRTSourceH) -> CPLErr
"""
function VRTAddSource(arg1, arg2)
    ccall((:VRTAddSource, libgdal), CPLErr, (VRTSourcedRasterBandH, VRTSourceH), arg1, arg2)
end

"""
    VRTAddSimpleSource(VRTSourcedRasterBandH,
                       GDALRasterBandH,
                       int,
                       int,
                       int,
                       int,
                       int,
                       int,
                       int,
                       int,
                       const char *,
                       double) -> CPLErr
"""
function VRTAddSimpleSource(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
    ccall((:VRTAddSimpleSource, libgdal), CPLErr, (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cstring, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
end

"""
    VRTAddComplexSource(VRTSourcedRasterBandH,
                        GDALRasterBandH,
                        int,
                        int,
                        int,
                        int,
                        int,
                        int,
                        int,
                        int,
                        double,
                        double,
                        double) -> CPLErr
"""
function VRTAddComplexSource(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
    ccall((:VRTAddComplexSource, libgdal), CPLErr, (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
end

"""
    VRTAddFuncSource(VRTSourcedRasterBandH,
                     VRTImageReadFunc,
                     void *,
                     double) -> CPLErr
"""
function VRTAddFuncSource(arg1, arg2, arg3, arg4)
    ccall((:VRTAddFuncSource, libgdal), CPLErr, (VRTSourcedRasterBandH, VRTImageReadFunc, Ptr{Cvoid}, Cdouble), arg1, arg2, arg3, arg4)
end
