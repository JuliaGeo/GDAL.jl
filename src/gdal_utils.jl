# Julia wrapper for header: gdal_utils.h
# Automatically generated using Clang.jl


"""
    GDALInfoOptionsNew(char ** papszArgv,
                       GDALInfoOptionsForBinary * psOptionsForBinary) -> GDALInfoOptions *

Allocates a GDALInfoOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdalinfo utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdalinfo_bin.cpp use case) must be allocated with GDALInfoOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options, subdataset number...

### Returns
pointer to the allocated GDALInfoOptions struct. Must be freed with GDALInfoOptionsFree().
"""
function gdalinfooptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALInfoOptionsNew, libgdal), Ptr{GDALInfoOptions}, (Ptr{Cstring}, Ptr{GDALInfoOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALInfoOptionsFree(GDALInfoOptions * psOptions) -> void

Frees the GDALInfoOptions struct.

### Parameters
* **psOptions**: the options struct for GDALInfo().
"""
function gdalinfooptionsfree(psOptions)
    aftercare(ccall((:GDALInfoOptionsFree, libgdal), Cvoid, (Ptr{GDALInfoOptions},), psOptions))
end

"""
    GDALInfo(GDALDatasetH hDataset,
             const GDALInfoOptions * psOptions) -> char *

Lists various information about a GDAL supported raster dataset.

### Parameters
* **hDataset**: the dataset handle.
* **psOptions**: the options structure returned by GDALInfoOptionsNew() or NULL.

### Returns
string corresponding to the information about the raster dataset (must be freed with CPLFree()), or NULL in case of error.
"""
function gdalinfo(hDataset, psOptions)
    aftercare(ccall((:GDALInfo, libgdal), Cstring, (GDALDatasetH, Ptr{GDALInfoOptions}), hDataset, psOptions), true)
end

"""
    GDALTranslateOptionsNew(char ** papszArgv,
                            GDALTranslateOptionsForBinary * psOptionsForBinary) -> GDALTranslateOptions *

Allocates a GDALTranslateOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdal_translate utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALTranslateOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALTranslateOptions struct. Must be freed with GDALTranslateOptionsFree().
"""
function gdaltranslateoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALTranslateOptionsNew, libgdal), Ptr{GDALTranslateOptions}, (Ptr{Cstring}, Ptr{GDALTranslateOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALTranslateOptionsFree(GDALTranslateOptions * psOptions) -> void

Frees the GDALTranslateOptions struct.

### Parameters
* **psOptions**: the options struct for GDALTranslate().
"""
function gdaltranslateoptionsfree(psOptions)
    aftercare(ccall((:GDALTranslateOptionsFree, libgdal), Cvoid, (Ptr{GDALTranslateOptions},), psOptions))
end

"""
    GDALTranslateOptionsSetProgress(GDALTranslateOptions * psOptions,
                                    GDALProgressFunc pfnProgress,
                                    void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALTranslate().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdaltranslateoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALTranslateOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALTranslateOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALTranslate(const char * pszDest,
                  GDALDatasetH hSrcDataset,
                  const GDALTranslateOptions * psOptionsIn,
                  int * pbUsageError) -> GDALDatasetH

Converts raster data between different formats.

### Parameters
* **pszDest**: the destination dataset path.
* **hSrcDataset**: the source dataset handle.
* **psOptionsIn**: the options struct returned by GDALTranslateOptionsNew() or NULL.
* **pbUsageError**: the pointer to int variable to determine any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose()) or NULL in case of error.
"""
function gdaltranslate(pszDestFilename, hSrcDataset, psOptions, pbUsageError)
    aftercare(ccall((:GDALTranslate, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Ptr{GDALTranslateOptions}, Ptr{Cint}), pszDestFilename, hSrcDataset, psOptions, pbUsageError))
end

"""
    GDALWarpAppOptionsNew(char ** papszArgv,
                          GDALWarpAppOptionsForBinary * psOptionsForBinary) -> GDALWarpAppOptions *

Allocates a GDALWarpAppOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdalwarp utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALWarpAppOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALWarpAppOptions struct. Must be freed with GDALWarpAppOptionsFree().
"""
function gdalwarpappoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALWarpAppOptionsNew, libgdal), Ptr{GDALWarpAppOptions}, (Ptr{Cstring}, Ptr{GDALWarpAppOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALWarpAppOptionsFree(GDALWarpAppOptions * psOptions) -> void

Frees the GDALWarpAppOptions struct.

### Parameters
* **psOptions**: the options struct for GDALWarp().
"""
function gdalwarpappoptionsfree(psOptions)
    aftercare(ccall((:GDALWarpAppOptionsFree, libgdal), Cvoid, (Ptr{GDALWarpAppOptions},), psOptions))
end

"""
    GDALWarpAppOptionsSetProgress(GDALWarpAppOptions * psOptions,
                                  GDALProgressFunc pfnProgress,
                                  void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALWarp().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalwarpappoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALWarpAppOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALWarpAppOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALWarpAppOptionsSetQuiet(GDALWarpAppOptions * psOptions,
                               int bQuiet) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALWarp().
* **bQuiet**: whether GDALWarp() should emit messages on stdout.
"""
function gdalwarpappoptionssetquiet(psOptions, bQuiet)
    aftercare(ccall((:GDALWarpAppOptionsSetQuiet, libgdal), Cvoid, (Ptr{GDALWarpAppOptions}, Cint), psOptions, bQuiet))
end

"""
    GDALWarpAppOptionsSetWarpOption(GDALWarpAppOptions * psOptions,
                                    const char * pszKey,
                                    const char * pszValue) -> void

Set a warp option.

### Parameters
* **psOptions**: the options struct for GDALWarp().
* **pszKey**: key.
* **pszValue**: value.
"""
function gdalwarpappoptionssetwarpoption(psOptions, pszKey, pszValue)
    aftercare(ccall((:GDALWarpAppOptionsSetWarpOption, libgdal), Cvoid, (Ptr{GDALWarpAppOptions}, Cstring, Cstring), psOptions, pszKey, pszValue))
end

"""
    GDALWarp(const char * pszDest,
             GDALDatasetH hDstDS,
             int nSrcCount,
             GDALDatasetH * pahSrcDS,
             const GDALWarpAppOptions * psOptionsIn,
             int * pbUsageError) -> GDALDatasetH

Image reprojection and warping function.

### Parameters
* **pszDest**: the destination dataset path or NULL.
* **hDstDS**: the destination dataset or NULL.
* **nSrcCount**: the number of input datasets.
* **pahSrcDS**: the list of input datasets.
* **psOptionsIn**: the options struct returned by GDALWarpAppOptionsNew() or NULL.
* **pbUsageError**: the pointer to int variable to determine any usage error has occurred.

### Returns
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS if not NULL) or NULL in case of error.
"""
function gdalwarp(pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALWarp, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cint, Ptr{GDALDatasetH}, Ptr{GDALWarpAppOptions}, Ptr{Cint}), pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError))
end

"""
    GDALVectorTranslateOptionsNew(char ** papszArgv,
                                  GDALVectorTranslateOptionsForBinary * psOptionsForBinary) -> GDALVectorTranslateOptions *

allocates a GDALVectorTranslateOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the ogr2ogr utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALVectorTranslateOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALVectorTranslateOptions struct. Must be freed with GDALVectorTranslateOptionsFree().
"""
function gdalvectortranslateoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALVectorTranslateOptionsNew, libgdal), Ptr{GDALVectorTranslateOptions}, (Ptr{Cstring}, Ptr{GDALVectorTranslateOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALVectorTranslateOptionsFree(GDALVectorTranslateOptions * psOptions) -> void

Frees the GDALVectorTranslateOptions struct.

### Parameters
* **psOptions**: the options struct for GDALVectorTranslate().
"""
function gdalvectortranslateoptionsfree(psOptions)
    aftercare(ccall((:GDALVectorTranslateOptionsFree, libgdal), Cvoid, (Ptr{GDALVectorTranslateOptions},), psOptions))
end

"""
    GDALVectorTranslateOptionsSetProgress(GDALVectorTranslateOptions * psOptions,
                                          GDALProgressFunc pfnProgress,
                                          void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALVectorTranslate().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalvectortranslateoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALVectorTranslateOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALVectorTranslateOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALVectorTranslate(const char * pszDest,
                        GDALDatasetH hDstDS,
                        int nSrcCount,
                        GDALDatasetH * pahSrcDS,
                        const GDALVectorTranslateOptions * psOptionsIn,
                        int * pbUsageError) -> GDALDatasetH

Converts vector data between file formats.

### Parameters
* **pszDest**: the destination dataset path or NULL.
* **hDstDS**: the destination dataset or NULL.
* **nSrcCount**: the number of input datasets (only 1 supported currently)
* **pahSrcDS**: the list of input datasets.
* **psOptionsIn**: the options struct returned by GDALVectorTranslateOptionsNew() or NULL.
* **pbUsageError**: the pointer to int variable to determine any usage error has occurred

### Returns
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS is not NULL) or NULL in case of error.
"""
function gdalvectortranslate(pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALVectorTranslate, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cint, Ptr{GDALDatasetH}, Ptr{GDALVectorTranslateOptions}, Ptr{Cint}), pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError))
end

"""
    GDALDEMProcessingOptionsNew(char ** papszArgv,
                                GDALDEMProcessingOptionsForBinary * psOptionsForBinary) -> GDALDEMProcessingOptions *

Allocates a GDALDEMProcessingOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdaldem utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALDEMProcessingOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALDEMProcessingOptions struct. Must be freed with GDALDEMProcessingOptionsFree().
"""
function gdaldemprocessingoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALDEMProcessingOptionsNew, libgdal), Ptr{GDALDEMProcessingOptions}, (Ptr{Cstring}, Ptr{GDALDEMProcessingOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALDEMProcessingOptionsFree(GDALDEMProcessingOptions * psOptions) -> void

Frees the GDALDEMProcessingOptions struct.

### Parameters
* **psOptions**: the options struct for GDALDEMProcessing().
"""
function gdaldemprocessingoptionsfree(psOptions)
    aftercare(ccall((:GDALDEMProcessingOptionsFree, libgdal), Cvoid, (Ptr{GDALDEMProcessingOptions},), psOptions))
end

"""
    GDALDEMProcessingOptionsSetProgress(GDALDEMProcessingOptions * psOptions,
                                        GDALProgressFunc pfnProgress,
                                        void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALDEMProcessing().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdaldemprocessingoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALDEMProcessingOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALDEMProcessingOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALDEMProcessing(const char * pszDest,
                      GDALDatasetH hSrcDataset,
                      const char * pszProcessing,
                      const char * pszColorFilename,
                      const GDALDEMProcessingOptions * psOptionsIn,
                      int * pbUsageError) -> GDALDatasetH

Apply a DEM processing.

### Parameters
* **pszDest**: the destination dataset path.
* **hSrcDataset**: the source dataset handle.
* **pszProcessing**: the processing to apply (one of "hillshade", "slope", "aspect", "color-relief", "TRI", "TPI", "Roughness")
* **pszColorFilename**: color file (mandatory for "color-relief" processing, should be NULL otherwise)
* **psOptionsIn**: the options struct returned by GDALDEMProcessingOptionsNew() or NULL.
* **pbUsageError**: the pointer to int variable to determine any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose()) or NULL in case of error.
"""
function gdaldemprocessing(pszDestFilename, hSrcDataset, pszProcessing, pszColorFilename, psOptions, pbUsageError)
    aftercare(ccall((:GDALDEMProcessing, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cstring, Cstring, Ptr{GDALDEMProcessingOptions}, Ptr{Cint}), pszDestFilename, hSrcDataset, pszProcessing, pszColorFilename, psOptions, pbUsageError))
end

"""
    GDALNearblackOptionsNew(char ** papszArgv,
                            GDALNearblackOptionsForBinary * psOptionsForBinary) -> GDALNearblackOptions *

Allocates a GDALNearblackOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the nearblack utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALNearblackOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALNearblackOptions struct. Must be freed with GDALNearblackOptionsFree().
"""
function gdalnearblackoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALNearblackOptionsNew, libgdal), Ptr{GDALNearblackOptions}, (Ptr{Cstring}, Ptr{GDALNearblackOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALNearblackOptionsFree(GDALNearblackOptions * psOptions) -> void

Frees the GDALNearblackOptions struct.

### Parameters
* **psOptions**: the options struct for GDALNearblack().
"""
function gdalnearblackoptionsfree(psOptions)
    aftercare(ccall((:GDALNearblackOptionsFree, libgdal), Cvoid, (Ptr{GDALNearblackOptions},), psOptions))
end

"""
    GDALNearblackOptionsSetProgress(GDALNearblackOptions * psOptions,
                                    GDALProgressFunc pfnProgress,
                                    void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALNearblack().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalnearblackoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALNearblackOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALNearblackOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALNearblack(const char * pszDest,
                  GDALDatasetH hDstDS,
                  GDALDatasetH hSrcDataset,
                  const GDALNearblackOptions * psOptionsIn,
                  int * pbUsageError) -> GDALDatasetH

Convert nearly black/white borders to exact value.

### Parameters
* **pszDest**: the destination dataset path or NULL.
* **hDstDS**: the destination dataset or NULL. Might be equal to hSrcDataset.
* **hSrcDataset**: the source dataset handle.
* **psOptionsIn**: the options struct returned by GDALNearblackOptionsNew() or NULL.
* **pbUsageError**: the pointer to int variable to determine any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS is not NULL) or NULL in case of error.
"""
function gdalnearblack(pszDest, hDstDS, hSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALNearblack, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, GDALDatasetH, Ptr{GDALNearblackOptions}, Ptr{Cint}), pszDest, hDstDS, hSrcDS, psOptions, pbUsageError))
end

