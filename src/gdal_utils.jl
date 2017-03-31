

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
function infooptionsnew(papszArgv,psOptionsForBinary)
    ccall((:GDALInfoOptionsNew,libgdal),Ptr{GDALInfoOptions},(StringList,Ptr{GDALInfoOptionsForBinary}),papszArgv,psOptionsForBinary)
end


"""
    GDALInfoOptionsFree(GDALInfoOptions * psOptions) -> void

Frees the GDALInfoOptions struct.

### Parameters
* **psOptions**: the options struct for GDALInfo().
"""
function infooptionsfree(psOptions)
    ccall((:GDALInfoOptionsFree,libgdal),Void,(Ptr{GDALInfoOptions},),psOptions)
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
function Base.info{T <: GDALDatasetH}(hDataset::Ptr{T},psOptions)
    unsafe_string(ccall((:GDALInfo,libgdal),Cstring,(Ptr{GDALDatasetH},Ptr{GDALInfoOptions}),hDataset,psOptions))
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
function translateoptionsnew(papszArgv,psOptionsForBinary)
    ccall((:GDALTranslateOptionsNew,libgdal),Ptr{GDALTranslateOptions},(StringList,Ptr{GDALTranslateOptionsForBinary}),papszArgv,psOptionsForBinary)
end


"""
    GDALTranslateOptionsFree(GDALTranslateOptions * psOptions) -> void

Frees the GDALTranslateOptions struct.

### Parameters
* **psOptions**: the options struct for GDALTranslate().
"""
function translateoptionsfree(psOptions)
    ccall((:GDALTranslateOptionsFree,libgdal),Void,(Ptr{GDALTranslateOptions},),psOptions)
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
function translateoptionssetprogress(psOptions,pfnProgress::Any,pProgressData)
    ccall((:GDALTranslateOptionsSetProgress,libgdal),Void,(Ptr{GDALTranslateOptions},Ptr{GDALProgressFunc},Ptr{Void}),psOptions,pfnProgress,pProgressData)
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
function translate{T <: GDALDatasetH}(pszDestFilename,hSrcDataset::Ptr{T},psOptions,pbUsageError)
    checknull(ccall((:GDALTranslate,libgdal),Ptr{GDALDatasetH},(Cstring,Ptr{GDALDatasetH},Ptr{GDALTranslateOptions},Ptr{Cint}),pszDestFilename,hSrcDataset,psOptions,pbUsageError))
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
function warpappoptionsnew(papszArgv,psOptionsForBinary)
    ccall((:GDALWarpAppOptionsNew,libgdal),Ptr{GDALWarpAppOptions},(StringList,Ptr{GDALWarpAppOptionsForBinary}),papszArgv,psOptionsForBinary)
end


"""
    GDALWarpAppOptionsFree(GDALWarpAppOptions * psOptions) -> void

Frees the GDALWarpAppOptions struct.

### Parameters
* **psOptions**: the options struct for GDALWarp().
"""
function warpappoptionsfree(psOptions)
    ccall((:GDALWarpAppOptionsFree,libgdal),Void,(Ptr{GDALWarpAppOptions},),psOptions)
end


"""
    GDALWarpAppOptionsSetProgress(GDALWarpAppOptions * psOptions,
                                  GDALProgressFunc pfnProgress,
                                  void * pProgressData) -> void

Set a progress function.

### Parameters
* **psOptions**: the options struct for GDALWarpApp().
* **pfnProgress**: the progress callback.
* **pProgressData**: the user data for the progress callback.
"""
function warpappoptionssetprogress(psOptions,pfnProgress::Any,pProgressData)
    ccall((:GDALWarpAppOptionsSetProgress,libgdal),Void,(Ptr{GDALWarpAppOptions},Ptr{GDALProgressFunc},Ptr{Void}),psOptions,pfnProgress,pProgressData)
end


