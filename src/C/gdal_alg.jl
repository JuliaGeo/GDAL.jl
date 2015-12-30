# Julia wrapper for header: /usr/local/include/gdal_alg.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0



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
function GDALComputeMedianCutPCT(hRed::GDALRasterBandH,hGreen::GDALRasterBandH,hBlue::GDALRasterBandH,pfnIncludePixel::Ptr{Void},nColors::Cint,hColorTable::GDALColorTableH,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALComputeMedianCutPCT,libgdal),Cint,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,Ptr{Void},Cint,GDALColorTableH,GDALProgressFunc,Ptr{Void}),hRed,hGreen,hBlue,pfnIncludePixel,nColors,hColorTable,pfnProgress,pProgressArg)
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
function GDALDitherRGB2PCT(hRed::GDALRasterBandH,hGreen::GDALRasterBandH,hBlue::GDALRasterBandH,hTarget::GDALRasterBandH,hColorTable::GDALColorTableH,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALDitherRGB2PCT,libgdal),Cint,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,GDALColorTableH,GDALProgressFunc,Ptr{Void}),hRed,hGreen,hBlue,hTarget,hColorTable,pfnProgress,pProgressArg)
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
function GDALChecksumImage(hBand::GDALRasterBandH,nXOff::Cint,nYOff::Cint,nXSize::Cint,nYSize::Cint)
    ccall((:GDALChecksumImage,libgdal),Cint,(GDALRasterBandH,Cint,Cint,Cint,Cint),hBand,nXOff,nYOff,nXSize,nYSize)
end


"""
    GDALComputeProximity(GDALRasterBandH hSrcBand,
                         GDALRasterBandH hProximityBand,
                         char ** papszOptions,
                         GDALProgressFunc pfnProgress,
                         void * pProgressArg) -> CPLErr

Compute the proximity of all pixels in the image to a set of pixels in the source image.
"""
function GDALComputeProximity(hSrcBand::GDALRasterBandH,hProximityBand::GDALRasterBandH,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALComputeProximity,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hProximityBand,papszOptions,pfnProgress,pProgressArg)
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
function GDALFillNodata(hTargetBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,dfMaxSearchDist::Cdouble,bDeprecatedOption::Cint,nSmoothingIterations::Cint,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALFillNodata,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,Cdouble,Cint,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hTargetBand,hMaskBand,dfMaxSearchDist,bDeprecatedOption,nSmoothingIterations,papszOptions,pfnProgress,pProgressArg)
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
function GDALPolygonize(hSrcBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,hOutLayer::OGRLayerH,iPixValField::Cint,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALPolygonize,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,OGRLayerH,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hMaskBand,hOutLayer,iPixValField,papszOptions,pfnProgress,pProgressArg)
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
function GDALFPolygonize(hSrcBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,hOutLayer::OGRLayerH,iPixValField::Cint,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALFPolygonize,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,OGRLayerH,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hMaskBand,hOutLayer,iPixValField,papszOptions,pfnProgress,pProgressArg)
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
"""
function GDALSieveFilter(hSrcBand::GDALRasterBandH,hMaskBand::GDALRasterBandH,hDstBand::GDALRasterBandH,nSizeThreshold::Cint,nConnectedness::Cint,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALSieveFilter,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,Cint,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hMaskBand,hDstBand,nSizeThreshold,nConnectedness,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALDestroyTransformer(void * pTransformerArg) -> void
"""
function GDALDestroyTransformer(pTransformerArg::Ptr{Void})
    ccall((:GDALDestroyTransformer,libgdal),Void,(Ptr{Void},),pTransformerArg)
end


