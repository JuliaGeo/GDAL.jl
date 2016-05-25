

"""
    GDALComputeMedianCutPCT(GDALRasterBandH hRed,
                            GDALRasterBandH hGreen,
                            GDALRasterBandH hBlue,
                            int(*)(int, int, void *) pfnIncludePixel,
                            int nColors,
                            GDALColorTableH hColorTable,
                            GDALProgressFunc pfnProgress,
                            void * pProgressArg) -> int

Compute optimal PCT for RGB image.

### Parameters
* **hRed**: Red input band.
* **hGreen**: Green input band.
* **hBlue**: Blue input band.
* **pfnIncludePixel**: function used to test which pixels should be included in the analysis. At this time this argument is ignored and all pixels are utilized. This should normally be NULL.
* **nColors**: the desired number of colors to be returned (2-256).
* **hColorTable**: the colors will be returned in this color table object.
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
returns CE_None on success or CE_Failure if an error occurs.
"""
function computemediancutpct{T <: GDALRasterBandH}(hRed::Ptr{T},hGreen::Ptr{T},hBlue::Ptr{T},pfnIncludePixel,nColors::Integer,hColorTable::Ptr{GDALColorTableH},pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALComputeMedianCutPCT,libgdal),Cint,(Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{Void},Cint,Ptr{GDALColorTableH},Ptr{GDALProgressFunc},Ptr{Void}),hRed,hGreen,hBlue,pfnIncludePixel,nColors,hColorTable,pfnProgress,pProgressArg)
end


"""
    GDALDitherRGB2PCT(GDALRasterBandH hRed,
                      GDALRasterBandH hGreen,
                      GDALRasterBandH hBlue,
                      GDALRasterBandH hTarget,
                      GDALColorTableH hColorTable,
                      GDALProgressFunc pfnProgress,
                      void * pProgressArg) -> int

24bit to 8bit conversion with dithering.

### Parameters
* **hRed**: Red input band.
* **hGreen**: Green input band.
* **hBlue**: Blue input band.
* **hTarget**: Output band.
* **hColorTable**: the color table to use with the output band.
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function ditherrgb2pct{T <: GDALRasterBandH}(hRed::Ptr{T},hGreen::Ptr{T},hBlue::Ptr{T},hTarget::Ptr{T},hColorTable::Ptr{GDALColorTableH},pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALDitherRGB2PCT,libgdal),Cint,(Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{GDALColorTableH},Ptr{GDALProgressFunc},Ptr{Void}),hRed,hGreen,hBlue,hTarget,hColorTable,pfnProgress,pProgressArg)
end


"""
    GDALChecksumImage(GDALRasterBandH hBand,
                      int nXOff,
                      int nYOff,
                      int nXSize,
                      int nYSize) -> int

Compute checksum for image region.

### Parameters
* **hBand**: the raster band to read from.
* **nXOff**: pixel offset of window to read.
* **nYOff**: line offset of window to read.
* **nXSize**: pixel size of window to read.
* **nYSize**: line size of window to read.

### Returns
Checksum value.
"""
function checksumimage{T <: GDALRasterBandH}(hBand::Ptr{T},nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer)
    ccall((:GDALChecksumImage,libgdal),Cint,(Ptr{GDALRasterBandH},Cint,Cint,Cint,Cint),hBand,nXOff,nYOff,nXSize,nYSize)
end


"""
    GDALComputeProximity(GDALRasterBandH hSrcBand,
                         GDALRasterBandH hProximityBand,
                         char ** papszOptions,
                         GDALProgressFunc pfnProgress,
                         void * pProgressArg) -> CPLErr

Compute the proximity of all pixels in the image to a set of pixels in the source image.
"""
function computeproximity{T <: GDALRasterBandH}(hSrcBand::Ptr{T},hProximityBand::Ptr{T},papszOptions,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALComputeProximity,libgdal),CPLErr,(Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{Cstring},Ptr{GDALProgressFunc},Ptr{Void}),hSrcBand,hProximityBand,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALFillNodata(GDALRasterBandH hTargetBand,
                   GDALRasterBandH hMaskBand,
                   double dfMaxSearchDist,
                   int bDeprecatedOption,
                   int nSmoothingIterations,
                   char ** papszOptions,
                   GDALProgressFunc pfnProgress,
                   void * pProgressArg) -> CPLErr

Fill selected raster regions by interpolation from the edges.

### Parameters
* **hTargetBand**: the raster band to be modified in place.
* **hMaskBand**: a mask band indicating pixels to be interpolated (zero valued
* **dfMaxSearchDist**: the maximum number of pixels to search in all directions to find values to interpolate from.
* **bDeprecatedOption**: unused argument, should be zero.
* **nSmoothingIterations**: the number of 3x3 smoothing filter passes to run (0 or more).
* **papszOptions**: additional name=value options in a string list (the temporary file driver can be specified like TEMP_FILE_DRIVER=MEM).
* **pfnProgress**: the progress function to report completion.
* **pProgressArg**: callback data for progress function.

### Returns
CE_None on success or CE_Failure if something goes wrong.
"""
function fillnodata{T <: GDALRasterBandH}(hTargetBand::Ptr{T},hMaskBand::Ptr{T},dfMaxSearchDist::Real,bDeprecatedOption::Integer,nSmoothingIterations::Integer,papszOptions,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALFillNodata,libgdal),CPLErr,(Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Cdouble,Cint,Cint,Ptr{Cstring},Ptr{GDALProgressFunc},Ptr{Void}),hTargetBand,hMaskBand,dfMaxSearchDist,bDeprecatedOption,nSmoothingIterations,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALPolygonize(GDALRasterBandH hSrcBand,
                   GDALRasterBandH hMaskBand,
                   OGRLayerH hOutLayer,
                   int iPixValField,
                   char ** papszOptions,
                   GDALProgressFunc pfnProgress,
                   void * pProgressArg) -> CPLErr

Create polygon coverage from raster data.

### Parameters
* **hSrcBand**: the source raster band to be processed.
* **hMaskBand**: an optional mask band. All pixels in the mask band with a value other than zero will be considered suitable for collection as polygons.
* **hOutLayer**: the vector feature layer to which the polygons should be written.
* **iPixValField**: the attribute field index indicating the feature attribute into which the pixel value of the polygon should be written.
* **papszOptions**: a name/value list of additional options 
"8CONNECTED": May be set to "8" to use 8 connectedness. Otherwise 4 connectedness will be applied to the algorithm
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
CE_None on success or CE_Failure on a failure.
"""
function polygonize{T <: GDALRasterBandH,S <: OGRLayerH}(hSrcBand::Ptr{T},hMaskBand::Ptr{T},hOutLayer::Ptr{S},iPixValField::Integer,papszOptions,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALPolygonize,libgdal),CPLErr,(Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{OGRLayerH},Cint,Ptr{Cstring},Ptr{GDALProgressFunc},Ptr{Void}),hSrcBand,hMaskBand,hOutLayer,iPixValField,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALFPolygonize(GDALRasterBandH hSrcBand,
                    GDALRasterBandH hMaskBand,
                    OGRLayerH hOutLayer,
                    int iPixValField,
                    char ** papszOptions,
                    GDALProgressFunc pfnProgress,
                    void * pProgressArg) -> CPLErr

Create polygon coverage from raster data.

### Parameters
* **hSrcBand**: the source raster band to be processed.
* **hMaskBand**: an optional mask band. All pixels in the mask band with a value other than zero will be considered suitable for collection as polygons.
* **hOutLayer**: the vector feature layer to which the polygons should be written.
* **iPixValField**: the attribute field index indicating the feature attribute into which the pixel value of the polygon should be written.
* **papszOptions**: a name/value list of additional options 
"8CONNECTED": May be set to "8" to use 8 connectedness. Otherwise 4 connectedness will be applied to the algorithm
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
CE_None on success or CE_Failure on a failure.
"""
function fpolygonize{T <: GDALRasterBandH,S <: OGRLayerH}(hSrcBand::Ptr{T},hMaskBand::Ptr{T},hOutLayer::Ptr{S},iPixValField::Integer,papszOptions,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALFPolygonize,libgdal),CPLErr,(Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{OGRLayerH},Cint,Ptr{Cstring},Ptr{GDALProgressFunc},Ptr{Void}),hSrcBand,hMaskBand,hOutLayer,iPixValField,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALSieveFilter(GDALRasterBandH hSrcBand,
                    GDALRasterBandH hMaskBand,
                    GDALRasterBandH hDstBand,
                    int nSizeThreshold,
                    int nConnectedness,
                    char ** papszOptions,
                    GDALProgressFunc pfnProgress,
                    void * pProgressArg) -> CPLErr

