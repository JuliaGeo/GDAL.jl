# Julia wrapper for header: /usr/local/include/gdal_alg.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function GDALComputeMedianCutPCT(hRed::GDALRasterBandH,hGreen::GDALRasterBandH,hBlue::GDALRasterBandH,pfnIncludePixel::Ptr{Void},nColors::Cint,hColorTable::GDALColorTableH,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALComputeMedianCutPCT,libgdal),Cint,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,Ptr{Void},Cint,GDALColorTableH,GDALProgressFunc,Ptr{Void}),hRed,hGreen,hBlue,pfnIncludePixel,nColors,hColorTable,pfnProgress,pProgressArg)
end

function GDALDitherRGB2PCT(hRed::GDALRasterBandH,hGreen::GDALRasterBandH,hBlue::GDALRasterBandH,hTarget::GDALRasterBandH,hColorTable::GDALColorTableH,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALDitherRGB2PCT,libgdal),Cint,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,GDALColorTableH,GDALProgressFunc,Ptr{Void}),hRed,hGreen,hBlue,hTarget,hColorTable,pfnProgress,pProgressArg)
end

function GDALChecksumImage(hBand::GDALRasterBandH,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint)
    ccall((:GDALChecksumImage,libgdal),Cint,(GDALRasterBandH,Cint,Cint,Cint,Cint),hBand,nXOff,nYOff,nXSize,nYSize)
end

function GDALComputeProximity(hSrcBand::GDALRasterBandH,hProximityBand::GDALRasterBandH,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALComputeProximity,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hProximityBand,papszOptions,pfnProgress,pProgressArg)
end

function GDALFillNodata(hTargetBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,dfMaxSearchDist::Cdouble,bDeprecatedOption::Cint,nSmoothingIterations::Cint,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALFillNodata,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,Cdouble,Cint,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hTargetBand,hMaskBand,dfMaxSearchDist,bDeprecatedOption,nSmoothingIterations,papszOptions,pfnProgress,pProgressArg)
end

function GDALPolygonize(hSrcBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,hOutLayer::OGRLayerH,iPixValField::Cint,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALPolygonize,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,OGRLayerH,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hMaskBand,hOutLayer,iPixValField,papszOptions,pfnProgress,pProgressArg)
end

function GDALFPolygonize(hSrcBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,hOutLayer::OGRLayerH,iPixValField::Cint,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALFPolygonize,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,OGRLayerH,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hMaskBand,hOutLayer,iPixValField,papszOptions,pfnProgress,pProgressArg)
end

function GDALSieveFilter(hSrcBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,hDstBand::GDALRasterBandH,nSizeThreshold::Cint,nConnectedness::Cint,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALSieveFilter,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,Cint,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hMaskBand,hDstBand,nSizeThreshold,nConnectedness,papszOptions,pfnProgress,pProgressArg)
end

function GDALDestroyTransformer(pTransformerArg::Ptr{Void})
    ccall((:GDALDestroyTransformer,libgdal),Void,(Ptr{Void},),pTransformerArg)
end

function GDALUseTransformer(pTranformerArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALUseTransformer,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTranformerArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function GDALCreateSimilarTransformer(psTransformerArg::Ptr{Void},dfSrcRatioX::Cdouble,dfSrcRatioY::Cdouble)
    ccall((:GDALCreateSimilarTransformer,libgdal),Ptr{Void},(Ptr{Void},Cdouble,Cdouble),psTransformerArg,dfSrcRatioX,dfSrcRatioY)
end

function GDALCreateGenImgProjTransformer(hSrcDS::GDALDatasetH,pszSrcWKT::Ptr{UInt8},hDstDS::GDALDatasetH,pszDstWKT::Ptr{UInt8},bGCPUseOK::Cint,dfGCPErrorThreshold::Cdouble,nOrder::Cint)
    ccall((:GDALCreateGenImgProjTransformer,libgdal),Ptr{Void},(GDALDatasetH,Ptr{UInt8},GDALDatasetH,Ptr{UInt8},Cint,Cdouble,Cint),hSrcDS,pszSrcWKT,hDstDS,pszDstWKT,bGCPUseOK,dfGCPErrorThreshold,nOrder)
end

function GDALCreateGenImgProjTransformer2(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALCreateGenImgProjTransformer2,libgdal),Ptr{Void},(GDALDatasetH,GDALDatasetH,Ptr{Ptr{UInt8}}),hSrcDS,hDstDS,papszOptions)
end