"""
    GDALUseTransformer(void * pTranformerArg,
                       int bDstToSrc,
                       int nPointCount,
                       double * x,
                       double * y,
                       double * z,
                       int * panSuccess) -> int
"""
function GDALUseTransformer(pTranformerArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALUseTransformer,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTranformerArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALCreateSimilarTransformer(void * psTransformerArg,
                                 double dfSrcRatioX,
                                 double dfSrcRatioY) -> void *
"""
function GDALCreateSimilarTransformer(psTransformerArg::Ptr{Void},dfSrcRatioX::Cdouble,dfSrcRatioY::Cdouble)
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
"""
function GDALCreateGenImgProjTransformer(hSrcDS::GDALDatasetH,pszSrcWKT::Ptr{UInt8},hDstDS::GDALDatasetH,pszDstWKT::Ptr{UInt8},bGCPUseOK::Cint,dfGCPErrorThreshold::Cdouble,nOrder::Cint)
    ccall((:GDALCreateGenImgProjTransformer,libgdal),Ptr{Void},(GDALDatasetH,Ptr{UInt8},GDALDatasetH,Ptr{UInt8},Cint,Cdouble,Cint),hSrcDS,pszSrcWKT,hDstDS,pszDstWKT,bGCPUseOK,dfGCPErrorThreshold,nOrder)
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
function GDALCreateGenImgProjTransformer2(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALCreateGenImgProjTransformer2,libgdal),Ptr{Void},(GDALDatasetH,GDALDatasetH,Ptr{Ptr{UInt8}}),hSrcDS,hDstDS,papszOptions)
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
function GDALCreateGenImgProjTransformer3(pszSrcWKT::Ptr{UInt8},padfSrcGeoTransform::Ptr{Cdouble},pszDstWKT::Ptr{UInt8},padfDstGeoTransform::Ptr{Cdouble})
    ccall((:GDALCreateGenImgProjTransformer3,libgdal),Ptr{Void},(Ptr{UInt8},Ptr{Cdouble},Ptr{UInt8},Ptr{Cdouble}),pszSrcWKT,padfSrcGeoTransform,pszDstWKT,padfDstGeoTransform)
end


"""
    GDALSetGenImgProjTransformerDstGeoTransform(void *,
                                                const double *) -> void

Set GenImgProj output geotransform.

### Parameters
* **hTransformArg**: the handle to update.
* **padfGeoTransform**: the destination geotransform to apply (six doubles).
"""
function GDALSetGenImgProjTransformerDstGeoTransform(arg1::Ptr{Void},arg2::Ptr{Cdouble})
    ccall((:GDALSetGenImgProjTransformerDstGeoTransform,libgdal),Void,(Ptr{Void},Ptr{Cdouble}),arg1,arg2)
end


"""
    GDALDestroyGenImgProjTransformer(void *) -> void

GenImgProjTransformer deallocator.

### Parameters
* **hTransformArg**: the handle to deallocate.
"""
function GDALDestroyGenImgProjTransformer(arg1::Ptr{Void})
    ccall((:GDALDestroyGenImgProjTransformer,libgdal),Void,(Ptr{Void},),arg1)
end


"""
    GDALGenImgProjTransform(void * pTransformArg,
                            int bDstToSrc,
                            int nPointCount,
                            double * x,
                            double * y,
                            double * z,
                            int * panSuccess) -> int

Perform general image reprojection transformation.
"""
function GDALGenImgProjTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALGenImgProjTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALSetTransformerDstGeoTransform(void *,
                                      const double *) -> void
"""
function GDALSetTransformerDstGeoTransform(arg1::Ptr{Void},arg2::Ptr{Cdouble})
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
function GDALCreateReprojectionTransformer(pszSrcWKT::Ptr{UInt8},pszDstWKT::Ptr{UInt8})
    ccall((:GDALCreateReprojectionTransformer,libgdal),Ptr{Void},(Ptr{UInt8},Ptr{UInt8}),pszSrcWKT,pszDstWKT)
end


"""
    GDALDestroyReprojectionTransformer(void *) -> void

Destroy reprojection transformation.

### Parameters
* **pTransformArg**: the transformation handle returned by GDALCreateReprojectionTransformer().
"""
function GDALDestroyReprojectionTransformer(arg1::Ptr{Void})
    ccall((:GDALDestroyReprojectionTransformer,libgdal),Void,(Ptr{Void},),arg1)
end


"""
    GDALReprojectionTransform(void * pTransformArg,
                              int bDstToSrc,
                              int nPointCount,
                              double * x,
                              double * y,
                              double * z,
                              int * panSuccess) -> int

