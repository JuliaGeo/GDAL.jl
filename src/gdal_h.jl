

"""
    GDALGetDataTypeSize(GDALDataType) -> int

Get data type size in bits.

### Parameters
* **eDataType**: type, such as GDT_Byte.

### Returns
the number of bits or zero if it is not recognised.
"""
function getdatatypesize(arg1::GDALDataType)
    ccall((:GDALGetDataTypeSize, libgdal), Cint, (GDALDataType,), arg1)
end


"""
    GDALGetDataTypeSizeBits(GDALDataType eDataType) -> int

Get data type size in bits.

### Parameters
* **eDataType**: type, such as GDT_Byte.

### Returns
the number of bits or zero if it is not recognised.
"""
function getdatatypesizebits(eDataType::GDALDataType)
    ccall((:GDALGetDataTypeSizeBits, libgdal), Cint, (GDALDataType,), eDataType)
end


"""
    GDALGetDataTypeSizeBytes(GDALDataType) -> int

Get data type size in bytes.

### Parameters
* **eDataType**: type, such as GDT_Byte.

### Returns
the number of bytes or zero if it is not recognised.
"""
function getdatatypesizebytes(arg1::GDALDataType)
    ccall((:GDALGetDataTypeSizeBytes, libgdal), Cint, (GDALDataType,), arg1)
end


"""
    GDALDataTypeIsComplex(GDALDataType) -> int

Is data type complex?

### Returns
TRUE if the passed type is complex (one of GDT_CInt16, GDT_CInt32, GDT_CFloat32 or GDT_CFloat64), that is it consists of a real and imaginary component.
"""
function datatypeiscomplex(arg1::GDALDataType)
    ccall((:GDALDataTypeIsComplex, libgdal), Cint, (GDALDataType,), arg1)
end


"""
    GDALGetDataTypeName(GDALDataType) -> const char *

Get name of data type.

### Parameters
* **eDataType**: type to get name of.

### Returns
string corresponding to existing data type or NULL pointer if invalid type given.
"""
function getdatatypename(arg1::GDALDataType)
    unsafe_string(ccall((:GDALGetDataTypeName, libgdal), Cstring, (GDALDataType,), arg1))
end


"""
    GDALGetDataTypeByName(const char *) -> GDALDataType

Get data type by symbolic name.

### Parameters
* **pszName**: string containing the symbolic name of the type.

### Returns
GDAL data type.
"""
function getdatatypebyname(arg1)
    ccall((:GDALGetDataTypeByName, libgdal), GDALDataType, (Cstring,), arg1)
end


"""
    GDALDataTypeUnion(GDALDataType,
                      GDALDataType) -> GDALDataType

Return the smallest data type that can fully express both input data types.

### Parameters
* **eType1**: first data type.
* **eType2**: second data type.

### Returns
a data type able to express eType1 and eType2.
"""
function datatypeunion(arg1::GDALDataType, arg2::GDALDataType)
    ccall((:GDALDataTypeUnion, libgdal), GDALDataType, (GDALDataType, GDALDataType), arg1, arg2)
end


"""
    GDALAdjustValueToDataType(GDALDataType eDT,
                              double dfValue,
                              int * pbClamped,
                              int * pbRounded) -> double

Adjust a value to the output data type.

### Parameters
* **eDT**: target data type.
* **dfValue**: value to adjust.
* **pbClamped**: pointer to a integer(boolean) to indicate if clamping has been made, or NULL
* **pbRounded**: pointer to a integer(boolean) to indicate if rounding has been made, or NULL

### Returns
adjusted value
"""
function adjustvaluetodatatype(eDT::GDALDataType, dfValue::Real, pbClamped, pbRounded)
    ccall((:GDALAdjustValueToDataType, libgdal), Cdouble, (GDALDataType, Cdouble, Ptr{Cint}, Ptr{Cint}), eDT, dfValue, pbClamped, pbRounded)
end


"""
    GDALGetNonComplexDataType(GDALDataType) -> GDALDataType

Return the base data type for the specified input.

### Parameters
* **eDataType**: type, such as GDT_CFloat32.

### Returns
GDAL data type.
"""
function getnoncomplexdatatype(arg1::GDALDataType)
    ccall((:GDALGetNonComplexDataType, libgdal), GDALDataType, (GDALDataType,), arg1)
end


"""
    GDALGetAsyncStatusTypeName(GDALAsyncStatusType) -> const char *

Get name of AsyncStatus data type.

### Parameters
* **eAsyncStatusType**: type to get name of.

### Returns
string corresponding to type.
"""
function getasyncstatustypename(arg1::GDALAsyncStatusType)
    unsafe_string(ccall((:GDALGetAsyncStatusTypeName, libgdal), Cstring, (GDALAsyncStatusType,), arg1))
end


"""
    GDALGetAsyncStatusTypeByName(const char *) -> GDALAsyncStatusType

Get AsyncStatusType by symbolic name.

### Parameters
* **pszName**: string containing the symbolic name of the type.

### Returns
GDAL AsyncStatus type.
"""
function getasyncstatustypebyname(arg1)
    ccall((:GDALGetAsyncStatusTypeByName, libgdal), GDALAsyncStatusType, (Cstring,), arg1)
end


"""
    GDALGetColorInterpretationName(GDALColorInterp) -> const char *

Get name of color interpretation.

### Parameters
* **eInterp**: color interpretation to get name of.

### Returns
string corresponding to color interpretation or NULL pointer if invalid enumerator given.
"""
function getcolorinterpretationname(arg1::GDALColorInterp)
    unsafe_string(ccall((:GDALGetColorInterpretationName, libgdal), Cstring, (GDALColorInterp,), arg1))
end


"""
    GDALGetColorInterpretationByName(const char * pszName) -> GDALColorInterp

Get color interpretation by symbolic name.

### Parameters
* **pszName**: string containing the symbolic name of the color interpretation.

### Returns
GDAL color interpretation.
"""
function getcolorinterpretationbyname(pszName)
    ccall((:GDALGetColorInterpretationByName, libgdal), GDALColorInterp, (Cstring,), pszName)
end


"""
    GDALGetPaletteInterpretationName(GDALPaletteInterp) -> const char *

Get name of palette interpretation.

### Parameters
* **eInterp**: palette interpretation to get name of.

### Returns
string corresponding to palette interpretation.
"""
function getpaletteinterpretationname(arg1::GDALPaletteInterp)
    unsafe_string(ccall((:GDALGetPaletteInterpretationName, libgdal), Cstring, (GDALPaletteInterp,), arg1))
end


"""
    GDALAllRegister() -> void

Register all known configured GDAL drivers.
"""
function allregister()
    ccall((:GDALAllRegister, libgdal), Cvoid, ())
end


"""
    GDALCreate(GDALDriverH hDriver,
               const char * pszFilename,
               int nXSize,
               int nYSize,
               int nBands,
               GDALDataType eBandType,
               char ** papszOptions) -> GDALDatasetH

Create a new dataset with this driver.
"""
function create(hDriver::Ref{<:GDALDriverH}, arg1, arg2::Integer, arg3::Integer, arg4::Integer, arg5::GDALDataType, arg6)
    failsafe(ccall((:GDALCreate, libgdal), Ptr{GDALDatasetH}, (Ptr{Cvoid}, Cstring, Cint, Cint, Cint, GDALDataType, Ptr{Cstring}), hDriver, arg1, arg2, arg3, arg4, arg5, arg6))
end