function GDALCreateGenImgProjTransformer3(pszSrcWKT::Ptr{UInt8},padfSrcGeoTransform::Ptr{Cdouble},pszDstWKT::Ptr{UInt8},padfDstGeoTransform::Ptr{Cdouble})
    ccall((:GDALCreateGenImgProjTransformer3,libgdal),Ptr{Void},(Ptr{UInt8},Ptr{Cdouble},Ptr{UInt8},Ptr{Cdouble}),pszSrcWKT,padfSrcGeoTransform,pszDstWKT,padfDstGeoTransform)
end

function GDALSetGenImgProjTransformerDstGeoTransform(arg1::Ptr{Void},arg2::Ptr{Cdouble})
    ccall((:GDALSetGenImgProjTransformerDstGeoTransform,libgdal),Void,(Ptr{Void},Ptr{Cdouble}),arg1,arg2)
end

function GDALDestroyGenImgProjTransformer(arg1::Ptr{Void})
    ccall((:GDALDestroyGenImgProjTransformer,libgdal),Void,(Ptr{Void},),arg1)
end

function GDALGenImgProjTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALGenImgProjTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function GDALSetTransformerDstGeoTransform(arg1::Ptr{Void},arg2::Ptr{Cdouble})
    ccall((:GDALSetTransformerDstGeoTransform,libgdal),Void,(Ptr{Void},Ptr{Cdouble}),arg1,arg2)
end

function GDALCreateReprojectionTransformer(pszSrcWKT::Ptr{UInt8},pszDstWKT::Ptr{UInt8})
    ccall((:GDALCreateReprojectionTransformer,libgdal),Ptr{Void},(Ptr{UInt8},Ptr{UInt8}),pszSrcWKT,pszDstWKT)
end

function GDALDestroyReprojectionTransformer(arg1::Ptr{Void})
    ccall((:GDALDestroyReprojectionTransformer,libgdal),Void,(Ptr{Void},),arg1)
end

function GDALReprojectionTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALReprojectionTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function GDALCreateGCPTransformer(nGCPCount::Cint,pasGCPList::Ptr{GDAL_GCP},nReqOrder::Cint,bReversed::Cint)
    ccall((:GDALCreateGCPTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint,Cint),nGCPCount,pasGCPList,nReqOrder,bReversed)
end

function GDALCreateGCPRefineTransformer(nGCPCount::Cint,pasGCPList::Ptr{GDAL_GCP},nReqOrder::Cint,bReversed::Cint,tolerance::Cdouble,minimumGcps::Cint)
    ccall((:GDALCreateGCPRefineTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint,Cint,Cdouble,Cint),nGCPCount,pasGCPList,nReqOrder,bReversed,tolerance,minimumGcps)
end

