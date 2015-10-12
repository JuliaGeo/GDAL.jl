function computemediancutpct(hRed::GDALRasterBandH,hGreen::GDALRasterBandH,hBlue::GDALRasterBandH,pfnIncludePixel::Ptr{Void},nColors::Integer,hColorTable::GDALColorTableH,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALComputeMedianCutPCT,libgdal),Cint,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,Ptr{Void},Cint,GDALColorTableH,GDALProgressFunc,Ptr{Void}),hRed,hGreen,hBlue,pfnIncludePixel,nColors,hColorTable,pfnProgress,pProgressArg)
end

function ditherrgb2pct(hRed::GDALRasterBandH,hGreen::GDALRasterBandH,hBlue::GDALRasterBandH,hTarget::GDALRasterBandH,hColorTable::GDALColorTableH,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALDitherRGB2PCT,libgdal),Cint,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,GDALColorTableH,GDALProgressFunc,Ptr{Void}),hRed,hGreen,hBlue,hTarget,hColorTable,pfnProgress,pProgressArg)
end

function checksumimage(hBand::GDALRasterBandH,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer)
    ccall((:GDALChecksumImage,libgdal),Cint,(GDALRasterBandH,Cint,Cint,Cint,Cint),hBand,nXOff,nYOff,nXSize,nYSize)
end

function computeproximity(hSrcBand::GDALRasterBandH,hProximityBand::GDALRasterBandH,papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALComputeProximity,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hProximityBand,papszOptions,pfnProgress,pProgressArg)
end

function fillnodata(hTargetBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,dfMaxSearchDist::Real,bDeprecatedOption::Integer,nSmoothingIterations::Integer,papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALFillNodata,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,Cdouble,Cint,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hTargetBand,hMaskBand,dfMaxSearchDist,bDeprecatedOption,nSmoothingIterations,papszOptions,pfnProgress,pProgressArg)
end

function polygonize(hSrcBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,hOutLayer::OGRLayerH,iPixValField::Integer,papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALPolygonize,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,OGRLayerH,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hMaskBand,hOutLayer,iPixValField,papszOptions,pfnProgress,pProgressArg)
end

function fpolygonize(hSrcBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,hOutLayer::OGRLayerH,iPixValField::Integer,papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALFPolygonize,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,OGRLayerH,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hMaskBand,hOutLayer,iPixValField,papszOptions,pfnProgress,pProgressArg)
end

function sievefilter(hSrcBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,hDstBand::GDALRasterBandH,nSizeThreshold::Integer,nConnectedness::Integer,papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALSieveFilter,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,Cint,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hMaskBand,hDstBand,nSizeThreshold,nConnectedness,papszOptions,pfnProgress,pProgressArg)
end

function destroytransformer(pTransformerArg::Ptr{Void})
    ccall((:GDALDestroyTransformer,libgdal),Void,(Ptr{Void},),pTransformerArg)
end

