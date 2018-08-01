# Julia wrapper for header: /usr/local/include/gdal_vrt.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0



"""
    VRTCreate(int,
              int) -> VRTDatasetH
"""
function VRTCreate(arg1::Cint, arg2::Cint)
    ccall((:VRTCreate, libgdal), VRTDatasetH, (Cint, Cint), arg1, arg2)
end


"""
    VRTFlushCache(VRTDatasetH) -> void
"""
function VRTFlushCache(arg1::VRTDatasetH)
    ccall((:VRTFlushCache, libgdal), Cvoid, (VRTDatasetH,), arg1)
end


"""
    VRTSerializeToXML(VRTDatasetH,
                      const char *) -> CPLXMLNode *
"""
function VRTSerializeToXML(arg1::VRTDatasetH, arg2)
    ccall((:VRTSerializeToXML, libgdal), Ptr{CPLXMLNode}, (VRTDatasetH, Cstring), arg1, arg2)
end


"""
    VRTAddBand(VRTDatasetH,
               GDALDataType,
               char **) -> int
"""
function VRTAddBand(arg1::VRTDatasetH, arg2::GDALDataType, arg3)
    ccall((:VRTAddBand, libgdal), Cint, (VRTDatasetH, GDALDataType, Ptr{Cstring}), arg1, arg2, arg3)
end


"""
    VRTAddSource(VRTSourcedRasterBandH,
                 VRTSourceH) -> CPLErr
"""
function VRTAddSource(arg1::VRTSourcedRasterBandH, arg2::VRTSourceH)
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
function VRTAddSimpleSource(arg1::VRTSourcedRasterBandH, arg2::GDALRasterBandH, arg3::Cint, arg4::Cint, arg5::Cint, arg6::Cint, arg7::Cint, arg8::Cint, arg9::Cint, arg10::Cint, arg11, arg12::Cdouble)
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
function VRTAddComplexSource(arg1::VRTSourcedRasterBandH, arg2::GDALRasterBandH, arg3::Cint, arg4::Cint, arg5::Cint, arg6::Cint, arg7::Cint, arg8::Cint, arg9::Cint, arg10::Cint, arg11::Cdouble, arg12::Cdouble, arg13::Cdouble)
    ccall((:VRTAddComplexSource, libgdal), CPLErr, (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
end


"""
    VRTAddFuncSource(VRTSourcedRasterBandH,
                     VRTImageReadFunc,
                     void *,
                     double) -> CPLErr
"""
function VRTAddFuncSource(arg1::VRTSourcedRasterBandH, arg2::VRTImageReadFunc, arg3, arg4::Cdouble)
    ccall((:VRTAddFuncSource, libgdal), CPLErr, (VRTSourcedRasterBandH, VRTImageReadFunc, Ptr{Cvoid}, Cdouble), arg1, arg2, arg3, arg4)
end
