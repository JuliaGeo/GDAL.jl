# Julia wrapper for header: /usr/local/include/gdal.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function GDALGetDataTypeSize(arg1::GDALDataType)
    ccall((:GDALGetDataTypeSize,libgdal),Cint,(GDALDataType,),arg1)
end

function GDALDataTypeIsComplex(arg1::GDALDataType)
    ccall((:GDALDataTypeIsComplex,libgdal),Cint,(GDALDataType,),arg1)
end

function GDALGetDataTypeName(arg1::GDALDataType)
    ccall((:GDALGetDataTypeName,libgdal),Ptr{UInt8},(GDALDataType,),arg1)
end

function GDALGetDataTypeByName(arg1::Ptr{UInt8})
    ccall((:GDALGetDataTypeByName,libgdal),GDALDataType,(Ptr{UInt8},),arg1)
end

function GDALDataTypeUnion(arg1::GDALDataType,arg2::GDALDataType)
    ccall((:GDALDataTypeUnion,libgdal),GDALDataType,(GDALDataType,GDALDataType),arg1,arg2)
end

function GDALGetAsyncStatusTypeName(arg1::GDALAsyncStatusType)
    ccall((:GDALGetAsyncStatusTypeName,libgdal),Ptr{UInt8},(GDALAsyncStatusType,),arg1)
end

function GDALGetAsyncStatusTypeByName(arg1::Ptr{UInt8})
    ccall((:GDALGetAsyncStatusTypeByName,libgdal),GDALAsyncStatusType,(Ptr{UInt8},),arg1)
end

function GDALGetColorInterpretationName(arg1::GDALColorInterp)
    ccall((:GDALGetColorInterpretationName,libgdal),Ptr{UInt8},(GDALColorInterp,),arg1)
end

function GDALGetColorInterpretationByName(pszName::Ptr{UInt8})
    ccall((:GDALGetColorInterpretationByName,libgdal),GDALColorInterp,(Ptr{UInt8},),pszName)
end

function GDALGetPaletteInterpretationName(arg1::GDALPaletteInterp)
    ccall((:GDALGetPaletteInterpretationName,libgdal),Ptr{UInt8},(GDALPaletteInterp,),arg1)
end

function GDALAllRegister()
    ccall((:GDALAllRegister,libgdal),Void,())
end

function GDALCreate(hDriver::GDALDriverH,arg1::Ptr{UInt8},arg2::Cint,arg3::Cint,arg4::Cint,arg5::GDALDataType,arg6::Ptr{Ptr{UInt8}})
    ccall((:GDALCreate,libgdal),GDALDatasetH,(GDALDriverH,Ptr{UInt8},Cint,Cint,Cint,GDALDataType,Ptr{Ptr{UInt8}}),hDriver,arg1,arg2,arg3,arg4,arg5,arg6)
end

function GDALCreateCopy(arg1::GDALDriverH,arg2::Ptr{UInt8},arg3::GDALDatasetH,arg4::Cint,arg5::Ptr{Ptr{UInt8}},arg6::GDALProgressFunc,arg7::Ptr{Void})
    ccall((:GDALCreateCopy,libgdal),GDALDatasetH,(GDALDriverH,Ptr{UInt8},GDALDatasetH,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7)
end

function GDALIdentifyDriver(pszFilename::Ptr{UInt8},papszFileList::Ptr{Ptr{UInt8}})
    ccall((:GDALIdentifyDriver,libgdal),GDALDriverH,(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszFileList)
end

function GDALOpen(pszFilename::Ptr{UInt8},eAccess::GDALAccess)
    ccall((:GDALOpen,libgdal),GDALDatasetH,(Ptr{UInt8},GDALAccess),pszFilename,eAccess)
end

function GDALOpenShared(arg1::Ptr{UInt8},arg2::GDALAccess)
    ccall((:GDALOpenShared,libgdal),GDALDatasetH,(Ptr{UInt8},GDALAccess),arg1,arg2)
end

function GDALOpenEx(pszFilename::Ptr{UInt8},nOpenFlags::UInt32,papszAllowedDrivers::Ptr{Ptr{UInt8}},papszOpenOptions::Ptr{Ptr{UInt8}},papszSiblingFiles::Ptr{Ptr{UInt8}})
    ccall((:GDALOpenEx,libgdal),GDALDatasetH,(Ptr{UInt8},UInt32,Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}}),pszFilename,nOpenFlags,papszAllowedDrivers,papszOpenOptions,papszSiblingFiles)
end

function GDALDumpOpenDatasets(arg1::Ptr{FILE})
    ccall((:GDALDumpOpenDatasets,libgdal),Cint,(Ptr{FILE},),arg1)
end

function GDALGetDriverByName(arg1::Ptr{UInt8})
    ccall((:GDALGetDriverByName,libgdal),GDALDriverH,(Ptr{UInt8},),arg1)
end

function GDALGetDriverCount()
    ccall((:GDALGetDriverCount,libgdal),Cint,())
end

function GDALGetDriver(arg1::Cint)
    ccall((:GDALGetDriver,libgdal),GDALDriverH,(Cint,),arg1)
end

function GDALDestroyDriver(arg1::GDALDriverH)
    ccall((:GDALDestroyDriver,libgdal),Void,(GDALDriverH,),arg1)
end

function GDALRegisterDriver(arg1::GDALDriverH)
    ccall((:GDALRegisterDriver,libgdal),Cint,(GDALDriverH,),arg1)
end

function GDALDeregisterDriver(arg1::GDALDriverH)
    ccall((:GDALDeregisterDriver,libgdal),Void,(GDALDriverH,),arg1)
end

function GDALDestroyDriverManager()
    ccall((:GDALDestroyDriverManager,libgdal),Void,())
end

function GDALDestroy()
    ccall((:GDALDestroy,libgdal),Void,())
end

function GDALDeleteDataset(arg1::GDALDriverH,arg2::Ptr{UInt8})
    ccall((:GDALDeleteDataset,libgdal),CPLErr,(GDALDriverH,Ptr{UInt8}),arg1,arg2)
end

function GDALRenameDataset(arg1::GDALDriverH,pszNewName::Ptr{UInt8},pszOldName::Ptr{UInt8})
    ccall((:GDALRenameDataset,libgdal),CPLErr,(GDALDriverH,Ptr{UInt8},Ptr{UInt8}),arg1,pszNewName,pszOldName)
end

function GDALCopyDatasetFiles(arg1::GDALDriverH,pszNewName::Ptr{UInt8},pszOldName::Ptr{UInt8})
    ccall((:GDALCopyDatasetFiles,libgdal),CPLErr,(GDALDriverH,Ptr{UInt8},Ptr{UInt8}),arg1,pszNewName,pszOldName)
end

function GDALValidateCreationOptions(arg1::GDALDriverH,papszCreationOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALValidateCreationOptions,libgdal),Cint,(GDALDriverH,Ptr{Ptr{UInt8}}),arg1,papszCreationOptions)
end

function GDALGetDriverShortName(arg1::GDALDriverH)
    ccall((:GDALGetDriverShortName,libgdal),Ptr{UInt8},(GDALDriverH,),arg1)
end

function GDALGetDriverLongName(arg1::GDALDriverH)
    ccall((:GDALGetDriverLongName,libgdal),Ptr{UInt8},(GDALDriverH,),arg1)
