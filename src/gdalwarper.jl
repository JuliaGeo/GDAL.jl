# Julia wrapper for header: gdalwarper.h
# Automatically generated using Clang.jl


"""
    GDALWarpNoDataMasker(void * pMaskFuncArg,
                         int nBandCount,
                         GDALDataType eType,
                         int,
                         int,
                         int nXSize,
                         int nYSize,
                         GByte ** ppImageData,
                         int bMaskIsFloat,
                         void * pValidityMask,
                         int * pbOutAllValid) -> CPLErr
"""
function gdalwarpnodatamasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, papabyImageData, bMaskIsFloat, pValidityMask, pbOutAllValid)
    aftercare(ccall((:GDALWarpNoDataMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}, Ptr{Cint}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, papabyImageData, bMaskIsFloat, pValidityMask, pbOutAllValid))
end

"""
    GDALWarpDstAlphaMasker(void * pMaskFuncArg,
                           int nBandCount,
                           GDALDataType,
                           int nXOff,
                           int nYOff,
                           int nXSize,
                           int nYSize,
                           GByte **,
                           int bMaskIsFloat,
                           void * pValidityMask) -> CPLErr
"""
function gdalwarpdstalphamasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg1, bMaskIsFloat, pValidityMask)
    aftercare(ccall((:GDALWarpDstAlphaMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg1, bMaskIsFloat, pValidityMask))
end

"""
    GDALWarpSrcAlphaMasker(void * pMaskFuncArg,
                           int,
                           GDALDataType,
                           int nXOff,
                           int nYOff,
                           int nXSize,
                           int nYSize,
                           GByte **,
                           int bMaskIsFloat,
                           void * pValidityMask,
                           int * pbOutAllOpaque) -> CPLErr
"""
function gdalwarpsrcalphamasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg1, bMaskIsFloat, pValidityMask, pbOutAllOpaque)
    aftercare(ccall((:GDALWarpSrcAlphaMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}, Ptr{Cint}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg1, bMaskIsFloat, pValidityMask, pbOutAllOpaque))
end

