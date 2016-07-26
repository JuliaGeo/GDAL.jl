

"""
    GDALRegister_VRT(void) -> void
"""
function register_vrt()
    ccall((:GDALRegister_VRT,libgdal),Void,())
end


"""
    VRTCreate(int,
              int) -> VRTDatasetH
"""
function vrtcreate(arg1::Integer,arg2::Integer)
    checknull(ccall((:VRTCreate,libgdal),Ptr{VRTDatasetH},(Cint,Cint),arg1,arg2))
end


"""
    VRTFlushCache(VRTDatasetH) -> void
"""
function vrtflushcache(arg1::Ptr{VRTDatasetH})
    ccall((:VRTFlushCache,libgdal),Void,(Ptr{VRTDatasetH},),arg1)
end


"""
    VRTSerializeToXML(VRTDatasetH,
                      const char *) -> CPLXMLNode *
"""
function vrtserializetoxml(arg1::Ptr{VRTDatasetH},arg2)
    ccall((:VRTSerializeToXML,libgdal),Ptr{CPLXMLNode},(Ptr{VRTDatasetH},Cstring),arg1,arg2)
end


"""
    VRTAddBand(VRTDatasetH,
               GDALDataType,
               char **) -> int
"""
function vrtaddband(arg1::Ptr{VRTDatasetH},arg2::GDALDataType,arg3)
    ccall((:VRTAddBand,libgdal),Cint,(Ptr{VRTDatasetH},GDALDataType,StringList),arg1,arg2,arg3)
end


"""
    VRTAddSource(VRTSourcedRasterBandH,
                 VRTSourceH) -> CPLErr
"""
function vrtaddsource(arg1::Ptr{VRTSourcedRasterBandH},arg2::Ptr{VRTSourceH})
    ccall((:VRTAddSource,libgdal),CPLErr,(Ptr{VRTSourcedRasterBandH},Ptr{VRTSourceH}),arg1,arg2)
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
function vrtaddsimplesource{T <: GDALRasterBandH}(arg1::Ptr{VRTSourcedRasterBandH},arg2::Ptr{T},arg3::Integer,arg4::Integer,arg5::Integer,arg6::Integer,arg7::Integer,arg8::Integer,arg9::Integer,arg10::Integer,arg11,arg12::Real)
    ccall((:VRTAddSimpleSource,libgdal),CPLErr,(Ptr{VRTSourcedRasterBandH},Ptr{GDALRasterBandH},Cint,Cint,Cint,Cint,Cint,Cint,Cint,Cint,Cstring,Cdouble),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12)
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
function vrtaddcomplexsource{T <: GDALRasterBandH}(arg1::Ptr{VRTSourcedRasterBandH},arg2::Ptr{T},arg3::Integer,arg4::Integer,arg5::Integer,arg6::Integer,arg7::Integer,arg8::Integer,arg9::Integer,arg10::Integer,arg11::Real,arg12::Real,arg13::Real)
    ccall((:VRTAddComplexSource,libgdal),CPLErr,(Ptr{VRTSourcedRasterBandH},Ptr{GDALRasterBandH},Cint,Cint,Cint,Cint,Cint,Cint,Cint,Cint,Cdouble,Cdouble,Cdouble),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13)
end


"""
    VRTAddFuncSource(VRTSourcedRasterBandH,
                     VRTImageReadFunc,
                     void *,
                     double) -> CPLErr
"""
function vrtaddfuncsource(arg1::Ptr{VRTSourcedRasterBandH},arg2::Ptr{VRTImageReadFunc},arg3,arg4::Real)
    ccall((:VRTAddFuncSource,libgdal),CPLErr,(Ptr{VRTSourcedRasterBandH},Ptr{VRTImageReadFunc},Ptr{Void},Cdouble),arg1,arg2,arg3,arg4)
end