Perform reprojection transformation.
"""
function GDALReprojectionTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
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
* **bReversed**: set it to TRUE to compute the reversed transformation.

### Returns
the transform argument or NULL if creation fails.
"""
function GDALCreateGCPTransformer(nGCPCount::Cint,pasGCPList::Ptr{GDAL_GCP},nReqOrder::Cint,bReversed::Cint)
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
function GDALCreateGCPRefineTransformer(nGCPCount::Cint,pasGCPList::Ptr{GDAL_GCP},nReqOrder::Cint,bReversed::Cint,tolerance::Cdouble,minimumGcps::Cint)
    ccall((:GDALCreateGCPRefineTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint,Cint,Cdouble,Cint),nGCPCount,pasGCPList,nReqOrder,bReversed,tolerance,minimumGcps)
end


"""
    GDALDestroyGCPTransformer(void * pTransformArg) -> void

Destroy GCP transformer.

### Parameters
* **pTransformArg**: the transform arg previously returned by GDALCreateGCPTransformer().
"""
function GDALDestroyGCPTransformer(pTransformArg::Ptr{Void})
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
function GDALGCPTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
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
function GDALCreateTPSTransformer(nGCPCount::Cint,pasGCPList::Ptr{GDAL_GCP},bReversed::Cint)
    ccall((:GDALCreateTPSTransformer,libgdal),Ptr{Void},(Cint,Ptr{GDAL_GCP},Cint),nGCPCount,pasGCPList,bReversed)
end


"""
    GDALDestroyTPSTransformer(void * pTransformArg) -> void

Destroy TPS transformer.

### Parameters
* **pTransformArg**: the transform arg previously returned by GDALCreateTPSTransformer().
"""
function GDALDestroyTPSTransformer(pTransformArg::Ptr{Void})
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
"""
function GDALTPSTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALTPSTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    RPCInfoToMD(GDALRPCInfo * psRPCInfo) -> char **
"""
function RPCInfoToMD(psRPCInfo::Ptr{GDALRPCInfo})
    ccall((:RPCInfoToMD,libgdal),Ptr{Ptr{UInt8}},(Ptr{GDALRPCInfo},),psRPCInfo)
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
* **dfPixErrThreshold**: the error (measured in pixels) allowed in the iterative solution of pixel/line to lat/long computations (the other way is always exact given the equations).
* **papszOptions**: Other transformer options (ie. RPC_HEIGHT=<z>).

### Returns
transformer callback data (deallocate with GDALDestroyTransformer()).
"""
function GDALCreateRPCTransformer(psRPC::Ptr{GDALRPCInfo},bReversed::Cint,dfPixErrThreshold::Cdouble,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALCreateRPCTransformer,libgdal),Ptr{Void},(Ptr{GDALRPCInfo},Cint,Cdouble,Ptr{Ptr{UInt8}}),psRPC,bReversed,dfPixErrThreshold,papszOptions)
end


"""
    GDALDestroyRPCTransformer(void * pTransformArg) -> void
"""
function GDALDestroyRPCTransformer(pTransformArg::Ptr{Void})
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
function GDALRPCTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALRPCTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALCreateGeoLocTransformer(GDALDatasetH hBaseDS,
                                char ** papszGeolocationInfo,
                                int bReversed) -> void *
"""
function GDALCreateGeoLocTransformer(hBaseDS::GDALDatasetH,papszGeolocationInfo::Ptr{Ptr{UInt8}},bReversed::Cint)
    ccall((:GDALCreateGeoLocTransformer,libgdal),Ptr{Void},(GDALDatasetH,Ptr{Ptr{UInt8}},Cint),hBaseDS,papszGeolocationInfo,bReversed)
end


"""
    GDALDestroyGeoLocTransformer(void * pTransformArg) -> void
"""
function GDALDestroyGeoLocTransformer(pTransformArg::Ptr{Void})
    ccall((:GDALDestroyGeoLocTransformer,libgdal),Void,(Ptr{Void},),pTransformArg)
end


"""
    GDALGeoLocTransform(void * pTransformArg,
                        int bDstToSrc,
                        int nPointCount,
                        double * x,
                        double * y,
                        double * z,
                        int * panSuccess) -> int
"""
function GDALGeoLocTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
    ccall((:GDALGeoLocTransform,libgdal),Cint,(Ptr{Void},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),pTransformArg,bDstToSrc,nPointCount,x,y,z,panSuccess)