function usetransformer(pTranformerArg::Ptr{Void},bDstToSrc::Integer,nPointCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},panSuccess::Vector{Cint})
    ccall((:GDALUseTransformer,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTranformerArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function createsimilartransformer(psTransformerArg::Ptr{Void},dfSrcRatioX::Real,dfSrcRatioY::Real)
    ccall((:GDALCreateSimilarTransformer,libgdal),Ptr{Void},(Ptr{Void},Cdouble,Cdouble),psTransformerArg,dfSrcRatioX,dfSrcRatioY)
end

function creategenimgprojtransformer(hSrcDS::GDALDatasetH,pszSrcWKT::AbstractString,hDstDS::GDALDatasetH,pszDstWKT::AbstractString,bGCPUseOK::Integer,dfGCPErrorThreshold::Real,nOrder::Integer)
    ccall((:GDALCreateGenImgProjTransformer,libgdal),Ptr{Void},(GDALDatasetH,Ptr{UInt8},GDALDatasetH,Ptr{UInt8},Cint,Cdouble,Cint),hSrcDS,pszSrcWKT,hDstDS,pszDstWKT,bGCPUseOK,dfGCPErrorThreshold,nOrder)
end

function creategenimgprojtransformer2(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,papszOptions::Vector{UTF8String})
    ccall((:GDALCreateGenImgProjTransformer2,libgdal),Ptr{Void},(GDALDatasetH,GDALDatasetH,Ptr{Ptr{UInt8}}),hSrcDS,hDstDS,papszOptions)
end

function creategenimgprojtransformer3(pszSrcWKT::AbstractString,padfSrcGeoTransform::Vector{Float64},pszDstWKT::AbstractString,padfDstGeoTransform::Vector{Float64})
    ccall((:GDALCreateGenImgProjTransformer3,libgdal),Ptr{Void},(Ptr{UInt8},Ptr{Cdouble},Ptr{UInt8},Ptr{Cdouble}),pszSrcWKT,padfSrcGeoTransform,pszDstWKT,padfDstGeoTransform)
end

function setgenimgprojtransformerdstgeotransform(arg1::Ptr{Void},arg2::Vector{Float64})
    ccall((:GDALSetGenImgProjTransformerDstGeoTransform,libgdal),Void,(Ptr{Void},Ptr{Cdouble}),arg1,arg2)
end

function destroygenimgprojtransformer(arg1::Ptr{Void})
    ccall((:GDALDestroyGenImgProjTransformer,libgdal),Void,(Ptr{Void},),arg1)
end

function genimgprojtransform(pTransformArg::Ptr{Void},bDstToSrc::Integer,nPointCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},panSuccess::Vector{Cint})
    ccall((:GDALGenImgProjTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function settransformerdstgeotransform(arg1::Ptr{Void},arg2::Vector{Float64})
    ccall((:GDALSetTransformerDstGeoTransform,libgdal),Void,(Ptr{Void},Ptr{Cdouble}),arg1,arg2)
end

function createreprojectiontransformer(pszSrcWKT::AbstractString,pszDstWKT::AbstractString)
    ccall((:GDALCreateReprojectionTransformer,libgdal),Ptr{Void},(Ptr{UInt8},Ptr{UInt8}),pszSrcWKT,pszDstWKT)
end

function destroyreprojectiontransformer(arg1::Ptr{Void})
    ccall((:GDALDestroyReprojectionTransformer,libgdal),Void,(Ptr{Void},),arg1)
end

function reprojectiontransform(pTransformArg::Ptr{Void},bDstToSrc::Integer,nPointCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},panSuccess::Vector{Cint})
    ccall((:GDALReprojectionTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function creategcptransformer(nGCPCount::Integer,pasGCPList::Ptr{GDAL_GCP},nReqOrder::Integer,bReversed::Integer)
    ccall((:GDALCreateGCPTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint,Cint),nGCPCount,pasGCPList,nReqOrder,bReversed)
end

function creategcprefinetransformer(nGCPCount::Integer,pasGCPList::Ptr{GDAL_GCP},nReqOrder::Integer,bReversed::Integer,tolerance::Real,minimumGcps::Integer)
    ccall((:GDALCreateGCPRefineTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint,Cint,Cdouble,Cint),nGCPCount,pasGCPList,nReqOrder,bReversed,tolerance,minimumGcps)
end

function destroygcptransformer(pTransformArg::Ptr{Void})
    ccall((:GDALDestroyGCPTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end

function gcptransform(pTransformArg::Ptr{Void},bDstToSrc::Integer,nPointCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},panSuccess::Vector{Cint})
    ccall((:GDALGCPTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function createtpstransformer(nGCPCount::Integer,pasGCPList::Ptr{GDAL_GCP},bReversed::Integer)
    ccall((:GDALCreateTPSTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint),nGCPCount,pasGCPList,bReversed)
end

function destroytpstransformer(pTransformArg::Ptr{Void})
    ccall((:GDALDestroyTPSTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end

function tpstransform(pTransformArg::Ptr{Void},bDstToSrc::Integer,nPointCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},panSuccess::Vector{Cint})
    ccall((:GDALTPSTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function rpcinfotomd(psRPCInfo::Ptr{GDALRPCInfo})
    bytestring(unsafe_load(ccall((:RPCInfoToMD,libgdal),Ptr{Ptr{UInt8}},(Ptr{GDALRPCInfo},),psRPCInfo)))
end

function createrpctransformer(psRPC::Ptr{GDALRPCInfo},bReversed::Integer,dfPixErrThreshold::Real,papszOptions::Vector{UTF8String})
    ccall((:GDALCreateRPCTransformer,libgdal),Ptr{Void},(Ptr{GDALRPCInfo},Cint,Cdouble,Ptr{Ptr{UInt8}}),psRPC,bReversed,dfPixErrThreshold,papszOptions)
end

function destroyrpctransformer(pTransformArg::Ptr{Void})
    ccall((:GDALDestroyRPCTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end

function rpctransform(pTransformArg::Ptr{Void},bDstToSrc::Integer,nPointCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},panSuccess::Vector{Cint})
    ccall((:GDALRPCTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function creategeoloctransformer(hBaseDS::GDALDatasetH,papszGeolocationInfo::Vector{UTF8String},bReversed::Integer)
    ccall((:GDALCreateGeoLocTransformer,libgdal),Ptr{Void},(GDALDatasetH,Ptr{Ptr{UInt8}},Cint),hBaseDS,papszGeolocationInfo,bReversed)
end

function destroygeoloctransformer(pTransformArg::Ptr{Void})
    ccall((:GDALDestroyGeoLocTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end

function geoloctransform(pTransformArg::Ptr{Void},bDstToSrc::Integer,nPointCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},panSuccess::Vector{Cint})
    ccall((:GDALGeoLocTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function createapproxtransformer(pfnRawTransformer::GDALTransformerFunc,pRawTransformerArg::Ptr{Void},dfMaxError::Real)
    ccall((:GDALCreateApproxTransformer,libgdal),Ptr{Void},(GDALTransformerFunc,Ptr{Void},Cdouble),pfnRawTransformer,pRawTransformerArg,dfMaxError)
end

function approxtransformerownssubtransformer(pCBData::Ptr{Void},bOwnFlag::Integer)
    ccall((:GDALApproxTransformerOwnsSubtransformer,libgdal),Void,(Ptr{Void},Cint),pCBData,bOwnFlag)
end

function destroyapproxtransformer(pApproxArg::Ptr{Void})
    ccall((:GDALDestroyApproxTransformer,libgdal),Void,(Ptr{Void},),pApproxArg)
end

function approxtransform(pTransformArg::Ptr{Void},bDstToSrc::Integer,nPointCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},panSuccess::Vector{Cint})
    ccall((:GDALApproxTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function simpleimagewarp(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,nBandCount::Integer,panBandList::Vector{Cint},pfnTransform::GDALTransformerFunc,pTransformArg::Ptr{Void},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void},papszWarpOptions::Vector{UTF8String})
    ccall((:GDALSimpleImageWarp,libgdal),Cint,(GDALDatasetH,GDALDatasetH,Cint,Ptr{Cint},GDALTransformerFunc,Ptr{Void},GDALProgressFunc,Ptr{Void},Ptr{Ptr{UInt8}}),hSrcDS,hDstDS,nBandCount,panBandList,pfnTransform,pTransformArg,pfnProgress,pProgressArg,papszWarpOptions)
end

function suggestedwarpoutput(hSrcDS::GDALDatasetH,pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfGeoTransformOut::Vector{Float64},pnPixels::Vector{Cint},pnLines::Vector{Cint})
    ccall((:GDALSuggestedWarpOutput,libgdal),CPLErr,(GDALDatasetH,GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Cint},Ptr{Cint}),hSrcDS,pfnTransformer,pTransformArg,padfGeoTransformOut,pnPixels,pnLines)
end

function suggestedwarpoutput2(hSrcDS::GDALDatasetH,pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfGeoTransformOut::Vector{Float64},pnPixels::Vector{Cint},pnLines::Vector{Cint},padfExtents::Vector{Float64},nOptions::Integer)
    ccall((:GDALSuggestedWarpOutput2,libgdal),CPLErr,(GDALDatasetH,GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Cint},Ptr{Cint},Ptr{Cdouble},Cint),hSrcDS,pfnTransformer,pTransformArg,padfGeoTransformOut,pnPixels,pnLines,padfExtents,nOptions)
end

function serializetransformer(pfnFunc::GDALTransformerFunc,pTransformArg::Ptr{Void})
    ccall((:GDALSerializeTransformer,libgdal),Ptr{CPLXMLNode},(GDALTransformerFunc,Ptr{Void}),pfnFunc,pTransformArg)
end

function deserializetransformer(psTree::Ptr{CPLXMLNode},ppfnFunc::Ptr{GDALTransformerFunc},ppTransformArg::Ptr{Ptr{Void}})
    ccall((:GDALDeserializeTransformer,libgdal),CPLErr,(Ptr{CPLXMLNode},Ptr{GDALTransformerFunc},Ptr{Ptr{Void}}),psTree,ppfnFunc,ppTransformArg)
end

function transformgeolocations(hXBand::GDALRasterBandH,hYBand::GDALRasterBandH,hZBand::GDALRasterBandH,pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void},papszOptions::Vector{UTF8String})
    ccall((:GDALTransformGeolocations,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,GDALTransformerFunc,Ptr{Void},GDALProgressFunc,Ptr{Void},Ptr{Ptr{UInt8}}),hXBand,hYBand,hZBand,pfnTransformer,pTransformArg,pfnProgress,pProgressArg,papszOptions)
end

function create(nWidth::Integer,nHeight::Integer,bNoDataSet::Integer,dfNoDataValue::Real,dfContourInterval::Real,dfContourBase::Real,pfnWriter::GDALContourWriter,pCBData::Ptr{Void})
    checknull(ccall((:GDAL_CG_Create,libgdal),GDALContourGeneratorH,(Cint,Cint,Cint,Cdouble,Cdouble,Cdouble,GDALContourWriter,Ptr{Void}),nWidth,nHeight,bNoDataSet,dfNoDataValue,dfContourInterval,dfContourBase,pfnWriter,pCBData))
end

function feedline(hCG::GDALContourGeneratorH,padfScanline::Vector{Float64})
    ccall((:GDAL_CG_FeedLine,libgdal),CPLErr,(GDALContourGeneratorH,Ptr{Cdouble}),hCG,padfScanline)
end

function destroy(hCG::GDALContourGeneratorH)
    ccall((:GDAL_CG_Destroy,libgdal),Void,(GDALContourGeneratorH,),hCG)
end

function contourwriter(arg1::Real,arg2::Integer,arg3::Vector{Float64},arg4::Vector{Float64},pInfo::Ptr{Void})
    ccall((:OGRContourWriter,libgdal),CPLErr,(Cdouble,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Void}),arg1,arg2,arg3,arg4,pInfo)
end

function contourgenerate(hBand::GDALRasterBandH,dfContourInterval::Real,dfContourBase::Real,nFixedLevelCount::Integer,padfFixedLevels::Vector{Float64},bUseNoData::Integer,dfNoDataValue::Real,hLayer::Ptr{Void},iIDField::Integer,iElevField::Integer,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALContourGenerate,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cdouble},Cint,Cdouble,Ptr{Void},Cint,Cint,GDALProgressFunc,Ptr{Void}),hBand,dfContourInterval,dfContourBase,nFixedLevelCount,padfFixedLevels,bUseNoData,dfNoDataValue,hLayer,iIDField,iElevField,pfnProgress,pProgressArg)
end

function rasterizegeometries(hDS::GDALDatasetH,nBandCount::Integer,panBandList::Vector{Cint},nGeomCount::Integer,pahGeometries::Ptr{OGRGeometryH},pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfGeomBurnValue::Vector{Float64},papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALRasterizeGeometries,libgdal),CPLErr,(GDALDatasetH,Cint,Ptr{Cint},Cint,Ptr{OGRGeometryH},GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hDS,nBandCount,panBandList,nGeomCount,pahGeometries,pfnTransformer,pTransformArg,padfGeomBurnValue,papszOptions,pfnProgress,pProgressArg)
end

function rasterizelayers(hDS::GDALDatasetH,nBandCount::Integer,panBandList::Vector{Cint},nLayerCount::Integer,pahLayers::Ptr{OGRLayerH},pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfLayerBurnValues::Vector{Float64},papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALRasterizeLayers,libgdal),CPLErr,(GDALDatasetH,Cint,Ptr{Cint},Cint,Ptr{OGRLayerH},GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hDS,nBandCount,panBandList,nLayerCount,pahLayers,pfnTransformer,pTransformArg,padfLayerBurnValues,papszOptions,pfnProgress,pProgressArg)
end

function rasterizelayersbuf(pData::Ptr{Void},nBufXSize::Integer,nBufYSize::Integer,eBufType::GDALDataType,nPixelSpace::Integer,nLineSpace::Integer,nLayerCount::Integer,pahLayers::Ptr{OGRLayerH},pszDstProjection::AbstractString,padfDstGeoTransform::Vector{Float64},pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},dfBurnValue::Real,papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALRasterizeLayersBuf,libgdal),CPLErr,(Ptr{Void},Cint,Cint,GDALDataType,Cint,Cint,Cint,Ptr{OGRLayerH},Ptr{UInt8},Ptr{Cdouble},GDALTransformerFunc,Ptr{Void},Cdouble,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),pData,nBufXSize,nBufYSize,eBufType,nPixelSpace,nLineSpace,nLayerCount,pahLayers,pszDstProjection,padfDstGeoTransform,pfnTransformer,pTransformArg,dfBurnValue,papszOptions,pfnProgress,pProgressArg)
end

function gridcreate(arg1::GDALGridAlgorithm,arg2::Ptr{Void},arg3::GUInt32,arg4::Vector{Float64},arg5::Vector{Float64},arg6::Vector{Float64},arg7::Real,arg8::Real,arg9::Real,arg10::Real,arg11::GUInt32,arg12::GUInt32,arg13::GDALDataType,arg14::Ptr{Void},arg15::GDALProgressFunc,arg16::Ptr{Void})
    ccall((:GDALGridCreate,libgdal),CPLErr,(GDALGridAlgorithm,Ptr{Void},GUInt32,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Cdouble,Cdouble,Cdouble,Cdouble,GUInt32,GUInt32,GDALDataType,Ptr{Void},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16)
end

function computematchingpoints(hFirstImage::GDALDatasetH,hSecondImage::GDALDatasetH,papszOptions::Vector{UTF8String},pnGCPCount::Vector{Cint})
    ccall((:GDALComputeMatchingPoints,libgdal),Ptr{GDAL_GCP},(GDALDatasetH,GDALDatasetH,Ptr{Ptr{UInt8}},Ptr{Cint}),hFirstImage,hSecondImage,papszOptions,pnGCPCount)
end

