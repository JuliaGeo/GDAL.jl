# Julia wrapper for header: /usr/local/include/gdalwarper.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function GDALWarpNoDataMasker(pMaskFuncArg::Ptr{Void},nBandCount::Cint,eType::GDALDataType,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,papabyImageData::Ptr{Ptr{GByte}},bMaskIsFloat::Cint,pValidityMask::Ptr{Void},pbOutAllValid::Ptr{Cint})
    ccall((:GDALWarpNoDataMasker,libgdal),CPLErr,(Ptr{Void},Cint,GDALDataType,Cint,Cint,Cint,Cint,Ptr{Ptr{GByte}},Cint,Ptr{Void},Ptr{Cint}),pMaskFuncArg,nBandCount,eType,nXOff,nYOff,nXSize,nYSize,papabyImageData,bMaskIsFloat,pValidityMask,pbOutAllValid)
end

function GDALWarpDstAlphaMasker(pMaskFuncArg::Ptr{Void},nBandCount::Cint,eType::GDALDataType,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,arg1::Ptr{Ptr{GByte}},bMaskIsFloat::Cint,pValidityMask::Ptr{Void})
    ccall((:GDALWarpDstAlphaMasker,libgdal),CPLErr,(Ptr{Void},Cint,GDALDataType,Cint,Cint,Cint,Cint,Ptr{Ptr{GByte}},Cint,Ptr{Void}),pMaskFuncArg,nBandCount,eType,nXOff,nYOff,nXSize,nYSize,arg1,bMaskIsFloat,pValidityMask)
end

function GDALWarpSrcAlphaMasker(pMaskFuncArg::Ptr{Void},nBandCount::Cint,eType::GDALDataType,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,arg1::Ptr{Ptr{GByte}},bMaskIsFloat::Cint,pValidityMask::Ptr{Void},pbOutAllOpaque::Ptr{Cint})
    ccall((:GDALWarpSrcAlphaMasker,libgdal),CPLErr,(Ptr{Void},Cint,GDALDataType,Cint,Cint,Cint,Cint,Ptr{Ptr{GByte}},Cint,Ptr{Void},Ptr{Cint}),pMaskFuncArg,nBandCount,eType,nXOff,nYOff,nXSize,nYSize,arg1,bMaskIsFloat,pValidityMask,pbOutAllOpaque)
end

function GDALWarpSrcMaskMasker(pMaskFuncArg::Ptr{Void},nBandCount::Cint,eType::GDALDataType,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,arg1::Ptr{Ptr{GByte}},bMaskIsFloat::Cint,pValidityMask::Ptr{Void})
    ccall((:GDALWarpSrcMaskMasker,libgdal),CPLErr,(Ptr{Void},Cint,GDALDataType,Cint,Cint,Cint,Cint,Ptr{Ptr{GByte}},Cint,Ptr{Void}),pMaskFuncArg,nBandCount,eType,nXOff,nYOff,nXSize,nYSize,arg1,bMaskIsFloat,pValidityMask)
end

function GDALWarpCutlineMasker(pMaskFuncArg::Ptr{Void},nBandCount::Cint,eType::GDALDataType,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,arg1::Ptr{Ptr{GByte}},bMaskIsFloat::Cint,pValidityMask::Ptr{Void})
    ccall((:GDALWarpCutlineMasker,libgdal),CPLErr,(Ptr{Void},Cint,GDALDataType,Cint,Cint,Cint,Cint,Ptr{Ptr{GByte}},Cint,Ptr{Void}),pMaskFuncArg,nBandCount,eType,nXOff,nYOff,nXSize,nYSize,arg1,bMaskIsFloat,pValidityMask)
end

function GDALCreateWarpOptions()
    ccall((:GDALCreateWarpOptions,libgdal),Ptr{GDALWarpOptions},())
end

function GDALDestroyWarpOptions(arg1::Ptr{GDALWarpOptions})
    ccall((:GDALDestroyWarpOptions,libgdal),Void,(Ptr{GDALWarpOptions},),arg1)
end

function GDALCloneWarpOptions(arg1::Ptr{GDALWarpOptions})
    ccall((:GDALCloneWarpOptions,libgdal),Ptr{GDALWarpOptions},(Ptr{GDALWarpOptions},),arg1)
end

function GDALSerializeWarpOptions(arg1::Ptr{GDALWarpOptions})
    ccall((:GDALSerializeWarpOptions,libgdal),Ptr{CPLXMLNode},(Ptr{GDALWarpOptions},),arg1)
end

function GDALDeserializeWarpOptions(arg1::Ptr{CPLXMLNode})
    ccall((:GDALDeserializeWarpOptions,libgdal),Ptr{GDALWarpOptions},(Ptr{CPLXMLNode},),arg1)
end

function GDALReprojectImage(hSrcDS::GDALDatasetH,pszSrcWKT::Ptr{UInt8},hDstDS::GDALDatasetH,pszDstWKT::Ptr{UInt8},eResampleAlg::GDALResampleAlg,dfWarpMemoryLimit::Cdouble,dfMaxError::Cdouble,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void},psOptions::Ptr{GDALWarpOptions})
    ccall((:GDALReprojectImage,libgdal),CPLErr,(GDALDatasetH,Ptr{UInt8},GDALDatasetH,Ptr{UInt8},GDALResampleAlg,Cdouble,Cdouble,GDALProgressFunc,Ptr{Void},Ptr{GDALWarpOptions}),hSrcDS,pszSrcWKT,hDstDS,pszDstWKT,eResampleAlg,dfWarpMemoryLimit,dfMaxError,pfnProgress,pProgressArg,psOptions)