end


"""
    GDALCreateApproxTransformer(GDALTransformerFunc pfnRawTransformer,
                                void * pRawTransformerArg,
                                double dfMaxError) -> void *

Create an approximating transformer.

### Parameters
* **pfnBaseTransformer**: the high precision transformer which should be approximated.
* **pBaseTransformArg**: the callback argument for the high precision transformer.
* **dfMaxError**: the maximum cartesian error in the "output" space that is to be accepted in the linear approximation.

### Returns
callback pointer suitable for use with GDALApproxTransform(). It should be deallocated with GDALDestroyApproxTransformer().
"""
function GDALCreateApproxTransformer(pfnRawTransformer::GDALTransformerFunc,pRawTransformerArg::Ptr{Void},dfMaxError::Cdouble)
    ccall((:GDALCreateApproxTransformer,libgdal),Ptr{Void},(GDALTransformerFunc,Ptr{Void},Cdouble),pfnRawTransformer,pRawTransformerArg,dfMaxError)
end


"""
    GDALApproxTransformerOwnsSubtransformer(void * pCBData,
                                            int bOwnFlag) -> void
"""
function GDALApproxTransformerOwnsSubtransformer(pCBData::Ptr{Void},bOwnFlag::Cint)
    ccall((:GDALApproxTransformerOwnsSubtransformer,libgdal),Void,(Ptr{Void},Cint),pCBData,bOwnFlag)
end


"""
    GDALDestroyApproxTransformer(void * pApproxArg) -> void

Cleanup approximate transformer.

### Parameters
* **pCBData**: callback data originally returned by GDALCreateApproxTransformer().
"""
function GDALDestroyApproxTransformer(pApproxArg::Ptr{Void})
    ccall((:GDALDestroyApproxTransformer,libgdal),Void,(Ptr{Void},),pApproxArg)
end


"""
    GDALApproxTransform(void * pTransformArg,
                        int bDstToSrc,
                        int nPointCount,
                        double * x,
                        double * y,
                        double * z,
                        int * panSuccess) -> int

Perform approximate transformation.
"""
function GDALApproxTransform(pTransformArg::Ptr{Void},bDstToSrc::Cint,nPointCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},panSuccess::Ptr{Cint})
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
function GDALSimpleImageWarp(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,nBandCount::Cint,panBandList::Ptr{Cint},pfnTransform::GDALTransformerFunc,pTransformArg::Ptr{Void},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void},papszWarpOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALSimpleImageWarp,libgdal),Cint,(GDALDatasetH,GDALDatasetH,Cint,Ptr{Cint},GDALTransformerFunc,Ptr{Void},GDALProgressFunc,Ptr{Void},Ptr{Ptr{UInt8}}),hSrcDS,hDstDS,nBandCount,panBandList,pfnTransform,pTransformArg,pfnProgress,pProgressArg,papszWarpOptions)
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
function GDALSuggestedWarpOutput(hSrcDS::GDALDatasetH,pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfGeoTransformOut::Ptr{Cdouble},pnPixels::Ptr{Cint},pnLines::Ptr{Cint})
    ccall((:GDALSuggestedWarpOutput,libgdal),CPLErr,(GDALDatasetH,GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Cint},Ptr{Cint}),hSrcDS,pfnTransformer,pTransformArg,padfGeoTransformOut,pnPixels,pnLines)
end


"""
    GDALSuggestedWarpOutput2(GDALDatasetH hSrcDS,
                             GDALTransformerFunc pfnTransformer,
                             void * pTransformArg,
                             double * padfGeoTransformOut,
                             int * pnPixels,
                             int * pnLines,
                             double * padfExtents,
                             int nOptions) -> CPLErr
"""
function GDALSuggestedWarpOutput2(hSrcDS::GDALDatasetH,pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfGeoTransformOut::Ptr{Cdouble},pnPixels::Ptr{Cint},pnLines::Ptr{Cint},padfExtents::Ptr{Cdouble},nOptions::Cint)
    ccall((:GDALSuggestedWarpOutput2,libgdal),CPLErr,(GDALDatasetH,GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Cint},Ptr{Cint},Ptr{Cdouble},Cint),hSrcDS,pfnTransformer,pTransformArg,padfGeoTransformOut,pnPixels,pnLines,padfExtents,nOptions)