"""
    GDALCreateCopy(GDALDriverH hDriver,
                   const char * pszFilename,
                   GDALDatasetH hSrcDS,
                   int bStrict,
                   char ** papszOptions,
                   GDALProgressFunc pfnProgress,
                   void * pProgressData) -> GDALDatasetH

Create a copy of a dataset.
"""
function createcopy(arg1::Ref{<:GDALDriverH}, arg2, arg3::Ref{<:GDALDatasetH}, arg4::Integer, arg5, arg6::Any, arg7)
    failsafe(ccall((:GDALCreateCopy, libgdal), Ptr{GDALDatasetH}, (Ptr{Cvoid}, Cstring, Ptr{Cvoid}, Cint, Ptr{Cstring}, Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7))
end


"""
    GDALIdentifyDriver(const char * pszFilename,
                       char ** papszFileList) -> GDALDriverH

Identify the driver that can open a raster file.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset.
* **papszFileList**: an array of strings, whose last element is the NULL pointer. These strings are filenames that are auxiliary to the main filename. The passed value may be NULL.

### Returns
A GDALDriverH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDriver *.
"""
function identifydriver(pszFilename, papszFileList)
    failsafe(ccall((:GDALIdentifyDriver, libgdal), Ptr{GDALDriverH}, (Cstring, Ptr{Cstring}), pszFilename, papszFileList))
end


"""
    GDALIdentifyDriverEx(const char * pszFilename,
                         unsigned int nIdentifyFlags,
                         const char *const * papszAllowedDrivers,
                         const char *const * papszFileList) -> GDALDriverH

Identify the driver that can open a raster file.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset.
* **nIdentifyFlags**: a combination of GDAL_OF_RASTER for raster drivers or GDAL_OF_VECTOR for vector drivers. If none of the value is specified, both kinds are implied.
* **papszAllowedDrivers**: NULL to consider all candidate drivers, or a NULL terminated list of strings with the driver short names that must be considered.
* **papszFileList**: an array of strings, whose last element is the NULL pointer. These strings are filenames that are auxiliary to the main filename. The passed value may be NULL.

### Returns
A GDALDriverH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDriver *.
"""
function identifydriverex(pszFilename, nIdentifyFlags::Integer, papszAllowedDrivers, papszFileList)
    failsafe(ccall((:GDALIdentifyDriverEx, libgdal), Ptr{GDALDriverH}, (Cstring, UInt32, Ptr{Cstring}, Ptr{Cstring}), pszFilename, nIdentifyFlags, papszAllowedDrivers, papszFileList))
end


"""
    GDALOpen(const char * pszFilename,
             GDALAccess eAccess) -> GDALDatasetH

Open a raster file as a GDALDataset.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset. It should be in UTF-8 encoding.
* **eAccess**: the desired access, either GA_Update or GA_ReadOnly. Many drivers support only read only access.

### Returns
A GDALDatasetH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDataset *.
"""
function open(pszFilename, eAccess::GDALAccess)
    failsafe(ccall((:GDALOpen, libgdal), Ptr{GDALDatasetH}, (Cstring, GDALAccess), pszFilename, eAccess))
end


"""
    GDALOpenShared(const char * pszFilename,
                   GDALAccess eAccess) -> GDALDatasetH

Open a raster file as a GDALDataset.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset. It should be in UTF-8 encoding.
* **eAccess**: the desired access, either GA_Update or GA_ReadOnly. Many drivers support only read only access.

### Returns
A GDALDatasetH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDataset *.
"""
function openshared(arg1, arg2::GDALAccess)
    failsafe(ccall((:GDALOpenShared, libgdal), Ptr{GDALDatasetH}, (Cstring, GDALAccess), arg1, arg2))
end


"""
    GDALOpenEx(const char * pszFilename,
               unsigned int nOpenFlags,
               const char *const * papszAllowedDrivers,
               const char *const * papszOpenOptions,
               const char *const * papszSiblingFiles) -> friend GDALDatasetH

Open a raster or vector file as a GDALDataset.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset. It should be in UTF-8 encoding.
* **nOpenFlags**: a combination of GDAL_OF_ flags that may be combined through logical or operator. 

Driver kind: GDAL_OF_RASTER for raster drivers, GDAL_OF_VECTOR for vector drivers. If none of the value is specified, both kinds are implied. 

Access mode: GDAL_OF_READONLY (exclusive)or GDAL_OF_UPDATE. 

Shared mode: GDAL_OF_SHARED. If set, it allows the sharing of GDALDataset handles for a dataset with other callers that have set GDAL_OF_SHARED. In particular, GDALOpenEx() will first consult its list of currently open and shared GDALDataset's, and if the GetDescription() name for one exactly matches the pszFilename passed to GDALOpenEx() it will be referenced and returned, if GDALOpenEx() is called from the same thread. 

Verbose error: GDAL_OF_VERBOSE_ERROR. If set, a failed attempt to open the file will lead to an error message to be reported.
* **papszAllowedDrivers**: NULL to consider all candidate drivers, or a NULL terminated list of strings with the driver short names that must be considered.
* **papszOpenOptions**: NULL, or a NULL terminated list of strings with open options passed to candidate drivers. An option exists for all drivers, OVERVIEW_LEVEL=level, to select a particular overview level of a dataset. The level index starts at 0. The level number can be suffixed by "only" to specify that only this overview level must be visible, and not sub-levels. Open options are validated by default, and a warning is emitted in case the option is not recognized. In some scenarios, it might be not desirable (e.g. when not knowing which driver will open the file), so the special open option VALIDATE_OPEN_OPTIONS can be set to NO to avoid such warnings. Alternatively, since GDAL 2.1, an option name can be preceded by the @ character to indicate that it may not cause a warning if the driver doesn't declare this option.
* **papszSiblingFiles**: NULL, or a NULL terminated list of strings that are filenames that are auxiliary to the main filename. If NULL is passed, a probing of the file system will be done.

### Returns
A GDALDatasetH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDataset *.
"""
function openex(pszFilename, nOpenFlags::Integer, papszAllowedDrivers, papszOpenOptions, papszSiblingFiles)
    failsafe(ccall((:GDALOpenEx, libgdal), Ptr{GDALDatasetH}, (Cstring, UInt32, Ptr{Cstring}, Ptr{Cstring}, Ptr{Cstring}), pszFilename, nOpenFlags, papszAllowedDrivers, papszOpenOptions, papszSiblingFiles))
end


"""
    GDALDumpOpenDatasets(FILE * fp) -> int

List open datasets.
"""
function dumpopendatasets(arg1)
    ccall((:GDALDumpOpenDatasets, libgdal), Cint, (Ptr{FILE},), arg1)
end


"""
    GDALGetDriverByName(const char * pszName) -> GDALDriverH

Fetch a driver based on the short name.
"""
function getdriverbyname(arg1)
    failsafe(ccall((:GDALGetDriverByName, libgdal), Ptr{GDALDriverH}, (Cstring,), arg1))
end


"""
    GDALGetDriverCount() -> int

Fetch the number of registered drivers.
"""
function getdrivercount()
    ccall((:GDALGetDriverCount, libgdal), Cint, ())
end


"""
    GDALGetDriver(int iDriver) -> GDALDriverH

Fetch driver by index.
"""
function getdriver(arg1::Integer)
    failsafe(ccall((:GDALGetDriver, libgdal), Ptr{GDALDriverH}, (Cint,), arg1))
end


"""
    GDALDestroyDriver(GDALDriverH hDriver) -> void

Destroy a GDALDriver.

### Parameters
* **hDriver**: the driver to destroy.
"""
function destroydriver(arg1::Ref{<:GDALDriverH})
    ccall((:GDALDestroyDriver, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    GDALRegisterDriver(GDALDriverH hDriver) -> int

Register a driver for use.
"""
function registerdriver(arg1::Ref{<:GDALDriverH})
    ccall((:GDALRegisterDriver, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALDeregisterDriver(GDALDriverH hDriver) -> void

Deregister the passed driver.
"""
function deregisterdriver(arg1::Ref{<:GDALDriverH})
    ccall((:GDALDeregisterDriver, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    GDALDestroyDriverManager(void) -> void

Destroy the driver manager.
"""
function destroydrivermanager()
    ccall((:GDALDestroyDriverManager, libgdal), Cvoid, ())
end


"""
    GDALDestroy(void) -> void
"""
function destroy()
    ccall((:GDALDestroy, libgdal), Cvoid, ())
end


"""
    GDALDeleteDataset(GDALDriverH hDriver,
                      const char * pszFilename) -> CPLErr

Delete named dataset.
"""
function deletedataset(arg1::Ref{<:GDALDriverH}, arg2)
    ccall((:GDALDeleteDataset, libgdal), CPLErr, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    GDALRenameDataset(GDALDriverH hDriver,
                      const char * pszNewName,
                      const char * pszOldName) -> CPLErr

Rename a dataset.
"""
function renamedataset(arg1::Ref{<:GDALDriverH}, pszNewName, pszOldName)
    ccall((:GDALRenameDataset, libgdal), CPLErr, (Ptr{Cvoid}, Cstring, Cstring), arg1, pszNewName, pszOldName)
end


"""
    GDALCopyDatasetFiles(GDALDriverH hDriver,
                         const char * pszNewName,
                         const char * pszOldName) -> CPLErr

Copy the files of a dataset.
"""
function copydatasetfiles(arg1::Ref{<:GDALDriverH}, pszNewName, pszOldName)
    ccall((:GDALCopyDatasetFiles, libgdal), CPLErr, (Ptr{Cvoid}, Cstring, Cstring), arg1, pszNewName, pszOldName)
end


"""
    GDALValidateCreationOptions(GDALDriverH hDriver,
                                char ** papszCreationOptions) -> int

Validate the list of creation options that are handled by a driver.

### Parameters
* **hDriver**: the handle of the driver with whom the lists of creation option must be validated
* **papszCreationOptions**: the list of creation options. An array of strings, whose last element is a NULL pointer

### Returns
TRUE if the list of creation options is compatible with the Create() and CreateCopy() method of the driver, FALSE otherwise.
"""
function validatecreationoptions(arg1::Ref{<:GDALDriverH}, papszCreationOptions)
    ccall((:GDALValidateCreationOptions, libgdal), Cint, (Ptr{Cvoid}, Ptr{Cstring}), arg1, papszCreationOptions)
end


"""
    GDALGetDriverShortName(GDALDriverH hDriver) -> const char *

Return the short name of a driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
the short name of the driver. The returned string should not be freed and is owned by the driver.
"""
function getdrivershortname(arg1::Ref{<:GDALDriverH})
    unsafe_string(ccall((:GDALGetDriverShortName, libgdal), Cstring, (Ptr{Cvoid},), arg1))
end


"""
    GDALGetDriverLongName(GDALDriverH hDriver) -> const char *

Return the long name of a driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
the long name of the driver or empty string. The returned string should not be freed and is owned by the driver.
"""
function getdriverlongname(arg1::Ref{<:GDALDriverH})
    unsafe_string(ccall((:GDALGetDriverLongName, libgdal), Cstring, (Ptr{Cvoid},), arg1))
end


"""
    GDALGetDriverHelpTopic(GDALDriverH hDriver) -> const char *

Return the URL to the help that describes the driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
the URL to the help that describes the driver or NULL. The returned string should not be freed and is owned by the driver.
"""
function getdriverhelptopic(arg1::Ref{<:GDALDriverH})
    unsafe_string(ccall((:GDALGetDriverHelpTopic, libgdal), Cstring, (Ptr{Cvoid},), arg1))
end


"""
    GDALGetDriverCreationOptionList(GDALDriverH hDriver) -> const char *

Return the list of creation options of the driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
an XML string that describes the list of creation options or empty string. The returned string should not be freed and is owned by the driver.
"""
function getdrivercreationoptionlist(arg1::Ref{<:GDALDriverH})
    unsafe_string(ccall((:GDALGetDriverCreationOptionList, libgdal), Cstring, (Ptr{Cvoid},), arg1))
end


"""
    GDALInitGCPs(int,
                 GDAL_GCP *) -> void

Initialize an array of GCPs.

### Parameters
* **nCount**: number of GCPs in psGCP
* **psGCP**: array of GCPs of size nCount.
"""
function initgcps(arg1::Integer, arg2)
    ccall((:GDALInitGCPs, libgdal), Cvoid, (Cint, Ptr{GDAL_GCP}), arg1, arg2)
end


"""
    GDALDeinitGCPs(int,
                   GDAL_GCP *) -> void

De-initialize an array of GCPs (initialized with GDALInitGCPs())

### Parameters
* **nCount**: number of GCPs in psGCP
* **psGCP**: array of GCPs of size nCount.
"""
function deinitgcps(arg1::Integer, arg2)
    ccall((:GDALDeinitGCPs, libgdal), Cvoid, (Cint, Ptr{GDAL_GCP}), arg1, arg2)
end


"""
    GDALDuplicateGCPs(int,
                      const GDAL_GCP *) -> GDAL_GCP *

Duplicate an array of GCPs.

### Parameters
* **nCount**: number of GCPs in psGCP
* **pasGCPList**: array of GCPs of size nCount.
"""
function duplicategcps(arg1::Integer, arg2)
    ccall((:GDALDuplicateGCPs, libgdal), Ptr{GDAL_GCP}, (Cint, Ptr{GDAL_GCP}), arg1, arg2)
end


"""
    GDALGCPsToGeoTransform(int nGCPCount,
                           const GDAL_GCP * pasGCPs,
                           double * padfGeoTransform,
                           int bApproxOK) -> int

Generate Geotransform from GCPs.

### Parameters
* **nGCPCount**: the number of GCPs being passed in.
* **pasGCPs**: the list of GCP structures.
* **padfGeoTransform**: the six double array in which the affine geotransformation will be returned.
* **bApproxOK**: If FALSE the function will fail if the geotransform is not essentially an exact fit (within 0.25 pixel) for all GCPs.

### Returns
TRUE on success or FALSE if there aren't enough points to prepare a geotransform, the pointers are ill-determined or if bApproxOK is FALSE and the fit is poor.
"""
function gcpstogeotransform(nGCPCount::Integer, pasGCPs, padfGeoTransform, bApproxOK::Integer)
    ccall((:GDALGCPsToGeoTransform, libgdal), Cint, (Cint, Ptr{GDAL_GCP}, Ptr{Cdouble}, Cint), nGCPCount, pasGCPs, padfGeoTransform, bApproxOK)
end


"""
    GDALInvGeoTransform(double * gt_in,
                        double * gt_out) -> int

Invert Geotransform.

### Parameters
* **gt_in**: Input geotransform (six doubles - unaltered).
* **gt_out**: Output geotransform (six doubles - updated).

### Returns
TRUE on success or FALSE if the equation is uninvertable.
"""
function invgeotransform(padfGeoTransformIn, padfInvGeoTransformOut)
    ccall((:GDALInvGeoTransform, libgdal), Cint, (Ptr{Cdouble}, Ptr{Cdouble}), padfGeoTransformIn, padfInvGeoTransformOut)
end


"""
    GDALApplyGeoTransform(double * padfGeoTransform,
                          double dfPixel,
                          double dfLine,
                          double * pdfGeoX,
                          double * pdfGeoY) -> void

Apply GeoTransform to x/y coordinate.

### Parameters
* **padfGeoTransform**: Six coefficient GeoTransform to apply.
* **dfPixel**: Input pixel position.
* **dfLine**: Input line position.
* **pdfGeoX**: output location where geo_x (easting/longitude) location is placed.
* **pdfGeoY**: output location where geo_y (northing/latitude) location is placed.
"""
function applygeotransform(arg1, arg2::Real, arg3::Real, arg4, arg5)
    ccall((:GDALApplyGeoTransform, libgdal), Cvoid, (Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5)
end


"""
    GDALComposeGeoTransforms(const double * padfGeoTransform1,
                             const double * padfGeoTransform2,
                             double * padfGeoTransformOut) -> void

Compose two geotransforms.

### Parameters
* **padfGT1**: the first geotransform, six values.
* **padfGT2**: the second geotransform, six values.
* **padfGTOut**: the output geotransform, six values, may safely be the same array as padfGT1 or padfGT2.
"""
function composegeotransforms(padfGeoTransform1, padfGeoTransform2, padfGeoTransformOut)
    ccall((:GDALComposeGeoTransforms, libgdal), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), padfGeoTransform1, padfGeoTransform2, padfGeoTransformOut)
end


"""
    GDALGetMetadataDomainList(GDALMajorObjectH hObject) -> char **

Fetch list of metadata domains.
"""
function getmetadatadomainlist(hObject::Ref{<:GDALMajorObjectH})
    unsafe_loadstringlist(ccall((:GDALGetMetadataDomainList, libgdal), Ptr{Cstring}, (Ptr{Cvoid},), hObject))
end


"""
    GDALGetMetadata(GDALMajorObjectH hObject,
                    const char * pszDomain) -> char **

Fetch metadata.
"""
function getmetadata(arg1::Ref{<:GDALMajorObjectH}, arg2)
    unsafe_loadstringlist(ccall((:GDALGetMetadata, libgdal), Ptr{Cstring}, (Ptr{Cvoid}, Cstring), arg1, arg2))
end


"""
    GDALSetMetadata(GDALMajorObjectH hObject,
                    char ** papszMD,
                    const char * pszDomain) -> CPLErr

Set metadata.
"""
function setmetadata(arg1::Ref{<:GDALMajorObjectH}, arg2, arg3)
    ccall((:GDALSetMetadata, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cstring}, Cstring), arg1, arg2, arg3)
end


"""
    GDALGetMetadataItem(GDALMajorObjectH hObject,
                        const char * pszName,
                        const char * pszDomain) -> const char *

Fetch single metadata item.
"""
function getmetadataitem(arg1::Ref{<:GDALMajorObjectH}, arg2, arg3)
    unsafe_string(ccall((:GDALGetMetadataItem, libgdal), Cstring, (Ptr{Cvoid}, Cstring, Cstring), arg1, arg2, arg3))
end


"""
    GDALSetMetadataItem(GDALMajorObjectH hObject,
                        const char * pszName,
                        const char * pszValue,
                        const char * pszDomain) -> CPLErr

Set single metadata item.
"""
function setmetadataitem(arg1::Ref{<:GDALMajorObjectH}, arg2, arg3, arg4)
    ccall((:GDALSetMetadataItem, libgdal), CPLErr, (Ptr{Cvoid}, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4)
end


"""
    GDALGetDescription(GDALMajorObjectH hObject) -> const char *

Fetch object description.
"""
function getdescription(arg1::Ref{<:GDALMajorObjectH})
    unsafe_string(ccall((:GDALGetDescription, libgdal), Cstring, (Ptr{Cvoid},), arg1))
end


"""
    GDALSetDescription(GDALMajorObjectH hObject,
                       const char * pszNewDesc) -> void

Set object description.
"""
function setdescription(arg1::Ref{<:GDALMajorObjectH}, arg2)
    ccall((:GDALSetDescription, libgdal), Cvoid, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    GDALGetDatasetDriver(GDALDatasetH hDataset) -> GDALDriverH

Fetch the driver to which this dataset relates.
"""
function getdatasetdriver(arg1::Ref{<:GDALDatasetH})
    failsafe(ccall((:GDALGetDatasetDriver, libgdal), Ptr{GDALDriverH}, (Ptr{Cvoid},), arg1))
end


"""
    GDALGetFileList(GDALDatasetH hDS) -> char **

Fetch files forming dataset.
"""
function getfilelist(arg1::Ref{<:GDALDatasetH})
    unsafe_loadstringlist(ccall((:GDALGetFileList, libgdal), Ptr{Cstring}, (Ptr{Cvoid},), arg1))
end


"""
    GDALClose(GDALDatasetH hDS) -> friend void

Close GDAL dataset.

### Parameters
* **hDS**: The dataset to close. May be cast from a "GDALDataset *".
"""
function close(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALClose, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetRasterXSize(GDALDatasetH hDataset) -> int

Fetch raster width in pixels.
"""
function getrasterxsize(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALGetRasterXSize, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetRasterYSize(GDALDatasetH hDataset) -> int

Fetch raster height in pixels.
"""
function getrasterysize(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALGetRasterYSize, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetRasterCount(GDALDatasetH hDS) -> int

Fetch the number of raster bands on this dataset.
"""
function getrastercount(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALGetRasterCount, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetRasterBand(GDALDatasetH hDS,
                      int nBandId) -> GDALRasterBandH

Fetch a band object for a dataset.
"""
function getrasterband(arg1::Ref{<:GDALDatasetH}, arg2::Integer)
    failsafe(ccall((:GDALGetRasterBand, libgdal), Ptr{GDALRasterBandH}, (Ptr{Cvoid}, Cint), arg1, arg2))
end


"""
    GDALAddBand(GDALDatasetH hDataset,
                GDALDataType eType,
                char ** papszOptions) -> CPLErr

Add a band to a dataset.
"""
function addband(hDS::Ref{<:GDALDatasetH}, eType::GDALDataType, papszOptions)
    ccall((:GDALAddBand, libgdal), CPLErr, (Ptr{Cvoid}, GDALDataType, Ptr{Cstring}), hDS, eType, papszOptions)
end


"""
    GDALBeginAsyncReader(GDALDatasetH hDS,
                         int nXOff,
                         int nYOff,
                         int nXSize,
                         int nYSize,
                         void * pBuf,
                         int nBufXSize,
                         int nBufYSize,
                         GDALDataType eBufType,
                         int nBandCount,
                         int * panBandMap,
                         int nPixelSpace,
                         int nLineSpace,
                         int nBandSpace,
                         char ** papszOptions) -> GDALAsyncReaderH

Sets up an asynchronous data request.

### Parameters
* **hDS**: handle to the dataset object.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **pBuf**: The buffer into which the data should be read. This buffer must contain at least nBufXSize * nBufYSize * nBandCount words of type eBufType. It is organized in left to right,top to bottom pixel order. Spacing is controlled by the nPixelSpace, and nLineSpace parameters.
* **nBufXSize**: the width of the buffer image into which the desired region is to be read, or from which it is to be written.
* **nBufYSize**: the height of the buffer image into which the desired region is to be read, or from which it is to be written.
* **eBufType**: the type of the pixel values in the pData data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nBandCount**: the number of bands being read or written.
* **panBandMap**: the list of nBandCount band numbers being read/written. Note band numbers are 1 based. This may be NULL to select the first nBandCount bands.
* **nPixelSpace**: The byte offset from the start of one pixel value in pData to the start of the next pixel value within a scanline. If defaulted (0) the size of the datatype eBufType is used.
* **nLineSpace**: The byte offset from the start of one scanline in pData to the start of the next. If defaulted the size of the datatype eBufType * nBufXSize is used.
* **nBandSpace**: the byte offset from the start of one bands data to the start of the next. If defaulted (zero) the value will be nLineSpace * nBufYSize implying band sequential organization of the data buffer.
* **papszOptions**: Driver specific control options in a string list or NULL. Consult driver documentation for options supported.

### Returns
handle representing the request.
"""
function beginasyncreader(hDS::Ref{<:GDALDatasetH}, nXOff::Integer, nYOff::Integer, nXSize::Integer, nYSize::Integer, pBuf, nBufXSize::Integer, nBufYSize::Integer, eBufType::GDALDataType, nBandCount::Integer, panBandMap, nPixelSpace::Integer, nLineSpace::Integer, nBandSpace::Integer, papszOptions)
    failsafe(ccall((:GDALBeginAsyncReader, libgdal), Ptr{GDALAsyncReaderH}, (Ptr{Cvoid}, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint, Ptr{Cstring}), hDS, nXOff, nYOff, nXSize, nYSize, pBuf, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, papszOptions))
end


"""
    GDALEndAsyncReader(GDALDatasetH hDS,
                       GDALAsyncReaderH hAsyncReaderH) -> void

End asynchronous request.

### Parameters
* **hDS**: handle to the dataset object.
* **hAsyncReaderH**: handle returned by GDALBeginAsyncReader()
"""
function endasyncreader(hDS::Ref{<:GDALDatasetH}, hAsynchReaderH::Ref{GDALAsyncReaderH})
    ccall((:GDALEndAsyncReader, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), hDS, hAsynchReaderH)
end


"""
    GDALDatasetRasterIO(GDALDatasetH hDS,
                        GDALRWFlag eRWFlag,
                        int nXOff,
                        int nYOff,
                        int nXSize,
                        int nYSize,
                        void * pData,
                        int nBufXSize,
                        int nBufYSize,
                        GDALDataType eBufType,
                        int nBandCount,
                        int * panBandMap,
                        int nPixelSpace,
                        int nLineSpace,
                        int nBandSpace) -> CPLErr

Read/write a region of image data from multiple bands.
"""
function datasetrasterio(hDS::Ref{<:GDALDatasetH}, eRWFlag::GDALRWFlag, nDSXOff::Integer, nDSYOff::Integer, nDSXSize::Integer, nDSYSize::Integer, pBuffer, nBXSize::Integer, nBYSize::Integer, eBDataType::GDALDataType, nBandCount::Integer, panBandCount, nPixelSpace::Integer, nLineSpace::Integer, nBandSpace::Integer)
    ccall((:GDALDatasetRasterIO, libgdal), CPLErr, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint), hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace)
end


"""
    GDALDatasetRasterIOEx(GDALDatasetH hDS,
                          GDALRWFlag eRWFlag,
                          int nXOff,
                          int nYOff,
                          int nXSize,
                          int nYSize,
                          void * pData,
                          int nBufXSize,
                          int nBufYSize,
                          GDALDataType eBufType,
                          int nBandCount,
                          int * panBandMap,
                          GSpacing nPixelSpace,
                          GSpacing nLineSpace,
                          GSpacing nBandSpace,
                          GDALRasterIOExtraArg * psExtraArg) -> CPLErr

Read/write a region of image data from multiple bands.
"""
function datasetrasterioex(hDS::Ref{<:GDALDatasetH}, eRWFlag::GDALRWFlag, nDSXOff::Integer, nDSYOff::Integer, nDSXSize::Integer, nDSYSize::Integer, pBuffer, nBXSize::Integer, nBYSize::Integer, eBDataType::GDALDataType, nBandCount::Integer, panBandCount, nPixelSpace::GSpacing, nLineSpace::GSpacing, nBandSpace::GSpacing, psExtraArg)
    ccall((:GDALDatasetRasterIOEx, libgdal), CPLErr, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, GSpacing, GSpacing, GSpacing, Ptr{GDALRasterIOExtraArg}), hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace, psExtraArg)
end


"""
    GDALDatasetAdviseRead(GDALDatasetH hDS,
                          int nXOff,
                          int nYOff,
                          int nXSize,
                          int nYSize,
                          int nBufXSize,
                          int nBufYSize,
                          GDALDataType eDT,
                          int nBandCount,
                          int * panBandMap,
                          char ** papszOptions) -> CPLErr

Advise driver of upcoming read requests.
"""
function datasetadviseread(hDS::Ref{<:GDALDatasetH}, nDSXOff::Integer, nDSYOff::Integer, nDSXSize::Integer, nDSYSize::Integer, nBXSize::Integer, nBYSize::Integer, eBDataType::GDALDataType, nBandCount::Integer, panBandCount, papszOptions)
    ccall((:GDALDatasetAdviseRead, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Ptr{Cstring}), hDS, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, papszOptions)
end


"""
    GDALGetProjectionRef(GDALDatasetH hDS) -> const char *

Fetch the projection definition string for this dataset.
"""
function getprojectionref(arg1::Ref{<:GDALDatasetH})
    unsafe_string(ccall((:GDALGetProjectionRef, libgdal), Cstring, (Ptr{Cvoid},), arg1))
end


"""
    GDALSetProjection(GDALDatasetH hDS,
                      const char * pszProjection) -> CPLErr

Set the projection reference string for this dataset.
"""
function setprojection(arg1::Ref{<:GDALDatasetH}, arg2)
    ccall((:GDALSetProjection, libgdal), CPLErr, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    GDALGetGeoTransform(GDALDatasetH hDS,
                        double * padfTransform) -> CPLErr

Fetch the affine transformation coefficients.
"""
function getgeotransform(arg1::Ref{<:GDALDatasetH}, arg2)
    ccall((:GDALGetGeoTransform, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cdouble}), arg1, arg2)
end


"""
    GDALSetGeoTransform(GDALDatasetH hDS,
                        double * padfTransform) -> CPLErr

Set the affine transformation coefficients.
"""
function setgeotransform(arg1::Ref{<:GDALDatasetH}, arg2)
    ccall((:GDALSetGeoTransform, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cdouble}), arg1, arg2)
end


"""
    GDALGetGCPCount(GDALDatasetH hDS) -> int

Get number of GCPs.
"""
function getgcpcount(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALGetGCPCount, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetGCPProjection(GDALDatasetH hDS) -> const char *

Get output projection for GCPs.
"""
function getgcpprojection(arg1::Ref{<:GDALDatasetH})
    unsafe_string(ccall((:GDALGetGCPProjection, libgdal), Cstring, (Ptr{Cvoid},), arg1))
end


"""
    GDALGetGCPs(GDALDatasetH hDS) -> const GDAL_GCP *

Fetch GCPs.
"""
function getgcps(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALGetGCPs, libgdal), Ptr{GDAL_GCP}, (Ptr{Cvoid},), arg1)
end


"""
    GDALSetGCPs(GDALDatasetH hDS,
                int nGCPCount,
                const GDAL_GCP * pasGCPList,
                const char * pszGCPProjection) -> CPLErr

Assign GCPs.
"""
function setgcps(arg1::Ref{<:GDALDatasetH}, arg2::Integer, arg3, arg4)
    ccall((:GDALSetGCPs, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Ptr{GDAL_GCP}, Cstring), arg1, arg2, arg3, arg4)
end


"""
    GDALGetInternalHandle(GDALDatasetH hDS,
                          const char * pszRequest) -> void *

Fetch a format specific internally meaningful handle.
"""
function getinternalhandle(arg1::Ref{<:GDALDatasetH}, arg2)
    ccall((:GDALGetInternalHandle, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    GDALReferenceDataset(GDALDatasetH hDataset) -> int

Add one to dataset reference count.
"""
function referencedataset(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALReferenceDataset, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALDereferenceDataset(GDALDatasetH hDataset) -> int

Subtract one from dataset reference count.
"""
function dereferencedataset(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALDereferenceDataset, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALReleaseDataset(GDALDatasetH hDataset) -> int

Drop a reference to this object, and destroy if no longer referenced.
"""
function releasedataset(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALReleaseDataset, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALBuildOverviews(GDALDatasetH hDataset,
                       const char * pszResampling,
                       int nOverviews,
                       int * panOverviewList,
                       int nListBands,
                       int * panBandList,
                       GDALProgressFunc pfnProgress,
                       void * pProgressData) -> CPLErr

Build raster overview(s)
"""
function buildoverviews(arg1::Ref{<:GDALDatasetH}, arg2, arg3::Integer, arg4, arg5::Integer, arg6, arg7::Any, arg8)
    ccall((:GDALBuildOverviews, libgdal), CPLErr, (Ptr{Cvoid}, Cstring, Cint, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
end


"""
    GDALGetOpenDatasets(GDALDatasetH ** ppahDSList,
                        int * pnCount) -> void

Fetch all open GDAL dataset handles.
"""
function getopendatasets(hDS, pnCount)
    ccall((:GDALGetOpenDatasets, libgdal), Cvoid, (Ptr{Ptr{GDALDatasetH}}, Ptr{Cint}), hDS, pnCount)
end


"""
    GDALGetAccess(GDALDatasetH hDS) -> int

Return access flag.
"""
function getaccess(hDS::Ref{<:GDALDatasetH})
    ccall((:GDALGetAccess, libgdal), Cint, (Ptr{Cvoid},), hDS)
end


"""
    GDALFlushCache(GDALDatasetH hDS) -> void

Flush all write cached data to disk.
"""
function flushcache(hDS::Ref{<:GDALDatasetH})
    ccall((:GDALFlushCache, libgdal), Cvoid, (Ptr{Cvoid},), hDS)
end


"""
    GDALCreateDatasetMaskBand(GDALDatasetH hDS,
                              int nFlags) -> CPLErr

Adds a mask band to the dataset.
"""
function createdatasetmaskband(hDS::Ref{<:GDALDatasetH}, nFlags::Integer)
    ccall((:GDALCreateDatasetMaskBand, libgdal), CPLErr, (Ptr{Cvoid}, Cint), hDS, nFlags)
end


"""
    GDALDatasetCopyWholeRaster(GDALDatasetH hSrcDS,
                               GDALDatasetH hDstDS,
                               char ** papszOptions,
                               GDALProgressFunc pfnProgress,
                               void * pProgressData) -> CPLErr

Copy all dataset raster data.

### Parameters
* **hSrcDS**: the source dataset
* **hDstDS**: the destination dataset
* **papszOptions**: transfer hints in "StringList" Name=Value format.
* **pfnProgress**: progress reporting function.
* **pProgressData**: callback data for progress function.

### Returns
CE_None on success, or CE_Failure on failure.
"""
function datasetcopywholeraster(hSrcDS::Ref{<:GDALDatasetH}, hDstDS::Ref{<:GDALDatasetH}, papszOptions, pfnProgress::Any, pProgressData)
    ccall((:GDALDatasetCopyWholeRaster, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cstring}, Ptr{Cvoid}, Ptr{Cvoid}), hSrcDS, hDstDS, papszOptions, pfnProgress, pProgressData)
end


"""
    GDALRasterBandCopyWholeRaster(GDALRasterBandH hSrcBand,
                                  GDALRasterBandH hDstBand,
                                  const char *const * constpapszOptions,
                                  GDALProgressFunc pfnProgress,
                                  void * pProgressData) -> CPLErr

Copy all raster band raster data.

### Parameters
* **hSrcBand**: the source band
* **hDstBand**: the destination band
* **papszOptions**: transfer hints in "StringList" Name=Value format.
* **pfnProgress**: progress reporting function.
* **pProgressData**: callback data for progress function.

### Returns
CE_None on success, or CE_Failure on failure.
"""
function rasterbandcopywholeraster(hSrcBand::Ref{GDALRasterBandH}, hDstBand::Ref{GDALRasterBandH}, constpapszOptions, pfnProgress::Any, pProgressData)
    ccall((:GDALRasterBandCopyWholeRaster, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cstring}, Ptr{Cvoid}, Ptr{Cvoid}), hSrcBand, hDstBand, constpapszOptions, pfnProgress, pProgressData)
end


"""
    GDALRegenerateOverviews(GDALRasterBandH hSrcBand,
                            int nOverviewCount,
                            GDALRasterBandH * pahOverviewBands,
                            const char * pszResampling,
                            GDALProgressFunc pfnProgress,
                            void * pProgressData) -> CPLErr

Generate downsampled overviews.

### Parameters
* **hSrcBand**: the source (base level) band.
* **nOverviewCount**: the number of downsampled bands being generated.
* **pahOvrBands**: the list of downsampled bands to be generated.
* **pszResampling**: Resampling algorithm (e.g. "AVERAGE").
* **pfnProgress**: progress report function.
* **pProgressData**: progress function callback data.

### Returns
CE_None on success or CE_Failure on failure.
"""
function regenerateoverviews(hSrcBand::Ref{GDALRasterBandH}, nOverviewCount::Integer, pahOverviewBands, pszResampling, pfnProgress::Any, pProgressData)
    ccall((:GDALRegenerateOverviews, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Ptr{GDALRasterBandH}, Cstring, Ptr{Cvoid}, Ptr{Cvoid}), hSrcBand, nOverviewCount, pahOverviewBands, pszResampling, pfnProgress, pProgressData)
end


"""
    GDALDatasetGetLayerCount(GDALDatasetH hDS) -> int

Get the number of layers in this dataset.

### Parameters
* **hDS**: the dataset handle.

### Returns
layer count.
"""
function datasetgetlayercount(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALDatasetGetLayerCount, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALDatasetGetLayer(GDALDatasetH hDS,
                        int iLayer) -> OGRLayerH

Fetch a layer by index.

### Parameters
* **hDS**: the dataset handle.
* **iLayer**: a layer number between 0 and GetLayerCount()-1.

### Returns
the layer, or NULL if iLayer is out of range or an error occurs.
"""
function datasetgetlayer(arg1::Ref{<:GDALDatasetH}, arg2::Integer)
    failsafe(ccall((:GDALDatasetGetLayer, libgdal), Ptr{OGRLayerH}, (Ptr{Cvoid}, Cint), arg1, arg2))
end


"""
    GDALDatasetGetLayerByName(GDALDatasetH hDS,
                              const char * pszName) -> OGRLayerH

Fetch a layer by name.

### Parameters
* **hDS**: the dataset handle.
* **pszName**: the layer name of the layer to fetch.

### Returns
the layer, or NULL if Layer is not found or an error occurs.
"""
function datasetgetlayerbyname(arg1::Ref{<:GDALDatasetH}, arg2)
    failsafe(ccall((:GDALDatasetGetLayerByName, libgdal), Ptr{OGRLayerH}, (Ptr{Cvoid}, Cstring), arg1, arg2))
end


"""
    GDALDatasetDeleteLayer(GDALDatasetH hDS,
                           int iLayer) -> OGRErr

Delete the indicated layer from the datasource.

### Parameters
* **hDS**: the dataset handle.
* **iLayer**: the index of the layer to delete.

### Returns
OGRERR_NONE on success, or OGRERR_UNSUPPORTED_OPERATION if deleting layers is not supported for this datasource.
"""
function datasetdeletelayer(arg1::Ref{<:GDALDatasetH}, arg2::Integer)
    ccall((:GDALDatasetDeleteLayer, libgdal), OGRErr, (Ptr{Cvoid}, Cint), arg1, arg2)
end


"""
    GDALDatasetCreateLayer(GDALDatasetH hDS,
                           const char * pszName,
                           OGRSpatialReferenceH hSpatialRef,
                           OGRwkbGeometryType eGType,
                           char ** papszOptions) -> OGRLayerH

This function attempts to create a new layer on the dataset with the indicated name, coordinate system, geometry type.

### Parameters
* **hDS**: the dataset handle
* **pszName**: the name for the new layer. This should ideally not match any existing layer on the datasource.
* **hSpatialRef**: the coordinate system to use for the new layer, or NULL if no coordinate system is available.
* **eGType**: the geometry type for the layer. Use wkbUnknown if there are no constraints on the types geometry to be written.
* **papszOptions**: a StringList of name=value options. Options are driver specific.

### Returns
NULL is returned on failure, or a new OGRLayer handle on success.
"""
function datasetcreatelayer(arg1::Ref{<:GDALDatasetH}, arg2, arg3::Ref{OGRSpatialReferenceH}, arg4::OGRwkbGeometryType, arg5)
    failsafe(ccall((:GDALDatasetCreateLayer, libgdal), Ptr{OGRLayerH}, (Ptr{Cvoid}, Cstring, Ptr{Cvoid}, OGRwkbGeometryType, Ptr{Cstring}), arg1, arg2, arg3, arg4, arg5))
end


"""
    GDALDatasetCopyLayer(GDALDatasetH hDS,
                         OGRLayerH hSrcLayer,
                         const char * pszNewName,
                         char ** papszOptions) -> OGRLayerH

Duplicate an existing layer.

### Parameters
* **hDS**: the dataset handle.
* **hSrcLayer**: source layer.
* **pszNewName**: the name of the layer to create.
* **papszOptions**: a StringList of name=value options. Options are driver specific.

### Returns
an handle to the layer, or NULL if an error occurs.
"""
function datasetcopylayer(arg1::Ref{<:GDALDatasetH}, arg2::Ref{OGRLayerH}, arg3, arg4)
    failsafe(ccall((:GDALDatasetCopyLayer, libgdal), Ptr{OGRLayerH}, (Ptr{Cvoid}, Ptr{Cvoid}, Cstring, Ptr{Cstring}), arg1, arg2, arg3, arg4))
end


"""
    GDALDatasetResetReading(GDALDatasetH hDS) -> void

Reset feature reading to start on the first feature.

### Parameters
* **hDS**: dataset handle
"""
function datasetresetreading(arg1::Ref{<:GDALDatasetH})
    ccall((:GDALDatasetResetReading, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    GDALDatasetGetNextFeature(GDALDatasetH hDS,
                              OGRLayerH * phBelongingLayer,
                              double * pdfProgressPct,
                              GDALProgressFunc pfnProgress,
                              void * pProgressData) -> OGRFeatureH

Fetch the next available feature from this dataset.

### Parameters
* **hDS**: dataset handle.
* **phBelongingLayer**: a pointer to a OGRLayer* variable to receive the layer to which the object belongs to, or NULL. It is possible that the output of *ppoBelongingLayer to be NULL despite the feature not being NULL.
* **pdfProgressPct**: a pointer to a double variable to receive the percentage progress (in [0,1] range), or NULL. On return, the pointed value might be negative if determining the progress is not possible.
* **pfnProgress**: a progress callback to report progress (for GetNextFeature() calls that might have a long duration) and offer cancellation possibility, or NULL
* **pProgressData**: user data provided to pfnProgress, or NULL

### Returns
a feature, or NULL if no more features are available.
"""
function datasetgetnextfeature(hDS::Ref{<:GDALDatasetH}, phBelongingLayer, pdfProgressPct, pfnProgress::Any, pProgressData)
    failsafe(ccall((:GDALDatasetGetNextFeature, libgdal), Ptr{OGRFeatureH}, (Ptr{Cvoid}, Ptr{OGRLayerH}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}), hDS, phBelongingLayer, pdfProgressPct, pfnProgress, pProgressData))
end


"""
    GDALDatasetTestCapability(GDALDatasetH hDS,
                              const char * pszCap) -> int

Test if capability is available.

### Parameters
* **hDS**: the dataset handle.
* **pszCap**: the capability to test.

### Returns
TRUE if capability available otherwise FALSE.
"""
function datasettestcapability(arg1::Ref{<:GDALDatasetH}, arg2)
    ccall((:GDALDatasetTestCapability, libgdal), Cint, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    GDALDatasetExecuteSQL(GDALDatasetH hDS,
                          const char * pszStatement,
                          OGRGeometryH hSpatialFilter,
                          const char * pszDialect) -> OGRLayerH

Execute an SQL statement against the data store.

### Parameters
* **hDS**: the dataset handle.
* **pszStatement**: the SQL statement to execute.
* **hSpatialFilter**: geometry which represents a spatial filter. Can be NULL.
* **pszDialect**: allows control of the statement dialect. If set to NULL, the OGR SQL engine will be used, except for RDBMS drivers that will use their dedicated SQL engine, unless OGRSQL is explicitly passed as the dialect. Starting with OGR 1.10, the SQLITE dialect can also be used.

### Returns
an OGRLayer containing the results of the query. Deallocate with ReleaseResultSet().
"""
function datasetexecutesql(arg1::Ref{<:GDALDatasetH}, arg2, arg3::Ref{OGRGeometryH}, arg4)
    failsafe(ccall((:GDALDatasetExecuteSQL, libgdal), Ptr{OGRLayerH}, (Ptr{Cvoid}, Cstring, Ptr{Cvoid}, Cstring), arg1, arg2, arg3, arg4))
end


"""
    GDALDatasetReleaseResultSet(GDALDatasetH hDS,
                                OGRLayerH hLayer) -> void

Release results of ExecuteSQL().

### Parameters
* **hDS**: the dataset handle.
* **hLayer**: the result of a previous ExecuteSQL() call.
"""
function datasetreleaseresultset(arg1::Ref{<:GDALDatasetH}, arg2::Ref{OGRLayerH})
    ccall((:GDALDatasetReleaseResultSet, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    GDALDatasetGetStyleTable(GDALDatasetH hDS) -> OGRStyleTableH

Returns dataset style table.

### Parameters
* **hDS**: the dataset handle

### Returns
handle to a style table which should not be modified or freed by the caller.
"""
function datasetgetstyletable(arg1::Ref{<:GDALDatasetH})
    failsafe(ccall((:GDALDatasetGetStyleTable, libgdal), Ptr{OGRStyleTableH}, (Ptr{Cvoid},), arg1))
end


"""
    GDALDatasetSetStyleTableDirectly(GDALDatasetH hDS,
                                     OGRStyleTableH hStyleTable) -> void

Set dataset style table.

### Parameters
* **hDS**: the dataset handle
* **hStyleTable**: style table handle to set
"""
function datasetsetstyletabledirectly(arg1::Ref{<:GDALDatasetH}, arg2::Ref{OGRStyleTableH})
    ccall((:GDALDatasetSetStyleTableDirectly, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    GDALDatasetSetStyleTable(GDALDatasetH hDS,
                             OGRStyleTableH hStyleTable) -> void

Set dataset style table.

### Parameters
* **hDS**: the dataset handle
* **hStyleTable**: style table handle to set
"""
function datasetsetstyletable(arg1::Ref{<:GDALDatasetH}, arg2::Ref{OGRStyleTableH})
    ccall((:GDALDatasetSetStyleTable, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    GDALDatasetStartTransaction(GDALDatasetH hDS,
                                int bForce) -> OGRErr

For datasources which support transactions, StartTransaction creates a transaction.

### Parameters
* **hDS**: the dataset handle.
* **bForce**: can be set to TRUE if an emulation, possibly slow, of a transaction mechanism is acceptable.

### Returns
OGRERR_NONE on success.
"""
function datasetstarttransaction(hDS::Ref{<:GDALDatasetH}, bForce::Integer)
    ccall((:GDALDatasetStartTransaction, libgdal), OGRErr, (Ptr{Cvoid}, Cint), hDS, bForce)
end


"""
    GDALDatasetCommitTransaction(GDALDatasetH hDS) -> OGRErr

For datasources which support transactions, CommitTransaction commits a transaction.

### Returns
OGRERR_NONE on success.
"""
function datasetcommittransaction(hDS::Ref{<:GDALDatasetH})
    ccall((:GDALDatasetCommitTransaction, libgdal), OGRErr, (Ptr{Cvoid},), hDS)
end


"""
    GDALDatasetRollbackTransaction(GDALDatasetH hDS) -> OGRErr

For datasources which support transactions, RollbackTransaction will roll back a datasource to its state before the start of the current transaction.

### Returns
OGRERR_NONE on success.
"""
function datasetrollbacktransaction(hDS::Ref{<:GDALDatasetH})
    ccall((:GDALDatasetRollbackTransaction, libgdal), OGRErr, (Ptr{Cvoid},), hDS)
end


"""
    GDALGetRasterDataType(GDALRasterBandH hBand) -> GDALDataType

Fetch the pixel data type for this band.
"""
function getrasterdatatype(arg1::Ref{GDALRasterBandH})
    ccall((:GDALGetRasterDataType, libgdal), GDALDataType, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetBlockSize(GDALRasterBandH hBand,
                     int * pnXSize,
                     int * pnYSize) -> void

Fetch the "natural" block size of this band.
"""
function getblocksize(arg1::Ref{GDALRasterBandH}, pnXSize, pnYSize)
    ccall((:GDALGetBlockSize, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cint}, Ptr{Cint}), arg1, pnXSize, pnYSize)
end


"""
    GDALGetActualBlockSize(GDALRasterBandH hBand,
                           int nXBlockOff,
                           int nYBlockOff,
                           int * pnXValid,
                           int * pnYValid) -> CPLErr

Retrieve the actual block size for a given block offset.
"""
function getactualblocksize(arg1::Ref{GDALRasterBandH}, nXBlockOff::Integer, nYBlockOff::Integer, pnXValid, pnYValid)
    ccall((:GDALGetActualBlockSize, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Cint, Ptr{Cint}, Ptr{Cint}), arg1, nXBlockOff, nYBlockOff, pnXValid, pnYValid)
end


"""
    GDALRasterAdviseRead(GDALRasterBandH hBand,
                         int nXOff,
                         int nYOff,
                         int nXSize,
                         int nYSize,
                         int nBufXSize,
                         int nBufYSize,
                         GDALDataType eDT,
                         char ** papszOptions) -> CPLErr

Advise driver of upcoming read requests.
"""
function rasteradviseread(hRB::Ref{GDALRasterBandH}, nDSXOff::Integer, nDSYOff::Integer, nDSXSize::Integer, nDSYSize::Integer, nBXSize::Integer, nBYSize::Integer, eBDataType::GDALDataType, papszOptions)
    ccall((:GDALRasterAdviseRead, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Ptr{Cstring}), hRB, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, papszOptions)
end


"""
    GDALRasterIO(GDALRasterBandH hBand,
                 GDALRWFlag eRWFlag,
                 int nXOff,
                 int nYOff,
                 int nXSize,
                 int nYSize,
                 void * pData,
                 int nBufXSize,
                 int nBufYSize,
                 GDALDataType eBufType,
                 int nPixelSpace,
                 int nLineSpace) -> CPLErr

Read/write a region of image data for this band.
"""
function rasterio(hRBand::Ref{GDALRasterBandH}, eRWFlag::GDALRWFlag, nDSXOff::Integer, nDSYOff::Integer, nDSXSize::Integer, nDSYSize::Integer, pBuffer, nBXSize::Integer, nBYSize::Integer, eBDataType::GDALDataType, nPixelSpace::Integer, nLineSpace::Integer)
    ccall((:GDALRasterIO, libgdal), CPLErr, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Cint), hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace)
end


"""
    GDALRasterIOEx(GDALRasterBandH hBand,
                   GDALRWFlag eRWFlag,
                   int nXOff,
                   int nYOff,
                   int nXSize,
                   int nYSize,
                   void * pData,
                   int nBufXSize,
                   int nBufYSize,
                   GDALDataType eBufType,
                   GSpacing nPixelSpace,
                   GSpacing nLineSpace,
                   GDALRasterIOExtraArg * psExtraArg) -> CPLErr

Read/write a region of image data for this band.
"""
function rasterioex(hRBand::Ref{GDALRasterBandH}, eRWFlag::GDALRWFlag, nDSXOff::Integer, nDSYOff::Integer, nDSXSize::Integer, nDSYSize::Integer, pBuffer, nBXSize::Integer, nBYSize::Integer, eBDataType::GDALDataType, nPixelSpace::GSpacing, nLineSpace::GSpacing, psExtraArg)
    ccall((:GDALRasterIOEx, libgdal), CPLErr, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, GSpacing, GSpacing, Ptr{GDALRasterIOExtraArg}), hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace, psExtraArg)
end


"""
    GDALReadBlock(GDALRasterBandH hBand,
                  int nXOff,
                  int nYOff,
                  void * pData) -> CPLErr

Read a block of image data efficiently.
"""
function readblock(arg1::Ref{GDALRasterBandH}, arg2::Integer, arg3::Integer, arg4)
    ccall((:GDALReadBlock, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4)
end


"""
    GDALWriteBlock(GDALRasterBandH hBand,
                   int nXOff,
                   int nYOff,
                   void * pData) -> CPLErr

Write a block of image data efficiently.
"""
function writeblock(arg1::Ref{GDALRasterBandH}, arg2::Integer, arg3::Integer, arg4)
    ccall((:GDALWriteBlock, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4)
end


"""
    GDALGetRasterBandXSize(GDALRasterBandH hBand) -> int

Fetch XSize of raster.
"""
function getrasterbandxsize(arg1::Ref{GDALRasterBandH})
    ccall((:GDALGetRasterBandXSize, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetRasterBandYSize(GDALRasterBandH hBand) -> int

Fetch YSize of raster.
"""
function getrasterbandysize(arg1::Ref{GDALRasterBandH})
    ccall((:GDALGetRasterBandYSize, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetRasterAccess(GDALRasterBandH hBand) -> GDALAccess

Find out if we have update permission for this band.
"""
function getrasteraccess(arg1::Ref{GDALRasterBandH})
    ccall((:GDALGetRasterAccess, libgdal), GDALAccess, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetBandNumber(GDALRasterBandH hBand) -> int

Fetch the band number.
"""
function getbandnumber(arg1::Ref{GDALRasterBandH})
    ccall((:GDALGetBandNumber, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetBandDataset(GDALRasterBandH hBand) -> GDALDatasetH

Fetch the owning dataset handle.
"""
function getbanddataset(arg1::Ref{GDALRasterBandH})
    failsafe(ccall((:GDALGetBandDataset, libgdal), Ptr{GDALDatasetH}, (Ptr{Cvoid},), arg1))
end


"""
    GDALGetRasterColorInterpretation(GDALRasterBandH hBand) -> GDALColorInterp

How should this band be interpreted as color?
"""
function getrastercolorinterpretation(arg1::Ref{GDALRasterBandH})
    ccall((:GDALGetRasterColorInterpretation, libgdal), GDALColorInterp, (Ptr{Cvoid},), arg1)
end


"""
    GDALSetRasterColorInterpretation(GDALRasterBandH hBand,
                                     GDALColorInterp eColorInterp) -> CPLErr

Set color interpretation of a band.
"""
function setrastercolorinterpretation(arg1::Ref{GDALRasterBandH}, arg2::GDALColorInterp)
    ccall((:GDALSetRasterColorInterpretation, libgdal), CPLErr, (Ptr{Cvoid}, GDALColorInterp), arg1, arg2)
end


"""
    GDALGetRasterColorTable(GDALRasterBandH hBand) -> GDALColorTableH

Fetch the color table associated with band.
"""
function getrastercolortable(arg1::Ref{GDALRasterBandH})
    failsafe(ccall((:GDALGetRasterColorTable, libgdal), Ptr{GDALColorTableH}, (Ptr{Cvoid},), arg1))
end


"""
    GDALSetRasterColorTable(GDALRasterBandH hBand,
                            GDALColorTableH hCT) -> CPLErr

Set the raster color table.
"""
function setrastercolortable(arg1::Ref{GDALRasterBandH}, arg2::Ref{GDALColorTableH})
    ccall((:GDALSetRasterColorTable, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    GDALHasArbitraryOverviews(GDALRasterBandH hBand) -> int

Check for arbitrary overviews.
"""
function hasarbitraryoverviews(arg1::Ref{GDALRasterBandH})
    ccall((:GDALHasArbitraryOverviews, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetOverviewCount(GDALRasterBandH hBand) -> int

Return the number of overview layers available.
"""
function getoverviewcount(arg1::Ref{GDALRasterBandH})
    ccall((:GDALGetOverviewCount, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetOverview(GDALRasterBandH hBand,
                    int i) -> GDALRasterBandH

Fetch overview raster band object.
"""
function getoverview(arg1::Ref{GDALRasterBandH}, arg2::Integer)
    failsafe(ccall((:GDALGetOverview, libgdal), Ptr{GDALRasterBandH}, (Ptr{Cvoid}, Cint), arg1, arg2))
end


"""
    GDALGetRasterNoDataValue(GDALRasterBandH hBand,
                             int * pbSuccess) -> double

Fetch the no data value for this band.
"""
function getrasternodatavalue(arg1::Ref{GDALRasterBandH}, arg2)
    ccall((:GDALGetRasterNoDataValue, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{Cint}), arg1, arg2)
end


"""
    GDALSetRasterNoDataValue(GDALRasterBandH hBand,
                             double dfValue) -> CPLErr

Set the no data value for this band.
"""
function setrasternodatavalue(arg1::Ref{GDALRasterBandH}, arg2::Real)
    ccall((:GDALSetRasterNoDataValue, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble), arg1, arg2)
end


"""
    GDALDeleteRasterNoDataValue(GDALRasterBandH hBand) -> CPLErr

Remove the no data value for this band.
"""
function deleterasternodatavalue(arg1::Ref{GDALRasterBandH})
    ccall((:GDALDeleteRasterNoDataValue, libgdal), CPLErr, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetRasterCategoryNames(GDALRasterBandH hBand) -> char **

Fetch the list of category names for this raster.
"""
function getrastercategorynames(arg1::Ref{GDALRasterBandH})
    unsafe_loadstringlist(ccall((:GDALGetRasterCategoryNames, libgdal), Ptr{Cstring}, (Ptr{Cvoid},), arg1))
end


"""
    GDALSetRasterCategoryNames(GDALRasterBandH hBand,
                               char ** papszNames) -> CPLErr

Set the category names for this band.
"""
function setrastercategorynames(arg1::Ref{GDALRasterBandH}, arg2)
    ccall((:GDALSetRasterCategoryNames, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    GDALGetRasterMinimum(GDALRasterBandH hBand,
                         int * pbSuccess) -> double

Fetch the minimum value for this band.
"""
function getrasterminimum(arg1::Ref{GDALRasterBandH}, pbSuccess)
    ccall((:GDALGetRasterMinimum, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{Cint}), arg1, pbSuccess)
end


"""
    GDALGetRasterMaximum(GDALRasterBandH hBand,
                         int * pbSuccess) -> double

Fetch the maximum value for this band.
"""
function getrastermaximum(arg1::Ref{GDALRasterBandH}, pbSuccess)
    ccall((:GDALGetRasterMaximum, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{Cint}), arg1, pbSuccess)
end


"""
    GDALGetRasterStatistics(GDALRasterBandH hBand,
                            int bApproxOK,
                            int bForce,
                            double * pdfMin,
                            double * pdfMax,
                            double * pdfMean,
                            double * pdfStdDev) -> CPLErr

Fetch image statistics.
"""
function getrasterstatistics(arg1::Ref{GDALRasterBandH}, bApproxOK::Integer, bForce::Integer, pdfMin, pdfMax, pdfMean, pdfStdDev)
    ccall((:GDALGetRasterStatistics, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), arg1, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev)
end


"""
    GDALComputeRasterStatistics(GDALRasterBandH hBand,
                                int bApproxOK,
                                double * pdfMin,
                                double * pdfMax,
                                double * pdfMean,
                                double * pdfStdDev,
                                GDALProgressFunc pfnProgress,
                                void * pProgressData) -> CPLErr

Compute image statistics.
"""
function computerasterstatistics(arg1::Ref{GDALRasterBandH}, bApproxOK::Integer, pdfMin, pdfMax, pdfMean, pdfStdDev, pfnProgress::Any, pProgressData)
    ccall((:GDALComputeRasterStatistics, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}), arg1, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pfnProgress, pProgressData)
end


"""
    GDALSetRasterStatistics(GDALRasterBandH hBand,
                            double dfMin,
                            double dfMax,
                            double dfMean,
                            double dfStdDev) -> CPLErr

Set statistics on band.
"""
function setrasterstatistics(hBand::Ref{GDALRasterBandH}, dfMin::Real, dfMax::Real, dfMean::Real, dfStdDev::Real)
    ccall((:GDALSetRasterStatistics, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hBand, dfMin, dfMax, dfMean, dfStdDev)
end


"""
    GDALGetRasterUnitType(GDALRasterBandH hBand) -> const char *

Return raster unit type.
"""
function getrasterunittype(arg1::Ref{GDALRasterBandH})
    unsafe_string(ccall((:GDALGetRasterUnitType, libgdal), Cstring, (Ptr{Cvoid},), arg1))
end


"""
    GDALSetRasterUnitType(GDALRasterBandH hBand,
                          const char * pszNewValue) -> CPLErr

Set unit type.
"""
function setrasterunittype(hBand::Ref{GDALRasterBandH}, pszNewValue)
    ccall((:GDALSetRasterUnitType, libgdal), CPLErr, (Ptr{Cvoid}, Cstring), hBand, pszNewValue)
end


"""
    GDALGetRasterOffset(GDALRasterBandH hBand,
                        int * pbSuccess) -> double

Fetch the raster value offset.
"""
function getrasteroffset(arg1::Ref{GDALRasterBandH}, pbSuccess)
    ccall((:GDALGetRasterOffset, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{Cint}), arg1, pbSuccess)
end


"""
    GDALSetRasterOffset(GDALRasterBandH hBand,
                        double dfNewOffset) -> CPLErr

Set scaling offset.
"""
function setrasteroffset(hBand::Ref{GDALRasterBandH}, dfNewOffset::Real)
    ccall((:GDALSetRasterOffset, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble), hBand, dfNewOffset)
end


"""
    GDALGetRasterScale(GDALRasterBandH hBand,
                       int * pbSuccess) -> double

Fetch the raster value scale.
"""
function getrasterscale(arg1::Ref{GDALRasterBandH}, pbSuccess)
    ccall((:GDALGetRasterScale, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{Cint}), arg1, pbSuccess)
end


"""
    GDALSetRasterScale(GDALRasterBandH hBand,
                       double dfNewOffset) -> CPLErr

Set scaling ratio.
"""
function setrasterscale(hBand::Ref{GDALRasterBandH}, dfNewOffset::Real)
    ccall((:GDALSetRasterScale, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble), hBand, dfNewOffset)
end


"""
    GDALComputeRasterMinMax(GDALRasterBandH hBand,
                            int bApproxOK,
                            double adfMinMax) -> void

Compute the min/max values for a band.
"""
function computerasterminmax(hBand::Ref{GDALRasterBandH}, bApproxOK::Integer, adfMinMax::NTuple{2, Cdouble})
    ccall((:GDALComputeRasterMinMax, libgdal), Cvoid, (Ptr{Cvoid}, Cint, NTuple{2, Cdouble}), hBand, bApproxOK, adfMinMax)
end


"""
    GDALFlushRasterCache(GDALRasterBandH hBand) -> CPLErr

Flush raster data cache.
"""
function flushrastercache(hBand::Ref{GDALRasterBandH})
    ccall((:GDALFlushRasterCache, libgdal), CPLErr, (Ptr{Cvoid},), hBand)
end


"""
    GDALGetRasterHistogram(GDALRasterBandH hBand,
                           double dfMin,
                           double dfMax,
                           int nBuckets,
                           int * panHistogram,
                           int bIncludeOutOfRange,
                           int bApproxOK,
                           GDALProgressFunc pfnProgress,
                           void * pProgressData) -> CPLErr

Compute raster histogram.
"""
function getrasterhistogram(hBand::Ref{GDALRasterBandH}, dfMin::Real, dfMax::Real, nBuckets::Integer, panHistogram, bIncludeOutOfRange::Integer, bApproxOK::Integer, pfnProgress::Any, pProgressData)
    ccall((:GDALGetRasterHistogram, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cint, Ptr{Cint}, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}), hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData)
end


"""
    GDALGetRasterHistogramEx(GDALRasterBandH hBand,
                             double dfMin,
                             double dfMax,
                             int nBuckets,
                             GUIntBig * panHistogram,
                             int bIncludeOutOfRange,
                             int bApproxOK,
                             GDALProgressFunc pfnProgress,
                             void * pProgressData) -> CPLErr

Compute raster histogram.
"""
function getrasterhistogramex(hBand::Ref{GDALRasterBandH}, dfMin::Real, dfMax::Real, nBuckets::Integer, panHistogram, bIncludeOutOfRange::Integer, bApproxOK::Integer, pfnProgress::Any, pProgressData)
    ccall((:GDALGetRasterHistogramEx, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cint, Ptr{GUIntBig}, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}), hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData)
end


"""
    GDALGetDefaultHistogram(GDALRasterBandH hBand,
                            double * pdfMin,
                            double * pdfMax,
                            int * pnBuckets,
                            int ** ppanHistogram,
                            int bForce,
                            GDALProgressFunc pfnProgress,
                            void * pProgressData) -> CPLErr

Fetch default raster histogram.
"""
function getdefaulthistogram(hBand::Ref{GDALRasterBandH}, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce::Integer, pfnProgress::Any, pProgressData)
    ccall((:GDALGetDefaultHistogram, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cint}}, Cint, Ptr{Cvoid}, Ptr{Cvoid}), hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData)
end


"""
    GDALGetDefaultHistogramEx(GDALRasterBandH hBand,
                              double * pdfMin,
                              double * pdfMax,
                              int * pnBuckets,
                              GUIntBig ** ppanHistogram,
                              int bForce,
                              GDALProgressFunc pfnProgress,
                              void * pProgressData) -> CPLErr

Fetch default raster histogram.
"""
function getdefaulthistogramex(hBand::Ref{GDALRasterBandH}, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce::Integer, pfnProgress::Any, pProgressData)
    ccall((:GDALGetDefaultHistogramEx, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{GUIntBig}}, Cint, Ptr{Cvoid}, Ptr{Cvoid}), hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData)
end


"""
    GDALSetDefaultHistogram(GDALRasterBandH hBand,
                            double dfMin,
                            double dfMax,
                            int nBuckets,
                            int * panHistogram) -> CPLErr

Set default histogram.
"""
function setdefaulthistogram(hBand::Ref{GDALRasterBandH}, dfMin::Real, dfMax::Real, nBuckets::Integer, panHistogram)
    ccall((:GDALSetDefaultHistogram, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cint, Ptr{Cint}), hBand, dfMin, dfMax, nBuckets, panHistogram)
end


"""
    GDALSetDefaultHistogramEx(GDALRasterBandH hBand,
                              double dfMin,
                              double dfMax,
                              int nBuckets,
                              GUIntBig * panHistogram) -> CPLErr

Set default histogram.
"""
function setdefaulthistogramex(hBand::Ref{GDALRasterBandH}, dfMin::Real, dfMax::Real, nBuckets::Integer, panHistogram)
    ccall((:GDALSetDefaultHistogramEx, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cint, Ptr{GUIntBig}), hBand, dfMin, dfMax, nBuckets, panHistogram)
end


"""
    GDALGetRandomRasterSample(GDALRasterBandH,
                              int,
                              float *) -> int

Undocumented.

### Parameters
* **hBand**: undocumented.
* **nSamples**: undocumented.
* **pafSampleBuf**: undocumented.

### Returns
undocumented
"""
function getrandomrastersample(arg1::Ref{GDALRasterBandH}, arg2::Integer, arg3)
    ccall((:GDALGetRandomRasterSample, libgdal), Cint, (Ptr{Cvoid}, Cint, Ptr{Cfloat}), arg1, arg2, arg3)
end


"""
    GDALGetRasterSampleOverview(GDALRasterBandH hBand,
                                int nDesiredSamples) -> GDALRasterBandH

Fetch best sampling overview.
"""
function getrastersampleoverview(arg1::Ref{GDALRasterBandH}, arg2::Integer)
    failsafe(ccall((:GDALGetRasterSampleOverview, libgdal), Ptr{GDALRasterBandH}, (Ptr{Cvoid}, Cint), arg1, arg2))
end


"""
    GDALGetRasterSampleOverviewEx(GDALRasterBandH hBand,
                                  GUIntBig nDesiredSamples) -> GDALRasterBandH

Fetch best sampling overview.
"""
function getrastersampleoverviewex(arg1::Ref{GDALRasterBandH}, arg2::GUIntBig)
    failsafe(ccall((:GDALGetRasterSampleOverviewEx, libgdal), Ptr{GDALRasterBandH}, (Ptr{Cvoid}, GUIntBig), arg1, arg2))
end


"""
    GDALFillRaster(GDALRasterBandH hBand,
                   double dfRealValue,
                   double dfImaginaryValue) -> CPLErr

Fill this band with a constant value.
"""
function fillraster(hBand::Ref{GDALRasterBandH}, dfRealValue::Real, dfImaginaryValue::Real)
    ccall((:GDALFillRaster, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble, Cdouble), hBand, dfRealValue, dfImaginaryValue)
end


"""
    GDALComputeBandStats(GDALRasterBandH hBand,
                         int nSampleStep,
                         double * pdfMean,
                         double * pdfStdDev,
                         GDALProgressFunc pfnProgress,
                         void * pProgressData) -> CPLErr

Undocumented.

### Parameters
* **hSrcBand**: undocumented.
* **nSampleStep**: undocumented.
* **pdfMean**: undocumented.
* **pdfStdDev**: undocumented.
* **pfnProgress**: undocumented.
* **pProgressData**: undocumented.

### Returns
undocumented
"""
function computebandstats(hBand::Ref{GDALRasterBandH}, nSampleStep::Integer, pdfMean, pdfStdDev, pfnProgress::Any, pProgressData)
    ccall((:GDALComputeBandStats, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}), hBand, nSampleStep, pdfMean, pdfStdDev, pfnProgress, pProgressData)
end


"""
    GDALOverviewMagnitudeCorrection(GDALRasterBandH hBaseBand,
                                    int nOverviewCount,
                                    GDALRasterBandH * pahOverviews,
                                    GDALProgressFunc pfnProgress,
                                    void * pProgressData) -> CPLErr

Undocumented.

### Parameters
* **hBaseBand**: undocumented.
* **nOverviewCount**: undocumented.
* **pahOverviews**: undocumented.
* **pfnProgress**: undocumented.
* **pProgressData**: undocumented.

### Returns
undocumented
"""
function overviewmagnitudecorrection(hBaseBand::Ref{GDALRasterBandH}, nOverviewCount::Integer, pahOverviews, pfnProgress::Any, pProgressData)
    ccall((:GDALOverviewMagnitudeCorrection, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Ptr{GDALRasterBandH}, Ptr{Cvoid}, Ptr{Cvoid}), hBaseBand, nOverviewCount, pahOverviews, pfnProgress, pProgressData)
end


"""
    GDALGetDefaultRAT(GDALRasterBandH hBand) -> GDALRasterAttributeTableH

Fetch default Raster Attribute Table.
"""
function getdefaultrat(hBand::Ref{GDALRasterBandH})
    failsafe(ccall((:GDALGetDefaultRAT, libgdal), Ptr{GDALRasterAttributeTableH}, (Ptr{Cvoid},), hBand))
end


"""
    GDALSetDefaultRAT(GDALRasterBandH hBand,
                      GDALRasterAttributeTableH hRAT) -> CPLErr

Set default Raster Attribute Table.
"""
function setdefaultrat(arg1::Ref{GDALRasterBandH}, arg2::Ref{GDALRasterAttributeTableH})
    ccall((:GDALSetDefaultRAT, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    GDALAddDerivedBandPixelFunc(const char * pszName,
                                GDALDerivedPixelFunc pfnPixelFunc) -> CPLErr

This adds a pixel function to the global list of available pixel functions for derived bands.

### Parameters
* **pszFuncName**: Name used to access pixel function
* **pfnNewFunction**: Pixel function associated with name. An existing pixel function registered with the same name will be replaced with the new one.

### Returns
CE_None, invalid (NULL) parameters are currently ignored.
"""
function addderivedbandpixelfunc(pszName, pfnPixelFunc::Ref{GDALDerivedPixelFunc})
    ccall((:GDALAddDerivedBandPixelFunc, libgdal), CPLErr, (Cstring, Ptr{Cvoid}), pszName, pfnPixelFunc)
end


"""
    GDALGetMaskBand(GDALRasterBandH hBand) -> GDALRasterBandH

Return the mask band associated with the band.
"""
function getmaskband(hBand::Ref{GDALRasterBandH})
    failsafe(ccall((:GDALGetMaskBand, libgdal), Ptr{GDALRasterBandH}, (Ptr{Cvoid},), hBand))
end


"""
    GDALGetMaskFlags(GDALRasterBandH hBand) -> int

Return the status flags of the mask band associated with the band.
"""
function getmaskflags(hBand::Ref{GDALRasterBandH})
    ccall((:GDALGetMaskFlags, libgdal), Cint, (Ptr{Cvoid},), hBand)
end


"""
    GDALCreateMaskBand(GDALRasterBandH hBand,
                       int nFlags) -> CPLErr

Adds a mask band to the current band.
"""
function createmaskband(hBand::Ref{GDALRasterBandH}, nFlags::Integer)
    ccall((:GDALCreateMaskBand, libgdal), CPLErr, (Ptr{Cvoid}, Cint), hBand, nFlags)
end


"""
    GDALGetDataCoverageStatus(GDALRasterBandH hBand,
                              int nXOff,
                              int nYOff,
                              int nXSize,
                              int nYSize,
                              int nMaskFlagStop,
                              double * pdfDataPct) -> int

Get the coverage status of a sub-window of the raster.

### Parameters
* **hBand**: raster band
* **nXOff**: The pixel offset to the top left corner of the region of the band to be queried. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be queried. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be queried in pixels.
* **nYSize**: The height of the region of the band to be queried in lines.
* **nMaskFlagStop**: 0, or a binary-or'ed mask of possible values GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED, GDAL_DATA_COVERAGE_STATUS_DATA and GDAL_DATA_COVERAGE_STATUS_EMPTY. As soon as the computation of the coverage matches the mask, the computation will be stopped. *pdfDataPct will not be valid in that case.
* **pdfDataPct**: Optional output parameter whose pointed value will be set to the (approximate) percentage in [0,100] of pixels in the queried sub-window that have valid values. The implementation might not always be able to compute it, in which case it will be set to a negative value.

### Returns
a binary-or'ed combination of possible values GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED, GDAL_DATA_COVERAGE_STATUS_DATA and GDAL_DATA_COVERAGE_STATUS_EMPTY
"""
function getdatacoveragestatus(hBand::Ref{GDALRasterBandH}, nXOff::Integer, nYOff::Integer, nXSize::Integer, nYSize::Integer, nMaskFlagStop::Integer, pdfDataPct)
    ccall((:GDALGetDataCoverageStatus, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Cint, Cint, Cint, Ptr{Cdouble}), hBand, nXOff, nYOff, nXSize, nYSize, nMaskFlagStop, pdfDataPct)
end


"""
    GDALARGetNextUpdatedRegion(GDALAsyncReaderH hARIO,
                               double dfTimeout,
                               int * pnBufXOff,
                               int * pnBufYOff,
                               int * pnBufXSize,
                               int * pnBufYSize) -> GDALAsyncStatusType

Get async IO update.

### Parameters
* **hARIO**: handle to the async reader.
* **dfTimeout**: the number of seconds to wait for additional updates. Use -1 to wait indefinitely, or zero to not wait at all if there is no data available.
* **pnBufXOff**: location to return the X offset of the area of the request buffer that has been updated.
* **pnBufYOff**: location to return the Y offset of the area of the request buffer that has been updated.
* **pnBufXSize**: location to return the X size of the area of the request buffer that has been updated.
* **pnBufYSize**: location to return the Y size of the area of the request buffer that has been updated.

### Returns
GARIO_ status, details described above.
"""
function argetnextupdatedregion(hARIO::Ref{GDALAsyncReaderH}, dfTimeout::Real, pnXBufOff, pnYBufOff, pnXBufSize, pnYBufSize)
    ccall((:GDALARGetNextUpdatedRegion, libgdal), GDALAsyncStatusType, (Ptr{Cvoid}, Cdouble, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), hARIO, dfTimeout, pnXBufOff, pnYBufOff, pnXBufSize, pnYBufSize)
end


"""
    GDALARLockBuffer(GDALAsyncReaderH hARIO,
                     double dfTimeout) -> int

Lock image buffer.

### Parameters
* **hARIO**: handle to async reader.
* **dfTimeout**: the time in seconds to wait attempting to lock the buffer. -1.0 to wait indefinitely and 0 to not wait at all if it can't be acquired immediately. Default is -1.0 (infinite wait).

### Returns
TRUE if successful, or FALSE on an error.
"""
function arlockbuffer(hARIO::Ref{GDALAsyncReaderH}, dfTimeout::Real)
    ccall((:GDALARLockBuffer, libgdal), Cint, (Ptr{Cvoid}, Cdouble), hARIO, dfTimeout)
end


"""
    GDALARUnlockBuffer(GDALAsyncReaderH hARIO) -> void

Unlock image buffer.

### Parameters
* **hARIO**: handle to async reader.
"""
function arunlockbuffer(hARIO::Ref{GDALAsyncReaderH})
    ccall((:GDALARUnlockBuffer, libgdal), Cvoid, (Ptr{Cvoid},), hARIO)
end


"""
    GDALGeneralCmdLineProcessor(int nArgc,
                                char *** ppapszArgv,
                                int nOptions) -> int

General utility option processing.

### Parameters
* **nArgc**: number of values in the argument list.
* **ppapszArgv**: pointer to the argument list array (will be updated in place).
* **nOptions**: a or-able combination of GDAL_OF_RASTER and GDAL_OF_VECTOR to determine which drivers should be displayed by formats. If set to 0, GDAL_OF_RASTER is assumed.

### Returns
updated nArgc argument count. Return of 0 requests terminate without error, return of -1 requests exit with error code.
"""
function generalcmdlineprocessor(nArgc::Integer, ppapszArgv, nOptions::Integer)
    ccall((:GDALGeneralCmdLineProcessor, libgdal), Cint, (Cint, Ptr{Ptr{Cstring}}, Cint), nArgc, ppapszArgv, nOptions)
end


"""
    GDALSwapWords(void * pData,
                  int nWordSize,
                  int nWordCount,
                  int nWordSkip) -> void

Byte swap words in-place.

### Parameters
* **pData**: pointer to start of data buffer.
* **nWordSize**: size of words being swapped in bytes. Normally 2, 4 or 8.
* **nWordCount**: the number of words to be swapped in this call.
* **nWordSkip**: the byte offset from the start of one word to the start of the next. For packed buffers this is the same as nWordSize.
"""
function swapwords(pData, nWordSize::Integer, nWordCount::Integer, nWordSkip::Integer)
    ccall((:GDALSwapWords, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Cint, Cint), pData, nWordSize, nWordCount, nWordSkip)
end


"""
    GDALSwapWordsEx(void * pData,
                    int nWordSize,
                    size_t nWordCount,
                    int nWordSkip) -> void

Byte swap words in-place.

### Parameters
* **pData**: pointer to start of data buffer.
* **nWordSize**: size of words being swapped in bytes. Normally 2, 4 or 8.
* **nWordCount**: the number of words to be swapped in this call.
* **nWordSkip**: the byte offset from the start of one word to the start of the next. For packed buffers this is the same as nWordSize.
"""
function swapwordsex(pData, nWordSize::Integer, nWordCount::Csize_t, nWordSkip::Integer)
    ccall((:GDALSwapWordsEx, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Csize_t, Cint), pData, nWordSize, nWordCount, nWordSkip)
end


"""
    GDALCopyWords(const void *CPL_RESTRICT pSrcData,
                  GDALDataType eSrcType,
                  int nSrcPixelOffset,
                  void *CPL_RESTRICT pDstData,
                  GDALDataType eDstType,
                  int nDstPixelOffset,
                  int nWordCount) -> void

Copy pixel words from buffer to buffer.

### Parameters
* **pSrcData**: Pointer to source data to be converted.
* **eSrcType**: the source data type (see GDALDataType enum)
* **nSrcPixelStride**: Source pixel stride (i.e. distance between 2 words), in bytes
* **pDstData**: Pointer to buffer where destination data should go
* **eDstType**: the destination data type (see GDALDataType enum)
* **nDstPixelStride**: Destination pixel stride (i.e. distance between 2 words), in bytes
* **nWordCount**: number of words to be copied
"""
function copywords(pSrcData, eSrcType::GDALDataType, nSrcPixelOffset::Integer, pDstData, eDstType::GDALDataType, nDstPixelOffset::Integer, nWordCount::Integer)
    ccall((:GDALCopyWords, libgdal), Cvoid, (Ptr{Cvoid}, GDALDataType, Cint, Ptr{Cvoid}, GDALDataType, Cint, Cint), pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount)
end


"""
    GDALCopyBits(const GByte * pabySrcData,
                 int nSrcOffset,
                 int nSrcStep,
                 GByte * pabyDstData,
                 int nDstOffset,
                 int nDstStep,
                 int nBitCount,
                 int nStepCount) -> void

Bitwise word copying.

### Parameters
* **pabySrcData**: the source data buffer.
* **nSrcOffset**: the offset (in bits) in pabySrcData to the start of the first word to copy.
* **nSrcStep**: the offset in bits from the start one source word to the start of the next.
* **pabyDstData**: the destination data buffer.
* **nDstOffset**: the offset (in bits) in pabyDstData to the start of the first word to copy over.
* **nDstStep**: the offset in bits from the start one word to the start of the next.
* **nBitCount**: the number of bits in a word to be copied.
* **nStepCount**: the number of words to copy.
"""
function copybits(pabySrcData, nSrcOffset::Integer, nSrcStep::Integer, pabyDstData, nDstOffset::Integer, nDstStep::Integer, nBitCount::Integer, nStepCount::Integer)
    ccall((:GDALCopyBits, libgdal), Cvoid, (Ptr{GByte}, Cint, Cint, Ptr{GByte}, Cint, Cint, Cint, Cint), pabySrcData, nSrcOffset, nSrcStep, pabyDstData, nDstOffset, nDstStep, nBitCount, nStepCount)
end


"""
    GDALLoadWorldFile(const char *,
                      double *) -> int

Read ESRI world file.

### Parameters
* **pszFilename**: the world file name.
* **padfGeoTransform**: the six double array into which the geotransformation should be placed.

### Returns
TRUE on success or FALSE on failure.
"""
function loadworldfile(arg1, arg2)
    ccall((:GDALLoadWorldFile, libgdal), Cint, (Cstring, Ptr{Cdouble}), arg1, arg2)
end


"""
    GDALReadWorldFile(const char *,
                      const char *,
                      double *) -> int

Read ESRI world file.

### Parameters
* **pszBaseFilename**: the target raster file.
* **pszExtension**: the extension to use (i.e. ".wld") or NULL to derive it from the pszBaseFilename
* **padfGeoTransform**: the six double array into which the geotransformation should be placed.

### Returns
TRUE on success or FALSE on failure.
"""
function readworldfile(arg1, arg2, arg3)
    ccall((:GDALReadWorldFile, libgdal), Cint, (Cstring, Cstring, Ptr{Cdouble}), arg1, arg2, arg3)
end


"""
    GDALWriteWorldFile(const char *,
                       const char *,
                       double *) -> int

Write ESRI world file.

### Parameters
* **pszBaseFilename**: the target raster file.
* **pszExtension**: the extension to use (i.e. ".wld"). Must not be NULL
* **padfGeoTransform**: the six double array from which the geotransformation should be read.

### Returns
TRUE on success or FALSE on failure.
"""
function writeworldfile(arg1, arg2, arg3)
    ccall((:GDALWriteWorldFile, libgdal), Cint, (Cstring, Cstring, Ptr{Cdouble}), arg1, arg2, arg3)
end


"""
    GDALLoadTabFile(const char *,
                    double *,
                    char **,
                    int *,
                    GDAL_GCP **) -> int

Helper function for translator implementer wanting support for MapInfo .tab files.

### Parameters
* **pszFilename**: filename of .tab
* **padfGeoTransform**: output geotransform. Must hold 6 doubles.
* **ppszWKT**: output pointer to a string that will be allocated with CPLMalloc().
* **pnGCPCount**: output pointer to GCP count.
* **ppasGCPs**: outputer pointer to an array of GCPs.

### Returns
TRUE in case of success, FALSE otherwise.
"""
function loadtabfile(arg1, arg2, arg3, arg4, arg5)
    ccall((:GDALLoadTabFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5)
end


"""
    GDALReadTabFile(const char *,
                    double *,
                    char **,
                    int *,
                    GDAL_GCP **) -> int

Helper function for translator implementer wanting support for MapInfo .tab files.

### Parameters
* **pszBaseFilename**: filename whose basename will help building the .tab filename.
* **padfGeoTransform**: output geotransform. Must hold 6 doubles.
* **ppszWKT**: output pointer to a string that will be allocated with CPLMalloc().
* **pnGCPCount**: output pointer to GCP count.
* **ppasGCPs**: outputer pointer to an array of GCPs.

### Returns
TRUE in case of success, FALSE otherwise.
"""
function readtabfile(arg1, arg2, arg3, arg4, arg5)
    ccall((:GDALReadTabFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5)
end


"""
    GDALLoadOziMapFile(const char *,
                       double *,
                       char **,
                       int *,
                       GDAL_GCP **) -> int

Helper function for translator implementer wanting support for OZI .map.

### Parameters
* **pszFilename**: filename of .tab file
* **padfGeoTransform**: output geotransform. Must hold 6 doubles.
* **ppszWKT**: output pointer to a string that will be allocated with CPLMalloc().
* **pnGCPCount**: output pointer to GCP count.
* **ppasGCPs**: outputer pointer to an array of GCPs.

### Returns
TRUE in case of success, FALSE otherwise.
"""
function loadozimapfile(arg1, arg2, arg3, arg4, arg5)
    ccall((:GDALLoadOziMapFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5)
end


"""
    GDALReadOziMapFile(const char *,
                       double *,
                       char **,
                       int *,
                       GDAL_GCP **) -> int

Helper function for translator implementer wanting support for OZI .map.

### Parameters
* **pszBaseFilename**: filename whose basename will help building the .map filename.
* **padfGeoTransform**: output geotransform. Must hold 6 doubles.
* **ppszWKT**: output pointer to a string that will be allocated with CPLMalloc().
* **pnGCPCount**: output pointer to GCP count.
* **ppasGCPs**: outputer pointer to an array of GCPs.

### Returns
TRUE in case of success, FALSE otherwise.
"""
function readozimapfile(arg1, arg2, arg3, arg4, arg5)
    ccall((:GDALReadOziMapFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5)
end


"""
    GDALDecToDMS(double,
                 const char *,
                 int) -> const char *

Translate a decimal degrees value to a DMS string with hemisphere.
"""
function dectodms(arg1::Real, arg2, arg3::Integer)
    unsafe_string(ccall((:GDALDecToDMS, libgdal), Cstring, (Cdouble, Cstring, Cint), arg1, arg2, arg3))
end


"""
    GDALPackedDMSToDec(double) -> double

Convert a packed DMS value (DDDMMMSSS.SS) into decimal degrees.
"""
function packeddmstodec(arg1::Real)
    ccall((:GDALPackedDMSToDec, libgdal), Cdouble, (Cdouble,), arg1)
end


"""
    GDALDecToPackedDMS(double) -> double

Convert decimal degrees into packed DMS value (DDDMMMSSS.SS).
"""
function dectopackeddms(arg1::Real)
    ccall((:GDALDecToPackedDMS, libgdal), Cdouble, (Cdouble,), arg1)
end


"""
    GDALExtractRPCInfo(char **,
                       GDALRPCInfo *) -> int

Extract RPC info from metadata, and apply to an RPCInfo structure.

### Parameters
* **papszMD**: Dictionary of metadata representing RPC
* **psRPC**: (output) Pointer to structure to hold the RPC values.

### Returns
TRUE in case of success. FALSE in case of failure.
"""
function extractrpcinfo(arg1, arg2)
    ccall((:GDALExtractRPCInfo, libgdal), Cint, (Ptr{Cstring}, Ptr{GDALRPCInfo}), arg1, arg2)
end


"""
    GDALCreateColorTable(GDALPaletteInterp eInterp) -> GDALColorTableH

Construct a new color table.
"""
function createcolortable(arg1::GDALPaletteInterp)
    failsafe(ccall((:GDALCreateColorTable, libgdal), Ptr{GDALColorTableH}, (GDALPaletteInterp,), arg1))
end


"""
    GDALDestroyColorTable(GDALColorTableH hTable) -> void

Destroys a color table.
"""
function destroycolortable(arg1::Ref{GDALColorTableH})
    ccall((:GDALDestroyColorTable, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    GDALCloneColorTable(GDALColorTableH hTable) -> GDALColorTableH

Make a copy of a color table.
"""
function clonecolortable(arg1::Ref{GDALColorTableH})
    failsafe(ccall((:GDALCloneColorTable, libgdal), Ptr{GDALColorTableH}, (Ptr{Cvoid},), arg1))
end


"""
    GDALGetPaletteInterpretation(GDALColorTableH hTable) -> GDALPaletteInterp

Fetch palette interpretation.
"""
function getpaletteinterpretation(arg1::Ref{GDALColorTableH})
    ccall((:GDALGetPaletteInterpretation, libgdal), GDALPaletteInterp, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetColorEntryCount(GDALColorTableH hTable) -> int

Get number of color entries in table.
"""
function getcolorentrycount(arg1::Ref{GDALColorTableH})
    ccall((:GDALGetColorEntryCount, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALGetColorEntry(GDALColorTableH hTable,
                      int i) -> const GDALColorEntry *

Fetch a color entry from table.
"""
function getcolorentry(arg1::Ref{GDALColorTableH}, arg2::Integer)
    ccall((:GDALGetColorEntry, libgdal), Ptr{GDALColorEntry}, (Ptr{Cvoid}, Cint), arg1, arg2)
end


"""
    GDALGetColorEntryAsRGB(GDALColorTableH hTable,
                           int i,
                           GDALColorEntry * poEntry) -> int

Fetch a table entry in RGB format.
"""
function getcolorentryasrgb(arg1::Ref{GDALColorTableH}, arg2::Integer, arg3)
    ccall((:GDALGetColorEntryAsRGB, libgdal), Cint, (Ptr{Cvoid}, Cint, Ptr{GDALColorEntry}), arg1, arg2, arg3)
end


"""
    GDALSetColorEntry(GDALColorTableH hTable,
                      int i,
                      const GDALColorEntry * poEntry) -> void

Set entry in color table.
"""
function setcolorentry(arg1::Ref{GDALColorTableH}, arg2::Integer, arg3)
    ccall((:GDALSetColorEntry, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Ptr{GDALColorEntry}), arg1, arg2, arg3)
end


"""
    GDALCreateColorRamp(GDALColorTableH hTable,
                        int nStartIndex,
                        const GDALColorEntry * psStartColor,
                        int nEndIndex,
                        const GDALColorEntry * psEndColor) -> void

Create color ramp.
"""
function createcolorramp(hTable::Ref{GDALColorTableH}, nStartIndex::Integer, psStartColor, nEndIndex::Integer, psEndColor)
    ccall((:GDALCreateColorRamp, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Ptr{GDALColorEntry}, Cint, Ptr{GDALColorEntry}), hTable, nStartIndex, psStartColor, nEndIndex, psEndColor)
end


"""
    GDALCreateRasterAttributeTable(void) -> GDALRasterAttributeTableH

Construct empty table.
"""
function createrasterattributetable()
    failsafe(ccall((:GDALCreateRasterAttributeTable, libgdal), Ptr{GDALRasterAttributeTableH}, ()))
end


"""
    GDALDestroyRasterAttributeTable(GDALRasterAttributeTableH) -> void

Destroys a RAT.
"""
function destroyrasterattributetable(arg1::Ref{GDALRasterAttributeTableH})
    ccall((:GDALDestroyRasterAttributeTable, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    GDALRATGetColumnCount(GDALRasterAttributeTableH) -> int

Fetch table column count.
"""
function ratgetcolumncount(arg1::Ref{GDALRasterAttributeTableH})
    ccall((:GDALRATGetColumnCount, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALRATGetNameOfCol(GDALRasterAttributeTableH,
                        int) -> const char *

Fetch name of indicated column.

### Parameters
* **hRAT**: RAT handle.
* **iCol**: column index.

### Returns
name.
"""
function ratgetnameofcol(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer)
    unsafe_string(ccall((:GDALRATGetNameOfCol, libgdal), Cstring, (Ptr{Cvoid}, Cint), arg1, arg2))
end


"""
    GDALRATGetUsageOfCol(GDALRasterAttributeTableH,
                         int) -> GDALRATFieldUsage

Fetch column usage value.

### Parameters
* **hRAT**: RAT handle.
* **iCol**: column index.

### Returns
usage.
"""
function ratgetusageofcol(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer)
    ccall((:GDALRATGetUsageOfCol, libgdal), GDALRATFieldUsage, (Ptr{Cvoid}, Cint), arg1, arg2)
end


"""
    GDALRATGetTypeOfCol(GDALRasterAttributeTableH,
                        int) -> GDALRATFieldType

Fetch column type.

### Parameters
* **hRAT**: RAT handle.
* **iCol**: column index.

### Returns
type.
"""
function ratgettypeofcol(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer)
    ccall((:GDALRATGetTypeOfCol, libgdal), GDALRATFieldType, (Ptr{Cvoid}, Cint), arg1, arg2)
end


"""
    GDALRATGetColOfUsage(GDALRasterAttributeTableH,
                         GDALRATFieldUsage) -> int

Fetch column index for given usage.
"""
function ratgetcolofusage(arg1::Ref{GDALRasterAttributeTableH}, arg2::GDALRATFieldUsage)
    ccall((:GDALRATGetColOfUsage, libgdal), Cint, (Ptr{Cvoid}, GDALRATFieldUsage), arg1, arg2)
end


"""
    GDALRATGetRowCount(GDALRasterAttributeTableH) -> int

Fetch row count.
"""
function ratgetrowcount(arg1::Ref{GDALRasterAttributeTableH})
    ccall((:GDALRATGetRowCount, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    GDALRATGetValueAsString(GDALRasterAttributeTableH,
                            int,
                            int) -> const char *

Fetch field value as a string.
"""
function ratgetvalueasstring(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer, arg3::Integer)
    unsafe_string(ccall((:GDALRATGetValueAsString, libgdal), Cstring, (Ptr{Cvoid}, Cint, Cint), arg1, arg2, arg3))
end


"""
    GDALRATGetValueAsInt(GDALRasterAttributeTableH,
                         int,
                         int) -> int

Fetch field value as a integer.
"""
function ratgetvalueasint(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer, arg3::Integer)
    ccall((:GDALRATGetValueAsInt, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint), arg1, arg2, arg3)
end


"""
    GDALRATGetValueAsDouble(GDALRasterAttributeTableH,
                            int,
                            int) -> double

Fetch field value as a double.
"""
function ratgetvalueasdouble(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer, arg3::Integer)
    ccall((:GDALRATGetValueAsDouble, libgdal), Cdouble, (Ptr{Cvoid}, Cint, Cint), arg1, arg2, arg3)
end


"""
    GDALRATSetValueAsString(GDALRasterAttributeTableH,
                            int,
                            int,
                            const char *) -> void

Set field value from string.

### Parameters
* **hRAT**: RAT handle.
* **iRow**: row index.
* **iField**: field index.
* **pszValue**: value.
"""
function ratsetvalueasstring(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer, arg3::Integer, arg4)
    ccall((:GDALRATSetValueAsString, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Cint, Cstring), arg1, arg2, arg3, arg4)
end


"""
    GDALRATSetValueAsInt(GDALRasterAttributeTableH,
                         int,
                         int,
                         int) -> void

Set field value from integer.
"""
function ratsetvalueasint(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer, arg3::Integer, arg4::Integer)
    ccall((:GDALRATSetValueAsInt, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Cint, Cint), arg1, arg2, arg3, arg4)
end


"""
    GDALRATSetValueAsDouble(GDALRasterAttributeTableH,
                            int,
                            int,
                            double) -> void

Set field value from double.
"""
function ratsetvalueasdouble(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer, arg3::Integer, arg4::Real)
    ccall((:GDALRATSetValueAsDouble, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Cint, Cdouble), arg1, arg2, arg3, arg4)
end


"""
    GDALRATChangesAreWrittenToFile(GDALRasterAttributeTableH hRAT) -> int

Determine whether changes made to this RAT are reflected directly in the dataset.
"""
function ratchangesarewrittentofile(hRAT::Ref{GDALRasterAttributeTableH})
    ccall((:GDALRATChangesAreWrittenToFile, libgdal), Cint, (Ptr{Cvoid},), hRAT)
end


"""
    GDALRATValuesIOAsDouble(GDALRasterAttributeTableH hRAT,
                            GDALRWFlag eRWFlag,
                            int iField,
                            int iStartRow,
                            int iLength,
                            double * pdfData) -> CPLErr

Read or Write a block of doubles to/from the Attribute Table.
"""
function ratvaluesioasdouble(hRAT::Ref{GDALRasterAttributeTableH}, eRWFlag::GDALRWFlag, iField::Integer, iStartRow::Integer, iLength::Integer, pdfData)
    ccall((:GDALRATValuesIOAsDouble, libgdal), CPLErr, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Ptr{Cdouble}), hRAT, eRWFlag, iField, iStartRow, iLength, pdfData)
end


"""
    GDALRATValuesIOAsInteger(GDALRasterAttributeTableH hRAT,
                             GDALRWFlag eRWFlag,
                             int iField,
                             int iStartRow,
                             int iLength,
                             int * pnData) -> CPLErr

Read or Write a block of ints to/from the Attribute Table.
"""
function ratvaluesioasinteger(hRAT::Ref{GDALRasterAttributeTableH}, eRWFlag::GDALRWFlag, iField::Integer, iStartRow::Integer, iLength::Integer, pnData)
    ccall((:GDALRATValuesIOAsInteger, libgdal), CPLErr, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Ptr{Cint}), hRAT, eRWFlag, iField, iStartRow, iLength, pnData)
end


"""
    GDALRATValuesIOAsString(GDALRasterAttributeTableH hRAT,
                            GDALRWFlag eRWFlag,
                            int iField,
                            int iStartRow,
                            int iLength,
                            char ** papszStrList) -> CPLErr

Read or Write a block of strings to/from the Attribute Table.
"""
function ratvaluesioasstring(hRAT::Ref{GDALRasterAttributeTableH}, eRWFlag::GDALRWFlag, iField::Integer, iStartRow::Integer, iLength::Integer, papszStrList)
    ccall((:GDALRATValuesIOAsString, libgdal), CPLErr, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Ptr{Cstring}), hRAT, eRWFlag, iField, iStartRow, iLength, papszStrList)
end


"""
    GDALRATSetRowCount(GDALRasterAttributeTableH,
                       int) -> void

Set row count.

### Parameters
* **hRAT**: RAT handle.
* **nNewCount**: the new number of rows.
"""
function ratsetrowcount(arg1::Ref{GDALRasterAttributeTableH}, arg2::Integer)
    ccall((:GDALRATSetRowCount, libgdal), Cvoid, (Ptr{Cvoid}, Cint), arg1, arg2)
end


"""
    GDALRATCreateColumn(GDALRasterAttributeTableH,
                        const char *,
                        GDALRATFieldType,
                        GDALRATFieldUsage) -> CPLErr

Create new column.
"""
function ratcreatecolumn(arg1::Ref{GDALRasterAttributeTableH}, arg2, arg3::GDALRATFieldType, arg4::GDALRATFieldUsage)
    ccall((:GDALRATCreateColumn, libgdal), CPLErr, (Ptr{Cvoid}, Cstring, GDALRATFieldType, GDALRATFieldUsage), arg1, arg2, arg3, arg4)
end


"""
    GDALRATSetLinearBinning(GDALRasterAttributeTableH,
                            double,
                            double) -> CPLErr

Set linear binning information.
"""
function ratsetlinearbinning(arg1::Ref{GDALRasterAttributeTableH}, arg2::Real, arg3::Real)
    ccall((:GDALRATSetLinearBinning, libgdal), CPLErr, (Ptr{Cvoid}, Cdouble, Cdouble), arg1, arg2, arg3)
end


"""
    GDALRATGetLinearBinning(GDALRasterAttributeTableH,
                            double *,
                            double *) -> int

Get linear binning information.
"""
function ratgetlinearbinning(arg1::Ref{GDALRasterAttributeTableH}, arg2, arg3)
    ccall((:GDALRATGetLinearBinning, libgdal), Cint, (Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cdouble}), arg1, arg2, arg3)
end


"""
    GDALRATInitializeFromColorTable(GDALRasterAttributeTableH,
                                    GDALColorTableH) -> CPLErr

Initialize from color table.
"""
function ratinitializefromcolortable(arg1::Ref{GDALRasterAttributeTableH}, arg2::Ref{GDALColorTableH})
    ccall((:GDALRATInitializeFromColorTable, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    GDALRATTranslateToColorTable(GDALRasterAttributeTableH,
                                 int nEntryCount) -> GDALColorTableH

Translate to a color table.
"""
function rattranslatetocolortable(arg1::Ref{GDALRasterAttributeTableH}, nEntryCount::Integer)
    failsafe(ccall((:GDALRATTranslateToColorTable, libgdal), Ptr{GDALColorTableH}, (Ptr{Cvoid}, Cint), arg1, nEntryCount))
end


"""
    GDALRATDumpReadable(GDALRasterAttributeTableH,
                        FILE *) -> void

Dump RAT in readable form.
"""
function ratdumpreadable(arg1::Ref{GDALRasterAttributeTableH}, arg2)
    ccall((:GDALRATDumpReadable, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{FILE}), arg1, arg2)
end


"""
    GDALRATClone(GDALRasterAttributeTableH) -> GDALRasterAttributeTableH

Copy Raster Attribute Table.
"""
function ratclone(arg1::Ref{GDALRasterAttributeTableH})
    failsafe(ccall((:GDALRATClone, libgdal), Ptr{GDALRasterAttributeTableH}, (Ptr{Cvoid},), arg1))
end


"""
    GDALRATSerializeJSON(GDALRasterAttributeTableH) -> void *

Serialize Raster Attribute Table in Json format.
"""
function ratserializejson(arg1::Ref{GDALRasterAttributeTableH})
    ccall((:GDALRATSerializeJSON, libgdal), Ptr{Cvoid}, (Ptr{Cvoid},), arg1)
end


"""
    GDALRATGetRowOfValue(GDALRasterAttributeTableH,
                         double) -> int

Get row for pixel value.
"""
function ratgetrowofvalue(arg1::Ref{GDALRasterAttributeTableH}, arg2::Real)
    ccall((:GDALRATGetRowOfValue, libgdal), Cint, (Ptr{Cvoid}, Cdouble), arg1, arg2)
end


"""
    GDALSetCacheMax(int nNewSizeInBytes) -> void

Set maximum cache memory.

### Parameters
* **nNewSizeInBytes**: the maximum number of bytes for caching.
"""
function setcachemax(nBytes::Integer)
    ccall((:GDALSetCacheMax, libgdal), Cvoid, (Cint,), nBytes)
end


"""
    GDALGetCacheMax() -> int

Get maximum cache memory.

### Returns
maximum in bytes.
"""
function getcachemax()
    ccall((:GDALGetCacheMax, libgdal), Cint, ())
end


"""
    GDALGetCacheUsed() -> int

Get cache memory used.

### Returns
the number of bytes of memory currently in use by the GDALRasterBlock memory caching.
"""
function getcacheused()
    ccall((:GDALGetCacheUsed, libgdal), Cint, ())
end


"""
    GDALSetCacheMax64(GIntBig nNewSizeInBytes) -> void

Set maximum cache memory.

### Parameters
* **nNewSizeInBytes**: the maximum number of bytes for caching.
"""
function setcachemax64(nBytes::Integer)
    ccall((:GDALSetCacheMax64, libgdal), Cvoid, (GIntBig,), nBytes)
end


"""
    GDALGetCacheMax64() -> GIntBig

Get maximum cache memory.

### Returns
maximum in bytes.
"""
function getcachemax64()
    ccall((:GDALGetCacheMax64, libgdal), GIntBig, ())
end


"""
    GDALGetCacheUsed64() -> GIntBig

Get cache memory used.

### Returns
the number of bytes of memory currently in use by the GDALRasterBlock memory caching.
"""
function getcacheused64()
    ccall((:GDALGetCacheUsed64, libgdal), GIntBig, ())
end


"""
    GDALFlushCacheBlock() -> int

Try to flush one cached raster block.

### Returns
TRUE if one block was flushed, FALSE if there are no cached blocks or if they are currently locked.
"""
function flushcacheblock()
    ccall((:GDALFlushCacheBlock, libgdal), Cint, ())
end


"""
    GDALDatasetGetVirtualMem(GDALDatasetH hDS,
                             GDALRWFlag eRWFlag,
                             int nXOff,
                             int nYOff,
                             int nXSize,
                             int nYSize,
                             int nBufXSize,
                             int nBufYSize,
                             GDALDataType eBufType,
                             int nBandCount,
                             int * panBandMap,
                             int nPixelSpace,
                             GIntBig nLineSpace,
                             GIntBig nBandSpace,
                             size_t nCacheSize,
                             size_t nPageSizeHint,
                             int bSingleThreadUsage,
                             char ** papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL dataset object.

### Parameters
* **hDS**: Dataset object
* **eRWFlag**: Either GF_Read to read a region of data, or GF_Write to write a region of data.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **nBufXSize**: the width of the buffer image into which the desired region is to be read, or from which it is to be written.
* **nBufYSize**: the height of the buffer image into which the desired region is to be read, or from which it is to be written.
* **eBufType**: the type of the pixel values in the data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nBandCount**: the number of bands being read or written.
* **panBandMap**: the list of nBandCount band numbers being read/written. Note band numbers are 1 based. This may be NULL to select the first nBandCount bands.
* **nPixelSpace**: The byte offset from the start of one pixel value in the buffer to the start of the next pixel value within a scanline. If defaulted (0) the size of the datatype eBufType is used.
* **nLineSpace**: The byte offset from the start of one scanline in the buffer to the start of the next. If defaulted (0) the size of the datatype eBufType * nBufXSize is used.
* **nBandSpace**: the byte offset from the start of one bands data to the start of the next. If defaulted (0) the value will be nLineSpace * nBufYSize implying band sequential organization of the data buffer.
* **nCacheSize**: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM)
* **nPageSizeHint**: hint for the page size. Must be a multiple of the system page size, returned by CPLGetPageSize(). Minimum value is generally 4096. Might be set to 0 to let the function determine a default page size.
* **bSingleThreadUsage**: set to TRUE if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. If set to FALSE, CPLVirtualMemDeclareThread() must be called.
* **papszOptions**: NULL terminated list of options. Unused for now.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function datasetgetvirtualmem(hDS::Ref{<:GDALDatasetH}, eRWFlag::GDALRWFlag, nXOff::Integer, nYOff::Integer, nXSize::Integer, nYSize::Integer, nBufXSize::Integer, nBufYSize::Integer, eBufType::GDALDataType, nBandCount::Integer, panBandMap, nPixelSpace::Integer, nLineSpace::Integer, nBandSpace::Integer, nCacheSize::Csize_t, nPageSizeHint::Csize_t, bSingleThreadUsage::Integer, papszOptions)
    ccall((:GDALDatasetGetVirtualMem, libgdal), Ptr{CPLVirtualMem}, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, GIntBig, GIntBig, Csize_t, Csize_t, Cint, Ptr{Cstring}), hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions)
end


"""
    GDALRasterBandGetVirtualMem(GDALRasterBandH hBand,
                                GDALRWFlag eRWFlag,
                                int nXOff,
                                int nYOff,
                                int nXSize,
                                int nYSize,
                                int nBufXSize,
                                int nBufYSize,
                                GDALDataType eBufType,
                                int nPixelSpace,
                                GIntBig nLineSpace,
                                size_t nCacheSize,
                                size_t nPageSizeHint,
                                int bSingleThreadUsage,
                                char ** papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL raster band object.

### Parameters
* **hBand**: Rasterband object
* **eRWFlag**: Either GF_Read to read a region of data, or GF_Write to write a region of data.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **nBufXSize**: the width of the buffer image into which the desired region is to be read, or from which it is to be written.
* **nBufYSize**: the height of the buffer image into which the desired region is to be read, or from which it is to be written.
* **eBufType**: the type of the pixel values in the data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nPixelSpace**: The byte offset from the start of one pixel value in the buffer to the start of the next pixel value within a scanline. If defaulted (0) the size of the datatype eBufType is used.
* **nLineSpace**: The byte offset from the start of one scanline in the buffer to the start of the next. If defaulted (0) the size of the datatype eBufType * nBufXSize is used.
* **nCacheSize**: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM)
* **nPageSizeHint**: hint for the page size. Must be a multiple of the system page size, returned by CPLGetPageSize(). Minimum value is generally 4096. Might be set to 0 to let the function determine a default page size.
* **bSingleThreadUsage**: set to TRUE if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. If set to FALSE, CPLVirtualMemDeclareThread() must be called.
* **papszOptions**: NULL terminated list of options. Unused for now.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function rasterbandgetvirtualmem(hBand::Ref{GDALRasterBandH}, eRWFlag::GDALRWFlag, nXOff::Integer, nYOff::Integer, nXSize::Integer, nYSize::Integer, nBufXSize::Integer, nBufYSize::Integer, eBufType::GDALDataType, nPixelSpace::Integer, nLineSpace::Integer, nCacheSize::Csize_t, nPageSizeHint::Csize_t, bSingleThreadUsage::Integer, papszOptions)
    ccall((:GDALRasterBandGetVirtualMem, libgdal), Ptr{CPLVirtualMem}, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, GIntBig, Csize_t, Csize_t, Cint, Ptr{Cstring}), hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions)
end


"""
    GDALGetVirtualMemAuto(GDALRasterBandH hBand,
                          GDALRWFlag eRWFlag,
                          int * pnPixelSpace,
                          GIntBig * pnLineSpace,
                          char ** papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL raster band object.
"""
function getvirtualmemauto(hBand::Ref{GDALRasterBandH}, eRWFlag::GDALRWFlag, pnPixelSpace, pnLineSpace, papszOptions)
    ccall((:GDALGetVirtualMemAuto, libgdal), Ptr{CPLVirtualMem}, (Ptr{Cvoid}, GDALRWFlag, Ptr{Cint}, Ptr{GIntBig}, Ptr{Cstring}), hBand, eRWFlag, pnPixelSpace, pnLineSpace, papszOptions)
end


"""
    GDALDatasetGetTiledVirtualMem(GDALDatasetH hDS,
                                  GDALRWFlag eRWFlag,
                                  int nXOff,
                                  int nYOff,
                                  int nXSize,
                                  int nYSize,
                                  int nTileXSize,
                                  int nTileYSize,
                                  GDALDataType eBufType,
                                  int nBandCount,
                                  int * panBandMap,
                                  GDALTileOrganization eTileOrganization,
                                  size_t nCacheSize,
                                  int bSingleThreadUsage,
                                  char ** papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL dataset object, with tiling organization.

### Parameters
* **hDS**: Dataset object
* **eRWFlag**: Either GF_Read to read a region of data, or GF_Write to write a region of data.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **nTileXSize**: the width of the tiles.
* **nTileYSize**: the height of the tiles.
* **eBufType**: the type of the pixel values in the data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nBandCount**: the number of bands being read or written.
* **panBandMap**: the list of nBandCount band numbers being read/written. Note band numbers are 1 based. This may be NULL to select the first nBandCount bands.
* **eTileOrganization**: tile organization.
* **nCacheSize**: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM)
* **bSingleThreadUsage**: set to TRUE if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. If set to FALSE, CPLVirtualMemDeclareThread() must be called.
* **papszOptions**: NULL terminated list of options. Unused for now.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function datasetgettiledvirtualmem(hDS::Ref{<:GDALDatasetH}, eRWFlag::GDALRWFlag, nXOff::Integer, nYOff::Integer, nXSize::Integer, nYSize::Integer, nTileXSize::Integer, nTileYSize::Integer, eBufType::GDALDataType, nBandCount::Integer, panBandMap, eTileOrganization::GDALTileOrganization, nCacheSize::Csize_t, bSingleThreadUsage::Integer, papszOptions)
    ccall((:GDALDatasetGetTiledVirtualMem, libgdal), Ptr{CPLVirtualMem}, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, GDALTileOrganization, Csize_t, Cint, Ptr{Cstring}), hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nBandCount, panBandMap, eTileOrganization, nCacheSize, bSingleThreadUsage, papszOptions)
end


"""
    GDALRasterBandGetTiledVirtualMem(GDALRasterBandH hBand,
                                     GDALRWFlag eRWFlag,
                                     int nXOff,
                                     int nYOff,
                                     int nXSize,
                                     int nYSize,
                                     int nTileXSize,
                                     int nTileYSize,
                                     GDALDataType eBufType,
                                     size_t nCacheSize,
                                     int bSingleThreadUsage,
                                     char ** papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL rasterband object, with tiling organization.

### Parameters
* **hBand**: Rasterband object
* **eRWFlag**: Either GF_Read to read a region of data, or GF_Write to write a region of data.
* **nXOff**: The pixel offset to the top left corner of the region of the band to be accessed. This would be zero to start from the left side.
* **nYOff**: The line offset to the top left corner of the region of the band to be accessed. This would be zero to start from the top.
* **nXSize**: The width of the region of the band to be accessed in pixels.
* **nYSize**: The height of the region of the band to be accessed in lines.
* **nTileXSize**: the width of the tiles.
* **nTileYSize**: the height of the tiles.
* **eBufType**: the type of the pixel values in the data buffer. The pixel values will automatically be translated to/from the GDALRasterBand data type as needed.
* **nCacheSize**: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM)
* **bSingleThreadUsage**: set to TRUE if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. If set to FALSE, CPLVirtualMemDeclareThread() must be called.
* **papszOptions**: NULL terminated list of options. Unused for now.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function rasterbandgettiledvirtualmem(hBand::Ref{GDALRasterBandH}, eRWFlag::GDALRWFlag, nXOff::Integer, nYOff::Integer, nXSize::Integer, nYSize::Integer, nTileXSize::Integer, nTileYSize::Integer, eBufType::GDALDataType, nCacheSize::Csize_t, bSingleThreadUsage::Integer, papszOptions)
    ccall((:GDALRasterBandGetTiledVirtualMem, libgdal), Ptr{CPLVirtualMem}, (Ptr{Cvoid}, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Csize_t, Cint, Ptr{Cstring}), hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nCacheSize, bSingleThreadUsage, papszOptions)
end


"""
    GDALCreatePansharpenedVRT(const char * pszXML,
                              GDALRasterBandH hPanchroBand,
                              int nInputSpectralBands,
                              GDALRasterBandH * pahInputSpectralBands) -> GDALDatasetH

Create a virtual pansharpened dataset.

### Parameters
* **pszXML**: Pansharpened VRT XML where <SpectralBand> elements have no explicit SourceFilename and SourceBand. The spectral bands in the XML will be assigned the successive values of the pahInputSpectralBands array. Must not be NULL.
* **hPanchroBand**: Panchromatic band. Must not be NULL.
* **nInputSpectralBands**: Number of input spectral bands. Must be greater than zero.
* **pahInputSpectralBands**: Array of nInputSpectralBands spectral bands.

### Returns
NULL on failure, or a new virtual dataset handle on success to be closed with GDALClose().
"""
function createpansharpenedvrt(pszXML, hPanchroBand::Ref{GDALRasterBandH}, nInputSpectralBands::Integer, pahInputSpectralBands)
    failsafe(ccall((:GDALCreatePansharpenedVRT, libgdal), Ptr{GDALDatasetH}, (Cstring, Ptr{Cvoid}, Cint, Ptr{GDALRasterBandH}), pszXML, hPanchroBand, nInputSpectralBands, pahInputSpectralBands))
end


"""
    GDALGetJPEG2000Structure(const char * pszFilename,
                             char ** papszOptions) -> CPLXMLNode *

Dump the structure of a JPEG2000 file as a XML tree.

### Parameters
* **pszFilename**: filename.
* **papszOptions**: NULL terminated list of options, or NULL. Allowed options are BINARY_CONTENT=YES, TEXT_CONTENT=YES, CODESTREAM=YES, ALL=YES.

### Returns
XML tree (to be freed with CPLDestroyXMLNode()) or NULL in case of error
"""
function getjpeg2000structure(pszFilename, papszOptions)
    ccall((:GDALGetJPEG2000Structure, libgdal), Ptr{CPLXMLNode}, (Cstring, Ptr{Cstring}), pszFilename, papszOptions)
end
