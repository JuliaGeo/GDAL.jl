function getdatatypesize(arg1::GDALDataType)
    ccall((:GDALGetDataTypeSize,libgdal),Cint,(GDALDataType,),arg1)
end

function datatypeiscomplex(arg1::GDALDataType)
    ccall((:GDALDataTypeIsComplex,libgdal),Cint,(GDALDataType,),arg1)
end

function getdatatypename(arg1::GDALDataType)
    bytestring(ccall((:GDALGetDataTypeName,libgdal),Ptr{UInt8},(GDALDataType,),arg1))
end

function getdatatypebyname(arg1::AbstractString)
    ccall((:GDALGetDataTypeByName,libgdal),GDALDataType,(Ptr{UInt8},),arg1)
end

function datatypeunion(arg1::GDALDataType,arg2::GDALDataType)
    ccall((:GDALDataTypeUnion,libgdal),GDALDataType,(GDALDataType,GDALDataType),arg1,arg2)
end

function getasyncstatustypename(arg1::GDALAsyncStatusType)
    bytestring(ccall((:GDALGetAsyncStatusTypeName,libgdal),Ptr{UInt8},(GDALAsyncStatusType,),arg1))
end

function getasyncstatustypebyname(arg1::AbstractString)
    ccall((:GDALGetAsyncStatusTypeByName,libgdal),GDALAsyncStatusType,(Ptr{UInt8},),arg1)
end

function getcolorinterpretationname(arg1::GDALColorInterp)
    bytestring(ccall((:GDALGetColorInterpretationName,libgdal),Ptr{UInt8},(GDALColorInterp,),arg1))
end

function getcolorinterpretationbyname(pszName::AbstractString)
    ccall((:GDALGetColorInterpretationByName,libgdal),GDALColorInterp,(Ptr{UInt8},),pszName)
end

function getpaletteinterpretationname(arg1::GDALPaletteInterp)
    bytestring(ccall((:GDALGetPaletteInterpretationName,libgdal),Ptr{UInt8},(GDALPaletteInterp,),arg1))
end

function allregister()
    ccall((:GDALAllRegister,libgdal),Void,())
end

function create(hDriver::GDALDriverH,arg1::AbstractString,arg2::Integer,arg3::Integer,arg4::Integer,arg5::GDALDataType,arg6::Vector{UTF8String})
    checknull(ccall((:GDALCreate,libgdal),GDALDatasetH,(GDALDriverH,Ptr{UInt8},Cint,Cint,Cint,GDALDataType,Ptr{Ptr{UInt8}}),hDriver,arg1,arg2,arg3,arg4,arg5,arg6))
end

function createcopy(arg1::GDALDriverH,arg2::AbstractString,arg3::GDALDatasetH,arg4::Integer,arg5::Vector{UTF8String},arg6::GDALProgressFunc,arg7::Ptr{Void})
    checknull(ccall((:GDALCreateCopy,libgdal),GDALDatasetH,(GDALDriverH,Ptr{UInt8},GDALDatasetH,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7))
end

function identifydriver(pszFilename::AbstractString,papszFileList::Vector{UTF8String})
    checknull(ccall((:GDALIdentifyDriver,libgdal),GDALDriverH,(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszFileList))
end

function open(pszFilename::AbstractString,eAccess::GDALAccess)
    checknull(ccall((:GDALOpen,libgdal),GDALDatasetH,(Ptr{UInt8},GDALAccess),pszFilename,eAccess))
end

function openshared(arg1::AbstractString,arg2::GDALAccess)
    checknull(ccall((:GDALOpenShared,libgdal),GDALDatasetH,(Ptr{UInt8},GDALAccess),arg1,arg2))
end

function openex(pszFilename::AbstractString,nOpenFlags::UInt32,papszAllowedDrivers::Vector{UTF8String},papszOpenOptions::Vector{UTF8String},papszSiblingFiles::Vector{UTF8String})
    checknull(ccall((:GDALOpenEx,libgdal),GDALDatasetH,(Ptr{UInt8},UInt32,Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}}),pszFilename,nOpenFlags,papszAllowedDrivers,papszOpenOptions,papszSiblingFiles))
end

function dumpopendatasets(arg1::Ptr{FILE})
    ccall((:GDALDumpOpenDatasets,libgdal),Cint,(Ptr{FILE},),arg1)
end

function getdriverbyname(arg1::AbstractString)
    checknull(ccall((:GDALGetDriverByName,libgdal),GDALDriverH,(Ptr{UInt8},),arg1))
end

function getdrivercount()
    ccall((:GDALGetDriverCount,libgdal),Cint,())
end

function getdriver(arg1::Integer)
    checknull(ccall((:GDALGetDriver,libgdal),GDALDriverH,(Cint,),arg1))
end

function destroydriver(arg1::GDALDriverH)
    ccall((:GDALDestroyDriver,libgdal),Void,(GDALDriverH,),arg1)
end

function registerdriver(arg1::GDALDriverH)
    ccall((:GDALRegisterDriver,libgdal),Cint,(GDALDriverH,),arg1)
end

function deregisterdriver(arg1::GDALDriverH)
    ccall((:GDALDeregisterDriver,libgdal),Void,(GDALDriverH,),arg1)
end

function destroydrivermanager()
    ccall((:GDALDestroyDriverManager,libgdal),Void,())
end

function destroy()
    ccall((:GDALDestroy,libgdal),Void,())
end

function deletedataset(arg1::GDALDriverH,arg2::AbstractString)
    ccall((:GDALDeleteDataset,libgdal),CPLErr,(GDALDriverH,Ptr{UInt8}),arg1,arg2)
end

function renamedataset(arg1::GDALDriverH,pszNewName::AbstractString,pszOldName::AbstractString)
    ccall((:GDALRenameDataset,libgdal),CPLErr,(GDALDriverH,Ptr{UInt8},Ptr{UInt8}),arg1,pszNewName,pszOldName)
end

function copydatasetfiles(arg1::GDALDriverH,pszNewName::AbstractString,pszOldName::AbstractString)
    ccall((:GDALCopyDatasetFiles,libgdal),CPLErr,(GDALDriverH,Ptr{UInt8},Ptr{UInt8}),arg1,pszNewName,pszOldName)
end

function validatecreationoptions(arg1::GDALDriverH,papszCreationOptions::Vector{UTF8String})
    ccall((:GDALValidateCreationOptions,libgdal),Cint,(GDALDriverH,Ptr{Ptr{UInt8}}),arg1,papszCreationOptions)
end

function getdrivershortname(arg1::GDALDriverH)
    bytestring(ccall((:GDALGetDriverShortName,libgdal),Ptr{UInt8},(GDALDriverH,),arg1))
end

function getdriverlongname(arg1::GDALDriverH)
    bytestring(ccall((:GDALGetDriverLongName,libgdal),Ptr{UInt8},(GDALDriverH,),arg1))
end

function getdriverhelptopic(arg1::GDALDriverH)
    bytestring(ccall((:GDALGetDriverHelpTopic,libgdal),Ptr{UInt8},(GDALDriverH,),arg1))