end

function GDALGetDriverHelpTopic(arg1::GDALDriverH)
    ccall((:GDALGetDriverHelpTopic,libgdal),Ptr{UInt8},(GDALDriverH,),arg1)
end

function GDALGetDriverCreationOptionList(arg1::GDALDriverH)
    ccall((:GDALGetDriverCreationOptionList,libgdal),Ptr{UInt8},(GDALDriverH,),arg1)
end

function GDALInitGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
    ccall((:GDALInitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
end

function GDALDeinitGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
    ccall((:GDALDeinitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
end

function GDALDuplicateGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
    ccall((:GDALDuplicateGCPs,libgdal),Ptr{GDAL_GCP},(Cint,Ptr{GDAL_GCP}),arg1,arg2)
end

function GDALGCPsToGeoTransform(nGCPCount::Cint,pasGCPs::Ptr{GDAL_GCP},padfGeoTransform::Ptr{Cdouble},bApproxOK::Cint)
    ccall((:GDALGCPsToGeoTransform,libgdal),Cint,(Cint,Ptr{GDAL_GCP},Ptr{Cdouble},Cint),nGCPCount,pasGCPs,padfGeoTransform,bApproxOK)
end

function GDALInvGeoTransform(padfGeoTransformIn::Ptr{Cdouble},padfInvGeoTransformOut::Ptr{Cdouble})
    ccall((:GDALInvGeoTransform,libgdal),Cint,(Ptr{Cdouble},Ptr{Cdouble}),padfGeoTransformIn,padfInvGeoTransformOut)
end

function GDALApplyGeoTransform(arg1::Ptr{Cdouble},arg2::Cdouble,arg3::Cdouble,arg4::Ptr{Cdouble},arg5::Ptr{Cdouble})
    ccall((:GDALApplyGeoTransform,libgdal),Void,(Ptr{Cdouble},Cdouble,Cdouble,Ptr{Cdouble},Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5)
end

function GDALComposeGeoTransforms(padfGeoTransform1::Ptr{Cdouble},padfGeoTransform2::Ptr{Cdouble},padfGeoTransformOut::Ptr{Cdouble})
    ccall((:GDALComposeGeoTransforms,libgdal),Void,(Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),padfGeoTransform1,padfGeoTransform2,padfGeoTransformOut)
end

function GDALGetMetadataDomainList(hObject::GDALMajorObjectH)
    ccall((:GDALGetMetadataDomainList,libgdal),Ptr{Ptr{UInt8}},(GDALMajorObjectH,),hObject)
end

function GDALGetMetadata(arg1::GDALMajorObjectH,arg2::Ptr{UInt8})
    ccall((:GDALGetMetadata,libgdal),Ptr{Ptr{UInt8}},(GDALMajorObjectH,Ptr{UInt8}),arg1,arg2)
end

function GDALSetMetadata(arg1::GDALMajorObjectH,arg2::Ptr{Ptr{UInt8}},arg3::Ptr{UInt8})
    ccall((:GDALSetMetadata,libgdal),CPLErr,(GDALMajorObjectH,Ptr{Ptr{UInt8}},Ptr{UInt8}),arg1,arg2,arg3)
end

function GDALGetMetadataItem(arg1::GDALMajorObjectH,arg2::Ptr{UInt8},arg3::Ptr{UInt8})
    ccall((:GDALGetMetadataItem,libgdal),Ptr{UInt8},(GDALMajorObjectH,Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3)
end

function GDALSetMetadataItem(arg1::GDALMajorObjectH,arg2::Ptr{UInt8},arg3::Ptr{UInt8},arg4::Ptr{UInt8})
    ccall((:GDALSetMetadataItem,libgdal),CPLErr,(GDALMajorObjectH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function GDALGetDescription(arg1::GDALMajorObjectH)
    ccall((:GDALGetDescription,libgdal),Ptr{UInt8},(GDALMajorObjectH,),arg1)
end

function GDALSetDescription(arg1::GDALMajorObjectH,arg2::Ptr{UInt8})
    ccall((:GDALSetDescription,libgdal),Void,(GDALMajorObjectH,Ptr{UInt8}),arg1,arg2)
end

function GDALGetDatasetDriver(arg1::GDALDatasetH)
    ccall((:GDALGetDatasetDriver,libgdal),GDALDriverH,(GDALDatasetH,),arg1)
end

function GDALGetFileList(arg1::GDALDatasetH)
    ccall((:GDALGetFileList,libgdal),Ptr{Ptr{UInt8}},(GDALDatasetH,),arg1)
end

function GDALClose(arg1::GDALDatasetH)
    ccall((:GDALClose,libgdal),Void,(GDALDatasetH,),arg1)
end

function GDALGetRasterXSize(arg1::GDALDatasetH)
    ccall((:GDALGetRasterXSize,libgdal),Cint,(GDALDatasetH,),arg1)
end

function GDALGetRasterYSize(arg1::GDALDatasetH)
    ccall((:GDALGetRasterYSize,libgdal),Cint,(GDALDatasetH,),arg1)
end

function GDALGetRasterCount(arg1::GDALDatasetH)
    ccall((:GDALGetRasterCount,libgdal),Cint,(GDALDatasetH,),arg1)
end

function GDALGetRasterBand(arg1::GDALDatasetH,arg2::Cint)
    ccall((:GDALGetRasterBand,libgdal),GDALRasterBandH,(GDALDatasetH,Cint),arg1,arg2)
end

function GDALAddBand(hDS::GDALDatasetH,eType::GDALDataType,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALAddBand,libgdal),CPLErr,(GDALDatasetH,GDALDataType,Ptr{Ptr{UInt8}}),hDS,eType,papszOptions)
end

function GDALBeginAsyncReader(hDS::GDALDatasetH,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,pBuf::Ptr{Void},nBufXSize::Cint,nBufYSize::Cint,eBufType::GDALDataType,nBandCount::Cint,panBandMap::Ptr{Cint},nPixelSpace::Cint,nLineSpace::Cint,nBandSpace::Cint,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALBeginAsyncReader,libgdal),GDALAsyncReaderH,(GDALDatasetH,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,Cint,Cint,Ptr{Ptr{UInt8}}),hDS,nXOff,nYOff,nXSize,nYSize,pBuf,nBufXSize,nBufYSize,eBufType,nBandCount,panBandMap,nPixelSpace,nLineSpace,nBandSpace,papszOptions)
end

function GDALEndAsyncReader(hDS::GDALDatasetH,hAsynchReaderH::GDALAsyncReaderH)
    ccall((:GDALEndAsyncReader,libgdal),Void,(GDALDatasetH,GDALAsyncReaderH),hDS,hAsynchReaderH)
end

function GDALDatasetRasterIO(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nDSXOff::Cint,nDSYOff::Cint,nDSXSize::Cint,nDSYSize::Cint,pBuffer::Ptr{Void},nBXSize::Cint,nBYSize::Cint,eBDataType::GDALDataType,nBandCount::Cint,panBandCount::Ptr{Cint},nPixelSpace::Cint,nLineSpace::Cint,nBandSpace::Cint)
    ccall((:GDALDatasetRasterIO,libgdal),CPLErr,(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,Cint,Cint),hDS,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nBandCount,panBandCount,nPixelSpace,nLineSpace,nBandSpace)
end

function GDALDatasetRasterIOEx(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nDSXOff::Cint,nDSYOff::Cint,nDSXSize::Cint,nDSYSize::Cint,pBuffer::Ptr{Void},nBXSize::Cint,nBYSize::Cint,eBDataType::GDALDataType,nBandCount::Cint,panBandCount::Ptr{Cint},nPixelSpace::GSpacing,nLineSpace::GSpacing,nBandSpace::GSpacing,psExtraArg::Ptr{GDALRasterIOExtraArg})
    ccall((:GDALDatasetRasterIOEx,libgdal),CPLErr,(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Ptr{Cint},GSpacing,GSpacing,GSpacing,Ptr{GDALRasterIOExtraArg}),hDS,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nBandCount,panBandCount,nPixelSpace,nLineSpace,nBandSpace,psExtraArg)
end

function GDALDatasetAdviseRead(hDS::GDALDatasetH,nDSXOff::Cint,nDSYOff::Cint,nDSXSize::Cint,nDSYSize::Cint,nBXSize::Cint,nBYSize::Cint,eBDataType::GDALDataType,nBandCount::Cint,panBandCount::Ptr{Cint},papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALDatasetAdviseRead,libgdal),CPLErr,(GDALDatasetH,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,Ptr{Cint},Ptr{Ptr{UInt8}}),hDS,nDSXOff,nDSYOff,nDSXSize,nDSYSize,nBXSize,nBYSize,eBDataType,nBandCount,panBandCount,papszOptions)
end

function GDALGetProjectionRef(arg1::GDALDatasetH)
    ccall((:GDALGetProjectionRef,libgdal),Ptr{UInt8},(GDALDatasetH,),arg1)
end

function GDALSetProjection(arg1::GDALDatasetH,arg2::Ptr{UInt8})
    ccall((:GDALSetProjection,libgdal),CPLErr,(GDALDatasetH,Ptr{UInt8}),arg1,arg2)
end

function GDALGetGeoTransform(arg1::GDALDatasetH,arg2::Ptr{Cdouble})
    ccall((:GDALGetGeoTransform,libgdal),CPLErr,(GDALDatasetH,Ptr{Cdouble}),arg1,arg2)
end

function GDALSetGeoTransform(arg1::GDALDatasetH,arg2::Ptr{Cdouble})
    ccall((:GDALSetGeoTransform,libgdal),CPLErr,(GDALDatasetH,Ptr{Cdouble}),arg1,arg2)
end

function GDALGetGCPCount(arg1::GDALDatasetH)
    ccall((:GDALGetGCPCount,libgdal),Cint,(GDALDatasetH,),arg1)
end

function GDALGetGCPProjection(arg1::GDALDatasetH)
    ccall((:GDALGetGCPProjection,libgdal),Ptr{UInt8},(GDALDatasetH,),arg1)
end

function GDALGetGCPs(arg1::GDALDatasetH)
    ccall((:GDALGetGCPs,libgdal),Ptr{GDAL_GCP},(GDALDatasetH,),arg1)
end

function GDALSetGCPs(arg1::GDALDatasetH,arg2::Cint,arg3::Ptr{GDAL_GCP},arg4::Ptr{UInt8})
    ccall((:GDALSetGCPs,libgdal),CPLErr,(GDALDatasetH,Cint,Ptr{GDAL_GCP},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function GDALGetInternalHandle(arg1::GDALDatasetH,arg2::Ptr{UInt8})
    ccall((:GDALGetInternalHandle,libgdal),Ptr{Void},(GDALDatasetH,Ptr{UInt8}),arg1,arg2)
end

function GDALReferenceDataset(arg1::GDALDatasetH)
    ccall((:GDALReferenceDataset,libgdal),Cint,(GDALDatasetH,),arg1)
end

function GDALDereferenceDataset(arg1::GDALDatasetH)
    ccall((:GDALDereferenceDataset,libgdal),Cint,(GDALDatasetH,),arg1)
end

function GDALBuildOverviews(arg1::GDALDatasetH,arg2::Ptr{UInt8},arg3::Cint,arg4::Ptr{Cint},arg5::Cint,arg6::Ptr{Cint},arg7::GDALProgressFunc,arg8::Ptr{Void})
    ccall((:GDALBuildOverviews,libgdal),CPLErr,(GDALDatasetH,Ptr{UInt8},Cint,Ptr{Cint},Cint,Ptr{Cint},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8)
end

function GDALGetOpenDatasets(hDS::Ptr{Ptr{GDALDatasetH}},pnCount::Ptr{Cint})
    ccall((:GDALGetOpenDatasets,libgdal),Void,(Ptr{Ptr{GDALDatasetH}},Ptr{Cint}),hDS,pnCount)
end

function GDALGetAccess(hDS::GDALDatasetH)
    ccall((:GDALGetAccess,libgdal),Cint,(GDALDatasetH,),hDS)
end

function GDALFlushCache(hDS::GDALDatasetH)
    ccall((:GDALFlushCache,libgdal),Void,(GDALDatasetH,),hDS)
end

function GDALCreateDatasetMaskBand(hDS::GDALDatasetH,nFlags::Cint)
    ccall((:GDALCreateDatasetMaskBand,libgdal),CPLErr,(GDALDatasetH,Cint),hDS,nFlags)
end

function GDALDatasetCopyWholeRaster(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALDatasetCopyWholeRaster,libgdal),CPLErr,(GDALDatasetH,GDALDatasetH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcDS,hDstDS,papszOptions,pfnProgress,pProgressData)
end

function GDALRasterBandCopyWholeRaster(hSrcBand::GDALRasterBandH,hDstBand::GDALRasterBandH,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALRasterBandCopyWholeRaster,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hDstBand,papszOptions,pfnProgress,pProgressData)
end

function GDALRegenerateOverviews(hSrcBand::GDALRasterBandH,nOverviewCount::Cint,pahOverviewBands::Ptr{GDALRasterBandH},pszResampling::Ptr{UInt8},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALRegenerateOverviews,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{GDALRasterBandH},Ptr{UInt8},GDALProgressFunc,Ptr{Void}),hSrcBand,nOverviewCount,pahOverviewBands,pszResampling,pfnProgress,pProgressData)
end

function GDALDatasetGetLayerCount(arg1::GDALDatasetH)
    ccall((:GDALDatasetGetLayerCount,libgdal),Cint,(GDALDatasetH,),arg1)
end

function GDALDatasetGetLayer(arg1::GDALDatasetH,arg2::Cint)
    ccall((:GDALDatasetGetLayer,libgdal),OGRLayerH,(GDALDatasetH,Cint),arg1,arg2)
end

function GDALDatasetGetLayerByName(arg1::GDALDatasetH,arg2::Ptr{UInt8})
    ccall((:GDALDatasetGetLayerByName,libgdal),OGRLayerH,(GDALDatasetH,Ptr{UInt8}),arg1,arg2)
end

function GDALDatasetDeleteLayer(arg1::GDALDatasetH,arg2::Cint)
    ccall((:GDALDatasetDeleteLayer,libgdal),OGRErr,(GDALDatasetH,Cint),arg1,arg2)
end

function GDALDatasetCreateLayer(arg1::GDALDatasetH,arg2::Ptr{UInt8},arg3::OGRSpatialReferenceH,arg4::OGRwkbGeometryType,arg5::Ptr{Ptr{UInt8}})
    ccall((:GDALDatasetCreateLayer,libgdal),OGRLayerH,(GDALDatasetH,Ptr{UInt8},OGRSpatialReferenceH,OGRwkbGeometryType,Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4,arg5)
end

function GDALDatasetCopyLayer(arg1::GDALDatasetH,arg2::OGRLayerH,arg3::Ptr{UInt8},arg4::Ptr{Ptr{UInt8}})
    ccall((:GDALDatasetCopyLayer,libgdal),OGRLayerH,(GDALDatasetH,OGRLayerH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4)
end

function GDALDatasetTestCapability(arg1::GDALDatasetH,arg2::Ptr{UInt8})
    ccall((:GDALDatasetTestCapability,libgdal),Cint,(GDALDatasetH,Ptr{UInt8}),arg1,arg2)
end

function GDALDatasetExecuteSQL(arg1::GDALDatasetH,arg2::Ptr{UInt8},arg3::OGRGeometryH,arg4::Ptr{UInt8})
    ccall((:GDALDatasetExecuteSQL,libgdal),OGRLayerH,(GDALDatasetH,Ptr{UInt8},OGRGeometryH,Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function GDALDatasetReleaseResultSet(arg1::GDALDatasetH,arg2::OGRLayerH)
    ccall((:GDALDatasetReleaseResultSet,libgdal),Void,(GDALDatasetH,OGRLayerH),arg1,arg2)
end

function GDALDatasetGetStyleTable(arg1::GDALDatasetH)
    ccall((:GDALDatasetGetStyleTable,libgdal),OGRStyleTableH,(GDALDatasetH,),arg1)
end

function GDALDatasetSetStyleTableDirectly(arg1::GDALDatasetH,arg2::OGRStyleTableH)
    ccall((:GDALDatasetSetStyleTableDirectly,libgdal),Void,(GDALDatasetH,OGRStyleTableH),arg1,arg2)
end

function GDALDatasetSetStyleTable(arg1::GDALDatasetH,arg2::OGRStyleTableH)
    ccall((:GDALDatasetSetStyleTable,libgdal),Void,(GDALDatasetH,OGRStyleTableH),arg1,arg2)
end

function GDALDatasetStartTransaction(hDS::GDALDatasetH,bForce::Cint)
    ccall((:GDALDatasetStartTransaction,libgdal),OGRErr,(GDALDatasetH,Cint),hDS,bForce)
end

function GDALDatasetCommitTransaction(hDS::GDALDatasetH)
    ccall((:GDALDatasetCommitTransaction,libgdal),OGRErr,(GDALDatasetH,),hDS)
end

function GDALDatasetRollbackTransaction(hDS::GDALDatasetH)
    ccall((:GDALDatasetRollbackTransaction,libgdal),OGRErr,(GDALDatasetH,),hDS)
end

function GDALGetRasterDataType(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterDataType,libgdal),GDALDataType,(GDALRasterBandH,),arg1)
end

function GDALGetBlockSize(arg1::GDALRasterBandH,pnXSize::Ptr{Cint},pnYSize::Ptr{Cint})
    ccall((:GDALGetBlockSize,libgdal),Void,(GDALRasterBandH,Ptr{Cint},Ptr{Cint}),arg1,pnXSize,pnYSize)
end

function GDALRasterAdviseRead(hRB::GDALRasterBandH,nDSXOff::Cint,nDSYOff::Cint,nDSXSize::Cint,nDSYSize::Cint,nBXSize::Cint,nBYSize::Cint,eBDataType::GDALDataType,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALRasterAdviseRead,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Ptr{Ptr{UInt8}}),hRB,nDSXOff,nDSYOff,nDSXSize,nDSYSize,nBXSize,nBYSize,eBDataType,papszOptions)
end

function GDALRasterIO(hRBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nDSXOff::Cint,nDSYOff::Cint,nDSXSize::Cint,nDSYSize::Cint,pBuffer::Ptr{Void},nBXSize::Cint,nBYSize::Cint,eBDataType::GDALDataType,nPixelSpace::Cint,nLineSpace::Cint)
    ccall((:GDALRasterIO,libgdal),CPLErr,(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Cint),hRBand,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nPixelSpace,nLineSpace)
end

function GDALRasterIOEx(hRBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nDSXOff::Cint,nDSYOff::Cint,nDSXSize::Cint,nDSYSize::Cint,pBuffer::Ptr{Void},nBXSize::Cint,nBYSize::Cint,eBDataType::GDALDataType,nPixelSpace::GSpacing,nLineSpace::GSpacing,psExtraArg::Ptr{GDALRasterIOExtraArg})
    ccall((:GDALRasterIOEx,libgdal),CPLErr,(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,GSpacing,GSpacing,Ptr{GDALRasterIOExtraArg}),hRBand,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nPixelSpace,nLineSpace,psExtraArg)
end

function GDALReadBlock(arg1::GDALRasterBandH,arg2::Cint,arg3::Cint,arg4::Ptr{Void})
    ccall((:GDALReadBlock,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Void}),arg1,arg2,arg3,arg4)
end

function GDALWriteBlock(arg1::GDALRasterBandH,arg2::Cint,arg3::Cint,arg4::Ptr{Void})
    ccall((:GDALWriteBlock,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Void}),arg1,arg2,arg3,arg4)
end

function GDALGetRasterBandXSize(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterBandXSize,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetRasterBandYSize(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterBandYSize,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetRasterAccess(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterAccess,libgdal),GDALAccess,(GDALRasterBandH,),arg1)
end

function GDALGetBandNumber(arg1::GDALRasterBandH)
    ccall((:GDALGetBandNumber,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetBandDataset(arg1::GDALRasterBandH)
    ccall((:GDALGetBandDataset,libgdal),GDALDatasetH,(GDALRasterBandH,),arg1)
end

function GDALGetRasterColorInterpretation(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterColorInterpretation,libgdal),GDALColorInterp,(GDALRasterBandH,),arg1)
end

function GDALSetRasterColorInterpretation(arg1::GDALRasterBandH,arg2::GDALColorInterp)
    ccall((:GDALSetRasterColorInterpretation,libgdal),CPLErr,(GDALRasterBandH,GDALColorInterp),arg1,arg2)
end

function GDALGetRasterColorTable(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterColorTable,libgdal),GDALColorTableH,(GDALRasterBandH,),arg1)
end

function GDALSetRasterColorTable(arg1::GDALRasterBandH,arg2::GDALColorTableH)
    ccall((:GDALSetRasterColorTable,libgdal),CPLErr,(GDALRasterBandH,GDALColorTableH),arg1,arg2)
end

function GDALHasArbitraryOverviews(arg1::GDALRasterBandH)
    ccall((:GDALHasArbitraryOverviews,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetOverviewCount(arg1::GDALRasterBandH)
    ccall((:GDALGetOverviewCount,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetOverview(arg1::GDALRasterBandH,arg2::Cint)
    ccall((:GDALGetOverview,libgdal),GDALRasterBandH,(GDALRasterBandH,Cint),arg1,arg2)
end

function GDALGetRasterNoDataValue(arg1::GDALRasterBandH,arg2::Ptr{Cint})
    ccall((:GDALGetRasterNoDataValue,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,arg2)
end

function GDALSetRasterNoDataValue(arg1::GDALRasterBandH,arg2::Cdouble)
    ccall((:GDALSetRasterNoDataValue,libgdal),CPLErr,(GDALRasterBandH,Cdouble),arg1,arg2)
end

function GDALGetRasterCategoryNames(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterCategoryNames,libgdal),Ptr{Ptr{UInt8}},(GDALRasterBandH,),arg1)
end

function GDALSetRasterCategoryNames(arg1::GDALRasterBandH,arg2::Ptr{Ptr{UInt8}})
    ccall((:GDALSetRasterCategoryNames,libgdal),CPLErr,(GDALRasterBandH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function GDALGetRasterMinimum(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
    ccall((:GDALGetRasterMinimum,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function GDALGetRasterMaximum(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
    ccall((:GDALGetRasterMaximum,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function GDALGetRasterStatistics(arg1::GDALRasterBandH,bApproxOK::Cint,bForce::Cint,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pdfMean::Ptr{Cdouble},pdfStdDev::Ptr{Cdouble})
    ccall((:GDALGetRasterStatistics,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),arg1,bApproxOK,bForce,pdfMin,pdfMax,pdfMean,pdfStdDev)
end

function GDALComputeRasterStatistics(arg1::GDALRasterBandH,bApproxOK::Cint,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pdfMean::Ptr{Cdouble},pdfStdDev::Ptr{Cdouble},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALComputeRasterStatistics,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},GDALProgressFunc,Ptr{Void}),arg1,bApproxOK,pdfMin,pdfMax,pdfMean,pdfStdDev,pfnProgress,pProgressData)
end

function GDALSetRasterStatistics(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,dfMean::Cdouble,dfStdDev::Cdouble)
    ccall((:GDALSetRasterStatistics,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cdouble,Cdouble),hBand,dfMin,dfMax,dfMean,dfStdDev)
end

function GDALGetRasterUnitType(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterUnitType,libgdal),Ptr{UInt8},(GDALRasterBandH,),arg1)
end

function GDALSetRasterUnitType(hBand::GDALRasterBandH,pszNewValue::Ptr{UInt8})
    ccall((:GDALSetRasterUnitType,libgdal),CPLErr,(GDALRasterBandH,Ptr{UInt8}),hBand,pszNewValue)
end

function GDALGetRasterOffset(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
    ccall((:GDALGetRasterOffset,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function GDALSetRasterOffset(hBand::GDALRasterBandH,dfNewOffset::Cdouble)
    ccall((:GDALSetRasterOffset,libgdal),CPLErr,(GDALRasterBandH,Cdouble),hBand,dfNewOffset)
end

function GDALGetRasterScale(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
    ccall((:GDALGetRasterScale,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function GDALSetRasterScale(hBand::GDALRasterBandH,dfNewOffset::Cdouble)
    ccall((:GDALSetRasterScale,libgdal),CPLErr,(GDALRasterBandH,Cdouble),hBand,dfNewOffset)
end

function GDALComputeRasterMinMax(hBand::GDALRasterBandH,bApproxOK::Cint,adfMinMax::Array_2_Cdouble)
    ccall((:GDALComputeRasterMinMax,libgdal),Void,(GDALRasterBandH,Cint,Array_2_Cdouble),hBand,bApproxOK,adfMinMax)
end

function GDALFlushRasterCache(hBand::GDALRasterBandH)
    ccall((:GDALFlushRasterCache,libgdal),CPLErr,(GDALRasterBandH,),hBand)
end

function GDALGetRasterHistogram(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,nBuckets::Cint,panHistogram::Ptr{Cint},bIncludeOutOfRange::Cint,bApproxOK::Cint,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetRasterHistogram,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cint},Cint,Cint,GDALProgressFunc,Ptr{Void}),hBand,dfMin,dfMax,nBuckets,panHistogram,bIncludeOutOfRange,bApproxOK,pfnProgress,pProgressData)
end

function GDALGetRasterHistogramEx(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,nBuckets::Cint,panHistogram::Ptr{GUIntBig},bIncludeOutOfRange::Cint,bApproxOK::Cint,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetRasterHistogramEx,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{GUIntBig},Cint,Cint,GDALProgressFunc,Ptr{Void}),hBand,dfMin,dfMax,nBuckets,panHistogram,bIncludeOutOfRange,bApproxOK,pfnProgress,pProgressData)
end

function GDALGetDefaultHistogram(hBand::GDALRasterBandH,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pnBuckets::Ptr{Cint},ppanHistogram::Ptr{Ptr{Cint}},bForce::Cint,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetDefaultHistogram,libgdal),CPLErr,(GDALRasterBandH,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint},Ptr{Ptr{Cint}},Cint,GDALProgressFunc,Ptr{Void}),hBand,pdfMin,pdfMax,pnBuckets,ppanHistogram,bForce,pfnProgress,pProgressData)
end

function GDALGetDefaultHistogramEx(hBand::GDALRasterBandH,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pnBuckets::Ptr{Cint},ppanHistogram::Ptr{Ptr{GUIntBig}},bForce::Cint,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetDefaultHistogramEx,libgdal),CPLErr,(GDALRasterBandH,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint},Ptr{Ptr{GUIntBig}},Cint,GDALProgressFunc,Ptr{Void}),hBand,pdfMin,pdfMax,pnBuckets,ppanHistogram,bForce,pfnProgress,pProgressData)
end

function GDALSetDefaultHistogram(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,nBuckets::Cint,panHistogram::Ptr{Cint})
    ccall((:GDALSetDefaultHistogram,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cint}),hBand,dfMin,dfMax,nBuckets,panHistogram)
end

function GDALSetDefaultHistogramEx(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,nBuckets::Cint,panHistogram::Ptr{GUIntBig})
    ccall((:GDALSetDefaultHistogramEx,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{GUIntBig}),hBand,dfMin,dfMax,nBuckets,panHistogram)
end

function GDALGetRandomRasterSample(arg1::GDALRasterBandH,arg2::Cint,arg3::Ptr{Cfloat})
    ccall((:GDALGetRandomRasterSample,libgdal),Cint,(GDALRasterBandH,Cint,Ptr{Cfloat}),arg1,arg2,arg3)
end

function GDALGetRasterSampleOverview(arg1::GDALRasterBandH,arg2::Cint)
    ccall((:GDALGetRasterSampleOverview,libgdal),GDALRasterBandH,(GDALRasterBandH,Cint),arg1,arg2)
end

function GDALGetRasterSampleOverviewEx(arg1::GDALRasterBandH,arg2::GUIntBig)
    ccall((:GDALGetRasterSampleOverviewEx,libgdal),GDALRasterBandH,(GDALRasterBandH,GUIntBig),arg1,arg2)
end

function GDALFillRaster(hBand::GDALRasterBandH,dfRealValue::Cdouble,dfImaginaryValue::Cdouble)
    ccall((:GDALFillRaster,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble),hBand,dfRealValue,dfImaginaryValue)
end

function GDALComputeBandStats(hBand::GDALRasterBandH,nSampleStep::Cint,pdfMean::Ptr{Cdouble},pdfStdDev::Ptr{Cdouble},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALComputeBandStats,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{Cdouble},Ptr{Cdouble},GDALProgressFunc,Ptr{Void}),hBand,nSampleStep,pdfMean,pdfStdDev,pfnProgress,pProgressData)
end

function GDALOverviewMagnitudeCorrection(hBaseBand::GDALRasterBandH,nOverviewCount::Cint,pahOverviews::Ptr{GDALRasterBandH},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALOverviewMagnitudeCorrection,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{GDALRasterBandH},GDALProgressFunc,Ptr{Void}),hBaseBand,nOverviewCount,pahOverviews,pfnProgress,pProgressData)
end

function GDALGetDefaultRAT(hBand::GDALRasterBandH)
    ccall((:GDALGetDefaultRAT,libgdal),GDALRasterAttributeTableH,(GDALRasterBandH,),hBand)
end

function GDALSetDefaultRAT(arg1::GDALRasterBandH,arg2::GDALRasterAttributeTableH)
    ccall((:GDALSetDefaultRAT,libgdal),CPLErr,(GDALRasterBandH,GDALRasterAttributeTableH),arg1,arg2)
end

function GDALAddDerivedBandPixelFunc(pszName::Ptr{UInt8},pfnPixelFunc::GDALDerivedPixelFunc)
    ccall((:GDALAddDerivedBandPixelFunc,libgdal),CPLErr,(Ptr{UInt8},GDALDerivedPixelFunc),pszName,pfnPixelFunc)
end

function GDALGetMaskBand(hBand::GDALRasterBandH)
    ccall((:GDALGetMaskBand,libgdal),GDALRasterBandH,(GDALRasterBandH,),hBand)
end

function GDALGetMaskFlags(hBand::GDALRasterBandH)
    ccall((:GDALGetMaskFlags,libgdal),Cint,(GDALRasterBandH,),hBand)
end

function GDALCreateMaskBand(hBand::GDALRasterBandH,nFlags::Cint)
    ccall((:GDALCreateMaskBand,libgdal),CPLErr,(GDALRasterBandH,Cint),hBand,nFlags)
end

function GDALARGetNextUpdatedRegion(hARIO::GDALAsyncReaderH,dfTimeout::Cdouble,pnXBufOff::Ptr{Cint},pnYBufOff::Ptr{Cint},pnXBufSize::Ptr{Cint},pnYBufSize::Ptr{Cint})
    ccall((:GDALARGetNextUpdatedRegion,libgdal),GDALAsyncStatusType,(GDALAsyncReaderH,Cdouble,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint}),hARIO,dfTimeout,pnXBufOff,pnYBufOff,pnXBufSize,pnYBufSize)
end

function GDALARLockBuffer(hARIO::GDALAsyncReaderH,dfTimeout::Cdouble)
    ccall((:GDALARLockBuffer,libgdal),Cint,(GDALAsyncReaderH,Cdouble),hARIO,dfTimeout)
end

function GDALARUnlockBuffer(hARIO::GDALAsyncReaderH)
    ccall((:GDALARUnlockBuffer,libgdal),Void,(GDALAsyncReaderH,),hARIO)
end

function GDALGeneralCmdLineProcessor(nArgc::Cint,ppapszArgv::Ptr{Ptr{Ptr{UInt8}}},nOptions::Cint)
    ccall((:GDALGeneralCmdLineProcessor,libgdal),Cint,(Cint,Ptr{Ptr{Ptr{UInt8}}},Cint),nArgc,ppapszArgv,nOptions)
end

function GDALSwapWords(pData::Ptr{Void},nWordSize::Cint,nWordCount::Cint,nWordSkip::Cint)
    ccall((:GDALSwapWords,libgdal),Void,(Ptr{Void},Cint,Cint,Cint),pData,nWordSize,nWordCount,nWordSkip)
end

function GDALCopyWords(pSrcData::Ptr{Void},eSrcType::GDALDataType,nSrcPixelOffset::Cint,pDstData::Ptr{Void},eDstType::GDALDataType,nDstPixelOffset::Cint,nWordCount::Cint)
    ccall((:GDALCopyWords,libgdal),Void,(Ptr{Void},GDALDataType,Cint,Ptr{Void},GDALDataType,Cint,Cint),pSrcData,eSrcType,nSrcPixelOffset,pDstData,eDstType,nDstPixelOffset,nWordCount)
end

function GDALCopyBits(pabySrcData::Ptr{GByte},nSrcOffset::Cint,nSrcStep::Cint,pabyDstData::Ptr{GByte},nDstOffset::Cint,nDstStep::Cint,nBitCount::Cint,nStepCount::Cint)
    ccall((:GDALCopyBits,libgdal),Void,(Ptr{GByte},Cint,Cint,Ptr{GByte},Cint,Cint,Cint,Cint),pabySrcData,nSrcOffset,nSrcStep,pabyDstData,nDstOffset,nDstStep,nBitCount,nStepCount)
end

function GDALLoadWorldFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble})
    ccall((:GDALLoadWorldFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble}),arg1,arg2)
end

function GDALReadWorldFile(arg1::Ptr{UInt8},arg2::Ptr{UInt8},arg3::Ptr{Cdouble})
    ccall((:GDALReadWorldFile,libgdal),Cint,(Ptr{UInt8},Ptr{UInt8},Ptr{Cdouble}),arg1,arg2,arg3)
end

function GDALWriteWorldFile(arg1::Ptr{UInt8},arg2::Ptr{UInt8},arg3::Ptr{Cdouble})
    ccall((:GDALWriteWorldFile,libgdal),Cint,(Ptr{UInt8},Ptr{UInt8},Ptr{Cdouble}),arg1,arg2,arg3)
end

function GDALLoadTabFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble},arg3::Ptr{Ptr{UInt8}},arg4::Ptr{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALLoadTabFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function GDALReadTabFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble},arg3::Ptr{Ptr{UInt8}},arg4::Ptr{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALReadTabFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function GDALLoadOziMapFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble},arg3::Ptr{Ptr{UInt8}},arg4::Ptr{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALLoadOziMapFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function GDALReadOziMapFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble},arg3::Ptr{Ptr{UInt8}},arg4::Ptr{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALReadOziMapFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function GDALDecToDMS(arg1::Cdouble,arg2::Ptr{UInt8},arg3::Cint)
    ccall((:GDALDecToDMS,libgdal),Ptr{UInt8},(Cdouble,Ptr{UInt8},Cint),arg1,arg2,arg3)
end

function GDALPackedDMSToDec(arg1::Cdouble)
    ccall((:GDALPackedDMSToDec,libgdal),Cdouble,(Cdouble,),arg1)
end

function GDALDecToPackedDMS(arg1::Cdouble)
    ccall((:GDALDecToPackedDMS,libgdal),Cdouble,(Cdouble,),arg1)
end

function GDALExtractRPCInfo(arg1::Ptr{Ptr{UInt8}},arg2::Ptr{GDALRPCInfo})
    ccall((:GDALExtractRPCInfo,libgdal),Cint,(Ptr{Ptr{UInt8}},Ptr{GDALRPCInfo}),arg1,arg2)
end

function GDALCreateColorTable(arg1::GDALPaletteInterp)
    ccall((:GDALCreateColorTable,libgdal),GDALColorTableH,(GDALPaletteInterp,),arg1)
end

function GDALDestroyColorTable(arg1::GDALColorTableH)
    ccall((:GDALDestroyColorTable,libgdal),Void,(GDALColorTableH,),arg1)
end

function GDALCloneColorTable(arg1::GDALColorTableH)
    ccall((:GDALCloneColorTable,libgdal),GDALColorTableH,(GDALColorTableH,),arg1)
end

function GDALGetPaletteInterpretation(arg1::GDALColorTableH)
    ccall((:GDALGetPaletteInterpretation,libgdal),GDALPaletteInterp,(GDALColorTableH,),arg1)
end

function GDALGetColorEntryCount(arg1::GDALColorTableH)
    ccall((:GDALGetColorEntryCount,libgdal),Cint,(GDALColorTableH,),arg1)
end

function GDALGetColorEntry(arg1::GDALColorTableH,arg2::Cint)
    ccall((:GDALGetColorEntry,libgdal),Ptr{GDALColorEntry},(GDALColorTableH,Cint),arg1,arg2)
end

function GDALGetColorEntryAsRGB(arg1::GDALColorTableH,arg2::Cint,arg3::Ptr{GDALColorEntry})
    ccall((:GDALGetColorEntryAsRGB,libgdal),Cint,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
end

function GDALSetColorEntry(arg1::GDALColorTableH,arg2::Cint,arg3::Ptr{GDALColorEntry})
    ccall((:GDALSetColorEntry,libgdal),Void,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
end

function GDALCreateColorRamp(hTable::GDALColorTableH,nStartIndex::Cint,psStartColor::Ptr{GDALColorEntry},nEndIndex::Cint,psEndColor::Ptr{GDALColorEntry})
    ccall((:GDALCreateColorRamp,libgdal),Void,(GDALColorTableH,Cint,Ptr{GDALColorEntry},Cint,Ptr{GDALColorEntry}),hTable,nStartIndex,psStartColor,nEndIndex,psEndColor)
end

function GDALCreateRasterAttributeTable()
    ccall((:GDALCreateRasterAttributeTable,libgdal),GDALRasterAttributeTableH,())
end

function GDALDestroyRasterAttributeTable(arg1::GDALRasterAttributeTableH)
    ccall((:GDALDestroyRasterAttributeTable,libgdal),Void,(GDALRasterAttributeTableH,),arg1)
end

function GDALRATGetColumnCount(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATGetColumnCount,libgdal),Cint,(GDALRasterAttributeTableH,),arg1)
end

function GDALRATGetNameOfCol(arg1::GDALRasterAttributeTableH,arg2::Cint)
    ccall((:GDALRATGetNameOfCol,libgdal),Ptr{UInt8},(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function GDALRATGetUsageOfCol(arg1::GDALRasterAttributeTableH,arg2::Cint)
    ccall((:GDALRATGetUsageOfCol,libgdal),GDALRATFieldUsage,(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function GDALRATGetTypeOfCol(arg1::GDALRasterAttributeTableH,arg2::Cint)
    ccall((:GDALRATGetTypeOfCol,libgdal),GDALRATFieldType,(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function GDALRATGetColOfUsage(arg1::GDALRasterAttributeTableH,arg2::GDALRATFieldUsage)
    ccall((:GDALRATGetColOfUsage,libgdal),Cint,(GDALRasterAttributeTableH,GDALRATFieldUsage),arg1,arg2)
end

function GDALRATGetRowCount(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATGetRowCount,libgdal),Cint,(GDALRasterAttributeTableH,),arg1)
end

function GDALRATGetValueAsString(arg1::GDALRasterAttributeTableH,arg2::Cint,arg3::Cint)
    ccall((:GDALRATGetValueAsString,libgdal),Ptr{UInt8},(GDALRasterAttributeTableH,Cint,Cint),arg1,arg2,arg3)
end

function GDALRATGetValueAsInt(arg1::GDALRasterAttributeTableH,arg2::Cint,arg3::Cint)
    ccall((:GDALRATGetValueAsInt,libgdal),Cint,(GDALRasterAttributeTableH,Cint,Cint),arg1,arg2,arg3)
end

function GDALRATGetValueAsDouble(arg1::GDALRasterAttributeTableH,arg2::Cint,arg3::Cint)
    ccall((:GDALRATGetValueAsDouble,libgdal),Cdouble,(GDALRasterAttributeTableH,Cint,Cint),arg1,arg2,arg3)
end

function GDALRATSetValueAsString(arg1::GDALRasterAttributeTableH,arg2::Cint,arg3::Cint,arg4::Ptr{UInt8})
    ccall((:GDALRATSetValueAsString,libgdal),Void,(GDALRasterAttributeTableH,Cint,Cint,Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function GDALRATSetValueAsInt(arg1::GDALRasterAttributeTableH,arg2::Cint,arg3::Cint,arg4::Cint)
    ccall((:GDALRATSetValueAsInt,libgdal),Void,(GDALRasterAttributeTableH,Cint,Cint,Cint),arg1,arg2,arg3,arg4)
end

function GDALRATSetValueAsDouble(arg1::GDALRasterAttributeTableH,arg2::Cint,arg3::Cint,arg4::Cdouble)
    ccall((:GDALRATSetValueAsDouble,libgdal),Void,(GDALRasterAttributeTableH,Cint,Cint,Cdouble),arg1,arg2,arg3,arg4)
end

function GDALRATChangesAreWrittenToFile(hRAT::GDALRasterAttributeTableH)
    ccall((:GDALRATChangesAreWrittenToFile,libgdal),Cint,(GDALRasterAttributeTableH,),hRAT)
end

function GDALRATValuesIOAsDouble(hRAT::GDALRasterAttributeTableH,eRWFlag::GDALRWFlag,iField::Cint,iStartRow::Cint,iLength::Cint,pdfData::Ptr{Cdouble})
    ccall((:GDALRATValuesIOAsDouble,libgdal),CPLErr,(GDALRasterAttributeTableH,GDALRWFlag,Cint,Cint,Cint,Ptr{Cdouble}),hRAT,eRWFlag,iField,iStartRow,iLength,pdfData)
end

function GDALRATValuesIOAsInteger(hRAT::GDALRasterAttributeTableH,eRWFlag::GDALRWFlag,iField::Cint,iStartRow::Cint,iLength::Cint,pnData::Ptr{Cint})
    ccall((:GDALRATValuesIOAsInteger,libgdal),CPLErr,(GDALRasterAttributeTableH,GDALRWFlag,Cint,Cint,Cint,Ptr{Cint}),hRAT,eRWFlag,iField,iStartRow,iLength,pnData)
end

function GDALRATValuesIOAsString(hRAT::GDALRasterAttributeTableH,eRWFlag::GDALRWFlag,iField::Cint,iStartRow::Cint,iLength::Cint,papszStrList::Ptr{Ptr{UInt8}})
    ccall((:GDALRATValuesIOAsString,libgdal),CPLErr,(GDALRasterAttributeTableH,GDALRWFlag,Cint,Cint,Cint,Ptr{Ptr{UInt8}}),hRAT,eRWFlag,iField,iStartRow,iLength,papszStrList)
end

function GDALRATSetRowCount(arg1::GDALRasterAttributeTableH,arg2::Cint)
    ccall((:GDALRATSetRowCount,libgdal),Void,(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function GDALRATCreateColumn(arg1::GDALRasterAttributeTableH,arg2::Ptr{UInt8},arg3::GDALRATFieldType,arg4::GDALRATFieldUsage)
    ccall((:GDALRATCreateColumn,libgdal),CPLErr,(GDALRasterAttributeTableH,Ptr{UInt8},GDALRATFieldType,GDALRATFieldUsage),arg1,arg2,arg3,arg4)
end

function GDALRATSetLinearBinning(arg1::GDALRasterAttributeTableH,arg2::Cdouble,arg3::Cdouble)
    ccall((:GDALRATSetLinearBinning,libgdal),CPLErr,(GDALRasterAttributeTableH,Cdouble,Cdouble),arg1,arg2,arg3)
end

function GDALRATGetLinearBinning(arg1::GDALRasterAttributeTableH,arg2::Ptr{Cdouble},arg3::Ptr{Cdouble})
    ccall((:GDALRATGetLinearBinning,libgdal),Cint,(GDALRasterAttributeTableH,Ptr{Cdouble},Ptr{Cdouble}),arg1,arg2,arg3)
end

function GDALRATInitializeFromColorTable(arg1::GDALRasterAttributeTableH,arg2::GDALColorTableH)
    ccall((:GDALRATInitializeFromColorTable,libgdal),CPLErr,(GDALRasterAttributeTableH,GDALColorTableH),arg1,arg2)
end

function GDALRATTranslateToColorTable(arg1::GDALRasterAttributeTableH,nEntryCount::Cint)
    ccall((:GDALRATTranslateToColorTable,libgdal),GDALColorTableH,(GDALRasterAttributeTableH,Cint),arg1,nEntryCount)
end

function GDALRATDumpReadable(arg1::GDALRasterAttributeTableH,arg2::Ptr{FILE})
    ccall((:GDALRATDumpReadable,libgdal),Void,(GDALRasterAttributeTableH,Ptr{FILE}),arg1,arg2)
end

function GDALRATClone(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATClone,libgdal),GDALRasterAttributeTableH,(GDALRasterAttributeTableH,),arg1)
end

function GDALRATSerializeJSON(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATSerializeJSON,libgdal),Ptr{Void},(GDALRasterAttributeTableH,),arg1)
end

function GDALRATGetRowOfValue(arg1::GDALRasterAttributeTableH,arg2::Cdouble)
    ccall((:GDALRATGetRowOfValue,libgdal),Cint,(GDALRasterAttributeTableH,Cdouble),arg1,arg2)
end

function GDALSetCacheMax(nBytes::Cint)
    ccall((:GDALSetCacheMax,libgdal),Void,(Cint,),nBytes)
end

function GDALGetCacheMax()
    ccall((:GDALGetCacheMax,libgdal),Cint,())
end

function GDALGetCacheUsed()
    ccall((:GDALGetCacheUsed,libgdal),Cint,())
end

function GDALSetCacheMax64(nBytes::GIntBig)
    ccall((:GDALSetCacheMax64,libgdal),Void,(GIntBig,),nBytes)
end

function GDALGetCacheMax64()
    ccall((:GDALGetCacheMax64,libgdal),GIntBig,())
end

function GDALGetCacheUsed64()
    ccall((:GDALGetCacheUsed64,libgdal),GIntBig,())
end

function GDALFlushCacheBlock()
    ccall((:GDALFlushCacheBlock,libgdal),Cint,())
end

function GDALDatasetGetVirtualMem(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,nBufXSize::Cint,nBufYSize::Cint,eBufType::GDALDataType,nBandCount::Cint,panBandMap::Ptr{Cint},nPixelSpace::Cint,nLineSpace::GIntBig,nBandSpace::GIntBig,nCacheSize::Csize_t,nPageSizeHint::Csize_t,bSingleThreadUsage::Cint,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALDatasetGetVirtualMem,libgdal),Ptr{CPLVirtualMem},(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,GIntBig,GIntBig,Csize_t,Csize_t,Cint,Ptr{Ptr{UInt8}}),hDS,eRWFlag,nXOff,nYOff,nXSize,nYSize,nBufXSize,nBufYSize,eBufType,nBandCount,panBandMap,nPixelSpace,nLineSpace,nBandSpace,nCacheSize,nPageSizeHint,bSingleThreadUsage,papszOptions)
end

function GDALRasterBandGetVirtualMem(hBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,nBufXSize::Cint,nBufYSize::Cint,eBufType::GDALDataType,nPixelSpace::Cint,nLineSpace::GIntBig,nCacheSize::Csize_t,nPageSizeHint::Csize_t,bSingleThreadUsage::Cint,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALRasterBandGetVirtualMem,libgdal),Ptr{CPLVirtualMem},(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,GIntBig,Csize_t,Csize_t,Cint,Ptr{Ptr{UInt8}}),hBand,eRWFlag,nXOff,nYOff,nXSize,nYSize,nBufXSize,nBufYSize,eBufType,nPixelSpace,nLineSpace,nCacheSize,nPageSizeHint,bSingleThreadUsage,papszOptions)
end

function GDALGetVirtualMemAuto(hBand::GDALRasterBandH,eRWFlag::GDALRWFlag,pnPixelSpace::Ptr{Cint},pnLineSpace::Ptr{GIntBig},papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALGetVirtualMemAuto,libgdal),Ptr{CPLVirtualMem},(GDALRasterBandH,GDALRWFlag,Ptr{Cint},Ptr{GIntBig},Ptr{Ptr{UInt8}}),hBand,eRWFlag,pnPixelSpace,pnLineSpace,papszOptions)
end

function GDALDatasetGetTiledVirtualMem(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,nTileXSize::Cint,nTileYSize::Cint,eBufType::GDALDataType,nBandCount::Cint,panBandMap::Ptr{Cint},eTileOrganization::GDALTileOrganization,nCacheSize::Csize_t,bSingleThreadUsage::Cint,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALDatasetGetTiledVirtualMem,libgdal),Ptr{CPLVirtualMem},(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,Ptr{Cint},GDALTileOrganization,Csize_t,Cint,Ptr{Ptr{UInt8}}),hDS,eRWFlag,nXOff,nYOff,nXSize,nYSize,nTileXSize,nTileYSize,eBufType,nBandCount,panBandMap,eTileOrganization,nCacheSize,bSingleThreadUsage,papszOptions)
end

function GDALRasterBandGetTiledVirtualMem(hBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint,nTileXSize::Cint,nTileYSize::Cint,eBufType::GDALDataType,nCacheSize::Csize_t,bSingleThreadUsage::Cint,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALRasterBandGetTiledVirtualMem,libgdal),Ptr{CPLVirtualMem},(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Csize_t,Cint,Ptr{Ptr{UInt8}}),hBand,eRWFlag,nXOff,nYOff,nXSize,nYSize,nTileXSize,nTileYSize,eBufType,nCacheSize,bSingleThreadUsage,papszOptions)
end

function GDALGetJPEG2000Structure(pszFilename::Ptr{UInt8},papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALGetJPEG2000Structure,libgdal),Ptr{CPLXMLNode},(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszOptions)
end