"""
    GDALGridOptionsNew(char ** papszArgv,
                       GDALGridOptionsForBinary * psOptionsForBinary) -> GDALGridOptions *

Allocates a GDALGridOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdal_translate utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALGridOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALGridOptions struct. Must be freed with GDALGridOptionsFree().
"""
function gdalgridoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALGridOptionsNew, libgdal), Ptr{GDALGridOptions}, (Ptr{Cstring}, Ptr{GDALGridOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALGridOptionsFree(GDALGridOptions * psOptions) -> void

Frees the GDALGridOptions struct.

### Parameters
* **psOptions**: the options struct for GDALGrid().
"""
function gdalgridoptionsfree(psOptions)
    aftercare(ccall((:GDALGridOptionsFree, libgdal), Cvoid, (Ptr{GDALGridOptions},), psOptions))
end

"""
    GDALGridOptionsSetProgress(GDALGridOptions * psOptions,
                               GDALProgressFunc pfnProgress,
                               void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALGrid().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalgridoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGridOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALGridOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALGrid(const char * pszDest,
             GDALDatasetH hSrcDataset,
             const GDALGridOptions * psOptionsIn,
             int * pbUsageError) -> GDALDatasetH

Create raster from the scattered data.

### Parameters
* **pszDest**: the destination dataset path.
* **hSrcDataset**: the source dataset handle.
* **psOptionsIn**: the options struct returned by GDALGridOptionsNew() or NULL.
* **pbUsageError**: the pointer to int variable to determine any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose()) or NULL in case of error.
"""
function gdalgrid(pszDest, hSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALGrid, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Ptr{GDALGridOptions}, Ptr{Cint}), pszDest, hSrcDS, psOptions, pbUsageError))
end

"""
    GDALRasterizeOptionsNew(char ** papszArgv,
                            GDALRasterizeOptionsForBinary * psOptionsForBinary) -> GDALRasterizeOptions *

Allocates a GDALRasterizeOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdal_rasterize utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALRasterizeOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALRasterizeOptions struct. Must be freed with GDALRasterizeOptionsFree().
"""
function gdalrasterizeoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALRasterizeOptionsNew, libgdal), Ptr{GDALRasterizeOptions}, (Ptr{Cstring}, Ptr{GDALRasterizeOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALRasterizeOptionsFree(GDALRasterizeOptions * psOptions) -> void

Frees the GDALRasterizeOptions struct.

### Parameters
* **psOptions**: the options struct for GDALRasterize().
"""
function gdalrasterizeoptionsfree(psOptions)
    aftercare(ccall((:GDALRasterizeOptionsFree, libgdal), Cvoid, (Ptr{GDALRasterizeOptions},), psOptions))
end

"""
    GDALRasterizeOptionsSetProgress(GDALRasterizeOptions * psOptions,
                                    GDALProgressFunc pfnProgress,
                                    void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALRasterize().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalrasterizeoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALRasterizeOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALRasterizeOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALRasterize(const char * pszDest,
                  GDALDatasetH hDstDS,
                  GDALDatasetH hSrcDataset,
                  const GDALRasterizeOptions * psOptionsIn,
                  int * pbUsageError) -> GDALDatasetH

Burns vector geometries into a raster.

### Parameters
* **pszDest**: the destination dataset path or NULL.
* **hDstDS**: the destination dataset or NULL.
* **hSrcDataset**: the source dataset handle.
* **psOptionsIn**: the options struct returned by GDALRasterizeOptionsNew() or NULL.
* **pbUsageError**: the pointer to int variable to determine any usage error has occurred or NULL.

### Returns
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS is not NULL) or NULL in case of error.
"""
function gdalrasterize(pszDest, hDstDS, hSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALRasterize, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, GDALDatasetH, Ptr{GDALRasterizeOptions}, Ptr{Cint}), pszDest, hDstDS, hSrcDS, psOptions, pbUsageError))
end