Removes small raster polygons.

### Parameters
* **hSrcBand**: the source raster band to be processed.
* **hMaskBand**: an optional mask band. All pixels in the mask band with a value other than zero will be considered suitable for inclusion in polygons.
* **hDstBand**: the output raster band. It may be the same as hSrcBand to update the source in place.
* **nSizeThreshold**: raster polygons with sizes smaller than this will be merged into their largest neighbour.
* **nConnectedness**: either 4 indicating that diagonal pixels are not considered directly adjacent for polygon membership purposes or 8 indicating they are.
* **papszOptions**: algorithm options in name=value list form. None currently supported.
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function sievefilter{T <: GDALRasterBandH}(hSrcBand::Ptr{T},hMaskBand::Ptr{T},hDstBand::Ptr{T},nSizeThreshold::Integer,nConnectedness::Integer,papszOptions,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALSieveFilter,libgdal),CPLErr,(Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Cint,Cint,Ptr{Cstring},Ptr{GDALProgressFunc},Ptr{Void}),hSrcBand,hMaskBand,hDstBand,nSizeThreshold,nConnectedness,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALDestroyTransformer(void * pTransformArg) -> void
"""
function destroytransformer(pTransformerArg)
    ccall((:GDALDestroyTransformer,libgdal),Void,(Ptr{Void},),pTransformerArg)
end


"""
    GDALUseTransformer(void * pTransformArg,
                       int bDstToSrc,
                       int nPointCount,
                       double * x,
                       double * y,
                       double * z,
                       int * panSuccess) -> int
"""
function usetransformer(pTransformerArg,bDstToSrc::Integer,nPointCount::Integer,x,y,z,panSuccess)
    ccall((:GDALUseTransformer,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformerArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALCreateSimilarTransformer(void * pTransformArg,
                                 double dfRatioX,
                                 double dfRatioY) -> void *
"""
function createsimilartransformer(psTransformerArg,dfSrcRatioX::Real,dfSrcRatioY::Real)
    ccall((:GDALCreateSimilarTransformer,libgdal),Ptr{Void},(Ptr{Void},Cdouble,Cdouble),psTransformerArg,dfSrcRatioX,dfSrcRatioY)
end


"""
    GDALCreateGenImgProjTransformer(GDALDatasetH hSrcDS,
                                    const char * pszSrcWKT,
                                    GDALDatasetH hDstDS,
                                    const char * pszDstWKT,
                                    int bGCPUseOK,
                                    double dfGCPErrorThreshold,
                                    int nOrder) -> void *

Create image to image transformer.

### Parameters
* **hSrcDS**: source dataset, or NULL.
* **pszSrcWKT**: the coordinate system for the source dataset. If NULL, it will be read from the dataset itself.
* **hDstDS**: destination dataset (or NULL).
* **pszDstWKT**: the coordinate system for the destination dataset. If NULL, and hDstDS not NULL, it will be read from the destination dataset.
* **bGCPUseOK**: TRUE if GCPs should be used if the geotransform is not available on the source dataset (not destination).
* **dfGCPErrorThreshold**: ignored/deprecated.
* **nOrder**: the maximum order to use for GCP derived polynomials if possible. Use 0 to autoselect, or -1 for thin plate splines.

### Returns
handle suitable for use GDALGenImgProjTransform(), and to be deallocated with GDALDestroyGenImgProjTransformer().
"""
function creategenimgprojtransformer{T <: GDALDatasetH}(hSrcDS::Ptr{T},pszSrcWKT,hDstDS::Ptr{T},pszDstWKT,bGCPUseOK::Integer,dfGCPErrorThreshold::Real,nOrder::Integer)
    ccall((:GDALCreateGenImgProjTransformer,libgdal),Ptr{Void},(Ptr{GDALDatasetH},Cstring,Ptr{GDALDatasetH},Cstring,Cint,Cdouble,Cint),hSrcDS,pszSrcWKT,hDstDS,pszDstWKT,bGCPUseOK,dfGCPErrorThreshold,nOrder)
end


"""
    GDALCreateGenImgProjTransformer2(GDALDatasetH hSrcDS,
                                     GDALDatasetH hDstDS,
                                     char ** papszOptions) -> void *

Create image to image transformer.

### Parameters
* **hSrcDS**: source dataset, or NULL.
* **hDstDS**: destination dataset (or NULL).
* **papszOptions**: NULL-terminated list of string options (or NULL).

### Returns
handle suitable for use GDALGenImgProjTransform(), and to be deallocated with GDALDestroyGenImgProjTransformer() or NULL on failure.
"""
function creategenimgprojtransformer2{T <: GDALDatasetH}(hSrcDS::Ptr{T},hDstDS::Ptr{T},papszOptions)
    ccall((:GDALCreateGenImgProjTransformer2,libgdal),Ptr{Void},(Ptr{GDALDatasetH},Ptr{GDALDatasetH},Ptr{Cstring}),hSrcDS,hDstDS,papszOptions)
end


"""
    GDALCreateGenImgProjTransformer3(const char * pszSrcWKT,
                                     const double * padfSrcGeoTransform,
                                     const char * pszDstWKT,
                                     const double * padfDstGeoTransform) -> void *

Create image to image transformer.

### Parameters
* **pszSrcWKT**: source WKT (or NULL).
* **padfSrcGeoTransform**: source geotransform (or NULL).
* **pszDstWKT**: destination WKT (or NULL).
* **padfDstGeoTransform**: destination geotransform (or NULL).

### Returns
handle suitable for use GDALGenImgProjTransform(), and to be deallocated with GDALDestroyGenImgProjTransformer() or NULL on failure.
"""
function creategenimgprojtransformer3(pszSrcWKT,padfSrcGeoTransform,pszDstWKT,padfDstGeoTransform)
    ccall((:GDALCreateGenImgProjTransformer3,libgdal),Ptr{Void},(Cstring,Ptr{Cdouble},Cstring,Ptr{Cdouble}),pszSrcWKT,padfSrcGeoTransform,pszDstWKT,padfDstGeoTransform)
end


"""
    GDALSetGenImgProjTransformerDstGeoTransform(void * hTransformArg,
                                                const double * padfGeoTransform) -> void

Set GenImgProj output geotransform.

### Parameters
* **hTransformArg**: the handle to update.
* **padfGeoTransform**: the destination geotransform to apply (six doubles).
"""
function setgenimgprojtransformerdstgeotransform(arg1,arg2)
    ccall((:GDALSetGenImgProjTransformerDstGeoTransform,libgdal),Void,(Ptr{Void},Ptr{Cdouble}),arg1,arg2)
