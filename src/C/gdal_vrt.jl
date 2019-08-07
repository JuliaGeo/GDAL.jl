# Julia wrapper for header: gdal_vrt.h
# Automatically generated using Clang.jl

"""
    VRTCreate(int nXSize,
              int nYSize) -> VRTDatasetH
"""
function VRTCreate(arg1, arg2)
    ccall((:VRTCreate, libgdal), VRTDatasetH, (Cint, Cint), arg1, arg2)
end

"""
    VRTFlushCache(VRTDatasetH hDataset) -> void
"""
function VRTFlushCache(arg1)
    ccall((:VRTFlushCache, libgdal), Cvoid, (VRTDatasetH,), arg1)
end

"""
    VRTSerializeToXML(VRTDatasetH hDataset,
                      const char * pszVRTPath) -> CPLXMLNode *
"""
function VRTSerializeToXML(arg1, arg2)
    ccall((:VRTSerializeToXML, libgdal), Ptr{CPLXMLNode}, (VRTDatasetH, Cstring), arg1, arg2)
end

"""
    VRTAddBand(VRTDatasetH hDataset,
               GDALDataType eType,
               char ** papszOptions) -> int
"""
function VRTAddBand(arg1, arg2, arg3)
    ccall((:VRTAddBand, libgdal), Cint, (VRTDatasetH, GDALDataType, Ptr{Cstring}), arg1, arg2, arg3)
end

"""
    VRTAddSource(VRTSourcedRasterBandH hVRTBand,
                 VRTSourceH hNewSource) -> CPLErr
"""
function VRTAddSource(arg1, arg2)
    ccall((:VRTAddSource, libgdal), CPLErr, (VRTSourcedRasterBandH, VRTSourceH), arg1, arg2)
end

"""
    VRTAddSimpleSource(VRTSourcedRasterBandH hVRTBand,
                       GDALRasterBandH hSrcBand,
                       int nSrcXOff,
                       int nSrcYOff,
                       int nSrcXSize,
                       int nSrcYSize,
                       int nDstXOff,
                       int nDstYOff,
                       int nDstXSize,
                       int nDstYSize,
                       const char * pszResampling,
                       double dfNoDataValue) -> CPLErr
"""
function VRTAddSimpleSource(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
    ccall((:VRTAddSimpleSource, libgdal), CPLErr, (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cstring, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
end

"""
    VRTAddComplexSource(VRTSourcedRasterBandH hVRTBand,
                        GDALRasterBandH hSrcBand,
                        int nSrcXOff,
                        int nSrcYOff,
                        int nSrcXSize,
                        int nSrcYSize,
                        int nDstXOff,
                        int nDstYOff,
                        int nDstXSize,
                        int nDstYSize,
                        double dfScaleOff,
                        double dfScaleRatio,
                        double dfNoDataValue) -> CPLErr
"""
function VRTAddComplexSource(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
    ccall((:VRTAddComplexSource, libgdal), CPLErr, (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
end

"""
    VRTAddFuncSource(VRTSourcedRasterBandH hVRTBand,
                     VRTImageReadFunc pfnReadFunc,
                     void * pCBData,
                     double dfNoDataValue) -> CPLErr
"""
function VRTAddFuncSource(arg1, arg2, arg3, arg4)
    ccall((:VRTAddFuncSource, libgdal), CPLErr, (VRTSourcedRasterBandH, VRTImageReadFunc, Ptr{Cvoid}, Cdouble), arg1, arg2, arg3, arg4)
end