function GDALDestroyGCPTransformer(pTransformArg::Ptr{Void})
    ccall((:GDALDestroyGCPTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end

function GDALGCPTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALGCPTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function GDALCreateTPSTransformer(nGCPCount::Cint,pasGCPList::Ptr{GDAL_GCP},bReversed::Cint)
    ccall((:GDALCreateTPSTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint),nGCPCount,pasGCPList,bReversed)
end

function GDALDestroyTPSTransformer(pTransformArg::Ptr{Void})
    ccall((:GDALDestroyTPSTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end

function GDALTPSTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALTPSTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function RPCInfoToMD(psRPCInfo::Ptr{GDALRPCInfo})
    ccall((:RPCInfoToMD,libgdal),Ptr{Ptr{UInt8}},(Ptr{GDALRPCInfo},),psRPCInfo)
end

function GDALCreateRPCTransformer(psRPC::Ptr{GDALRPCInfo},bReversed::Cint,dfPixErrThreshold::Cdouble,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALCreateRPCTransformer,libgdal),Ptr{Void},(Ptr{GDALRPCInfo},Cint,Cdouble,Ptr{Ptr{UInt8}}),psRPC,bReversed,dfPixErrThreshold,papszOptions)
end

function GDALDestroyRPCTransformer(pTransformArg::Ptr{Void})
    ccall((:GDALDestroyRPCTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end

function GDALRPCTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALRPCTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function GDALCreateGeoLocTransformer(hBaseDS::GDALDatasetH,papszGeolocationInfo::Ptr{Ptr{UInt8}},bReversed::Cint)
    ccall((:GDALCreateGeoLocTransformer,libgdal),Ptr{Void},(GDALDatasetH,Ptr{Ptr{UInt8}},Cint),hBaseDS,papszGeolocationInfo,bReversed)
end

function GDALDestroyGeoLocTransformer(pTransformArg::Ptr{Void})
    ccall((:GDALDestroyGeoLocTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end

function GDALGeoLocTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALGeoLocTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function GDALCreateApproxTransformer(pfnRawTransformer::GDALTransformerFunc,pRawTransformerArg::Ptr{Void},dfMaxError::Cdouble)
    ccall((:GDALCreateApproxTransformer,libgdal),Ptr{Void},(GDALTransformerFunc,Ptr{Void},Cdouble),pfnRawTransformer,pRawTransformerArg,dfMaxError)
end

function GDALApproxTransformerOwnsSubtransformer(pCBData::Ptr{Void},bOwnFlag::Cint)
    ccall((:GDALApproxTransformerOwnsSubtransformer,libgdal),Void,(Ptr{Void},Cint),pCBData,bOwnFlag)
end

function GDALDestroyApproxTransformer(pApproxArg::Ptr{Void})
    ccall((:GDALDestroyApproxTransformer,libgdal),Void,(Ptr{Void},),pApproxArg)
end

function GDALApproxTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALApproxTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end

function GDALSimpleImageWarp(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,nBandCount::Cint,panBandList::Ptr{Cint},pfnTransform::GDALTransformerFunc,pTransformArg::Ptr{Void},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void},papszWarpOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALSimpleImageWarp,libgdal),Cint,(GDALDatasetH,GDALDatasetH,Cint,Ptr{Cint},GDALTransformerFunc,Ptr{Void},GDALProgressFunc,Ptr{Void},Ptr{Ptr{UInt8}}),hSrcDS,hDstDS,nBandCount,panBandList,pfnTransform,pTransformArg,pfnProgress,pProgressArg,papszWarpOptions)
end

function GDALSuggestedWarpOutput(hSrcDS::GDALDatasetH,pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfGeoTransformOut::Ptr{Cdouble},pnPixels::Ptr{Cint},pnLines::Ptr{Cint})
    ccall((:GDALSuggestedWarpOutput,libgdal),CPLErr,(GDALDatasetH,GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Cint},Ptr{Cint}),hSrcDS,pfnTransformer,pTransformArg,padfGeoTransformOut,pnPixels,pnLines)
end

function GDALSuggestedWarpOutput2(hSrcDS::GDALDatasetH,pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfGeoTransformOut::Ptr{Cdouble},pnPixels::Ptr{Cint},pnLines::Ptr{Cint},padfExtents::Ptr{Cdouble},nOptions::Cint)
    ccall((:GDALSuggestedWarpOutput2,libgdal),CPLErr,(GDALDatasetH,GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Cint},Ptr{Cint},Ptr{Cdouble},Cint),hSrcDS,pfnTransformer,pTransformArg,padfGeoTransformOut,pnPixels,pnLines,padfExtents,nOptions)
end

function GDALSerializeTransformer(pfnFunc::GDALTransformerFunc,pTransformArg::Ptr{Void})
    ccall((:GDALSerializeTransformer,libgdal),Ptr{CPLXMLNode},(GDALTransformerFunc,Ptr{Void}),pfnFunc,pTransformArg)
end

function GDALDeserializeTransformer(psTree::Ptr{CPLXMLNode},ppfnFunc::Ptr{GDALTransformerFunc},ppTransformArg::Ptr{Ptr{Void}})
    ccall((:GDALDeserializeTransformer,libgdal),CPLErr,(Ptr{CPLXMLNode},Ptr{GDALTransformerFunc},Ptr{Ptr{Void}}),psTree,ppfnFunc,ppTransformArg)
end

function GDALTransformGeolocations(hXBand::GDALRasterBandH,hYBand::GDALRasterBandH,hZBand::GDALRasterBandH,pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void},papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALTransformGeolocations,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,GDALTransformerFunc,Ptr{Void},GDALProgressFunc,Ptr{Void},Ptr{Ptr{UInt8}}),hXBand,hYBand,hZBand,pfnTransformer,pTransformArg,pfnProgress,pProgressArg,papszOptions)
end

function GDAL_CG_Create(nWidth::Cint,nHeight::Cint,bNoDataSet::Cint,dfNoDataValue::Cdouble,dfContourInterval::Cdouble,dfContourBase::Cdouble,pfnWriter::GDALContourWriter,pCBData::Ptr{Void})
    ccall((:GDAL_CG_Create,libgdal),GDALContourGeneratorH,(Cint,Cint,Cint,Cdouble,Cdouble,Cdouble,GDALContourWriter,Ptr{Void}),nWidth,nHeight,bNoDataSet,dfNoDataValue,dfContourInterval,dfContourBase,pfnWriter,pCBData)
end

function GDAL_CG_FeedLine(hCG::GDALContourGeneratorH,padfScanline::Ptr{Cdouble})
    ccall((:GDAL_CG_FeedLine,libgdal),CPLErr,(GDALContourGeneratorH,Ptr{Cdouble}),hCG,padfScanline)
end

function GDAL_CG_Destroy(hCG::GDALContourGeneratorH)
    ccall((:GDAL_CG_Destroy,libgdal),Void,(GDALContourGeneratorH,),hCG)
end

function OGRContourWriter(arg1::Cdouble,arg2::Cint,arg3::Ptr{Cdouble},arg4::Ptr{Cdouble},pInfo::Ptr{Void})
    ccall((:OGRContourWriter,libgdal),CPLErr,(Cdouble,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Void}),arg1,arg2,arg3,arg4,pInfo)
