# http://www.gdal.org/classGDALMajorObject.html

abstract type GDALMajorObjectH end

abstract type GDALDatasetH <: GDALMajorObjectH end
abstract type GDALDriverH <: GDALMajorObjectH end
abstract type GDALRasterBandH <: GDALMajorObjectH end
abstract type OGRLayerH <: GDALMajorObjectH end

abstract type OGRDataSourceH <: GDALDatasetH end
abstract type VRTDatasetH <: GDALDatasetH end

abstract type OGRSFDriverH <: GDALDriverH end
abstract type VRTDriverH <: GDALDriverH end

abstract type GDALAsyncReaderH end
abstract type GDALColorTableH end
abstract type GDALContourGeneratorH end
abstract type GDALContourWriter end
abstract type GDALDerivedPixelFunc end
abstract type GDALMaskFunc end
abstract type GDALProgressFunc end
abstract type GDALRasterAttributeTableH end
abstract type GDALTransformerFunc end
abstract type GDALWarpOperationH end
abstract type GDALGridContext end

abstract type OGRCoordinateTransformationH end
abstract type OGRFeatureDefnH end
abstract type OGRFeatureH end
abstract type OGRFieldDefnH end
abstract type OGRGeometryH end
abstract type OGRGeomFieldDefnH end
abstract type OGRSpatialReferenceH end
abstract type OGRStyleMgrH end
abstract type OGRStyleTableH end
abstract type OGRStyleToolH end

abstract type CPLErrorHandler end
abstract type FilterFunc4ValuesType end
abstract type FilterFuncType end

abstract type VRTImageReadFunc end
abstract type VRTSourceH end
abstract type VRTSimpleSourceH end
abstract type VRTAveragedSourceH end
abstract type VRTComplexSourceH end
abstract type VRTFilteredSourceH end
abstract type VRTKernelFilteredSourceH end
abstract type VRTAverageFilteredSourceH end
abstract type VRTFuncSourceH end
abstract type VRTWarpedDatasetH end
abstract type VRTRasterBandH end
abstract type VRTSourcedRasterBandH end
abstract type VRTWarpedRasterBandH end
abstract type VRTDerivedRasterBandH end
abstract type VRTRawRasterBandH end

abstract type CPLFileFinder end
abstract type CPLVirtualMemCachePageCbk end
abstract type CPLVirtualMemFreeUserData end
abstract type CPLVirtualMemUnCachePageCbk end
abstract type VSIStatBufL end
abstract type _CPLXMLNode end
abstract type CPLVirtualMem end

# GDAL utils options
abstract type GDALBuildVRTOptions end
abstract type GDALBuildVRTOptionsForBinary end
abstract type GDALDEMProcessingOptions end
abstract type GDALDEMProcessingOptionsForBinary end
abstract type GDALGridOptions end
abstract type GDALGridOptionsForBinary end
abstract type GDALInfoOptions end
abstract type GDALInfoOptionsForBinary end
abstract type GDALNearblackOptions end
abstract type GDALNearblackOptionsForBinary end
abstract type GDALRasterizeOptions end
abstract type GDALRasterizeOptionsForBinary end
abstract type GDALTranslateOptions end
abstract type GDALTranslateOptionsForBinary end
abstract type GDALVectorTranslateOptions end
abstract type GDALVectorTranslateOptionsForBinary end
abstract type GDALWarpAppOptions end
abstract type GDALWarpAppOptionsForBinary end
