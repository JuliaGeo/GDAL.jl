

"""
    VRTCreate(int,
              int) -> VRTDatasetH
"""
function vrtcreate(arg1::Integer, arg2::Integer)
    failsafe(ccall((:VRTCreate, libgdal), Ptr{VRTDatasetH}, (Cint, Cint), arg1, arg2))
end


"""
    VRTFlushCache(VRTDatasetH) -> void
"""
function vrtflushcache(arg1::Ref{VRTDatasetH})
    ccall((:VRTFlushCache, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    VRTSerializeToXML(VRTDatasetH,
                      const char *) -> CPLXMLNode *
"""
function vrtserializetoxml(arg1::Ref{VRTDatasetH}, arg2)
    ccall((:VRTSerializeToXML, libgdal), Ptr{CPLXMLNode}, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    VRTAddBand(VRTDatasetH,
               GDALDataType,
               char **) -> int
"""
function vrtaddband(arg1::Ref{VRTDatasetH}, arg2::GDALDataType, arg3)
    ccall((:VRTAddBand, libgdal), Cint, (Ptr{Cvoid}, GDALDataType, Ptr{Cstring}), arg1, arg2, arg3)
end


"""
    VRTAddSource(VRTSourcedRasterBandH,
                 VRTSourceH) -> CPLErr
"""
function vrtaddsource(arg1::Ref{VRTSourcedRasterBandH}, arg2::Ref{VRTSourceH})
    ccall((:VRTAddSource, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
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
function vrtaddsimplesource(arg1::Ref{VRTSourcedRasterBandH}, arg2::Ref{GDALRasterBandH}, arg3::Integer, arg4::Integer, arg5::Integer, arg6::Integer, arg7::Integer, arg8::Integer, arg9::Integer, arg10::Integer, arg11, arg12::Real)
    ccall((:VRTAddSimpleSource, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cstring, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
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
function vrtaddcomplexsource(arg1::Ref{VRTSourcedRasterBandH}, arg2::Ref{GDALRasterBandH}, arg3::Integer, arg4::Integer, arg5::Integer, arg6::Integer, arg7::Integer, arg8::Integer, arg9::Integer, arg10::Integer, arg11::Real, arg12::Real, arg13::Real)
    ccall((:VRTAddComplexSource, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
end


"""
    VRTAddFuncSource(VRTSourcedRasterBandH,
                     VRTImageReadFunc,
                     void *,
                     double) -> CPLErr
"""
function vrtaddfuncsource(arg1::Ref{VRTSourcedRasterBandH}, arg2::Ref{VRTImageReadFunc}, arg3, arg4::Real)
    ccall((:VRTAddFuncSource, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cdouble), arg1, arg2, arg3, arg4)
end
