# http://www.gdal.org/classGDALMajorObject.html

@compat abstract type GDALMajorObjectH end

@compat abstract type GDALDatasetH <: GDALMajorObjectH end
@compat abstract type GDALDriverH <: GDALMajorObjectH end
@compat abstract type GDALRasterBandH <: GDALMajorObjectH end
@compat abstract type OGRLayerH <: GDALMajorObjectH end

@compat abstract type OGRDataSourceH <: GDALDatasetH end
@compat abstract type VRTDatasetH <: GDALDatasetH end

@compat abstract type OGRSFDriverH <: GDALDriverH end
@compat abstract type VRTDriverH <: GDALDriverH end

@compat abstract type GDALAsyncReaderH end
@compat abstract type GDALColorTableH end
@compat abstract type GDALContourGeneratorH end
@compat abstract type GDALContourWriter end
@compat abstract type GDALDerivedPixelFunc end
@compat abstract type GDALMaskFunc end
@compat abstract type GDALProgressFunc end
@compat abstract type GDALRasterAttributeTableH end
@compat abstract type GDALTransformerFunc end
@compat abstract type GDALWarpOperationH end

@compat abstract type OGRCoordinateTransformationH end
@compat abstract type OGRFeatureDefnH end
@compat abstract type OGRFeatureH end
@compat abstract type OGRFieldDefnH end
@compat abstract type OGRGeometryH end
@compat abstract type OGRSpatialReferenceH end
@compat abstract type OGRStyleMgrH end
@compat abstract type OGRStyleTableH end
@compat abstract type OGRStyleToolH end

@compat abstract type CPLErrorHandler end
@compat abstract type FilterFunc4ValuesType end
@compat abstract type FilterFuncType end

@compat abstract type VRTImageReadFunc end
@compat abstract type VRTSourceH end
@compat abstract type VRTSimpleSourceH end
@compat abstract type VRTAveragedSourceH end
@compat abstract type VRTComplexSourceH end
@compat abstract type VRTFilteredSourceH end
@compat abstract type VRTKernelFilteredSourceH end
@compat abstract type VRTAverageFilteredSourceH end
@compat abstract type VRTFuncSourceH end
@compat abstract type VRTWarpedDatasetH end
@compat abstract type VRTRasterBandH end
@compat abstract type VRTSourcedRasterBandH end
@compat abstract type VRTWarpedRasterBandH end
@compat abstract type VRTDerivedRasterBandH end
@compat abstract type VRTRawRasterBandH end


# C functions that take an argument of the type char** can be called
# by using a Ptr{Ptr{UInt8}} type within Julia.
const StringList = Ptr{Ptr{UInt8}}