"""
    GDALWarpAppOptionsSetWarpOption(GDALWarpAppOptions * psOptions,
                                    const char * pszKey,
                                    const char * pszValue) -> void

Set a warp option.

### Parameters
* **psOptions**: the options struct for GDALWarpApp().
* **pszKey**: key.
* **pszValue**: value.
"""
function warpappoptionssetwarpoption(psOptions,pszKey,pszValue)
    ccall((:GDALWarpAppOptionsSetWarpOption,libgdal),Void,(Ptr{GDALWarpAppOptions},Cstring,Cstring),psOptions,pszKey,pszValue)
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
the output dataset (new dataset that must be closed using GDALClose(), or hDstDS is not NULL) or NULL in case of error.
"""
function warp{T <: GDALDatasetH}(pszDest,hDstDS::Ptr{T},nSrcCount::Integer,pahSrcDS,psOptions,pbUsageError)
    checknull(ccall((:GDALWarp,libgdal),Ptr{GDALDatasetH},(Cstring,Ptr{GDALDatasetH},Cint,Ptr{GDALDatasetH},Ptr{GDALWarpAppOptions},Ptr{Cint}),pszDest,hDstDS,nSrcCount,pahSrcDS,psOptions,pbUsageError))
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
function vectortranslateoptionsnew(papszArgv,psOptionsForBinary)
    ccall((:GDALVectorTranslateOptionsNew,libgdal),Ptr{GDALVectorTranslateOptions},(StringList,Ptr{GDALVectorTranslateOptionsForBinary}),papszArgv,psOptionsForBinary)
end


"""
    GDALVectorTranslateOptionsFree(GDALVectorTranslateOptions * psOptions) -> void

Frees the GDALVectorTranslateOptions struct.