end


"""
    GDALSerializeTransformer(GDALTransformerFunc pfnFunc,
                             void * pTransformArg) -> CPLXMLNode *
"""
function GDALSerializeTransformer(pfnFunc::GDALTransformerFunc,pTransformArg::Ptr{Void})
    ccall((:GDALSerializeTransformer,libgdal),Ptr{CPLXMLNode},(GDALTransformerFunc,Ptr{Void}),pfnFunc,pTransformArg)
end


"""
    GDALDeserializeTransformer(CPLXMLNode * psTree,
                               GDALTransformerFunc * ppfnFunc,
                               void ** ppTransformArg) -> CPLErr
"""
function GDALDeserializeTransformer(psTree::Ptr{CPLXMLNode},ppfnFunc::Ptr{GDALTransformerFunc},ppTransformArg::Ptr{Ptr{Void}})
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
"""
function GDALTransformGeolocations(hXBand::GDALRasterBandH,hYBand::GDALRasterBandH,hZBand::GDALRasterBandH,pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void},papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALTransformGeolocations,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,GDALRasterBandH,GDALTransformerFunc,Ptr{Void},GDALProgressFunc,Ptr{Void},Ptr{Ptr{UInt8}}),hXBand,hYBand,hZBand,pfnTransformer,pTransformArg,pfnProgress,pProgressArg,papszOptions)
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
function GDAL_CG_Create(nWidth::Cint,nHeight::Cint,bNoDataSet::Cint,dfNoDataValue::Cdouble,dfContourInterval::Cdouble,dfContourBase::Cdouble,pfnWriter::GDALContourWriter,pCBData::Ptr{Void})
    ccall((:GDAL_CG_Create,libgdal),GDALContourGeneratorH,(Cint,Cint,Cint,Cdouble,Cdouble,Cdouble,GDALContourWriter,Ptr{Void}),nWidth,nHeight,bNoDataSet,dfNoDataValue,dfContourInterval,dfContourBase,pfnWriter,pCBData)
end


"""
    GDAL_CG_FeedLine(GDALContourGeneratorH hCG,
                     double * padfScanline) -> CPLErr
"""
function GDAL_CG_FeedLine(hCG::GDALContourGeneratorH,padfScanline::Ptr{Cdouble})
    ccall((:GDAL_CG_FeedLine,libgdal),CPLErr,(GDALContourGeneratorH,Ptr{Cdouble}),hCG,padfScanline)
end


"""
    GDAL_CG_Destroy(GDALContourGeneratorH hCG) -> void
"""
function GDAL_CG_Destroy(hCG::GDALContourGeneratorH)
    ccall((:GDAL_CG_Destroy,libgdal),Void,(GDALContourGeneratorH,),hCG)
end


"""
    OGRContourWriter(double dfLevel,
                     int nPoints,
                     double * padfX,
                     double * padfY,
                     void * pInfo) -> CPLErr