end

function getdrivercreationoptionlist(arg1::GDALDriverH)
    bytestring(ccall((:GDALGetDriverCreationOptionList,libgdal),Ptr{UInt8},(GDALDriverH,),arg1))
end

function initgcps(arg1::Integer,arg2::Ptr{GDAL_GCP})
    ccall((:GDALInitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
end

function deinitgcps(arg1::Integer,arg2::Ptr{GDAL_GCP})
    ccall((:GDALDeinitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
end

function duplicategcps(arg1::Integer,arg2::Ptr{GDAL_GCP})
    ccall((:GDALDuplicateGCPs,libgdal),Ptr{GDAL_GCP},(Cint,Ptr{GDAL_GCP}),arg1,arg2)
end

function gcpstogeotransform(nGCPCount::Integer,pasGCPs::Ptr{GDAL_GCP},padfGeoTransform::Vector{Float64},bApproxOK::Integer)
    ccall((:GDALGCPsToGeoTransform,libgdal),Cint,(Cint,Ptr{GDAL_GCP},Ptr{Cdouble},Cint),nGCPCount,pasGCPs,padfGeoTransform,bApproxOK)
end

function invgeotransform(padfGeoTransformIn::Vector{Float64},padfInvGeoTransformOut::Vector{Float64})
    ccall((:GDALInvGeoTransform,libgdal),Cint,(Ptr{Cdouble},Ptr{Cdouble}),padfGeoTransformIn,padfInvGeoTransformOut)
end

function applygeotransform(arg1::Vector{Float64},arg2::Real,arg3::Real,arg4::Vector{Float64},arg5::Vector{Float64})
    ccall((:GDALApplyGeoTransform,libgdal),Void,(Ptr{Cdouble},Cdouble,Cdouble,Ptr{Cdouble},Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5)
end

function composegeotransforms(padfGeoTransform1::Vector{Float64},padfGeoTransform2::Vector{Float64},padfGeoTransformOut::Vector{Float64})
    ccall((:GDALComposeGeoTransforms,libgdal),Void,(Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),padfGeoTransform1,padfGeoTransform2,padfGeoTransformOut)
end

function getmetadatadomainlist(hObject::GDALMajorObjectH)
    bytestring(unsafe_load(ccall((:GDALGetMetadataDomainList,libgdal),Ptr{Ptr{UInt8}},(GDALMajorObjectH,),hObject)))
end

function getmetadata(arg1::GDALMajorObjectH,arg2::AbstractString)
    bytestring(unsafe_load(ccall((:GDALGetMetadata,libgdal),Ptr{Ptr{UInt8}},(GDALMajorObjectH,Ptr{UInt8}),arg1,arg2)))
end

function setmetadata(arg1::GDALMajorObjectH,arg2::Vector{UTF8String},arg3::AbstractString)
    ccall((:GDALSetMetadata,libgdal),CPLErr,(GDALMajorObjectH,Ptr{Ptr{UInt8}},Ptr{UInt8}),arg1,arg2,arg3)
end

function getmetadataitem(arg1::GDALMajorObjectH,arg2::AbstractString,arg3::AbstractString)
    bytestring(ccall((:GDALGetMetadataItem,libgdal),Ptr{UInt8},(GDALMajorObjectH,Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3))
end

function setmetadataitem(arg1::GDALMajorObjectH,arg2::AbstractString,arg3::AbstractString,arg4::AbstractString)
    ccall((:GDALSetMetadataItem,libgdal),CPLErr,(GDALMajorObjectH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function getdescription(arg1::GDALMajorObjectH)
    bytestring(ccall((:GDALGetDescription,libgdal),Ptr{UInt8},(GDALMajorObjectH,),arg1))
end

function setdescription(arg1::GDALMajorObjectH,arg2::AbstractString)
    ccall((:GDALSetDescription,libgdal),Void,(GDALMajorObjectH,Ptr{UInt8}),arg1,arg2)
end

function getdatasetdriver(arg1::GDALDatasetH)
    checknull(ccall((:GDALGetDatasetDriver,libgdal),GDALDriverH,(GDALDatasetH,),arg1))
end

function getfilelist(arg1::GDALDatasetH)
    bytestring(unsafe_load(ccall((:GDALGetFileList,libgdal),Ptr{Ptr{UInt8}},(GDALDatasetH,),arg1)))
end

function close(arg1::GDALDatasetH)
    ccall((:GDALClose,libgdal),Void,(GDALDatasetH,),arg1)
end

function getrasterxsize(arg1::GDALDatasetH)
    ccall((:GDALGetRasterXSize,libgdal),Cint,(GDALDatasetH,),arg1)
end

function getrasterysize(arg1::GDALDatasetH)
    ccall((:GDALGetRasterYSize,libgdal),Cint,(GDALDatasetH,),arg1)
end

function getrastercount(arg1::GDALDatasetH)
    ccall((:GDALGetRasterCount,libgdal),Cint,(GDALDatasetH,),arg1)
end

function getrasterband(arg1::GDALDatasetH,arg2::Integer)
    checknull(ccall((:GDALGetRasterBand,libgdal),GDALRasterBandH,(GDALDatasetH,Cint),arg1,arg2))
end

function addband(hDS::GDALDatasetH,eType::GDALDataType,papszOptions::Vector{UTF8String})
    ccall((:GDALAddBand,libgdal),CPLErr,(GDALDatasetH,GDALDataType,Ptr{Ptr{UInt8}}),hDS,eType,papszOptions)
end

function beginasyncreader(hDS::GDALDatasetH,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,pBuf::Ptr{Void},nBufXSize::Integer,nBufYSize::Integer,eBufType::GDALDataType,nBandCount::Integer,panBandMap::Vector{Cint},nPixelSpace::Integer,nLineSpace::Integer,nBandSpace::Integer,papszOptions::Vector{UTF8String})
    checknull(ccall((:GDALBeginAsyncReader,libgdal),GDALAsyncReaderH,(GDALDatasetH,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,Cint,Cint,Ptr{Ptr{UInt8}}),hDS,nXOff,nYOff,nXSize,nYSize,pBuf,nBufXSize,nBufYSize,eBufType,nBandCount,panBandMap,nPixelSpace,nLineSpace,nBandSpace,papszOptions))
end

function endasyncreader(hDS::GDALDatasetH,hAsynchReaderH::GDALAsyncReaderH)
    ccall((:GDALEndAsyncReader,libgdal),Void,(GDALDatasetH,GDALAsyncReaderH),hDS,hAsynchReaderH)
end

function datasetrasterio(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,pBuffer::Ptr{Void},nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,nBandCount::Integer,panBandCount::Vector{Cint},nPixelSpace::Integer,nLineSpace::Integer,nBandSpace::Integer)
    ccall((:GDALDatasetRasterIO,libgdal),CPLErr,(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,Cint,Cint),hDS,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nBandCount,panBandCount,nPixelSpace,nLineSpace,nBandSpace)
end

function datasetrasterioex(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,pBuffer::Ptr{Void},nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,nBandCount::Integer,panBandCount::Vector{Cint},nPixelSpace::GSpacing,nLineSpace::GSpacing,nBandSpace::GSpacing,psExtraArg::GDALRasterIOExtraArg)
    ccall((:GDALDatasetRasterIOEx,libgdal),CPLErr,(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Ptr{Cint},GSpacing,GSpacing,GSpacing,Ref{GDALRasterIOExtraArg}),hDS,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nBandCount,panBandCount,nPixelSpace,nLineSpace,nBandSpace,psExtraArg)
end

function datasetadviseread(hDS::GDALDatasetH,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,nBandCount::Integer,panBandCount::Vector{Cint},papszOptions::Vector{UTF8String})
    ccall((:GDALDatasetAdviseRead,libgdal),CPLErr,(GDALDatasetH,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,Ptr{Cint},Ptr{Ptr{UInt8}}),hDS,nDSXOff,nDSYOff,nDSXSize,nDSYSize,nBXSize,nBYSize,eBDataType,nBandCount,panBandCount,papszOptions)
end

function getprojectionref(arg1::GDALDatasetH)
    bytestring(ccall((:GDALGetProjectionRef,libgdal),Ptr{UInt8},(GDALDatasetH,),arg1))
end

function setprojection(arg1::GDALDatasetH,arg2::AbstractString)
    ccall((:GDALSetProjection,libgdal),CPLErr,(GDALDatasetH,Ptr{UInt8}),arg1,arg2)
end

function getgeotransform(arg1::GDALDatasetH,arg2::Vector{Float64})
    ccall((:GDALGetGeoTransform,libgdal),CPLErr,(GDALDatasetH,Ptr{Cdouble}),arg1,arg2)
end

function setgeotransform(arg1::GDALDatasetH,arg2::Vector{Float64})
    ccall((:GDALSetGeoTransform,libgdal),CPLErr,(GDALDatasetH,Ptr{Cdouble}),arg1,arg2)
end

function getgcpcount(arg1::GDALDatasetH)
    ccall((:GDALGetGCPCount,libgdal),Cint,(GDALDatasetH,),arg1)
end

function getgcpprojection(arg1::GDALDatasetH)
    bytestring(ccall((:GDALGetGCPProjection,libgdal),Ptr{UInt8},(GDALDatasetH,),arg1))
end

function getgcps(arg1::GDALDatasetH)
    ccall((:GDALGetGCPs,libgdal),Ptr{GDAL_GCP},(GDALDatasetH,),arg1)
end

function setgcps(arg1::GDALDatasetH,arg2::Integer,arg3::Ptr{GDAL_GCP},arg4::AbstractString)
    ccall((:GDALSetGCPs,libgdal),CPLErr,(GDALDatasetH,Cint,Ptr{GDAL_GCP},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function getinternalhandle(arg1::GDALDatasetH,arg2::AbstractString)
    ccall((:GDALGetInternalHandle,libgdal),Ptr{Void},(GDALDatasetH,Ptr{UInt8}),arg1,arg2)
end

function referencedataset(arg1::GDALDatasetH)
    ccall((:GDALReferenceDataset,libgdal),Cint,(GDALDatasetH,),arg1)
end

function dereferencedataset(arg1::GDALDatasetH)
    ccall((:GDALDereferenceDataset,libgdal),Cint,(GDALDatasetH,),arg1)
end

function buildoverviews(arg1::GDALDatasetH,arg2::AbstractString,arg3::Integer,arg4::Vector{Cint},arg5::Integer,arg6::Vector{Cint},arg7::GDALProgressFunc,arg8::Ptr{Void})
    ccall((:GDALBuildOverviews,libgdal),CPLErr,(GDALDatasetH,Ptr{UInt8},Cint,Ptr{Cint},Cint,Ptr{Cint},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8)
end

function getopendatasets(hDS::Ptr{Ptr{GDALDatasetH}},pnCount::Vector{Cint})
    ccall((:GDALGetOpenDatasets,libgdal),Void,(Ptr{Ptr{GDALDatasetH}},Ptr{Cint}),hDS,pnCount)
end

function getaccess(hDS::GDALDatasetH)
    ccall((:GDALGetAccess,libgdal),Cint,(GDALDatasetH,),hDS)
end

function flushcache(hDS::GDALDatasetH)
    ccall((:GDALFlushCache,libgdal),Void,(GDALDatasetH,),hDS)
end

function createdatasetmaskband(hDS::GDALDatasetH,nFlags::Integer)
    ccall((:GDALCreateDatasetMaskBand,libgdal),CPLErr,(GDALDatasetH,Cint),hDS,nFlags)
end

function datasetcopywholeraster(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALDatasetCopyWholeRaster,libgdal),CPLErr,(GDALDatasetH,GDALDatasetH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcDS,hDstDS,papszOptions,pfnProgress,pProgressData)
end

function rasterbandcopywholeraster(hSrcBand::GDALRasterBandH,hDstBand::GDALRasterBandH,papszOptions::Vector{UTF8String},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALRasterBandCopyWholeRaster,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hDstBand,papszOptions,pfnProgress,pProgressData)
end

function regenerateoverviews(hSrcBand::GDALRasterBandH,nOverviewCount::Integer,pahOverviewBands::Ptr{GDALRasterBandH},pszResampling::AbstractString,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALRegenerateOverviews,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{GDALRasterBandH},Ptr{UInt8},GDALProgressFunc,Ptr{Void}),hSrcBand,nOverviewCount,pahOverviewBands,pszResampling,pfnProgress,pProgressData)
end

function datasetgetlayercount(arg1::GDALDatasetH)
    ccall((:GDALDatasetGetLayerCount,libgdal),Cint,(GDALDatasetH,),arg1)
end

function datasetgetlayer(arg1::GDALDatasetH,arg2::Integer)
    checknull(ccall((:GDALDatasetGetLayer,libgdal),OGRLayerH,(GDALDatasetH,Cint),arg1,arg2))
end

function datasetgetlayerbyname(arg1::GDALDatasetH,arg2::AbstractString)
    checknull(ccall((:GDALDatasetGetLayerByName,libgdal),OGRLayerH,(GDALDatasetH,Ptr{UInt8}),arg1,arg2))
end

function datasetdeletelayer(arg1::GDALDatasetH,arg2::Integer)
    ccall((:GDALDatasetDeleteLayer,libgdal),OGRErr,(GDALDatasetH,Cint),arg1,arg2)
end

function datasetcreatelayer(arg1::GDALDatasetH,arg2::AbstractString,arg3::OGRSpatialReferenceH,arg4::OGRwkbGeometryType,arg5::Vector{UTF8String})
    checknull(ccall((:GDALDatasetCreateLayer,libgdal),OGRLayerH,(GDALDatasetH,Ptr{UInt8},OGRSpatialReferenceH,OGRwkbGeometryType,Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4,arg5))
end

function datasetcopylayer(arg1::GDALDatasetH,arg2::OGRLayerH,arg3::AbstractString,arg4::Vector{UTF8String})
    checknull(ccall((:GDALDatasetCopyLayer,libgdal),OGRLayerH,(GDALDatasetH,OGRLayerH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4))
end

function datasettestcapability(arg1::GDALDatasetH,arg2::AbstractString)
    ccall((:GDALDatasetTestCapability,libgdal),Cint,(GDALDatasetH,Ptr{UInt8}),arg1,arg2)
end

function datasetexecutesql(arg1::GDALDatasetH,arg2::AbstractString,arg3::OGRGeometryH,arg4::AbstractString)
    checknull(ccall((:GDALDatasetExecuteSQL,libgdal),OGRLayerH,(GDALDatasetH,Ptr{UInt8},OGRGeometryH,Ptr{UInt8}),arg1,arg2,arg3,arg4))
end

function datasetreleaseresultset(arg1::GDALDatasetH,arg2::OGRLayerH)
    ccall((:GDALDatasetReleaseResultSet,libgdal),Void,(GDALDatasetH,OGRLayerH),arg1,arg2)
end

function datasetgetstyletable(arg1::GDALDatasetH)
    checknull(ccall((:GDALDatasetGetStyleTable,libgdal),OGRStyleTableH,(GDALDatasetH,),arg1))
end

function datasetsetstyletabledirectly(arg1::GDALDatasetH,arg2::OGRStyleTableH)
    ccall((:GDALDatasetSetStyleTableDirectly,libgdal),Void,(GDALDatasetH,OGRStyleTableH),arg1,arg2)
end

function datasetsetstyletable(arg1::GDALDatasetH,arg2::OGRStyleTableH)
    ccall((:GDALDatasetSetStyleTable,libgdal),Void,(GDALDatasetH,OGRStyleTableH),arg1,arg2)
end

function datasetstarttransaction(hDS::GDALDatasetH,bForce::Integer)
    ccall((:GDALDatasetStartTransaction,libgdal),OGRErr,(GDALDatasetH,Cint),hDS,bForce)
end

function datasetcommittransaction(hDS::GDALDatasetH)
    ccall((:GDALDatasetCommitTransaction,libgdal),OGRErr,(GDALDatasetH,),hDS)
end

function datasetrollbacktransaction(hDS::GDALDatasetH)
    ccall((:GDALDatasetRollbackTransaction,libgdal),OGRErr,(GDALDatasetH,),hDS)
end

function getrasterdatatype(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterDataType,libgdal),GDALDataType,(GDALRasterBandH,),arg1)
end

function getblocksize(arg1::GDALRasterBandH,pnXSize::Vector{Cint},pnYSize::Vector{Cint})
    ccall((:GDALGetBlockSize,libgdal),Void,(GDALRasterBandH,Ptr{Cint},Ptr{Cint}),arg1,pnXSize,pnYSize)
end

function rasteradviseread(hRB::GDALRasterBandH,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,papszOptions::Vector{UTF8String})
    ccall((:GDALRasterAdviseRead,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Ptr{Ptr{UInt8}}),hRB,nDSXOff,nDSYOff,nDSXSize,nDSYSize,nBXSize,nBYSize,eBDataType,papszOptions)
end

function rasterio(hRBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,pBuffer::Ptr{Void},nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,nPixelSpace::Integer,nLineSpace::Integer)
    ccall((:GDALRasterIO,libgdal),CPLErr,(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Cint),hRBand,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nPixelSpace,nLineSpace)
end

function rasterioex(hRBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,pBuffer::Ptr{Void},nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,nPixelSpace::GSpacing,nLineSpace::GSpacing,psExtraArg::GDALRasterIOExtraArg)
    ccall((:GDALRasterIOEx,libgdal),CPLErr,(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,GSpacing,GSpacing,Ref{GDALRasterIOExtraArg}),hRBand,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nPixelSpace,nLineSpace,psExtraArg)
end

function readblock(arg1::GDALRasterBandH,arg2::Integer,arg3::Integer,arg4::Ptr{Void})
    ccall((:GDALReadBlock,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Void}),arg1,arg2,arg3,arg4)
end

function writeblock(arg1::GDALRasterBandH,arg2::Integer,arg3::Integer,arg4::Ptr{Void})
    ccall((:GDALWriteBlock,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Void}),arg1,arg2,arg3,arg4)
end

function getrasterbandxsize(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterBandXSize,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function getrasterbandysize(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterBandYSize,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function getrasteraccess(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterAccess,libgdal),GDALAccess,(GDALRasterBandH,),arg1)
end

function getbandnumber(arg1::GDALRasterBandH)
    ccall((:GDALGetBandNumber,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function getbanddataset(arg1::GDALRasterBandH)
    checknull(ccall((:GDALGetBandDataset,libgdal),GDALDatasetH,(GDALRasterBandH,),arg1))
end

function getrastercolorinterpretation(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterColorInterpretation,libgdal),GDALColorInterp,(GDALRasterBandH,),arg1)
end

function setrastercolorinterpretation(arg1::GDALRasterBandH,arg2::GDALColorInterp)
    ccall((:GDALSetRasterColorInterpretation,libgdal),CPLErr,(GDALRasterBandH,GDALColorInterp),arg1,arg2)
end

function getrastercolortable(arg1::GDALRasterBandH)
    checknull(ccall((:GDALGetRasterColorTable,libgdal),GDALColorTableH,(GDALRasterBandH,),arg1))
end

function setrastercolortable(arg1::GDALRasterBandH,arg2::GDALColorTableH)
    ccall((:GDALSetRasterColorTable,libgdal),CPLErr,(GDALRasterBandH,GDALColorTableH),arg1,arg2)
end

function hasarbitraryoverviews(arg1::GDALRasterBandH)
    ccall((:GDALHasArbitraryOverviews,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function getoverviewcount(arg1::GDALRasterBandH)
    ccall((:GDALGetOverviewCount,libgdal),Cint,(GDALRasterBandH,),arg1)
end

function getoverview(arg1::GDALRasterBandH,arg2::Integer)
    checknull(ccall((:GDALGetOverview,libgdal),GDALRasterBandH,(GDALRasterBandH,Cint),arg1,arg2))
end

function getrasternodatavalue(arg1::GDALRasterBandH,arg2::Vector{Cint})
    ccall((:GDALGetRasterNoDataValue,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,arg2)
end

function setrasternodatavalue(arg1::GDALRasterBandH,arg2::Real)
    ccall((:GDALSetRasterNoDataValue,libgdal),CPLErr,(GDALRasterBandH,Cdouble),arg1,arg2)
end

function getrastercategorynames(arg1::GDALRasterBandH)
    bytestring(unsafe_load(ccall((:GDALGetRasterCategoryNames,libgdal),Ptr{Ptr{UInt8}},(GDALRasterBandH,),arg1)))
end

function setrastercategorynames(arg1::GDALRasterBandH,arg2::Vector{UTF8String})
    ccall((:GDALSetRasterCategoryNames,libgdal),CPLErr,(GDALRasterBandH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function getrasterminimum(arg1::GDALRasterBandH,pbSuccess::Vector{Cint})
    ccall((:GDALGetRasterMinimum,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function getrastermaximum(arg1::GDALRasterBandH,pbSuccess::Vector{Cint})
    ccall((:GDALGetRasterMaximum,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function getrasterstatistics(arg1::GDALRasterBandH,bApproxOK::Integer,bForce::Integer,pdfMin::Vector{Float64},pdfMax::Vector{Float64},pdfMean::Vector{Float64},pdfStdDev::Vector{Float64})
    ccall((:GDALGetRasterStatistics,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),arg1,bApproxOK,bForce,pdfMin,pdfMax,pdfMean,pdfStdDev)
end

function computerasterstatistics(arg1::GDALRasterBandH,bApproxOK::Integer,pdfMin::Vector{Float64},pdfMax::Vector{Float64},pdfMean::Vector{Float64},pdfStdDev::Vector{Float64},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALComputeRasterStatistics,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},GDALProgressFunc,Ptr{Void}),arg1,bApproxOK,pdfMin,pdfMax,pdfMean,pdfStdDev,pfnProgress,pProgressData)
end

function setrasterstatistics(hBand::GDALRasterBandH,dfMin::Real,dfMax::Real,dfMean::Real,dfStdDev::Real)
    ccall((:GDALSetRasterStatistics,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cdouble,Cdouble),hBand,dfMin,dfMax,dfMean,dfStdDev)
end

function getrasterunittype(arg1::GDALRasterBandH)
    bytestring(ccall((:GDALGetRasterUnitType,libgdal),Ptr{UInt8},(GDALRasterBandH,),arg1))
end

function setrasterunittype(hBand::GDALRasterBandH,pszNewValue::AbstractString)
    ccall((:GDALSetRasterUnitType,libgdal),CPLErr,(GDALRasterBandH,Ptr{UInt8}),hBand,pszNewValue)
end

function getrasteroffset(arg1::GDALRasterBandH,pbSuccess::Vector{Cint})
    ccall((:GDALGetRasterOffset,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function setrasteroffset(hBand::GDALRasterBandH,dfNewOffset::Real)
    ccall((:GDALSetRasterOffset,libgdal),CPLErr,(GDALRasterBandH,Cdouble),hBand,dfNewOffset)
end

function getrasterscale(arg1::GDALRasterBandH,pbSuccess::Vector{Cint})
    ccall((:GDALGetRasterScale,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function setrasterscale(hBand::GDALRasterBandH,dfNewOffset::Real)
    ccall((:GDALSetRasterScale,libgdal),CPLErr,(GDALRasterBandH,Cdouble),hBand,dfNewOffset)
end

function computerasterminmax(hBand::GDALRasterBandH,bApproxOK::Integer,adfMinMax::Array_2_Cdouble)
    ccall((:GDALComputeRasterMinMax,libgdal),Void,(GDALRasterBandH,Cint,Array_2_Cdouble),hBand,bApproxOK,adfMinMax)
end

function flushrastercache(hBand::GDALRasterBandH)
    ccall((:GDALFlushRasterCache,libgdal),CPLErr,(GDALRasterBandH,),hBand)
end

function getrasterhistogram(hBand::GDALRasterBandH,dfMin::Real,dfMax::Real,nBuckets::Integer,panHistogram::Vector{Cint},bIncludeOutOfRange::Integer,bApproxOK::Integer,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetRasterHistogram,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cint},Cint,Cint,GDALProgressFunc,Ptr{Void}),hBand,dfMin,dfMax,nBuckets,panHistogram,bIncludeOutOfRange,bApproxOK,pfnProgress,pProgressData)
end

function getrasterhistogramex(hBand::GDALRasterBandH,dfMin::Real,dfMax::Real,nBuckets::Integer,panHistogram::Ptr{GUIntBig},bIncludeOutOfRange::Integer,bApproxOK::Integer,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetRasterHistogramEx,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{GUIntBig},Cint,Cint,GDALProgressFunc,Ptr{Void}),hBand,dfMin,dfMax,nBuckets,panHistogram,bIncludeOutOfRange,bApproxOK,pfnProgress,pProgressData)
end

function getdefaulthistogram(hBand::GDALRasterBandH,pdfMin::Vector{Float64},pdfMax::Vector{Float64},pnBuckets::Vector{Cint},ppanHistogram::Ptr{Ptr{Cint}},bForce::Integer,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetDefaultHistogram,libgdal),CPLErr,(GDALRasterBandH,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint},Ptr{Ptr{Cint}},Cint,GDALProgressFunc,Ptr{Void}),hBand,pdfMin,pdfMax,pnBuckets,ppanHistogram,bForce,pfnProgress,pProgressData)
end

function getdefaulthistogramex(hBand::GDALRasterBandH,pdfMin::Vector{Float64},pdfMax::Vector{Float64},pnBuckets::Vector{Cint},ppanHistogram::Ptr{Ptr{GUIntBig}},bForce::Integer,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetDefaultHistogramEx,libgdal),CPLErr,(GDALRasterBandH,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint},Ptr{Ptr{GUIntBig}},Cint,GDALProgressFunc,Ptr{Void}),hBand,pdfMin,pdfMax,pnBuckets,ppanHistogram,bForce,pfnProgress,pProgressData)
end

function setdefaulthistogram(hBand::GDALRasterBandH,dfMin::Real,dfMax::Real,nBuckets::Integer,panHistogram::Vector{Cint})
    ccall((:GDALSetDefaultHistogram,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cint}),hBand,dfMin,dfMax,nBuckets,panHistogram)
end

function setdefaulthistogramex(hBand::GDALRasterBandH,dfMin::Real,dfMax::Real,nBuckets::Integer,panHistogram::Ptr{GUIntBig})
    ccall((:GDALSetDefaultHistogramEx,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{GUIntBig}),hBand,dfMin,dfMax,nBuckets,panHistogram)
end

function getrandomrastersample(arg1::GDALRasterBandH,arg2::Integer,arg3::Ptr{Cfloat})
    ccall((:GDALGetRandomRasterSample,libgdal),Cint,(GDALRasterBandH,Cint,Ptr{Cfloat}),arg1,arg2,arg3)
end

function getrastersampleoverview(arg1::GDALRasterBandH,arg2::Integer)
    checknull(ccall((:GDALGetRasterSampleOverview,libgdal),GDALRasterBandH,(GDALRasterBandH,Cint),arg1,arg2))
end

function getrastersampleoverviewex(arg1::GDALRasterBandH,arg2::GUIntBig)
    checknull(ccall((:GDALGetRasterSampleOverviewEx,libgdal),GDALRasterBandH,(GDALRasterBandH,GUIntBig),arg1,arg2))
end

function fillraster(hBand::GDALRasterBandH,dfRealValue::Real,dfImaginaryValue::Real)
    ccall((:GDALFillRaster,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble),hBand,dfRealValue,dfImaginaryValue)
end

function computebandstats(hBand::GDALRasterBandH,nSampleStep::Integer,pdfMean::Vector{Float64},pdfStdDev::Vector{Float64},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALComputeBandStats,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{Cdouble},Ptr{Cdouble},GDALProgressFunc,Ptr{Void}),hBand,nSampleStep,pdfMean,pdfStdDev,pfnProgress,pProgressData)
end

function overviewmagnitudecorrection(hBaseBand::GDALRasterBandH,nOverviewCount::Integer,pahOverviews::Ptr{GDALRasterBandH},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALOverviewMagnitudeCorrection,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{GDALRasterBandH},GDALProgressFunc,Ptr{Void}),hBaseBand,nOverviewCount,pahOverviews,pfnProgress,pProgressData)
end

function getdefaultrat(hBand::GDALRasterBandH)
    checknull(ccall((:GDALGetDefaultRAT,libgdal),GDALRasterAttributeTableH,(GDALRasterBandH,),hBand))
end

function setdefaultrat(arg1::GDALRasterBandH,arg2::GDALRasterAttributeTableH)
    ccall((:GDALSetDefaultRAT,libgdal),CPLErr,(GDALRasterBandH,GDALRasterAttributeTableH),arg1,arg2)
end

function addderivedbandpixelfunc(pszName::AbstractString,pfnPixelFunc::GDALDerivedPixelFunc)
    ccall((:GDALAddDerivedBandPixelFunc,libgdal),CPLErr,(Ptr{UInt8},GDALDerivedPixelFunc),pszName,pfnPixelFunc)
end

function getmaskband(hBand::GDALRasterBandH)
    checknull(ccall((:GDALGetMaskBand,libgdal),GDALRasterBandH,(GDALRasterBandH,),hBand))
end

function getmaskflags(hBand::GDALRasterBandH)
    ccall((:GDALGetMaskFlags,libgdal),Cint,(GDALRasterBandH,),hBand)
end

function createmaskband(hBand::GDALRasterBandH,nFlags::Integer)
    ccall((:GDALCreateMaskBand,libgdal),CPLErr,(GDALRasterBandH,Cint),hBand,nFlags)
end

function argetnextupdatedregion(hARIO::GDALAsyncReaderH,dfTimeout::Real,pnXBufOff::Vector{Cint},pnYBufOff::Vector{Cint},pnXBufSize::Vector{Cint},pnYBufSize::Vector{Cint})
    ccall((:GDALARGetNextUpdatedRegion,libgdal),GDALAsyncStatusType,(GDALAsyncReaderH,Cdouble,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint}),hARIO,dfTimeout,pnXBufOff,pnYBufOff,pnXBufSize,pnYBufSize)
end

function arlockbuffer(hARIO::GDALAsyncReaderH,dfTimeout::Real)
    ccall((:GDALARLockBuffer,libgdal),Cint,(GDALAsyncReaderH,Cdouble),hARIO,dfTimeout)
end

function arunlockbuffer(hARIO::GDALAsyncReaderH)
    ccall((:GDALARUnlockBuffer,libgdal),Void,(GDALAsyncReaderH,),hARIO)
end

function generalcmdlineprocessor(nArgc::Integer,ppapszArgv::Ptr{Ptr{Ptr{UInt8}}},nOptions::Integer)
    ccall((:GDALGeneralCmdLineProcessor,libgdal),Cint,(Cint,Ptr{Ptr{Ptr{UInt8}}},Cint),nArgc,ppapszArgv,nOptions)
end

function swapwords(pData::Ptr{Void},nWordSize::Integer,nWordCount::Integer,nWordSkip::Integer)
    ccall((:GDALSwapWords,libgdal),Void,(Ptr{Void},Cint,Cint,Cint),pData,nWordSize,nWordCount,nWordSkip)
end

function copywords(pSrcData::Ptr{Void},eSrcType::GDALDataType,nSrcPixelOffset::Integer,pDstData::Ptr{Void},eDstType::GDALDataType,nDstPixelOffset::Integer,nWordCount::Integer)
    ccall((:GDALCopyWords,libgdal),Void,(Ptr{Void},GDALDataType,Cint,Ptr{Void},GDALDataType,Cint,Cint),pSrcData,eSrcType,nSrcPixelOffset,pDstData,eDstType,nDstPixelOffset,nWordCount)
end

function copybits(pabySrcData::Ptr{GByte},nSrcOffset::Integer,nSrcStep::Integer,pabyDstData::Ptr{GByte},nDstOffset::Integer,nDstStep::Integer,nBitCount::Integer,nStepCount::Integer)
    ccall((:GDALCopyBits,libgdal),Void,(Ptr{GByte},Cint,Cint,Ptr{GByte},Cint,Cint,Cint,Cint),pabySrcData,nSrcOffset,nSrcStep,pabyDstData,nDstOffset,nDstStep,nBitCount,nStepCount)
end

function loadworldfile(arg1::AbstractString,arg2::Vector{Float64})
    ccall((:GDALLoadWorldFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble}),arg1,arg2)
end

function readworldfile(arg1::AbstractString,arg2::AbstractString,arg3::Vector{Float64})
    ccall((:GDALReadWorldFile,libgdal),Cint,(Ptr{UInt8},Ptr{UInt8},Ptr{Cdouble}),arg1,arg2,arg3)
end

function writeworldfile(arg1::AbstractString,arg2::AbstractString,arg3::Vector{Float64})
    ccall((:GDALWriteWorldFile,libgdal),Cint,(Ptr{UInt8},Ptr{UInt8},Ptr{Cdouble}),arg1,arg2,arg3)
end

function loadtabfile(arg1::AbstractString,arg2::Vector{Float64},arg3::Vector{UTF8String},arg4::Vector{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALLoadTabFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function readtabfile(arg1::AbstractString,arg2::Vector{Float64},arg3::Vector{UTF8String},arg4::Vector{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALReadTabFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function loadozimapfile(arg1::AbstractString,arg2::Vector{Float64},arg3::Vector{UTF8String},arg4::Vector{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALLoadOziMapFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function readozimapfile(arg1::AbstractString,arg2::Vector{Float64},arg3::Vector{UTF8String},arg4::Vector{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALReadOziMapFile,libgdal),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function dectodms(arg1::Real,arg2::AbstractString,arg3::Integer)
    bytestring(ccall((:GDALDecToDMS,libgdal),Ptr{UInt8},(Cdouble,Ptr{UInt8},Cint),arg1,arg2,arg3))
end

function packeddmstodec(arg1::Real)
    ccall((:GDALPackedDMSToDec,libgdal),Cdouble,(Cdouble,),arg1)
end

function dectopackeddms(arg1::Real)
    ccall((:GDALDecToPackedDMS,libgdal),Cdouble,(Cdouble,),arg1)
end

function extractrpcinfo(arg1::Vector{UTF8String},arg2::Ptr{GDALRPCInfo})
    ccall((:GDALExtractRPCInfo,libgdal),Cint,(Ptr{Ptr{UInt8}},Ptr{GDALRPCInfo}),arg1,arg2)
end

function createcolortable(arg1::GDALPaletteInterp)
    checknull(ccall((:GDALCreateColorTable,libgdal),GDALColorTableH,(GDALPaletteInterp,),arg1))
end

function destroycolortable(arg1::GDALColorTableH)
    ccall((:GDALDestroyColorTable,libgdal),Void,(GDALColorTableH,),arg1)
end

function clonecolortable(arg1::GDALColorTableH)
    checknull(ccall((:GDALCloneColorTable,libgdal),GDALColorTableH,(GDALColorTableH,),arg1))
end

function getpaletteinterpretation(arg1::GDALColorTableH)
    ccall((:GDALGetPaletteInterpretation,libgdal),GDALPaletteInterp,(GDALColorTableH,),arg1)
end

function getcolorentrycount(arg1::GDALColorTableH)
    ccall((:GDALGetColorEntryCount,libgdal),Cint,(GDALColorTableH,),arg1)
end

function getcolorentry(arg1::GDALColorTableH,arg2::Integer)
    ccall((:GDALGetColorEntry,libgdal),Ptr{GDALColorEntry},(GDALColorTableH,Cint),arg1,arg2)
end

function getcolorentryasrgb(arg1::GDALColorTableH,arg2::Integer,arg3::Ptr{GDALColorEntry})
    ccall((:GDALGetColorEntryAsRGB,libgdal),Cint,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
end

function setcolorentry(arg1::GDALColorTableH,arg2::Integer,arg3::Ptr{GDALColorEntry})
    ccall((:GDALSetColorEntry,libgdal),Void,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
end

function createcolorramp(hTable::GDALColorTableH,nStartIndex::Integer,psStartColor::Ptr{GDALColorEntry},nEndIndex::Integer,psEndColor::Ptr{GDALColorEntry})
    ccall((:GDALCreateColorRamp,libgdal),Void,(GDALColorTableH,Cint,Ptr{GDALColorEntry},Cint,Ptr{GDALColorEntry}),hTable,nStartIndex,psStartColor,nEndIndex,psEndColor)
end

function createrasterattributetable()
    checknull(ccall((:GDALCreateRasterAttributeTable,libgdal),GDALRasterAttributeTableH,()))
end

function destroyrasterattributetable(arg1::GDALRasterAttributeTableH)
    ccall((:GDALDestroyRasterAttributeTable,libgdal),Void,(GDALRasterAttributeTableH,),arg1)
end

function ratgetcolumncount(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATGetColumnCount,libgdal),Cint,(GDALRasterAttributeTableH,),arg1)
end

function ratgetnameofcol(arg1::GDALRasterAttributeTableH,arg2::Integer)
    bytestring(ccall((:GDALRATGetNameOfCol,libgdal),Ptr{UInt8},(GDALRasterAttributeTableH,Cint),arg1,arg2))
end

function ratgetusageofcol(arg1::GDALRasterAttributeTableH,arg2::Integer)
    ccall((:GDALRATGetUsageOfCol,libgdal),GDALRATFieldUsage,(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function ratgettypeofcol(arg1::GDALRasterAttributeTableH,arg2::Integer)
    ccall((:GDALRATGetTypeOfCol,libgdal),GDALRATFieldType,(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function ratgetcolofusage(arg1::GDALRasterAttributeTableH,arg2::GDALRATFieldUsage)
    ccall((:GDALRATGetColOfUsage,libgdal),Cint,(GDALRasterAttributeTableH,GDALRATFieldUsage),arg1,arg2)
end

function ratgetrowcount(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATGetRowCount,libgdal),Cint,(GDALRasterAttributeTableH,),arg1)
end

function ratgetvalueasstring(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer)
    bytestring(ccall((:GDALRATGetValueAsString,libgdal),Ptr{UInt8},(GDALRasterAttributeTableH,Cint,Cint),arg1,arg2,arg3))
end

function ratgetvalueasint(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer)
    ccall((:GDALRATGetValueAsInt,libgdal),Cint,(GDALRasterAttributeTableH,Cint,Cint),arg1,arg2,arg3)
end

function ratgetvalueasdouble(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer)
    ccall((:GDALRATGetValueAsDouble,libgdal),Cdouble,(GDALRasterAttributeTableH,Cint,Cint),arg1,arg2,arg3)
end

function ratsetvalueasstring(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer,arg4::AbstractString)
    ccall((:GDALRATSetValueAsString,libgdal),Void,(GDALRasterAttributeTableH,Cint,Cint,Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function ratsetvalueasint(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer,arg4::Integer)
    ccall((:GDALRATSetValueAsInt,libgdal),Void,(GDALRasterAttributeTableH,Cint,Cint,Cint),arg1,arg2,arg3,arg4)
end

function ratsetvalueasdouble(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer,arg4::Real)
    ccall((:GDALRATSetValueAsDouble,libgdal),Void,(GDALRasterAttributeTableH,Cint,Cint,Cdouble),arg1,arg2,arg3,arg4)
end

function ratchangesarewrittentofile(hRAT::GDALRasterAttributeTableH)
    ccall((:GDALRATChangesAreWrittenToFile,libgdal),Cint,(GDALRasterAttributeTableH,),hRAT)
end

function ratvaluesioasdouble(hRAT::GDALRasterAttributeTableH,eRWFlag::GDALRWFlag,iField::Integer,iStartRow::Integer,iLength::Integer,pdfData::Vector{Float64})
    ccall((:GDALRATValuesIOAsDouble,libgdal),CPLErr,(GDALRasterAttributeTableH,GDALRWFlag,Cint,Cint,Cint,Ptr{Cdouble}),hRAT,eRWFlag,iField,iStartRow,iLength,pdfData)
end

function ratvaluesioasinteger(hRAT::GDALRasterAttributeTableH,eRWFlag::GDALRWFlag,iField::Integer,iStartRow::Integer,iLength::Integer,pnData::Vector{Cint})
    ccall((:GDALRATValuesIOAsInteger,libgdal),CPLErr,(GDALRasterAttributeTableH,GDALRWFlag,Cint,Cint,Cint,Ptr{Cint}),hRAT,eRWFlag,iField,iStartRow,iLength,pnData)
end

function ratvaluesioasstring(hRAT::GDALRasterAttributeTableH,eRWFlag::GDALRWFlag,iField::Integer,iStartRow::Integer,iLength::Integer,papszStrList::Vector{UTF8String})
    ccall((:GDALRATValuesIOAsString,libgdal),CPLErr,(GDALRasterAttributeTableH,GDALRWFlag,Cint,Cint,Cint,Ptr{Ptr{UInt8}}),hRAT,eRWFlag,iField,iStartRow,iLength,papszStrList)
end

function ratsetrowcount(arg1::GDALRasterAttributeTableH,arg2::Integer)
    ccall((:GDALRATSetRowCount,libgdal),Void,(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function ratcreatecolumn(arg1::GDALRasterAttributeTableH,arg2::AbstractString,arg3::GDALRATFieldType,arg4::GDALRATFieldUsage)
    ccall((:GDALRATCreateColumn,libgdal),CPLErr,(GDALRasterAttributeTableH,Ptr{UInt8},GDALRATFieldType,GDALRATFieldUsage),arg1,arg2,arg3,arg4)
end

function ratsetlinearbinning(arg1::GDALRasterAttributeTableH,arg2::Real,arg3::Real)
    ccall((:GDALRATSetLinearBinning,libgdal),CPLErr,(GDALRasterAttributeTableH,Cdouble,Cdouble),arg1,arg2,arg3)
end

function ratgetlinearbinning(arg1::GDALRasterAttributeTableH,arg2::Vector{Float64},arg3::Vector{Float64})
    ccall((:GDALRATGetLinearBinning,libgdal),Cint,(GDALRasterAttributeTableH,Ptr{Cdouble},Ptr{Cdouble}),arg1,arg2,arg3)
end

function ratinitializefromcolortable(arg1::GDALRasterAttributeTableH,arg2::GDALColorTableH)
    ccall((:GDALRATInitializeFromColorTable,libgdal),CPLErr,(GDALRasterAttributeTableH,GDALColorTableH),arg1,arg2)
end

function rattranslatetocolortable(arg1::GDALRasterAttributeTableH,nEntryCount::Integer)
    checknull(ccall((:GDALRATTranslateToColorTable,libgdal),GDALColorTableH,(GDALRasterAttributeTableH,Cint),arg1,nEntryCount))
end

function ratdumpreadable(arg1::GDALRasterAttributeTableH,arg2::Ptr{FILE})
    ccall((:GDALRATDumpReadable,libgdal),Void,(GDALRasterAttributeTableH,Ptr{FILE}),arg1,arg2)
end

function ratclone(arg1::GDALRasterAttributeTableH)
    checknull(ccall((:GDALRATClone,libgdal),GDALRasterAttributeTableH,(GDALRasterAttributeTableH,),arg1))
end

function ratserializejson(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATSerializeJSON,libgdal),Ptr{Void},(GDALRasterAttributeTableH,),arg1)
end

function ratgetrowofvalue(arg1::GDALRasterAttributeTableH,arg2::Real)
    ccall((:GDALRATGetRowOfValue,libgdal),Cint,(GDALRasterAttributeTableH,Cdouble),arg1,arg2)
end

function setcachemax(nBytes::Integer)
    ccall((:GDALSetCacheMax,libgdal),Void,(Cint,),nBytes)
end

function getcachemax()
    ccall((:GDALGetCacheMax,libgdal),Cint,())
end

function getcacheused()
    ccall((:GDALGetCacheUsed,libgdal),Cint,())
end

function setcachemax64(nBytes::GIntBig)
    ccall((:GDALSetCacheMax64,libgdal),Void,(GIntBig,),nBytes)
end

function getcachemax64()
    ccall((:GDALGetCacheMax64,libgdal),GIntBig,())
end

function getcacheused64()
    ccall((:GDALGetCacheUsed64,libgdal),GIntBig,())
end

function flushcacheblock()
    ccall((:GDALFlushCacheBlock,libgdal),Cint,())
end

function datasetgetvirtualmem(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,nBufXSize::Integer,nBufYSize::Integer,eBufType::GDALDataType,nBandCount::Integer,panBandMap::Vector{Cint},nPixelSpace::Integer,nLineSpace::GIntBig,nBandSpace::GIntBig,nCacheSize::Csize_t,nPageSizeHint::Csize_t,bSingleThreadUsage::Integer,papszOptions::Vector{UTF8String})
    ccall((:GDALDatasetGetVirtualMem,libgdal),Ptr{CPLVirtualMem},(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,GIntBig,GIntBig,Csize_t,Csize_t,Cint,Ptr{Ptr{UInt8}}),hDS,eRWFlag,nXOff,nYOff,nXSize,nYSize,nBufXSize,nBufYSize,eBufType,nBandCount,panBandMap,nPixelSpace,nLineSpace,nBandSpace,nCacheSize,nPageSizeHint,bSingleThreadUsage,papszOptions)
end

function rasterbandgetvirtualmem(hBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,nBufXSize::Integer,nBufYSize::Integer,eBufType::GDALDataType,nPixelSpace::Integer,nLineSpace::GIntBig,nCacheSize::Csize_t,nPageSizeHint::Csize_t,bSingleThreadUsage::Integer,papszOptions::Vector{UTF8String})
    ccall((:GDALRasterBandGetVirtualMem,libgdal),Ptr{CPLVirtualMem},(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,GIntBig,Csize_t,Csize_t,Cint,Ptr{Ptr{UInt8}}),hBand,eRWFlag,nXOff,nYOff,nXSize,nYSize,nBufXSize,nBufYSize,eBufType,nPixelSpace,nLineSpace,nCacheSize,nPageSizeHint,bSingleThreadUsage,papszOptions)
end

function getvirtualmemauto(hBand::GDALRasterBandH,eRWFlag::GDALRWFlag,pnPixelSpace::Vector{Cint},pnLineSpace::Ptr{GIntBig},papszOptions::Vector{UTF8String})
    ccall((:GDALGetVirtualMemAuto,libgdal),Ptr{CPLVirtualMem},(GDALRasterBandH,GDALRWFlag,Ptr{Cint},Ptr{GIntBig},Ptr{Ptr{UInt8}}),hBand,eRWFlag,pnPixelSpace,pnLineSpace,papszOptions)
end

function datasetgettiledvirtualmem(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,nTileXSize::Integer,nTileYSize::Integer,eBufType::GDALDataType,nBandCount::Integer,panBandMap::Vector{Cint},eTileOrganization::GDALTileOrganization,nCacheSize::Csize_t,bSingleThreadUsage::Integer,papszOptions::Vector{UTF8String})
    ccall((:GDALDatasetGetTiledVirtualMem,libgdal),Ptr{CPLVirtualMem},(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,Ptr{Cint},GDALTileOrganization,Csize_t,Cint,Ptr{Ptr{UInt8}}),hDS,eRWFlag,nXOff,nYOff,nXSize,nYSize,nTileXSize,nTileYSize,eBufType,nBandCount,panBandMap,eTileOrganization,nCacheSize,bSingleThreadUsage,papszOptions)
end

function rasterbandgettiledvirtualmem(hBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,nTileXSize::Integer,nTileYSize::Integer,eBufType::GDALDataType,nCacheSize::Csize_t,bSingleThreadUsage::Integer,papszOptions::Vector{UTF8String})
    ccall((:GDALRasterBandGetTiledVirtualMem,libgdal),Ptr{CPLVirtualMem},(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Csize_t,Cint,Ptr{Ptr{UInt8}}),hBand,eRWFlag,nXOff,nYOff,nXSize,nYSize,nTileXSize,nTileYSize,eBufType,nCacheSize,bSingleThreadUsage,papszOptions)
end

function getjpeg2000structure(pszFilename::AbstractString,papszOptions::Vector{UTF8String})
    ccall((:GDALGetJPEG2000Structure,libgdal),Ptr{CPLXMLNode},(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszOptions)
end