end

function GDALContourGenerate(hBand::GDALRasterBandH,dfContourInterval::Cdouble,dfContourBase::Cdouble,nFixedLevelCount::Cint,padfFixedLevels::Ptr{Cdouble},bUseNoData::Cint,dfNoDataValue::Cdouble,hLayer::Ptr{Void},iIDField::Cint,iElevField::Cint,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALContourGenerate,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cdouble},Cint,Cdouble,Ptr{Void},Cint,Cint,GDALProgressFunc,Ptr{Void}),hBand,dfContourInterval,dfContourBase,nFixedLevelCount,padfFixedLevels,bUseNoData,dfNoDataValue,hLayer,iIDField,iElevField,pfnProgress,pProgressArg)
end

function GDALRasterizeGeometries(hDS::GDALDatasetH,nBandCount::Cint,panBandList::Ptr{Cint},nGeomCount::Cint,pahGeometries::Ptr{OGRGeometryH},pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfGeomBurnValue::Ptr{Cdouble},papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALRasterizeGeometries,libgdal),CPLErr,(GDALDatasetH,Cint,Ptr{Cint},Cint,Ptr{OGRGeometryH},GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hDS,nBandCount,panBandList,nGeomCount,pahGeometries,pfnTransformer,pTransformArg,padfGeomBurnValue,papszOptions,pfnProgress,pProgressArg)
end

function GDALRasterizeLayers(hDS::GDALDatasetH,nBandCount::Cint,panBandList::Ptr{Cint},nLayerCount::Cint,pahLayers::Ptr{OGRLayerH},pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfLayerBurnValues::Ptr{Cdouble},papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALRasterizeLayers,libgdal),CPLErr,(GDALDatasetH,Cint,Ptr{Cint},Cint,Ptr{OGRLayerH},GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hDS,nBandCount,panBandList,nLayerCount,pahLayers,pfnTransformer,pTransformArg,padfLayerBurnValues,papszOptions,pfnProgress,pProgressArg)
end

function GDALRasterizeLayersBuf(pData::Ptr{Void},nBufXSize::Cint,nBufYSize::Cint,eBufType::GDALDataType,nPixelSpace::Cint,nLineSpace::Cint,nLayerCount::Cint,pahLayers::Ptr{OGRLayerH},pszDstProjection::Ptr{UInt8},padfDstGeoTransform::Ptr{Cdouble},pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},dfBurnValue::Cdouble,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALRasterizeLayersBuf,libgdal),CPLErr,(Ptr{Void},Cint,Cint,GDALDataType,Cint,Cint,Cint,Ptr{OGRLayerH},Ptr{UInt8},Ptr{Cdouble},GDALTransformerFunc,Ptr{Void},Cdouble,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),pData,nBufXSize,nBufYSize,eBufType,nPixelSpace,nLineSpace,nLayerCount,pahLayers,pszDstProjection,padfDstGeoTransform,pfnTransformer,pTransformArg,dfBurnValue,papszOptions,pfnProgress,pProgressArg)
end

function GDALGridCreate(arg1::GDALGridAlgorithm,arg2::Ptr{Void},arg3::GUInt32,arg4::Ptr{Cdouble},arg5::Ptr{Cdouble},arg6::Ptr{Cdouble},arg7::Cdouble,arg8::Cdouble,arg9::Cdouble,arg10::Cdouble,arg11::GUInt32,arg12::GUInt32,arg13::GDALDataType,arg14::Ptr{Void},arg15::GDALProgressFunc,arg16::Ptr{Void})
    ccall((:GDALGridCreate,libgdal),CPLErr,(GDALGridAlgorithm,Ptr{Void},GUInt32,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Cdouble,Cdouble,Cdouble,Cdouble,GUInt32,GUInt32,GDALDataType,Ptr{Void},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16)
end

function GDALComputeMatchingPoints(hFirstImage::GDALDatasetH,hSecondImage::GDALDatasetH,papszOptions::Ptr{Ptr{UInt8}},pnGCPCount::Ptr{Cint})
    ccall((:GDALComputeMatchingPoints,libgdal),Ptr{GDAL_GCP},(GDALDatasetH,GDALDatasetH,Ptr{Ptr{UInt8}},Ptr{Cint}),hFirstImage,hSecondImage,papszOptions,pnGCPCount)
end