"""
    GDALBuildVRTOptionsNew(char ** papszArgv,
                           GDALBuildVRTOptionsForBinary * psOptionsForBinary) -> GDALBuildVRTOptions *

Allocates a GDALBuildVRTOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdalbuildvrt utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALBuildVRTOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALBuildVRTOptions struct. Must be freed with GDALBuildVRTOptionsFree().
"""
function gdalbuildvrtoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALBuildVRTOptionsNew, libgdal), Ptr{GDALBuildVRTOptions}, (Ptr{Cstring}, Ptr{GDALBuildVRTOptionsForBinary}), papszArgv, psOptionsForBinary))
end

"""
    GDALBuildVRTOptionsFree(GDALBuildVRTOptions * psOptions) -> void

Frees the GDALBuildVRTOptions struct.

### Parameters
* **psOptions**: the options struct for GDALBuildVRT().
"""
function gdalbuildvrtoptionsfree(psOptions)
    aftercare(ccall((:GDALBuildVRTOptionsFree, libgdal), Cvoid, (Ptr{GDALBuildVRTOptions},), psOptions))
end

"""
    GDALBuildVRTOptionsSetProgress(GDALBuildVRTOptions * psOptions,
                                   GDALProgressFunc pfnProgress,
                                   void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALBuildVRT().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function gdalbuildvrtoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALBuildVRTOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALBuildVRTOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

"""
    GDALBuildVRT(const char * pszDest,
                 int nSrcCount,
                 GDALDatasetH * pahSrcDS,
                 const char *const * papszSrcDSNames,
                 const GDALBuildVRTOptions * psOptionsIn,
                 int * pbUsageError) -> GDALDatasetH

Build a VRT from a list of datasets.

### Parameters
* **pszDest**: the destination dataset path.
* **nSrcCount**: the number of input datasets.
* **pahSrcDS**: the list of input datasets (or NULL, exclusive with papszSrcDSNames)
* **papszSrcDSNames**: the list of input dataset names (or NULL, exclusive with pahSrcDS)
* **psOptionsIn**: the options struct returned by GDALBuildVRTOptionsNew() or NULL.
* **pbUsageError**: the pointer to int variable to determine any usage error has occurred.

### Returns
the output dataset (new dataset that must be closed using GDALClose()) or NULL in case of error.
"""
function gdalbuildvrt(pszDest, nSrcCount, pahSrcDS, papszSrcDSNames, psOptions, pbUsageError)
    aftercare(ccall((:GDALBuildVRT, libgdal), GDALDatasetH, (Cstring, Cint, Ptr{GDALDatasetH}, Ptr{Cstring}, Ptr{GDALBuildVRTOptions}, Ptr{Cint}), pszDest, nSrcCount, pahSrcDS, papszSrcDSNames, psOptions, pbUsageError))
end