end

function GDALCreateAndReprojectImage(hSrcDS::GDALDatasetH,pszSrcWKT::Ptr{UInt8},pszDstFilename::Ptr{UInt8},pszDstWKT::Ptr{UInt8},hDstDriver::GDALDriverH,papszCreateOptions::Ptr{Ptr{UInt8}},eResampleAlg::GDALResampleAlg,dfWarpMemoryLimit::Cdouble,dfMaxError::Cdouble,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void},psOptions::Ptr{GDALWarpOptions})
    ccall((:GDALCreateAndReprojectImage,libgdal),CPLErr,(GDALDatasetH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8},GDALDriverH,Ptr{Ptr{UInt8}},GDALResampleAlg,Cdouble,Cdouble,GDALProgressFunc,Ptr{Void},Ptr{GDALWarpOptions}),hSrcDS,pszSrcWKT,pszDstFilename,pszDstWKT,hDstDriver,papszCreateOptions,eResampleAlg,dfWarpMemoryLimit,dfMaxError,pfnProgress,pProgressArg,psOptions)
end

function GDALAutoCreateWarpedVRT(hSrcDS::GDALDatasetH,pszSrcWKT::Ptr{UInt8},pszDstWKT::Ptr{UInt8},eResampleAlg::GDALResampleAlg,dfMaxError::Cdouble,psOptions::Ptr{GDALWarpOptions})
    ccall((:GDALAutoCreateWarpedVRT,libgdal),GDALDatasetH,(GDALDatasetH,Ptr{UInt8},Ptr{UInt8},GDALResampleAlg,Cdouble,Ptr{GDALWarpOptions}),hSrcDS,pszSrcWKT,pszDstWKT,eResampleAlg,dfMaxError,psOptions)
end

function GDALCreateWarpedVRT(hSrcDS::GDALDatasetH,nPixels::Cint,nLines::Cint,padfGeoTransform::Ptr{Cdouble},psOptions::Ptr{GDALWarpOptions})
    ccall((:GDALCreateWarpedVRT,libgdal),GDALDatasetH,(GDALDatasetH,Cint,Cint,Ptr{Cdouble},Ptr{GDALWarpOptions}),hSrcDS,nPixels,nLines,padfGeoTransform,psOptions)
end

function GDALInitializeWarpedVRT(hDS::GDALDatasetH,psWO::Ptr{GDALWarpOptions})
    ccall((:GDALInitializeWarpedVRT,libgdal),CPLErr,(GDALDatasetH,Ptr{GDALWarpOptions}),hDS,psWO)
end

function GDALCreateWarpOperation(arg1::Ptr{GDALWarpOptions})
    ccall((:GDALCreateWarpOperation,libgdal),GDALWarpOperationH,(Ptr{GDALWarpOptions},),arg1)
end

function GDALDestroyWarpOperation(arg1::GDALWarpOperationH)
    ccall((:GDALDestroyWarpOperation,libgdal),Void,(GDALWarpOperationH,),arg1)
end

function GDALChunkAndWarpImage(arg1::GDALWarpOperationH,arg2::Cint,arg3::Cint,arg4::Cint,arg5::Cint)
    ccall((:GDALChunkAndWarpImage,libgdal),CPLErr,(GDALWarpOperationH,Cint,Cint,Cint,Cint),arg1,arg2,arg3,arg4,arg5)
end

function GDALChunkAndWarpMulti(arg1::GDALWarpOperationH,arg2::Cint,arg3::Cint,arg4::Cint,arg5::Cint)
    ccall((:GDALChunkAndWarpMulti,libgdal),CPLErr,(GDALWarpOperationH,Cint,Cint,Cint,Cint),arg1,arg2,arg3,arg4,arg5)
end

function GDALWarpRegion(arg1::GDALWarpOperationH,arg2::Cint,arg3::Cint,arg4::Cint,arg5::Cint,arg6::Cint,arg7::Cint,arg8::Cint,arg9::Cint)
    ccall((:GDALWarpRegion,libgdal),CPLErr,(GDALWarpOperationH,Cint,Cint,Cint,Cint,Cint,Cint,Cint,Cint),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
end

function GDALWarpRegionToBuffer(arg1::GDALWarpOperationH,arg2::Cint,arg3::Cint,arg4::Cint,arg5::Cint,arg6::Ptr{Void},arg7::GDALDataType,arg8::Cint,arg9::Cint,arg10::Cint,arg11::Cint)
    ccall((:GDALWarpRegionToBuffer,libgdal),CPLErr,(GDALWarpOperationH,Cint,Cint,Cint,Cint,Ptr{Void},GDALDataType,Cint,Cint,Cint,Cint),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11)
end

function GWKGetFilterRadius(eResampleAlg::GDALResampleAlg)
    ccall((:GWKGetFilterRadius,libgdal),Cint,(GDALResampleAlg,),eResampleAlg)
end

function GWKGetFilterFunc(eResampleAlg::GDALResampleAlg)
    ccall((:GWKGetFilterFunc,libgdal),FilterFuncType,(GDALResampleAlg,),eResampleAlg)
end

function GWKGetFilterFunc4Values(eResampleAlg::GDALResampleAlg)
    ccall((:GWKGetFilterFunc4Values,libgdal),FilterFunc4ValuesType,(GDALResampleAlg,),eResampleAlg)
end