"""
    GDALWarpSrcMaskMasker(void * pMaskFuncArg,
                          int,
                          GDALDataType,
                          int nXOff,
                          int nYOff,
                          int nXSize,
                          int nYSize,
                          GByte **,
                          int bMaskIsFloat,
                          void * pValidityMask) -> CPLErr
"""
function gdalwarpsrcmaskmasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg1, bMaskIsFloat, pValidityMask)
    aftercare(ccall((:GDALWarpSrcMaskMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg1, bMaskIsFloat, pValidityMask))
end

"""
    GDALWarpCutlineMasker(void * pMaskFuncArg,
                          int,
                          GDALDataType,
                          int nXOff,
                          int nYOff,
                          int nXSize,
                          int nYSize,
                          GByte **,
                          int bMaskIsFloat,
                          void * pValidityMask) -> CPLErr
"""
function gdalwarpcutlinemasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg1, bMaskIsFloat, pValidityMask)
    aftercare(ccall((:GDALWarpCutlineMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg1, bMaskIsFloat, pValidityMask))
end

"""
    GDALCreateWarpOptions() -> GDALWarpOptions *

Create a warp options structure.
"""
function gdalcreatewarpoptions()
    aftercare(ccall((:GDALCreateWarpOptions, libgdal), Ptr{GDALWarpOptions}, ()))
end

"""
    GDALDestroyWarpOptions(GDALWarpOptions * psOptions) -> void

Destroy a warp options structure.
"""
function gdaldestroywarpoptions(arg1)
    aftercare(ccall((:GDALDestroyWarpOptions, libgdal), Cvoid, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALCloneWarpOptions(const GDALWarpOptions * psSrcOptions) -> GDALWarpOptions *

Clone a warp options structure.
"""
function gdalclonewarpoptions(arg1)
    aftercare(ccall((:GDALCloneWarpOptions, libgdal), Ptr{GDALWarpOptions}, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALWarpInitDstNoDataReal(GDALWarpOptions * psOptionsIn,
                              double dNoDataReal) -> void

Initialize padfDstNoDataReal with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataReal**: value to initialize to.
"""
function gdalwarpinitdstnodatareal(arg1, dNoDataReal)
    aftercare(ccall((:GDALWarpInitDstNoDataReal, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataReal))
end

"""
    GDALWarpInitSrcNoDataReal(GDALWarpOptions * psOptionsIn,
                              double dNoDataReal) -> void

Initialize padfSrcNoDataReal with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataReal**: value to initialize to.
"""
function gdalwarpinitsrcnodatareal(arg1, dNoDataReal)
    aftercare(ccall((:GDALWarpInitSrcNoDataReal, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataReal))
end

"""
    GDALWarpInitNoDataReal(GDALWarpOptions * psOptionsIn,
                           double dNoDataReal) -> void

Initialize padfSrcNoDataReal and padfDstNoDataReal with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataReal**: value to initialize to.
"""
function gdalwarpinitnodatareal(arg1, dNoDataReal)
    aftercare(ccall((:GDALWarpInitNoDataReal, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataReal))
end

"""
    GDALWarpInitDstNoDataImag(GDALWarpOptions * psOptionsIn,
                              double dNoDataImag) -> void

Initialize padfDstNoDataImag with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataImag**: value to initialize to.
"""
function gdalwarpinitdstnodataimag(arg1, dNoDataImag)
    aftercare(ccall((:GDALWarpInitDstNoDataImag, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataImag))
end

"""
    GDALWarpInitSrcNoDataImag(GDALWarpOptions * psOptionsIn,
                              double dNoDataImag) -> void

Initialize padfSrcNoDataImag with specified value.

### Parameters
* **psOptionsIn**: options to initialize.
* **dNoDataImag**: value to initialize to.
"""
function gdalwarpinitsrcnodataimag(arg1, dNoDataImag)
    aftercare(ccall((:GDALWarpInitSrcNoDataImag, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataImag))
end

"""
    GDALWarpResolveWorkingDataType(GDALWarpOptions * psOptions) -> void

If the working data type is unknown, this method will determine a valid working data type to support the data in the src and dest data sets and any noData values.

### Parameters
* **psOptions**: options to initialize.
"""
function gdalwarpresolveworkingdatatype(arg1)
    aftercare(ccall((:GDALWarpResolveWorkingDataType, libgdal), Cvoid, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALWarpInitDefaultBandMapping(GDALWarpOptions * psOptionsIn,
                                   int nBandCount) -> void

Init src and dst band mappings such that Bands[i] = i+1 for nBandCount Does nothing if psOptionsIn->nBandCount is non-zero.

### Parameters
* **psOptionsIn**: options to initialize.
* **nBandCount**: bands to initialize for.
"""
function gdalwarpinitdefaultbandmapping(arg1, nBandCount)
    aftercare(ccall((:GDALWarpInitDefaultBandMapping, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cint), arg1, nBandCount))
end

"""
    GDALSerializeWarpOptions(const GDALWarpOptions * psWO) -> CPLXMLNode *
"""
function gdalserializewarpoptions(arg1)
    aftercare(ccall((:GDALSerializeWarpOptions, libgdal), Ptr{CPLXMLNode}, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALDeserializeWarpOptions(CPLXMLNode * psTree) -> GDALWarpOptions *
"""
function gdaldeserializewarpoptions(arg1)
    aftercare(ccall((:GDALDeserializeWarpOptions, libgdal), Ptr{GDALWarpOptions}, (Ptr{CPLXMLNode},), arg1))
end

"""
    GDALReprojectImage(GDALDatasetH hSrcDS,
                       const char * pszSrcWKT,
                       GDALDatasetH hDstDS,
                       const char * pszDstWKT,
                       GDALResampleAlg eResampleAlg,
                       double dfWarpMemoryLimit,
                       double dfMaxError,
                       GDALProgressFunc pfnProgress,
                       void * pProgressArg,
                       GDALWarpOptions * psOptions) -> CPLErr

Reproject image.

### Parameters
* **hSrcDS**: the source image file.
* **pszSrcWKT**: the source projection. If NULL the source projection is read from from hSrcDS.
* **hDstDS**: the destination image file.
* **pszDstWKT**: the destination projection. If NULL the destination projection will be read from hDstDS.
* **eResampleAlg**: the type of resampling to use.
* **dfWarpMemoryLimit**: the amount of memory (in bytes) that the warp API is allowed to use for caching. This is in addition to the memory already allocated to the GDAL caching (as per GDALSetCacheMax()). May be 0.0 to use default memory settings.
* **dfMaxError**: maximum error measured in input pixels that is allowed in approximating the transformation (0.0 for exact calculations).
* **pfnProgress**: a GDALProgressFunc() compatible callback function for reporting progress or NULL.
* **pProgressArg**: argument to be passed to pfnProgress. May be NULL.
* **psOptions**: warp options, normally NULL.

### Returns
CE_None on success or CE_Failure if something goes wrong.
"""
function gdalreprojectimage(hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions)
    aftercare(ccall((:GDALReprojectImage, libgdal), CPLErr, (GDALDatasetH, Cstring, GDALDatasetH, Cstring, GDALResampleAlg, Cdouble, Cdouble, GDALProgressFunc, Ptr{Cvoid}, Ptr{GDALWarpOptions}), hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions))
end

"""
    GDALCreateAndReprojectImage(GDALDatasetH hSrcDS,
                                const char * pszSrcWKT,
                                const char * pszDstFilename,
                                const char * pszDstWKT,
                                GDALDriverH hDstDriver,
                                char ** papszCreateOptions,
                                GDALResampleAlg eResampleAlg,
                                double dfWarpMemoryLimit,
                                double dfMaxError,
                                GDALProgressFunc pfnProgress,
                                void * pProgressArg,
                                GDALWarpOptions * psOptions) -> CPLErr

Reproject an image and create the target reprojected image.
"""
function gdalcreateandreprojectimage(hSrcDS, pszSrcWKT, pszDstFilename, pszDstWKT, hDstDriver, papszCreateOptions, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions)
    aftercare(ccall((:GDALCreateAndReprojectImage, libgdal), CPLErr, (GDALDatasetH, Cstring, Cstring, Cstring, GDALDriverH, Ptr{Cstring}, GDALResampleAlg, Cdouble, Cdouble, GDALProgressFunc, Ptr{Cvoid}, Ptr{GDALWarpOptions}), hSrcDS, pszSrcWKT, pszDstFilename, pszDstWKT, hDstDriver, papszCreateOptions, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions))
end

"""
    GDALAutoCreateWarpedVRT(GDALDatasetH hSrcDS,
                            const char * pszSrcWKT,
                            const char * pszDstWKT,
                            GDALResampleAlg eResampleAlg,
                            double dfMaxError,
                            const GDALWarpOptions * psOptionsIn) -> GDALDatasetH

Create virtual warped dataset automatically.

### Parameters
* **hSrcDS**: The source dataset.
* **pszSrcWKT**: The coordinate system of the source image. If NULL, it will be read from the source image.
* **pszDstWKT**: The coordinate system to convert to. If NULL no change of coordinate system will take place.
* **eResampleAlg**: One of GRA_NearestNeighbour, GRA_Bilinear, GRA_Cubic, GRA_CubicSpline, GRA_Lanczos, GRA_Average or GRA_Mode. Controls the sampling method used.
* **dfMaxError**: Maximum error measured in input pixels that is allowed in approximating the transformation (0.0 for exact calculations).
* **psOptionsIn**: Additional warp options, normally NULL.

### Returns
NULL on failure, or a new virtual dataset handle on success.
"""
function gdalautocreatewarpedvrt(hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions)
    aftercare(ccall((:GDALAutoCreateWarpedVRT, libgdal), GDALDatasetH, (GDALDatasetH, Cstring, Cstring, GDALResampleAlg, Cdouble, Ptr{GDALWarpOptions}), hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions))
end

"""
    GDALCreateWarpedVRT(GDALDatasetH hSrcDS,
                        int nPixels,
                        int nLines,
                        double * padfGeoTransform,
                        GDALWarpOptions * psOptions) -> GDALDatasetH

Create virtual warped dataset.

### Parameters
* **hSrcDS**: The source dataset.
* **nPixels**: Width of the virtual warped dataset to create
* **nLines**: Height of the virtual warped dataset to create
* **padfGeoTransform**: Geotransform matrix of the virtual warped dataset to create
* **psOptions**: Warp options. Must be different from NULL.

### Returns
NULL on failure, or a new virtual dataset handle on success.
"""
function gdalcreatewarpedvrt(hSrcDS, nPixels, nLines, padfGeoTransform, psOptions)
    aftercare(ccall((:GDALCreateWarpedVRT, libgdal), GDALDatasetH, (GDALDatasetH, Cint, Cint, Ptr{Cdouble}, Ptr{GDALWarpOptions}), hSrcDS, nPixels, nLines, padfGeoTransform, psOptions))
end

"""
    GDALInitializeWarpedVRT(GDALDatasetH hDS,
                            GDALWarpOptions * psWO) -> CPLErr

Set warp info on virtual warped dataset.

### Parameters
* **hDS**: dataset previously created with the VRT driver, and a SUBCLASS of "VRTWarpedDataset".
* **psWO**: the warp options to apply. Note that ownership of the transformation information is taken over by the function though everything else remains the property of the caller.

### Returns
CE_None on success or CE_Failure if an error occurs.
"""
function gdalinitializewarpedvrt(hDS, psWO)
    aftercare(ccall((:GDALInitializeWarpedVRT, libgdal), CPLErr, (GDALDatasetH, Ptr{GDALWarpOptions}), hDS, psWO))
end

"""
    GDALCreateWarpOperation(const GDALWarpOptions * psNewOptions) -> GDALWarpOperationH
"""
function gdalcreatewarpoperation(arg1)
    aftercare(ccall((:GDALCreateWarpOperation, libgdal), GDALWarpOperationH, (Ptr{GDALWarpOptions},), arg1))
end

"""
    GDALDestroyWarpOperation(GDALWarpOperationH hOperation) -> void
"""
function gdaldestroywarpoperation(arg1)
    aftercare(ccall((:GDALDestroyWarpOperation, libgdal), Cvoid, (GDALWarpOperationH,), arg1))
end

"""
    GDALChunkAndWarpImage(GDALWarpOperationH hOperation,
                          int nDstXOff,
                          int nDstYOff,
                          int nDstXSize,
                          int nDstYSize) -> CPLErr
"""
function gdalchunkandwarpimage(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALChunkAndWarpImage, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALChunkAndWarpMulti(GDALWarpOperationH hOperation,
                          int nDstXOff,
                          int nDstYOff,
                          int nDstXSize,
                          int nDstYSize) -> CPLErr
"""
function gdalchunkandwarpmulti(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALChunkAndWarpMulti, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALWarpRegion(GDALWarpOperationH hOperation,
                   int nDstXOff,
                   int nDstYOff,
                   int nDstXSize,
                   int nDstYSize,
                   int nSrcXOff,
                   int nSrcYOff,
                   int nSrcXSize,
                   int nSrcYSize) -> CPLErr
"""
function gdalwarpregion(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    aftercare(ccall((:GDALWarpRegion, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9))
end

"""
    GDALWarpRegionToBuffer(GDALWarpOperationH hOperation,
                           int nDstXOff,
                           int nDstYOff,
                           int nDstXSize,
                           int nDstYSize,
                           void * pDataBuf,
                           GDALDataType eBufDataType,
                           int nSrcXOff,
                           int nSrcYOff,
                           int nSrcXSize,
                           int nSrcYSize) -> CPLErr
"""
function gdalwarpregiontobuffer(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
    aftercare(ccall((:GDALWarpRegionToBuffer, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint, Ptr{Cvoid}, GDALDataType, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11))
end

"""
    GWKGetFilterRadius(GDALResampleAlg eResampleAlg) -> int
"""
function gwkgetfilterradius(eResampleAlg)
    aftercare(ccall((:GWKGetFilterRadius, libgdal), Cint, (GDALResampleAlg,), eResampleAlg))
end

"""
    GWKGetFilterFunc(GDALResampleAlg eResampleAlg) -> FilterFuncType
"""
function gwkgetfilterfunc(eResampleAlg)
    aftercare(ccall((:GWKGetFilterFunc, libgdal), FilterFuncType, (GDALResampleAlg,), eResampleAlg))
end

"""
    GWKGetFilterFunc4Values(GDALResampleAlg eResampleAlg) -> FilterFunc4ValuesType
"""
function gwkgetfilterfunc4values(eResampleAlg)
    aftercare(ccall((:GWKGetFilterFunc4Values, libgdal), FilterFunc4ValuesType, (GDALResampleAlg,), eResampleAlg))
end