"""
function OGRContourWriter(arg1::Cdouble,arg2::Cint,arg3::Ptr{Cdouble},arg4::Ptr{Cdouble},pInfo::Ptr{Void})
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
function GDALContourGenerate(hBand::GDALRasterBandH,dfContourInterval::Cdouble,dfContourBase::Cdouble,nFixedLevelCount::Cint,padfFixedLevels::Ptr{Cdouble},bUseNoData::Cint,dfNoDataValue::Cdouble,hLayer::Ptr{Void},iIDField::Cint,iElevField::Cint,pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALContourGenerate,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cdouble},Cint,Cdouble,Ptr{Void},Cint,Cint,GDALProgressFunc,Ptr{Void}),hBand,dfContourInterval,dfContourBase,nFixedLevelCount,padfFixedLevels,bUseNoData,dfNoDataValue,hLayer,iIDField,iElevField,pfnProgress,pProgressArg)
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
function GDALRasterizeGeometries(hDS::GDALDatasetH,nBandCount::Cint,panBandList::Ptr{Cint},nGeomCount::Cint,pahGeometries::Ptr{OGRGeometryH},pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfGeomBurnValue::Ptr{Cdouble},papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALRasterizeGeometries,libgdal),CPLErr,(GDALDatasetH,Cint,Ptr{Cint},Cint,Ptr{OGRGeometryH},GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hDS,nBandCount,panBandList,nGeomCount,pahGeometries,pfnTransformer,pTransformArg,padfGeomBurnValue,papszOptions,pfnProgress,pProgressArg)
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
function GDALRasterizeLayers(hDS::GDALDatasetH,nBandCount::Cint,panBandList::Ptr{Cint},nLayerCount::Cint,pahLayers::Ptr{OGRLayerH},pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},padfLayerBurnValues::Ptr{Cdouble},papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALRasterizeLayers,libgdal),CPLErr,(GDALDatasetH,Cint,Ptr{Cint},Cint,Ptr{OGRLayerH},GDALTransformerFunc,Ptr{Void},Ptr{Cdouble},Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hDS,nBandCount,panBandList,nLayerCount,pahLayers,pfnTransformer,pTransformArg,padfLayerBurnValues,papszOptions,pfnProgress,pProgressArg)
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
function GDALRasterizeLayersBuf(pData::Ptr{Void},nBufXSize::Cint,nBufYSize::Cint,eBufType::GDALDataType,nPixelSpace::Cint,nLineSpace::Cint,nLayerCount::Cint,pahLayers::Ptr{OGRLayerH},pszDstProjection::Ptr{UInt8},padfDstGeoTransform::Ptr{Cdouble},pfnTransformer::GDALTransformerFunc,pTransformArg::Ptr{Void},dfBurnValue::Cdouble,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressArg::Ptr{Void})
    ccall((:GDALRasterizeLayersBuf,libgdal),CPLErr,(Ptr{Void},Cint,Cint,GDALDataType,Cint,Cint,Cint,Ptr{OGRLayerH},Ptr{UInt8},Ptr{Cdouble},GDALTransformerFunc,Ptr{Void},Cdouble,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),pData,nBufXSize,nBufYSize,eBufType,nPixelSpace,nLineSpace,nLayerCount,pahLayers,pszDstProjection,padfDstGeoTransform,pfnTransformer,pTransformArg,dfBurnValue,papszOptions,pfnProgress,pProgressArg)
end


"""
    GDALGridCreate(GDALGridAlgorithm,
                   const void *,
                   GUInt32,
                   const double *,
                   const double *,
                   const double *,
                   double,
                   double,
                   double,
                   double,
                   GUInt32,
                   GUInt32,
                   GDALDataType,
                   void *,
                   GDALProgressFunc,
                   void *) -> CPLErr

Create regular grid from the scattered data.

### Parameters
* **eAlgorithm**: Gridding method.
* **poOptions**: Options to control choosen gridding method.
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
function GDALGridCreate(arg1::GDALGridAlgorithm,arg2::Ptr{Void},arg3::GUInt32,arg4::Ptr{Cdouble},arg5::Ptr{Cdouble},arg6::Ptr{Cdouble},arg7::Cdouble,arg8::Cdouble,arg9::Cdouble,arg10::Cdouble,arg11::GUInt32,arg12::GUInt32,arg13::GDALDataType,arg14::Ptr{Void},arg15::GDALProgressFunc,arg16::Ptr{Void})
    ccall((:GDALGridCreate,libgdal),CPLErr,(GDALGridAlgorithm,Ptr{Void},GUInt32,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Cdouble,Cdouble,Cdouble,Cdouble,GUInt32,GUInt32,GDALDataType,Ptr{Void},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16)
end


"""
    GDALComputeMatchingPoints(GDALDatasetH hFirstImage,
                              GDALDatasetH hSecondImage,
                              char ** papszOptions,
                              int * pnGCPCount) -> GDAL_GCP *
"""
function GDALComputeMatchingPoints(hFirstImage::GDALDatasetH,hSecondImage::GDALDatasetH,papszOptions::Ptr{Ptr{UInt8}},pnGCPCount::Ptr{Cint})
    ccall((:GDALComputeMatchingPoints,libgdal),Ptr{GDAL_GCP},(GDALDatasetH,GDALDatasetH,Ptr{Ptr{UInt8}},Ptr{Cint}),hFirstImage,hSecondImage,papszOptions,pnGCPCount)
end