end


"""
    GDALDestroyGenImgProjTransformer(void * hTransformArg) -> void

GenImgProjTransformer deallocator.

### Parameters
* **hTransformArg**: the handle to deallocate.
"""
function destroygenimgprojtransformer(arg1)
    ccall((:GDALDestroyGenImgProjTransformer,libgdal),Void,(Ptr{Void},),arg1)
end


"""
    GDALGenImgProjTransform(void * pTransformArg,
                            int bDstToSrc,
                            int nPointCount,
                            double * padfX,
                            double * padfY,
                            double * padfZ,
                            int * panSuccess) -> int

Perform general image reprojection transformation.
"""
function genimgprojtransform(pTransformArg,bDstToSrc::Integer,nPointCount::Integer,x,y,z,panSuccess)
    ccall((:GDALGenImgProjTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALSetTransformerDstGeoTransform(void * pTransformArg,
                                      const double * padfGeoTransform) -> void
"""
function settransformerdstgeotransform(arg1,arg2)
    ccall((:GDALSetTransformerDstGeoTransform,libgdal),Void,(Ptr{Void},Ptr{Cdouble}),arg1,arg2)
end


"""
    GDALCreateReprojectionTransformer(const char * pszSrcWKT,
                                      const char * pszDstWKT) -> void *

Create reprojection transformer.

### Parameters
* **pszSrcWKT**: the coordinate system for the source coordinate system.
* **pszDstWKT**: the coordinate system for the destination coordinate system.

### Returns
Handle for use with GDALReprojectionTransform(), or NULL if the system fails to initialize the reprojection.
"""
function createreprojectiontransformer(pszSrcWKT,pszDstWKT)
    ccall((:GDALCreateReprojectionTransformer,libgdal),Ptr{Void},(Cstring,Cstring),pszSrcWKT,pszDstWKT)
end


"""
    GDALDestroyReprojectionTransformer(void * pTransformArg) -> void

Destroy reprojection transformation.

### Parameters
* **pTransformArg**: the transformation handle returned by GDALCreateReprojectionTransformer().
"""
function destroyreprojectiontransformer(arg1)
    ccall((:GDALDestroyReprojectionTransformer,libgdal),Void,(Ptr{Void},),arg1)
end


"""
    GDALReprojectionTransform(void * pTransformArg,
                              int bDstToSrc,
                              int nPointCount,
                              double * padfX,
                              double * padfY,
                              double * padfZ,
                              int * panSuccess) -> int

Perform reprojection transformation.
"""
function reprojectiontransform(pTransformArg,bDstToSrc::Integer,nPointCount::Integer,x,y,z,panSuccess)
    ccall((:GDALReprojectionTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALCreateGCPTransformer(int nGCPCount,
                             const GDAL_GCP * pasGCPList,
                             int nReqOrder,
                             int bReversed) -> void *

Create GCP based polynomial transformer.

### Parameters
* **nGCPCount**: the number of GCPs in pasGCPList.
* **pasGCPList**: an array of GCPs to be used as input.
* **nReqOrder**: the requested polynomial order. It should be 1, 2 or 3.
* **nGCPCount**: the number of GCPs in pasGCPList.
* **pasGCPList**: an array of GCPs to be used as input.
* **nReqOrder**: the requested polynomial order. It should be 1, 2 or 3.
* **bReversed**: set it to TRUE to compute the reversed transformation.

### Returns
the transform argument or NULL if creation fails.
"""
function creategcptransformer(nGCPCount::Integer,pasGCPList,nReqOrder::Integer,bReversed::Integer)
    ccall((:GDALCreateGCPTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint,Cint),nGCPCount,pasGCPList,nReqOrder,bReversed)
end


"""
    GDALCreateGCPRefineTransformer(int nGCPCount,
                                   const GDAL_GCP * pasGCPList,
                                   int nReqOrder,
                                   int bReversed,
                                   double tolerance,
                                   int minimumGcps) -> void *
"""
function creategcprefinetransformer(nGCPCount::Integer,pasGCPList,nReqOrder::Integer,bReversed::Integer,tolerance::Real,minimumGcps::Integer)
    ccall((:GDALCreateGCPRefineTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint,Cint,Cdouble,Cint),nGCPCount,pasGCPList,nReqOrder,bReversed,tolerance,minimumGcps)
end


"""
    GDALDestroyGCPTransformer(void * pTransformArg) -> void

Destroy GCP transformer.

### Parameters
* **pTransformArg**: the transform arg previously returned by GDALCreateGCPTransformer().
"""
function destroygcptransformer(pTransformArg)
    ccall((:GDALDestroyGCPTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end


"""
    GDALGCPTransform(void * pTransformArg,
                     int bDstToSrc,
                     int nPointCount,
                     double * x,
                     double * y,
                     double * z,
                     int * panSuccess) -> int

Transforms point based on GCP derived polynomial model.

### Parameters
* **pTransformArg**: return value from GDALCreateGCPTransformer().
* **bDstToSrc**: TRUE if transformation is from the destination (georeferenced) coordinates to pixel/line or FALSE when transforming from pixel/line to georeferenced coordinates.
* **nPointCount**: the number of values in the x, y and z arrays.
* **x**: array containing the X values to be transformed.
* **y**: array containing the Y values to be transformed.
* **z**: array containing the Z values to be transformed.
* **panSuccess**: array in which a flag indicating success (TRUE) or failure (FALSE) of the transformation are placed.

### Returns
TRUE.
"""
function gcptransform(pTransformArg,bDstToSrc::Integer,nPointCount::Integer,x,y,z,panSuccess)
    ccall((:GDALGCPTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALCreateTPSTransformer(int nGCPCount,
                             const GDAL_GCP * pasGCPList,
                             int bReversed) -> void *

Create Thin Plate Spline transformer from GCPs.

### Parameters
* **nGCPCount**: the number of GCPs in pasGCPList.
* **pasGCPList**: an array of GCPs to be used as input.
* **bReversed**: set it to TRUE to compute the reversed transformation.

### Returns
the transform argument or NULL if creation fails.
"""
function createtpstransformer(nGCPCount::Integer,pasGCPList,bReversed::Integer)
    ccall((:GDALCreateTPSTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint),nGCPCount,pasGCPList,bReversed)
end


"""
    GDALDestroyTPSTransformer(void * pTransformArg) -> void

Destroy TPS transformer.

### Parameters
* **pTransformArg**: the transform arg previously returned by GDALCreateTPSTransformer().
"""
function destroytpstransformer(pTransformArg)
    ccall((:GDALDestroyTPSTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end


"""
    GDALTPSTransform(void * pTransformArg,
                     int bDstToSrc,
                     int nPointCount,
                     double * x,
                     double * y,
                     double * z,
                     int * panSuccess) -> int

Transforms point based on GCP derived polynomial model.

### Parameters
* **pTransformArg**: return value from GDALCreateTPSTransformer().
* **bDstToSrc**: TRUE if transformation is from the destination (georeferenced) coordinates to pixel/line or FALSE when transforming from pixel/line to georeferenced coordinates.
* **nPointCount**: the number of values in the x, y and z arrays.
* **x**: array containing the X values to be transformed.
* **y**: array containing the Y values to be transformed.
* **z**: array containing the Z values to be transformed.
* **panSuccess**: array in which a flag indicating success (TRUE) or failure (FALSE) of the transformation are placed.

### Returns
TRUE.
"""
function tpstransform(pTransformArg,bDstToSrc::Integer,nPointCount::Integer,x,y,z,panSuccess)
    ccall((:GDALTPSTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    RPCInfoToMD(GDALRPCInfo * psRPCInfo) -> char **
"""
function rpcinfotomd(psRPCInfo)
    bytestring(unsafe_load(ccall((:RPCInfoToMD,libgdal),Ptr{Cstring},(Ptr{GDALRPCInfo},),psRPCInfo)))
end


"""
    GDALCreateRPCTransformer(GDALRPCInfo * psRPC,
                             int bReversed,
                             double dfPixErrThreshold,
                             char ** papszOptions) -> void *

Create an RPC based transformer.

### Parameters
* **psRPCInfo**: Definition of the RPC parameters.
* **bReversed**: If true "forward" transformation will be lat/long to pixel/line instead of the normal pixel/line to lat/long.
* **dfPixErrThreshold**: the error (measured in pixels) allowed in the iterative solution of pixel/line to lat/long computations (the other way is always exact given the equations). Starting with GDAL 2.1, this may also be set through the RPC_PIXEL_ERROR_THRESHOLD transformer option.
* **papszOptions**: Other transformer options (i.e. RPC_HEIGHT=<z>).

### Returns
transformer callback data (deallocate with GDALDestroyTransformer()).
"""
function createrpctransformer(psRPC,bReversed::Integer,dfPixErrThreshold::Real,papszOptions)
    ccall((:GDALCreateRPCTransformer,libgdal),Ptr{Void},(Ptr{GDALRPCInfo},Cint,Cdouble,Ptr{Cstring}),psRPC,bReversed,dfPixErrThreshold,papszOptions)
end


"""
    GDALDestroyRPCTransformer(void * pTransformArg) -> void
"""
function destroyrpctransformer(pTransformArg)
    ccall((:GDALDestroyRPCTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end


"""
    GDALRPCTransform(void * pTransformArg,
                     int bDstToSrc,
                     int nPointCount,
                     double * x,
                     double * y,
                     double * z,
                     int * panSuccess) -> int
"""
function rpctransform(pTransformArg,bDstToSrc::Integer,nPointCount::Integer,x,y,z,panSuccess)
    ccall((:GDALRPCTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALCreateGeoLocTransformer(GDALDatasetH hBaseDS,
                                char ** papszGeolocationInfo,
                                int bReversed) -> void *
"""
function creategeoloctransformer{T <: GDALDatasetH}(hBaseDS::Ptr{T},papszGeolocationInfo,bReversed::Integer)
    ccall((:GDALCreateGeoLocTransformer,libgdal),Ptr{Void},(Ptr{GDALDatasetH},Ptr{Cstring},Cint),hBaseDS,papszGeolocationInfo,bReversed)
end


"""
    GDALDestroyGeoLocTransformer(void * pTransformAlg) -> void
"""
function destroygeoloctransformer(pTransformArg)
    ccall((:GDALDestroyGeoLocTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end


"""
    GDALGeoLocTransform(void * pTransformArg,
                        int bDstToSrc,
                        int nPointCount,
                        double * padfX,
                        double * padfY,
                        double * padfZ,
                        int * panSuccess) -> int
"""
function geoloctransform(pTransformArg,bDstToSrc::Integer,nPointCount::Integer,x,y,z,panSuccess)
    ccall((:GDALGeoLocTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALCreateApproxTransformer(GDALTransformerFunc pfnBaseTransformer,
                                void * pBaseTransformArg,
                                double dfMaxError) -> void *

Create an approximating transformer.

### Parameters
* **pfnBaseTransformer**: the high precision transformer which should be approximated.
* **pBaseTransformArg**: the callback argument for the high precision transformer.
* **dfMaxError**: the maximum cartesian error in the "output" space that is to be accepted in the linear approximation.

### Returns
callback pointer suitable for use with GDALApproxTransform(). It should be deallocated with GDALDestroyApproxTransformer().
"""
function createapproxtransformer(pfnRawTransformer::Ptr{GDALTransformerFunc},pRawTransformerArg,dfMaxError::Real)
    ccall((:GDALCreateApproxTransformer,libgdal),Ptr{Void},(Ptr{GDALTransformerFunc},Ptr{Void},Cdouble),pfnRawTransformer,pRawTransformerArg,dfMaxError)
end


"""
    GDALApproxTransformerOwnsSubtransformer(void * pCBData,
                                            int bOwnFlag) -> void
"""
function approxtransformerownssubtransformer(pCBData,bOwnFlag::Integer)
    ccall((:GDALApproxTransformerOwnsSubtransformer,libgdal),Void,(Ptr{Void},Cint),pCBData,bOwnFlag)
end


"""
    GDALDestroyApproxTransformer(void * pCBData) -> void

Cleanup approximate transformer.

### Parameters
* **pCBData**: callback data originally returned by GDALCreateApproxTransformer().
"""
function destroyapproxtransformer(pApproxArg)
    ccall((:GDALDestroyApproxTransformer,libgdal),Void,(Ptr{Void},),pApproxArg)
end


"""
    GDALApproxTransform(void * pCBData,
                        int bDstToSrc,
                        int nPoints,
                        double * x,
                        double * y,
                        double * z,
                        int * panSuccess) -> int

Perform approximate transformation.
"""
function approxtransform(pTransformArg,bDstToSrc::Integer,nPointCount::Integer,x,y,z,panSuccess)
    ccall((:GDALApproxTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALSimpleImageWarp(GDALDatasetH hSrcDS,
                        GDALDatasetH hDstDS,
                        int nBandCount,
                        int * panBandList,
                        GDALTransformerFunc pfnTransform,
                        void * pTransformArg,
                        GDALProgressFunc pfnProgress,
                        void * pProgressArg,
                        char ** papszWarpOptions) -> int

Perform simple image warp.

### Parameters
* **hSrcDS**: the source image dataset.
* **hDstDS**: the destination image dataset.
* **nBandCount**: the number of bands to be warped. If zero, all bands will be processed.
* **panBandList**: the list of bands to translate.
* **pfnTransform**: the transformation function to call. See GDALTransformerFunc().
* **pTransformArg**: the callback handle to pass to pfnTransform.
* **pfnProgress**: the function used to report progress. See GDALProgressFunc().
* **pProgressArg**: the callback handle to pass to pfnProgress.
* **papszWarpOptions**: additional options controlling the warp.

### Returns
TRUE if the operation completes, or FALSE if an error occurs.
"""
function simpleimagewarp{T <: GDALDatasetH}(hSrcDS::Ptr{T},hDstDS::Ptr{T},nBandCount::Integer,panBandList,pfnTransform::Ptr{GDALTransformerFunc},pTransformArg,pfnProgress::Ptr{GDALProgressFunc},pProgressArg,papszWarpOptions)
    ccall((:GDALSimpleImageWarp,libgdal),Cint,(Ptr{GDALDatasetH},Ptr{GDALDatasetH},Cint,Ptr{Cint},Ptr{GDALTransformerFunc},Ptr{Void},Ptr{GDALProgressFunc},Ptr{Void},Ptr{Cstring}),hSrcDS,hDstDS,nBandCount,panBandList,pfnTransform,pTransformArg,pfnProgress,pProgressArg,papszWarpOptions)
end


"""
    GDALSuggestedWarpOutput(GDALDatasetH hSrcDS,
                            GDALTransformerFunc pfnTransformer,
                            void * pTransformArg,
                            double * padfGeoTransformOut,
                            int * pnPixels,
                            int * pnLines) -> CPLErr

Suggest output file size.

### Parameters
* **hSrcDS**: the input image (it is assumed the whole input images is being transformed).
* **pfnTransformer**: the transformer function.
* **pTransformArg**: the callback data for the transformer function.
* **padfGeoTransformOut**: the array of six doubles in which the suggested geotransform is returned.
* **pnPixels**: int in which the suggest pixel width of output is returned.
* **pnLines**: int in which the suggest pixel height of output is returned.

### Returns
CE_None if successful or CE_Failure otherwise.
"""
function suggestedwarpoutput{T <: GDALDatasetH}(hSrcDS::Ptr{T},pfnTransformer::Ptr{GDALTransformerFunc},pTransformArg,padfGeoTransformOut,pnPixels,pnLines)
    ccall((:GDALSuggestedWarpOutput,libgdal),CPLErr,(Ptr{GDALDatasetH},Ptr{GDALTransformerFunc},Ptr{Void},Ptr{Cdouble},Ptr{Cint},Ptr{Cint}),hSrcDS,pfnTransformer,pTransformArg,padfGeoTransformOut,pnPixels,pnLines)
end


"""
    GDALSuggestedWarpOutput2(GDALDatasetH hSrcDS,
                             GDALTransformerFunc pfnTransformer,
                             void * pTransformArg,
                             double * padfGeoTransformOut,
                             int * pnPixels,
                             int * pnLines,
                             double * padfExtent,
                             int nOptions) -> CPLErr

Suggest output file size.

### Parameters
* **hSrcDS**: the input image (it is assumed the whole input images is being transformed).
* **pfnTransformer**: the transformer function.
* **pTransformArg**: the callback data for the transformer function.
* **padfGeoTransformOut**: the array of six doubles in which the suggested geotransform is returned.
* **pnPixels**: int in which the suggest pixel width of output is returned.
* **pnLines**: int in which the suggest pixel height of output is returned.
* **padfExtent**: Four entry array to return extents as (xmin, ymin, xmax, ymax).
* **nOptions**: Options, currently always zero.

### Returns
CE_None if successful or CE_Failure otherwise.
"""
function suggestedwarpoutput2{T <: GDALDatasetH}(hSrcDS::Ptr{T},pfnTransformer::Ptr{GDALTransformerFunc},pTransformArg,padfGeoTransformOut,pnPixels,pnLines,padfExtents,nOptions::Integer)
    ccall((:GDALSuggestedWarpOutput2,libgdal),CPLErr,(Ptr{GDALDatasetH},Ptr{GDALTransformerFunc},Ptr{Void},Ptr{Cdouble},Ptr{Cint},Ptr{Cint},Ptr{Cdouble},Cint),hSrcDS,pfnTransformer,pTransformArg,padfGeoTransformOut,pnPixels,pnLines,padfExtents,nOptions)
end


"""
    GDALSerializeTransformer(GDALTransformerFunc pfnFunc,
                             void * pTransformArg) -> CPLXMLNode *
"""
function serializetransformer(pfnFunc::Ptr{GDALTransformerFunc},pTransformArg)
    ccall((:GDALSerializeTransformer,libgdal),Ptr{CPLXMLNode},(Ptr{GDALTransformerFunc},Ptr{Void}),pfnFunc,pTransformArg)
end


"""
    GDALDeserializeTransformer(CPLXMLNode * psTree,
                               GDALTransformerFunc * ppfnFunc,
                               void ** ppTransformArg) -> CPLErr
"""
function deserializetransformer(psTree,ppfnFunc,ppTransformArg)
    ccall((:GDALDeserializeTransformer,libgdal),CPLErr,(Ptr{CPLXMLNode},Ptr{GDALTransformerFunc},Ptr{Ptr{Void}}),psTree,ppfnFunc,ppTransformArg)
end


"""
    GDALTransformGeolocations(GDALRasterBandH hXBand,
                              GDALRasterBandH hYBand,
                              GDALRasterBandH hZBand,
                              GDALTransformerFunc pfnTransformer,
                              void * pTransformArg,
                              GDALProgressFunc pfnProgress,
                              void * pProgressArg,
                              char ** papszOptions) -> CPLErr

Transform locations held in bands.

### Parameters
* **hXBand**: the band containing the X locations (usually long/easting).
* **hYBand**: the band containing the Y locations (usually lat/northing).
* **hZBand**: the band containing the Z locations (may be NULL).
* **pfnTransformer**: the transformer function.
* **pTransformArg**: the callback data for the transformer function.
* **pfnProgress**: callback for reporting algorithm progress matching the GDALProgressFunc() semantics. May be NULL.
* **pProgressArg**: callback argument passed to pfnProgress.
* **papszOptions**: list of name/value options - none currently supported.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function transformgeolocations{T <: GDALRasterBandH}(hXBand::Ptr{T},hYBand::Ptr{T},hZBand::Ptr{T},pfnTransformer::Ptr{GDALTransformerFunc},pTransformArg,pfnProgress::Ptr{GDALProgressFunc},pProgressArg,papszOptions)
    ccall((:GDALTransformGeolocations,libgdal),CPLErr,(Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{GDALRasterBandH},Ptr{GDALTransformerFunc},Ptr{Void},Ptr{GDALProgressFunc},Ptr{Void},Ptr{Cstring}),hXBand,hYBand,hZBand,pfnTransformer,pTransformArg,pfnProgress,pProgressArg,papszOptions)
end


"""
    GDAL_CG_Create(int nWidth,
                   int nHeight,
                   int bNoDataSet,
                   double dfNoDataValue,
                   double dfContourInterval,
                   double dfContourBase,
                   GDALContourWriter pfnWriter,
                   void * pCBData) -> GDALContourGeneratorH
"""
function cg_create(nWidth::Integer,nHeight::Integer,bNoDataSet::Integer,dfNoDataValue::Real,dfContourInterval::Real,dfContourBase::Real,pfnWriter::Ptr{GDALContourWriter},pCBData)
    checknull(ccall((:GDAL_CG_Create,libgdal),Ptr{GDALContourGeneratorH},(Cint,Cint,Cint,Cdouble,Cdouble,Cdouble,Ptr{GDALContourWriter},Ptr{Void}),nWidth,nHeight,bNoDataSet,dfNoDataValue,dfContourInterval,dfContourBase,pfnWriter,pCBData))
end


"""
    GDAL_CG_FeedLine(GDALContourGeneratorH hCG,
                     double * padfScanline) -> CPLErr
"""
function feedline(hCG::Ptr{GDALContourGeneratorH},padfScanline)
    ccall((:GDAL_CG_FeedLine,libgdal),CPLErr,(Ptr{GDALContourGeneratorH},Ptr{Cdouble}),hCG,padfScanline)
end


"""
    GDAL_CG_Destroy(GDALContourGeneratorH hCG) -> void
"""
function destroy(hCG::Ptr{GDALContourGeneratorH})
    ccall((:GDAL_CG_Destroy,libgdal),Void,(Ptr{GDALContourGeneratorH},),hCG)
end


"""
    OGRContourWriter(double dfLevel,
                     int nPoints,
                     double * padfX,
                     double * padfY,
                     void * pInfo) -> CPLErr
"""
function contourwriter(arg1::Real,arg2::Integer,arg3,arg4,pInfo)
    ccall((:OGRContourWriter,libgdal),CPLErr,(Cdouble,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Void}),arg1,arg2,arg3,arg4,pInfo)
end


"""
    GDALContourGenerate(GDALRasterBandH hBand,
                        double dfContourInterval,
                        double dfContourBase,
                        int nFixedLevelCount,
                        double * padfFixedLevels,
                        int bUseNoData,
                        double dfNoDataValue,
                        void * hLayer,
                        int iIDField,
                        int iElevField,
                        GDALProgressFunc pfnProgress,
                        void * pProgressArg) -> CPLErr

Create vector contours from raster DEM.

### Parameters
* **hBand**: The band to read raster data from. The whole band will be processed.
* **dfContourInterval**: The elevation interval between contours generated.
* **dfContourBase**: The "base" relative to which contour intervals are applied. This is normally zero, but could be different. To generate 10m contours at 5, 15, 25, ... the ContourBase would be 5.
* **nFixedLevelCount**: The number of fixed levels. If this is greater than zero, then fixed levels will be used, and ContourInterval and ContourBase are ignored.
* **padfFixedLevels**: The list of fixed contour levels at which contours should be generated. It will contain FixedLevelCount entries, and may be NULL if fixed levels are disabled (FixedLevelCount = 0).
* **bUseNoData**: If TRUE the dfNoDataValue will be used.
* **dfNoDataValue**: The value to use as a "nodata" value. That is, a pixel value which should be ignored in generating contours as if the value of the pixel were not known.
* **hLayer**: The layer to which new contour vectors will be written. Each contour will have a LINESTRING geometry attached to it. This is really of type OGRLayerH, but void * is used to avoid pulling the ogr_api.h file in here.
* **iIDField**: If not -1 this will be used as a field index to indicate where a unique id should be written for each feature (contour) written.
* **iElevField**: If not -1 this will be used as a field index to indicate where the elevation value of the contour should be written.
* **pfnProgress**: A GDALProgressFunc that may be used to report progress to the user, or to interrupt the algorithm. May be NULL if not required.
* **pProgressArg**: The callback data for the pfnProgress function.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function contourgenerate{T <: GDALRasterBandH}(hBand::Ptr{T},dfContourInterval::Real,dfContourBase::Real,nFixedLevelCount::Integer,padfFixedLevels,bUseNoData::Integer,dfNoDataValue::Real,hLayer,iIDField::Integer,iElevField::Integer,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALContourGenerate,libgdal),CPLErr,(Ptr{GDALRasterBandH},Cdouble,Cdouble,Cint,Ptr{Cdouble},Cint,Cdouble,Ptr{Void},Cint,Cint,Ptr{GDALProgressFunc},Ptr{Void}),hBand,dfContourInterval,dfContourBase,nFixedLevelCount,padfFixedLevels,bUseNoData,dfNoDataValue,hLayer,iIDField,iElevField,pfnProgress,pProgressArg)
end


"""
    GDALRasterizeGeometries(GDALDatasetH hDS,
                            int nBandCount,
                            int * panBandList,
                            int nGeomCount,
                            OGRGeometryH * pahGeometries,
                            GDALTransformerFunc pfnTransformer,
                            void * pTransformArg,
                            double * padfGeomBurnValue,
                            char ** papszOptions,
                            GDALProgressFunc pfnProgress,
                            void * pProgressArg) -> CPLErr

Burn geometries into raster.

### Parameters
* **hDS**: output data, must be opened in update mode.
* **nBandCount**: the number of bands to be updated.
* **panBandList**: the list of bands to be updated.
* **nGeomCount**: the number of geometries being passed in pahGeometries.
* **pahGeometries**: the array of geometries to burn in.
* **pfnTransformer**: transformation to apply to geometries to put into pixel/line coordinates on raster. If NULL a geotransform based one will be created internally.
* **pTransformArg**: callback data for transformer.
* **padfGeomBurnValue**: the array of values to burn into the raster. There should be nBandCount values for each geometry.
* **papszOptions**: special options controlling rasterization 
"ALL_TOUCHED": 
May be set to TRUE to set all pixels touched by the line or polygons, not just those whose center is within the polygon or that are selected by brezenhams line algorithm. Defaults to FALSE. 
"BURN_VALUE_FROM": 
May be set to "Z" to use the Z values of the geometries. dfBurnValue is added to this before burning. Defaults to GDALBurnValueSrc.GBV_UserBurnValue in which case just the dfBurnValue is burned. This is implemented only for points and lines for now. The M value may be supported in the future. 
"MERGE_ALG": 
May be REPLACE (the default) or ADD. REPLACE results in overwriting of value, while ADD adds the new value to the existing raster, suitable for heatmaps for instance.
* **pfnProgress**: the progress function to report completion.
* **pProgressArg**: callback data for progress function.

### Returns
CE_None on success or CE_Failure on error.
"""
function rasterizegeometries{T <: GDALDatasetH}(hDS::Ptr{T},nBandCount::Integer,panBandList,nGeomCount::Integer,pahGeometries,pfnTransformer::Ptr{GDALTransformerFunc},pTransformArg,padfGeomBurnValue,papszOptions,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALRasterizeGeometries,libgdal),CPLErr,(Ptr{GDALDatasetH},Cint,Ptr{Cint},Cint,Ptr{OGRGeometryH},Ptr{GDALTransformerFunc},Ptr{Void},Ptr{Cdouble},Ptr{Cstring},Ptr{GDALProgressFunc},Ptr{Void}),hDS,nBandCount,panBandList,nGeomCount,pahGeometries,pfnTransformer,pTransformArg,padfGeomBurnValue,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALRasterizeLayers(GDALDatasetH hDS,
                        int nBandCount,
                        int * panBandList,
                        int nLayerCount,
                        OGRLayerH * pahLayers,
                        GDALTransformerFunc pfnTransformer,
                        void * pTransformArg,
                        double * padfLayerBurnValues,
                        char ** papszOptions,
                        GDALProgressFunc pfnProgress,
                        void * pProgressArg) -> CPLErr

Burn geometries from the specified list of layers into raster.

### Parameters
* **hDS**: output data, must be opened in update mode.
* **nBandCount**: the number of bands to be updated.
* **panBandList**: the list of bands to be updated.
* **nLayerCount**: the number of layers being passed in pahLayers array.
* **pahLayers**: the array of layers to burn in.
* **pfnTransformer**: transformation to apply to geometries to put into pixel/line coordinates on raster. If NULL a geotransform based one will be created internally.
* **pTransformArg**: callback data for transformer.
* **padfLayerBurnValues**: the array of values to burn into the raster. There should be nBandCount values for each layer.
* **papszOptions**: special options controlling rasterization: 
"ATTRIBUTE": 
Identifies an attribute field on the features to be used for a burn in value. The value will be burned into all output bands. If specified, padfLayerBurnValues will not be used and can be a NULL pointer. 
"CHUNKYSIZE": 
The height in lines of the chunk to operate on. The larger the chunk size the less times we need to make a pass through all the shapes. If it is not set or set to zero the default chunk size will be used. Default size will be estimated based on the GDAL cache buffer size using formula: cache_size_bytes/scanline_size_bytes, so the chunk will not exceed the cache. 
"ALL_TOUCHED": 
May be set to TRUE to set all pixels touched by the line or polygons, not just those whose center is within the polygon or that are selected by brezenhams line algorithm. Defaults to FALSE. 
"BURN_VALUE_FROM": 
May be set to "Z" to use the Z values of the geometries. The value from padfLayerBurnValues or the attribute field value is added to this before burning. In default case dfBurnValue is burned as it is. This is implemented properly only for points and lines for now. Polygons will be burned using the Z value from the first point. The M value may be supported in the future. 
"MERGE_ALG": 
May be REPLACE (the default) or ADD. REPLACE results in overwriting of value, while ADD adds the new value to the existing raster, suitable for heatmaps for instance.
* **pfnProgress**: the progress function to report completion.
* **pProgressArg**: callback data for progress function.

### Returns
CE_None on success or CE_Failure on error.
"""
function rasterizelayers{T <: GDALDatasetH}(hDS::Ptr{T},nBandCount::Integer,panBandList,nLayerCount::Integer,pahLayers,pfnTransformer::Ptr{GDALTransformerFunc},pTransformArg,padfLayerBurnValues,papszOptions,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALRasterizeLayers,libgdal),CPLErr,(Ptr{GDALDatasetH},Cint,Ptr{Cint},Cint,Ptr{OGRLayerH},Ptr{GDALTransformerFunc},Ptr{Void},Ptr{Cdouble},Ptr{Cstring},Ptr{GDALProgressFunc},Ptr{Void}),hDS,nBandCount,panBandList,nLayerCount,pahLayers,pfnTransformer,pTransformArg,padfLayerBurnValues,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALRasterizeLayersBuf(void * pData,
                           int nBufXSize,
                           int nBufYSize,
                           GDALDataType eBufType,
                           int nPixelSpace,
                           int nLineSpace,
                           int nLayerCount,
                           OGRLayerH * pahLayers,
                           const char * pszDstProjection,
                           double * padfDstGeoTransform,
                           GDALTransformerFunc pfnTransformer,
                           void * pTransformArg,
                           double dfBurnValue,
                           char ** papszOptions,
                           GDALProgressFunc pfnProgress,
                           void * pProgressArg) -> CPLErr

Burn geometries from the specified list of layer into raster.

### Parameters
* **pData**: pointer to the output data array.
* **nBufXSize**: width of the output data array in pixels.
* **nBufYSize**: height of the output data array in pixels.
* **eBufType**: data type of the output data array.
* **nPixelSpace**: The byte offset from the start of one pixel value in pData to the start of the next pixel value within a scanline. If defaulted (0) the size of the datatype eBufType is used.
* **nLineSpace**: The byte offset from the start of one scanline in pData to the start of the next. If defaulted the size of the datatype eBufType * nBufXSize is used.
* **nLayerCount**: the number of layers being passed in pahLayers array.
* **pahLayers**: the array of layers to burn in.
* **pszDstProjection**: WKT defining the coordinate system of the target raster.
* **padfDstGeoTransform**: geotransformation matrix of the target raster.
* **pfnTransformer**: transformation to apply to geometries to put into pixel/line coordinates on raster. If NULL a geotransform based one will be created internally.
* **pTransformArg**: callback data for transformer.
* **dfBurnValue**: the value to burn into the raster.
* **papszOptions**: special options controlling rasterization: 
"ATTRIBUTE": 
Identifies an attribute field on the features to be used for a burn in value. The value will be burned into all output bands. If specified, padfLayerBurnValues will not be used and can be a NULL pointer. 
"ALL_TOUCHED": 
May be set to TRUE to set all pixels touched by the line or polygons, not just those whose center is within the polygon or that are selected by brezenhams line algorithm. Defaults to FALSE.
* **pfnProgress**: the progress function to report completion.
* **pProgressArg**: callback data for progress function.

### Returns
CE_None on success or CE_Failure on error.
"""
function rasterizelayersbuf(pData,nBufXSize::Integer,nBufYSize::Integer,eBufType::GDALDataType,nPixelSpace::Integer,nLineSpace::Integer,nLayerCount::Integer,pahLayers,pszDstProjection,padfDstGeoTransform,pfnTransformer::Ptr{GDALTransformerFunc},pTransformArg,dfBurnValue::Real,papszOptions,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALRasterizeLayersBuf,libgdal),CPLErr,(Ptr{Void},Cint,Cint,GDALDataType,Cint,Cint,Cint,Ptr{OGRLayerH},Cstring,Ptr{Cdouble},Ptr{GDALTransformerFunc},Ptr{Void},Cdouble,Ptr{Cstring},Ptr{GDALProgressFunc},Ptr{Void}),pData,nBufXSize,nBufYSize,eBufType,nPixelSpace,nLineSpace,nLayerCount,pahLayers,pszDstProjection,padfDstGeoTransform,pfnTransformer,pTransformArg,dfBurnValue,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALGridCreate(GDALGridAlgorithm eAlgorithm,
                   const void * poOptions,
                   GUInt32 nPoints,
                   const double * padfX,
                   const double * padfY,
                   const double * padfZ,
                   double dfXMin,
                   double dfXMax,
                   double dfYMin,
                   double dfYMax,
                   GUInt32 nXSize,
                   GUInt32 nYSize,
                   GDALDataType eType,
                   void * pData,
                   GDALProgressFunc pfnProgress,
                   void * pProgressArg) -> CPLErr

Create regular grid from the scattered data.

### Parameters
* **eAlgorithm**: Gridding method.
* **poOptions**: Options to control chosen gridding method.
* **nPoints**: Number of elements in input arrays.
* **padfX**: Input array of X coordinates.
* **padfY**: Input array of Y coordinates.
* **padfZ**: Input array of Z values.
* **dfXMin**: Lowest X border of output grid.
* **dfXMax**: Highest X border of output grid.
* **dfYMin**: Lowest Y border of output grid.
* **dfYMax**: Highest Y border of output grid.
* **nXSize**: Number of columns in output grid.
* **nYSize**: Number of rows in output grid.
* **eType**: Data type of output array.
* **pData**: Pointer to array where the computed grid will be stored.
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
CE_None on success or CE_Failure if something goes wrong.
"""
function gridcreate(arg1::GDALGridAlgorithm,arg2,arg3::GUInt32,arg4,arg5,arg6,arg7::Real,arg8::Real,arg9::Real,arg10::Real,arg11::GUInt32,arg12::GUInt32,arg13::GDALDataType,arg14,arg15::Ptr{GDALProgressFunc},arg16)
    ccall((:GDALGridCreate,libgdal),CPLErr,(GDALGridAlgorithm,Ptr{Void},GUInt32,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Cdouble,Cdouble,Cdouble,Cdouble,GUInt32,GUInt32,GDALDataType,Ptr{Void},Ptr{GDALProgressFunc},Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16)
end


"""
    GDALGridContextCreate(GDALGridAlgorithm eAlgorithm,
                          const void * poOptions,
                          GUInt32 nPoints,
                          const double * padfX,
                          const double * padfY,
                          const double * padfZ,
                          int bCallerWillKeepPointArraysAlive) -> GDALGridContext *

Creates a context to do regular gridding from the scattered data.

### Parameters
* **eAlgorithm**: Gridding method.
* **poOptions**: Options to control chosen gridding method.
* **nPoints**: Number of elements in input arrays.
* **padfX**: Input array of X coordinates.
* **padfY**: Input array of Y coordinates.
* **padfZ**: Input array of Z values.
* **bCallerWillKeepPointArraysAlive**: Whether the provided padfX, padfY, padfZ arrays will still be "alive" during the calls to GDALGridContextProcess(). Setting to TRUE prevent them from being duplicated in the context. If unsure, set to FALSE.

### Returns
the context (to be freed with GDALGridContextFree()) or NULL in case or error
"""
function gridcontextcreate(eAlgorithm::GDALGridAlgorithm,poOptions,nPoints::GUInt32,padfX,padfY,padfZ,bCallerWillKeepPointArraysAlive::Integer)
    ccall((:GDALGridContextCreate,libgdal),Ptr{GDALGridContext},(GDALGridAlgorithm,Ptr{Void},GUInt32,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Cint),eAlgorithm,poOptions,nPoints,padfX,padfY,padfZ,bCallerWillKeepPointArraysAlive)
end


"""
    GDALGridContextFree(GDALGridContext * psContext) -> void

Free a context used created by GDALGridContextCreate()

### Parameters
* **psContext**: the context.
"""
function gridcontextfree(psContext)
    ccall((:GDALGridContextFree,libgdal),Void,(Ptr{GDALGridContext},),psContext)
end


"""
    GDALGridContextProcess(GDALGridContext * psContext,
                           double dfXMin,
                           double dfXMax,
                           double dfYMin,
                           double dfYMax,
                           GUInt32 nXSize,
                           GUInt32 nYSize,
                           GDALDataType eType,
                           void * pData,
                           GDALProgressFunc pfnProgress,
                           void * pProgressArg) -> CPLErr

Do the gridding of a window of a raster.

### Parameters
* **psContext**: Gridding context.
* **dfXMin**: Lowest X border of output grid.
* **dfXMax**: Highest X border of output grid.
* **dfYMin**: Lowest Y border of output grid.
* **dfYMax**: Highest Y border of output grid.
* **nXSize**: Number of columns in output grid.
* **nYSize**: Number of rows in output grid.
* **eType**: Data type of output array.
* **pData**: Pointer to array where the computed grid will be stored.
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.

### Returns
CE_None on success or CE_Failure if something goes wrong.
"""
function gridcontextprocess(psContext,dfXMin::Real,dfXMax::Real,dfYMin::Real,dfYMax::Real,nXSize::GUInt32,nYSize::GUInt32,eType::GDALDataType,pData,pfnProgress::Ptr{GDALProgressFunc},pProgressArg)
    ccall((:GDALGridContextProcess,libgdal),CPLErr,(Ptr{GDALGridContext},Cdouble,Cdouble,Cdouble,Cdouble,GUInt32,GUInt32,GDALDataType,Ptr{Void},Ptr{GDALProgressFunc},Ptr{Void}),psContext,dfXMin,dfXMax,dfYMin,dfYMax,nXSize,nYSize,eType,pData,pfnProgress,pProgressArg)
end


"""
    GDALComputeMatchingPoints(GDALDatasetH hFirstImage,
                              GDALDatasetH hSecondImage,
                              char ** papszOptions,
                              int * pnGCPCount) -> GDAL_GCP *
"""
function computematchingpoints{T <: GDALDatasetH}(hFirstImage::Ptr{T},hSecondImage::Ptr{T},papszOptions,pnGCPCount)
    ccall((:GDALComputeMatchingPoints,libgdal),Ptr{GDAL_GCP},(Ptr{GDALDatasetH},Ptr{GDALDatasetH},Ptr{Cstring},Ptr{Cint}),hFirstImage,hSecondImage,papszOptions,pnGCPCount)
end


"""
    GDALHasTriangulation() -> int

Returns if GDAL is built with Delaunay triangulation support.

### Returns
TRUE if GDAL is built with Delaunay triangulation support.
"""
function hastriangulation()
    ccall((:GDALHasTriangulation,libgdal),Cint,())
end


"""
    GDALTriangulationCreateDelaunay(int nPoints,
                                    const double * padfX,
                                    const double * padfY) -> GDALTriangulation *

Computes a Delaunay triangulation of the passed points.

### Parameters
* **nPoints**: number of points
* **padfX**: x coordinates of the points.
* **padfY**: y coordinates of the points.

### Returns
triangulation that must be freed with GDALTriangulationFree(), or NULL in case of error.
"""
function triangulationcreatedelaunay(nPoints::Integer,padfX,padfY)
    ccall((:GDALTriangulationCreateDelaunay,libgdal),Ptr{GDALTriangulation},(Cint,Ptr{Cdouble},Ptr{Cdouble}),nPoints,padfX,padfY)
end


"""
    GDALTriangulationComputeBarycentricCoefficients(GDALTriangulation * psDT,
                                                    const double * padfX,
                                                    const double * padfY) -> int

Computes barycentric coefficients for each triangles of the triangulation.

### Parameters
* **psDT**: triangulation.
* **padfX**: x coordinates of the points. Must be identical to the one passed to GDALTriangulationCreateDelaunay().
* **padfY**: y coordinates of the points. Must be identical to the one passed to GDALTriangulationCreateDelaunay().

### Returns
TRUE in case of success.
"""
function triangulationcomputebarycentriccoefficients(psDT,padfX,padfY)
    ccall((:GDALTriangulationComputeBarycentricCoefficients,libgdal),Cint,(Ptr{GDALTriangulation},Ptr{Cdouble},Ptr{Cdouble}),psDT,padfX,padfY)
end


"""
    GDALTriangulationComputeBarycentricCoordinates(const GDALTriangulation * psDT,
                                                   int nFacetIdx,
                                                   double dfX,
                                                   double dfY,
                                                   double * pdfL1,
                                                   double * pdfL2,
                                                   double * pdfL3) -> int
"""
function triangulationcomputebarycentriccoordinates(psDT,nFacetIdx::Integer,dfX::Real,dfY::Real,pdfL1,pdfL2,pdfL3)
    ccall((:GDALTriangulationComputeBarycentricCoordinates,libgdal),Cint,(Ptr{GDALTriangulation},Cint,Cdouble,Cdouble,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),psDT,nFacetIdx,dfX,dfY,pdfL1,pdfL2,pdfL3)
end


"""
    GDALTriangulationFindFacetBruteForce(const GDALTriangulation * psDT,
                                         double dfX,
                                         double dfY,
                                         int * panOutputFacetIdx) -> int

Returns the index of the triangle that contains the point by iterating over all triangles.

### Parameters
* **psDT**: triangulation.
* **dfX**: x coordinate of the point.
* **dfY**: y coordinate of the point.
* **panOutputFacetIdx**: (output) pointer to the index of the triangle.

### Returns
index >= 0 of the triangle in case of success, -1 otherwise.
"""
function triangulationfindfacetbruteforce(psDT,dfX::Real,dfY::Real,panOutputFacetIdx)
    ccall((:GDALTriangulationFindFacetBruteForce,libgdal),Cint,(Ptr{GDALTriangulation},Cdouble,Cdouble,Ptr{Cint}),psDT,dfX,dfY,panOutputFacetIdx)
end


"""
    GDALTriangulationFindFacetDirected(const GDALTriangulation * psDT,
                                       int nFacetIdx,
                                       double dfX,
                                       double dfY,
                                       int * panOutputFacetIdx) -> int

Returns the index of the triangle that contains the point by walking in the triangulation.

### Parameters
* **psDT**: triangulation.
* **nFacetIdx**: index of first triangle to start with.
* **dfX**: x coordinate of the point.
* **dfY**: y coordinate of the point.
* **panOutputFacetIdx**: (output) pointer to the index of the triangle.

### Returns
TRUE in case of success, -1 otherwise.
"""
function triangulationfindfacetdirected(psDT,nFacetIdx::Integer,dfX::Real,dfY::Real,panOutputFacetIdx)
    ccall((:GDALTriangulationFindFacetDirected,libgdal),Cint,(Ptr{GDALTriangulation},Cint,Cdouble,Cdouble,Ptr{Cint}),psDT,nFacetIdx,dfX,dfY,panOutputFacetIdx)
end


"""
    GDALTriangulationFree(GDALTriangulation * psDT) -> void

Free a triangulation.

### Parameters
* **psDT**: triangulation.
"""
function triangulationfree(psDT)
    ccall((:GDALTriangulationFree,libgdal),Void,(Ptr{GDALTriangulation},),psDT)
end


"""
    GDALTriangulationTerminate() -> void
"""
function triangulationterminate()
    ccall((:GDALTriangulationTerminate,libgdal),Void,())
end
