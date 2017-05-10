# http://www.gdal.org/classGDALMajorObject.html

abstract GDALMajorObjectH

abstract GDALDatasetH <: GDALMajorObjectH
abstract GDALDriverH <: GDALMajorObjectH
abstract GDALRasterBandH <: GDALMajorObjectH
abstract OGRLayerH <: GDALMajorObjectH

abstract OGRDataSourceH <: GDALDatasetH
abstract VRTDatasetH <: GDALDatasetH

abstract OGRSFDriverH <: GDALDriverH
abstract VRTDriverH <: GDALDriverH

abstract GDALAsyncReaderH
abstract GDALColorTableH
abstract GDALContourGeneratorH
abstract GDALContourWriter
abstract GDALDerivedPixelFunc
abstract GDALMaskFunc
abstract GDALProgressFunc
abstract GDALRasterAttributeTableH
abstract GDALTransformerFunc
abstract GDALWarpOperationH

abstract OGRCoordinateTransformationH
abstract OGRFeatureDefnH
abstract OGRFeatureH
abstract OGRFieldDefnH
abstract OGRGeometryH
abstract OGRSpatialReferenceH
abstract OGRStyleMgrH
abstract OGRStyleTableH
abstract OGRStyleToolH

abstract CPLErrorHandler
abstract FilterFunc4ValuesType
abstract FilterFuncType

abstract VRTImageReadFunc
abstract VRTSourceH
abstract VRTSimpleSourceH
abstract VRTAveragedSourceH
abstract VRTComplexSourceH
abstract VRTFilteredSourceH
abstract VRTKernelFilteredSourceH
abstract VRTAverageFilteredSourceH
abstract VRTFuncSourceH
abstract VRTWarpedDatasetH
abstract VRTRasterBandH
abstract VRTSourcedRasterBandH
abstract VRTWarpedRasterBandH
abstract VRTDerivedRasterBandH
abstract VRTRawRasterBandH


# C functions that take an argument of the type char** can be called
# by using a Ptr{Ptr{UInt8}} type within Julia.
const StringList = Ptr{Ptr{UInt8}}