### Parameters
* **psOptions**: the options struct for GDALVectorTranslate().
"""
function vectortranslateoptionsfree(psOptions)
    ccall((:GDALVectorTranslateOptionsFree,libgdal),Void,(Ptr{GDALVectorTranslateOptions},),psOptions)
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
function vectortranslateoptionssetprogress(psOptions,pfnProgress::Any,pProgressData)
    ccall((:GDALVectorTranslateOptionsSetProgress,libgdal),Void,(Ptr{GDALVectorTranslateOptions},Ptr{GDALProgressFunc},Ptr{Void}),psOptions,pfnProgress,pProgressData)
end


"""
    GDALVectorTranslate(const char * pszDest,
                        GDALDatasetH hDstDS,
                        int nSrcCount,
                        GDALDatasetH * pahSrcDS,
                        const GDALVectorTranslateOptions * psOptions,
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
function vectortranslate{T <: GDALDatasetH}(pszDest,hDstDS::Ptr{T},nSrcCount::Integer,pahSrcDS,psOptions,pbUsageError)
    checknull(ccall((:GDALVectorTranslate,libgdal),Ptr{GDALDatasetH},(Cstring,Ptr{GDALDatasetH},Cint,Ptr{GDALDatasetH},Ptr{GDALVectorTranslateOptions},Ptr{Cint}),pszDest,hDstDS,nSrcCount,pahSrcDS,psOptions,pbUsageError))
end


"""
    GDALDEMProcessingOptionsNew(char ** papszArgv,
                                GDALDEMProcessingOptionsForBinary * psOptionsForBinary) -> GDALDEMProcessingOptions *

Allocates a GDALDEMProcessingOptions struct.

### Parameters
* **papszArgv**: NULL terminated list of options (potentially including filename and open options too), or NULL. The accepted options are the ones of the gdal_translate utility.
* **psOptionsForBinary**: (output) may be NULL (and should generally be NULL), otherwise (gdal_translate_bin.cpp use case) must be allocated with GDALDEMProcessingOptionsForBinaryNew() prior to this function. Will be filled with potentially present filename, open options,...

### Returns
pointer to the allocated GDALDEMProcessingOptions struct. Must be freed with GDALDEMProcessingOptionsFree().
"""
function demprocessingoptionsnew(papszArgv,psOptionsForBinary)
    ccall((:GDALDEMProcessingOptionsNew,libgdal),Ptr{GDALDEMProcessingOptions},(StringList,Ptr{GDALDEMProcessingOptionsForBinary}),papszArgv,psOptionsForBinary)
end


"""
    GDALDEMProcessingOptionsFree(GDALDEMProcessingOptions * psOptions) -> void

Frees the GDALDEMProcessingOptions struct.

### Parameters
* **psOptions**: the options struct for GDALDEMProcessing().
"""
function demprocessingoptionsfree(psOptions)
    ccall((:GDALDEMProcessingOptionsFree,libgdal),Void,(Ptr{GDALDEMProcessingOptions},),psOptions)
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
function demprocessingoptionssetprogress(psOptions,pfnProgress::Any,pProgressData)
    ccall((:GDALDEMProcessingOptionsSetProgress,libgdal),Void,(Ptr{GDALDEMProcessingOptions},Ptr{GDALProgressFunc},Ptr{Void}),psOptions,pfnProgress,pProgressData)
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
function demprocessing{T <: GDALDatasetH}(pszDestFilename,hSrcDataset::Ptr{T},pszProcessing,pszColorFilename,psOptions,pbUsageError)
    checknull(ccall((:GDALDEMProcessing,libgdal),Ptr{GDALDatasetH},(Cstring,Ptr{GDALDatasetH},Cstring,Cstring,Ptr{GDALDEMProcessingOptions},Ptr{Cint}),pszDestFilename,hSrcDataset,pszProcessing,pszColorFilename,psOptions,pbUsageError))
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
function nearblackoptionsnew(papszArgv,psOptionsForBinary)
    ccall((:GDALNearblackOptionsNew,libgdal),Ptr{GDALNearblackOptions},(StringList,Ptr{GDALNearblackOptionsForBinary}),papszArgv,psOptionsForBinary)
end


"""
    GDALNearblackOptionsFree(GDALNearblackOptions * psOptions) -> void

Frees the GDALNearblackOptions struct.

### Parameters
* **psOptions**: the options struct for GDALNearblack().
"""
function nearblackoptionsfree(psOptions)
    ccall((:GDALNearblackOptionsFree,libgdal),Void,(Ptr{GDALNearblackOptions},),psOptions)
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
function nearblackoptionssetprogress(psOptions,pfnProgress::Any,pProgressData)
    ccall((:GDALNearblackOptionsSetProgress,libgdal),Void,(Ptr{GDALNearblackOptions},Ptr{GDALProgressFunc},Ptr{Void}),psOptions,pfnProgress,pProgressData)
end


"""
    GDALNearblack(const char * pszDest,
                  GDALDatasetH hDstDS,
                  GDALDatasetH hSrcDS,
                  const GDALNearblackOptions * psOptions,
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
function nearblack{T <: GDALDatasetH}(pszDest,hDstDS::Ptr{T},hSrcDS::Ptr{T},psOptions,pbUsageError)
    checknull(ccall((:GDALNearblack,libgdal),Ptr{GDALDatasetH},(Cstring,Ptr{GDALDatasetH},Ptr{GDALDatasetH},Ptr{GDALNearblackOptions},Ptr{Cint}),pszDest,hDstDS,hSrcDS,psOptions,pbUsageError))
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
function gridoptionsnew(papszArgv,psOptionsForBinary)
    ccall((:GDALGridOptionsNew,libgdal),Ptr{GDALGridOptions},(StringList,Ptr{GDALGridOptionsForBinary}),papszArgv,psOptionsForBinary)
end


"""
    GDALGridOptionsFree(GDALGridOptions * psOptions) -> void

Frees the GDALGridOptions struct.

### Parameters
* **psOptions**: the options struct for GDALGrid().
"""
function gridoptionsfree(psOptions)
    ccall((:GDALGridOptionsFree,libgdal),Void,(Ptr{GDALGridOptions},),psOptions)
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
function gridoptionssetprogress(psOptions,pfnProgress::Any,pProgressData)
    ccall((:GDALGridOptionsSetProgress,libgdal),Void,(Ptr{GDALGridOptions},Ptr{GDALProgressFunc},Ptr{Void}),psOptions,pfnProgress,pProgressData)
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
function grid{T <: GDALDatasetH}(pszDest,hSrcDS::Ptr{T},psOptions,pbUsageError)
    checknull(ccall((:GDALGrid,libgdal),Ptr{GDALDatasetH},(Cstring,Ptr{GDALDatasetH},Ptr{GDALGridOptions},Ptr{Cint}),pszDest,hSrcDS,psOptions,pbUsageError))
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
function rasterizeoptionsnew(papszArgv,psOptionsForBinary)
    ccall((:GDALRasterizeOptionsNew,libgdal),Ptr{GDALRasterizeOptions},(StringList,Ptr{GDALRasterizeOptionsForBinary}),papszArgv,psOptionsForBinary)
end


"""
    GDALRasterizeOptionsFree(GDALRasterizeOptions * psOptions) -> void

Frees the GDALRasterizeOptions struct.

### Parameters
* **psOptions**: the options struct for GDALRasterize().
"""
function rasterizeoptionsfree(psOptions)
    ccall((:GDALRasterizeOptionsFree,libgdal),Void,(Ptr{GDALRasterizeOptions},),psOptions)
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
function rasterizeoptionssetprogress(psOptions,pfnProgress::Any,pProgressData)
    ccall((:GDALRasterizeOptionsSetProgress,libgdal),Void,(Ptr{GDALRasterizeOptions},Ptr{GDALProgressFunc},Ptr{Void}),psOptions,pfnProgress,pProgressData)
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
function rasterize{T <: GDALDatasetH}(pszDest,hDstDS::Ptr{T},hSrcDS::Ptr{T},psOptions,pbUsageError)
    checknull(ccall((:GDALRasterize,libgdal),Ptr{GDALDatasetH},(Cstring,Ptr{GDALDatasetH},Ptr{GDALDatasetH},Ptr{GDALRasterizeOptions},Ptr{Cint}),pszDest,hDstDS,hSrcDS,psOptions,pbUsageError))
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
function buildvrtoptionsnew(papszArgv,psOptionsForBinary)
    ccall((:GDALBuildVRTOptionsNew,libgdal),Ptr{GDALBuildVRTOptions},(StringList,Ptr{GDALBuildVRTOptionsForBinary}),papszArgv,psOptionsForBinary)
end


"""
    GDALBuildVRTOptionsFree(GDALBuildVRTOptions * psOptions) -> void

Frees the GDALBuildVRTOptions struct.

### Parameters
* **psOptions**: the options struct for GDALBuildVRT().
"""
function buildvrtoptionsfree(psOptions)
    ccall((:GDALBuildVRTOptionsFree,libgdal),Void,(Ptr{GDALBuildVRTOptions},),psOptions)
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
function buildvrtoptionssetprogress(psOptions,pfnProgress::Any,pProgressData)
    ccall((:GDALBuildVRTOptionsSetProgress,libgdal),Void,(Ptr{GDALBuildVRTOptions},Ptr{GDALProgressFunc},Ptr{Void}),psOptions,pfnProgress,pProgressData)
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
function buildvrt(pszDest,nSrcCount::Integer,pahSrcDS,papszSrcDSNames,psOptions,pbUsageError)
    checknull(ccall((:GDALBuildVRT,libgdal),Ptr{GDALDatasetH},(Cstring,Cint,Ptr{GDALDatasetH},StringList,Ptr{GDALBuildVRTOptions},Ptr{Cint}),pszDest,nSrcCount,pahSrcDS,papszSrcDSNames,psOptions,pbUsageError))
end
