# Julia wrapper for header: gdal.h
# Automatically generated using Clang.jl


"""
    GDALGetDataTypeSize(GDALDataType eDataType) -> int

Get data type size in bits.

### Parameters
* **eDataType**: type, such as GDT_Byte.

### Returns
the number of bits or zero if it is not recognised.
"""
function gdalgetdatatypesize(arg1)
    aftercare(ccall((:GDALGetDataTypeSize, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALGetDataTypeSizeBits(GDALDataType eDataType) -> int

Get data type size in bits.

### Parameters
* **eDataType**: type, such as GDT_Byte.

### Returns
the number of bits or zero if it is not recognised.
"""
function gdalgetdatatypesizebits(eDataType)
    aftercare(ccall((:GDALGetDataTypeSizeBits, libgdal), Cint, (GDALDataType,), eDataType))
end

"""
    GDALGetDataTypeSizeBytes(GDALDataType eDataType) -> int

Get data type size in bytes.

### Parameters
* **eDataType**: type, such as GDT_Byte.

### Returns
the number of bytes or zero if it is not recognised.
"""
function gdalgetdatatypesizebytes(arg1)
    aftercare(ccall((:GDALGetDataTypeSizeBytes, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsComplex(GDALDataType eDataType) -> int

Is data type complex?

### Returns
TRUE if the passed type is complex (one of GDT_CInt16, GDT_CInt32, GDT_CFloat32 or GDT_CFloat64), that is it consists of a real and imaginary component.
"""
function gdaldatatypeiscomplex(arg1)
    aftercare(ccall((:GDALDataTypeIsComplex, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsInteger(GDALDataType eDataType) -> int

Is data type integer? (might be complex)

### Returns
TRUE if the passed type is integer (one of GDT_Byte, GDT_Int16, GDT_UInt16, GDT_Int32, GDT_UInt32, GDT_CInt16, GDT_CInt32).
"""
function gdaldatatypeisinteger(arg1)
    aftercare(ccall((:GDALDataTypeIsInteger, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsFloating(GDALDataType eDataType) -> int

Is data type floating? (might be complex)

### Returns
TRUE if the passed type is floating (one of GDT_Float32, GDT_Float64, GDT_CFloat32, GDT_CFloat64)
"""
function gdaldatatypeisfloating(arg1)
    aftercare(ccall((:GDALDataTypeIsFloating, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsSigned(GDALDataType eDataType) -> int

Is data type signed?

### Returns
TRUE if the passed type is signed.
"""
function gdaldatatypeissigned(arg1)
    aftercare(ccall((:GDALDataTypeIsSigned, libgdal), Cint, (GDALDataType,), arg1))
end

"""
    GDALGetDataTypeName(GDALDataType eDataType) -> const char *

Get name of data type.

### Parameters
* **eDataType**: type to get name of.

### Returns
string corresponding to existing data type or NULL pointer if invalid type given.
"""
function gdalgetdatatypename(arg1)
    aftercare(ccall((:GDALGetDataTypeName, libgdal), Cstring, (GDALDataType,), arg1), false)
end

"""
    GDALGetDataTypeByName(const char * pszName) -> GDALDataType

Get data type by symbolic name.

### Parameters
* **pszName**: string containing the symbolic name of the type.

### Returns
GDAL data type.
"""
function gdalgetdatatypebyname(arg1)
    aftercare(ccall((:GDALGetDataTypeByName, libgdal), GDALDataType, (Cstring,), arg1))
end

"""
    GDALDataTypeUnion(GDALDataType eType1,
                      GDALDataType eType2) -> GDALDataType

Return the smallest data type that can fully express both input data types.

### Parameters
* **eType1**: first data type.
* **eType2**: second data type.

### Returns
a data type able to express eType1 and eType2.
"""
function gdaldatatypeunion(arg1, arg2)
    aftercare(ccall((:GDALDataTypeUnion, libgdal), GDALDataType, (GDALDataType, GDALDataType), arg1, arg2))
end

"""
    GDALDataTypeUnionWithValue(GDALDataType eDT,
                               double dValue,
                               int bComplex) -> GDALDataType

Union a data type with the one found for a value.

### Parameters
* **eDT**: the first data type
* **dValue**: the value for which to find a data type and union with eDT
* **bComplex**: if the value is complex

### Returns
a data type able to express eDT and dValue.
"""
function gdaldatatypeunionwithvalue(eDT, dValue, bComplex)
    aftercare(ccall((:GDALDataTypeUnionWithValue, libgdal), GDALDataType, (GDALDataType, Cdouble, Cint), eDT, dValue, bComplex))
end

"""
    GDALFindDataType(int nBits,
                     int bSigned,
                     int bFloating,
                     int bComplex) -> GDALDataType

Finds the smallest data type able to support the given requirements.

### Parameters
* **nBits**: number of bits necessary
* **bSigned**: if negative values are necessary
* **bFloating**: if non-integer values necessary
* **bComplex**: if complex values are necessary

### Returns
a best fit GDALDataType for supporting the requirements
"""
function gdalfinddatatype(nBits, bSigned, bFloating, bComplex)
    aftercare(ccall((:GDALFindDataType, libgdal), GDALDataType, (Cint, Cint, Cint, Cint), nBits, bSigned, bFloating, bComplex))
end

"""
    GDALFindDataTypeForValue(double dValue,
                             int bComplex) -> GDALDataType

Finds the smallest data type able to support the provided value.

### Parameters
* **dValue**: value to support
* **bComplex**: is the value complex

### Returns
a best fit GDALDataType for supporting the value
"""
function gdalfinddatatypeforvalue(dValue, bComplex)
    aftercare(ccall((:GDALFindDataTypeForValue, libgdal), GDALDataType, (Cdouble, Cint), dValue, bComplex))
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
function gdaladjustvaluetodatatype(eDT, dfValue, pbClamped, pbRounded)
    aftercare(ccall((:GDALAdjustValueToDataType, libgdal), Cdouble, (GDALDataType, Cdouble, Ptr{Cint}, Ptr{Cint}), eDT, dfValue, pbClamped, pbRounded))
end

"""
    GDALGetNonComplexDataType(GDALDataType eDataType) -> GDALDataType

Return the base data type for the specified input.

### Parameters
* **eDataType**: type, such as GDT_CFloat32.

### Returns
GDAL data type.
"""
function gdalgetnoncomplexdatatype(arg1)
    aftercare(ccall((:GDALGetNonComplexDataType, libgdal), GDALDataType, (GDALDataType,), arg1))
end

"""
    GDALDataTypeIsConversionLossy(GDALDataType eTypeFrom,
                                  GDALDataType eTypeTo) -> int

Is conversion from eTypeFrom to eTypeTo potentially lossy.

### Parameters
* **eTypeFrom**: input datatype
* **eTypeTo**: output datatype

### Returns
TRUE if conversion from eTypeFrom to eTypeTo potentially lossy.
"""
function gdaldatatypeisconversionlossy(eTypeFrom, eTypeTo)
    aftercare(ccall((:GDALDataTypeIsConversionLossy, libgdal), Cint, (GDALDataType, GDALDataType), eTypeFrom, eTypeTo))
end

"""
    GDALGetAsyncStatusTypeName(GDALAsyncStatusType eAsyncStatusType) -> const char *

Get name of AsyncStatus data type.

### Parameters
* **eAsyncStatusType**: type to get name of.

### Returns
string corresponding to type.
"""
function gdalgetasyncstatustypename(arg1)
    aftercare(ccall((:GDALGetAsyncStatusTypeName, libgdal), Cstring, (GDALAsyncStatusType,), arg1), false)
end

"""
    GDALGetAsyncStatusTypeByName(const char * pszName) -> GDALAsyncStatusType

Get AsyncStatusType by symbolic name.

### Parameters
* **pszName**: string containing the symbolic name of the type.

### Returns
GDAL AsyncStatus type.
"""
function gdalgetasyncstatustypebyname(arg1)
    aftercare(ccall((:GDALGetAsyncStatusTypeByName, libgdal), GDALAsyncStatusType, (Cstring,), arg1))
end

"""
    GDALGetColorInterpretationName(GDALColorInterp eInterp) -> const char *

Get name of color interpretation.

### Parameters
* **eInterp**: color interpretation to get name of.

### Returns
string corresponding to color interpretation or NULL pointer if invalid enumerator given.
"""
function gdalgetcolorinterpretationname(arg1)
    aftercare(ccall((:GDALGetColorInterpretationName, libgdal), Cstring, (GDALColorInterp,), arg1), false)
end

"""
    GDALGetColorInterpretationByName(const char * pszName) -> GDALColorInterp

Get color interpretation by symbolic name.

### Parameters
* **pszName**: string containing the symbolic name of the color interpretation.

### Returns
GDAL color interpretation.
"""
function gdalgetcolorinterpretationbyname(pszName)
    aftercare(ccall((:GDALGetColorInterpretationByName, libgdal), GDALColorInterp, (Cstring,), pszName))
end

"""
    GDALGetPaletteInterpretationName(GDALPaletteInterp eInterp) -> const char *

Get name of palette interpretation.

### Parameters
* **eInterp**: palette interpretation to get name of.

### Returns
string corresponding to palette interpretation.
"""
function gdalgetpaletteinterpretationname(arg1)
    aftercare(ccall((:GDALGetPaletteInterpretationName, libgdal), Cstring, (GDALPaletteInterp,), arg1), false)
end

"""
    GDALAllRegister() -> void

Register all known configured GDAL drivers.
"""
function gdalallregister()
    aftercare(ccall((:GDALAllRegister, libgdal), Cvoid, ()))
end

"""
    GDALCreate(GDALDriverH hDriver,
               const char * pszFilename,
               int nXSize,
               int nYSize,
               int nBands,
               GDALDataType eBandType,
               CSLConstList papszOptions) -> GDALDatasetH

Create a new dataset with this driver.
"""
function gdalcreate(hDriver, arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:GDALCreate, libgdal), GDALDatasetH, (GDALDriverH, Cstring, Cint, Cint, Cint, GDALDataType, CSLConstList), hDriver, arg1, arg2, arg3, arg4, arg5, arg6))
end

"""
    GDALCreateCopy(GDALDriverH hDriver,
                   const char * pszFilename,
                   GDALDatasetH hSrcDS,
                   int bStrict,
                   CSLConstList papszOptions,
                   GDALProgressFunc pfnProgress,
                   void * pProgressData) -> GDALDatasetH

Create a copy of a dataset.
"""
function gdalcreatecopy(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    aftercare(ccall((:GDALCreateCopy, libgdal), GDALDatasetH, (GDALDriverH, Cstring, GDALDatasetH, Cint, CSLConstList, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7))
end

"""
    GDALIdentifyDriver(const char * pszFilename,
                       CSLConstList papszFileList) -> GDALDriverH

Identify the driver that can open a raster file.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset.
* **papszFileList**: an array of strings, whose last element is the NULL pointer. These strings are filenames that are auxiliary to the main filename. The passed value may be NULL.

### Returns
A GDALDriverH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDriver *.
"""
function gdalidentifydriver(pszFilename, papszFileList)
    aftercare(ccall((:GDALIdentifyDriver, libgdal), GDALDriverH, (Cstring, CSLConstList), pszFilename, papszFileList))
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
function gdalidentifydriverex(pszFilename, nIdentifyFlags, papszAllowedDrivers, papszFileList)
    aftercare(ccall((:GDALIdentifyDriverEx, libgdal), GDALDriverH, (Cstring, UInt32, Ptr{Cstring}, Ptr{Cstring}), pszFilename, nIdentifyFlags, papszAllowedDrivers, papszFileList))
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
function gdalopen(pszFilename, eAccess)
    aftercare(ccall((:GDALOpen, libgdal), GDALDatasetH, (Cstring, GDALAccess), pszFilename, eAccess))
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
function gdalopenshared(arg1, arg2)
    aftercare(ccall((:GDALOpenShared, libgdal), GDALDatasetH, (Cstring, GDALAccess), arg1, arg2))
end

"""
    GDALOpenEx(const char * pszFilename,
               unsigned int nOpenFlags,
               const char *const * papszAllowedDrivers,
               const char *const * papszOpenOptions,
               const char *const * papszSiblingFiles) -> GDALDatasetH

Open a raster or vector file as a GDALDataset.

### Parameters
* **pszFilename**: the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset. It should be in UTF-8 encoding.
* **nOpenFlags**: a combination of GDAL_OF_ flags that may be combined through logical or operator. 

Driver kind: GDAL_OF_RASTER for raster drivers, GDAL_OF_VECTOR for vector drivers, GDAL_OF_GNM for Geographic Network Model drivers. If none of the value is specified, all kinds are implied. 


Access mode: GDAL_OF_READONLY (exclusive)or GDAL_OF_UPDATE. 


Shared mode: GDAL_OF_SHARED. If set, it allows the sharing of GDALDataset handles for a dataset with other callers that have set GDAL_OF_SHARED. In particular, GDALOpenEx() will first consult its list of currently open and shared GDALDataset's, and if the GetDescription() name for one exactly matches the pszFilename passed to GDALOpenEx() it will be referenced and returned, if GDALOpenEx() is called from the same thread. 


Verbose error: GDAL_OF_VERBOSE_ERROR. If set, a failed attempt to open the file will lead to an error message to be reported.
* **papszAllowedDrivers**: NULL to consider all candidate drivers, or a NULL terminated list of strings with the driver short names that must be considered.
* **papszOpenOptions**: NULL, or a NULL terminated list of strings with open options passed to candidate drivers. An option exists for all drivers, OVERVIEW_LEVEL=level, to select a particular overview level of a dataset. The level index starts at 0. The level number can be suffixed by "only" to specify that only this overview level must be visible, and not sub-levels. Open options are validated by default, and a warning is emitted in case the option is not recognized. In some scenarios, it might be not desirable (e.g. when not knowing which driver will open the file), so the special open option VALIDATE_OPEN_OPTIONS can be set to NO to avoid such warnings. Alternatively, since GDAL 2.1, an option name can be preceded by the @ character to indicate that it may not cause a warning if the driver doesn't declare this option.
* **papszSiblingFiles**: NULL, or a NULL terminated list of strings that are filenames that are auxiliary to the main filename. If NULL is passed, a probing of the file system will be done.

### Returns
A GDALDatasetH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDataset *.
"""
function gdalopenex(pszFilename, nOpenFlags, papszAllowedDrivers, papszOpenOptions, papszSiblingFiles)
    aftercare(ccall((:GDALOpenEx, libgdal), GDALDatasetH, (Cstring, UInt32, Ptr{Cstring}, Ptr{Cstring}, Ptr{Cstring}), pszFilename, nOpenFlags, papszAllowedDrivers, papszOpenOptions, papszSiblingFiles))
end

"""
    GDALDumpOpenDatasets(FILE * fp) -> int

List open datasets.
"""
function gdaldumpopendatasets(arg1)
    aftercare(ccall((:GDALDumpOpenDatasets, libgdal), Cint, (Ptr{Cint},), arg1))
end

"""
    GDALGetDriverByName(const char * pszName) -> GDALDriverH

Fetch a driver based on the short name.
"""
function gdalgetdriverbyname(arg1)
    aftercare(ccall((:GDALGetDriverByName, libgdal), GDALDriverH, (Cstring,), arg1))
end

"""
    GDALGetDriverCount() -> int

Fetch the number of registered drivers.
"""
function gdalgetdrivercount()
    aftercare(ccall((:GDALGetDriverCount, libgdal), Cint, ()))
end

"""
    GDALGetDriver(int iDriver) -> GDALDriverH

Fetch driver by index.
"""
function gdalgetdriver(arg1)
    aftercare(ccall((:GDALGetDriver, libgdal), GDALDriverH, (Cint,), arg1))
end

"""
    GDALCreateDriver() -> GDALDriverH

Create a GDALDriver.
"""
function gdalcreatedriver()
    aftercare(ccall((:GDALCreateDriver, libgdal), GDALDriverH, ()))
end

"""
    GDALDestroyDriver(GDALDriverH hDriver) -> void

Destroy a GDALDriver.

### Parameters
* **hDriver**: the driver to destroy.
"""
function gdaldestroydriver(arg1)
    aftercare(ccall((:GDALDestroyDriver, libgdal), Cvoid, (GDALDriverH,), arg1))
end

"""
    GDALRegisterDriver(GDALDriverH hDriver) -> int

Register a driver for use.
"""
function gdalregisterdriver(arg1)
    aftercare(ccall((:GDALRegisterDriver, libgdal), Cint, (GDALDriverH,), arg1))
end

"""
    GDALDeregisterDriver(GDALDriverH hDriver) -> void

Deregister the passed driver.
"""
function gdalderegisterdriver(arg1)
    aftercare(ccall((:GDALDeregisterDriver, libgdal), Cvoid, (GDALDriverH,), arg1))
end

"""
    GDALDestroyDriverManager(void) -> void

Destroy the driver manager.
"""
function gdaldestroydrivermanager()
    aftercare(ccall((:GDALDestroyDriverManager, libgdal), Cvoid, ()))
end

"""
    GDALDestroy(void) -> void
"""
function gdaldestroy()
    aftercare(ccall((:GDALDestroy, libgdal), Cvoid, ()))
end

"""
    GDALDeleteDataset(GDALDriverH hDriver,
                      const char * pszFilename) -> CPLErr

Delete named dataset.
"""
function gdaldeletedataset(arg1, arg2)
    aftercare(ccall((:GDALDeleteDataset, libgdal), CPLErr, (GDALDriverH, Cstring), arg1, arg2))
end

"""
    GDALRenameDataset(GDALDriverH hDriver,
                      const char * pszNewName,
                      const char * pszOldName) -> CPLErr

Rename a dataset.
"""
function gdalrenamedataset(arg1, pszNewName, pszOldName)
    aftercare(ccall((:GDALRenameDataset, libgdal), CPLErr, (GDALDriverH, Cstring, Cstring), arg1, pszNewName, pszOldName))
end

"""
    GDALCopyDatasetFiles(GDALDriverH hDriver,
                         const char * pszNewName,
                         const char * pszOldName) -> CPLErr

Copy the files of a dataset.
"""
function gdalcopydatasetfiles(arg1, pszNewName, pszOldName)
    aftercare(ccall((:GDALCopyDatasetFiles, libgdal), CPLErr, (GDALDriverH, Cstring, Cstring), arg1, pszNewName, pszOldName))
end

"""
    GDALValidateCreationOptions(GDALDriverH hDriver,
                                CSLConstList papszCreationOptions) -> int

Validate the list of creation options that are handled by a driver.

### Parameters
* **hDriver**: the handle of the driver with whom the lists of creation option must be validated
* **papszCreationOptions**: the list of creation options. An array of strings, whose last element is a NULL pointer

### Returns
TRUE if the list of creation options is compatible with the Create() and CreateCopy() method of the driver, FALSE otherwise.
"""
function gdalvalidatecreationoptions(arg1, papszCreationOptions)
    aftercare(ccall((:GDALValidateCreationOptions, libgdal), Cint, (GDALDriverH, CSLConstList), arg1, papszCreationOptions))
end

"""
    GDALGetDriverShortName(GDALDriverH hDriver) -> const char *

Return the short name of a driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
the short name of the driver. The returned string should not be freed and is owned by the driver.
"""
function gdalgetdrivershortname(arg1)
    aftercare(ccall((:GDALGetDriverShortName, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

"""
    GDALGetDriverLongName(GDALDriverH hDriver) -> const char *

Return the long name of a driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
the long name of the driver or empty string. The returned string should not be freed and is owned by the driver.
"""
function gdalgetdriverlongname(arg1)
    aftercare(ccall((:GDALGetDriverLongName, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

"""
    GDALGetDriverHelpTopic(GDALDriverH hDriver) -> const char *

Return the URL to the help that describes the driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
the URL to the help that describes the driver or NULL. The returned string should not be freed and is owned by the driver.
"""
function gdalgetdriverhelptopic(arg1)
    aftercare(ccall((:GDALGetDriverHelpTopic, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

"""
    GDALGetDriverCreationOptionList(GDALDriverH hDriver) -> const char *

Return the list of creation options of the driver.

### Parameters
* **hDriver**: the handle of the driver

### Returns
an XML string that describes the list of creation options or empty string. The returned string should not be freed and is owned by the driver.
"""
function gdalgetdrivercreationoptionlist(arg1)
    aftercare(ccall((:GDALGetDriverCreationOptionList, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

"""
    GDALInitGCPs(int nCount,
                 GDAL_GCP * psGCP) -> void

Initialize an array of GCPs.

### Parameters
* **nCount**: number of GCPs in psGCP
* **psGCP**: array of GCPs of size nCount.
"""
function gdalinitgcps(arg1, arg2)
    aftercare(ccall((:GDALInitGCPs, libgdal), Cvoid, (Cint, Ptr{GDAL_GCP}), arg1, arg2))
end

"""
    GDALDeinitGCPs(int nCount,
                   GDAL_GCP * psGCP) -> void

De-initialize an array of GCPs (initialized with GDALInitGCPs())

### Parameters
* **nCount**: number of GCPs in psGCP
* **psGCP**: array of GCPs of size nCount.
"""
function gdaldeinitgcps(arg1, arg2)
    aftercare(ccall((:GDALDeinitGCPs, libgdal), Cvoid, (Cint, Ptr{GDAL_GCP}), arg1, arg2))
end

"""
    GDALDuplicateGCPs(int nCount,
                      const GDAL_GCP * pasGCPList) -> GDAL_GCP *

Duplicate an array of GCPs.

### Parameters
* **nCount**: number of GCPs in psGCP
* **pasGCPList**: array of GCPs of size nCount.
"""
function gdalduplicategcps(arg1, arg2)
    aftercare(ccall((:GDALDuplicateGCPs, libgdal), Ptr{GDAL_GCP}, (Cint, Ptr{GDAL_GCP}), arg1, arg2))
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
function gdalgcpstogeotransform(nGCPCount, pasGCPs, padfGeoTransform, bApproxOK)
    aftercare(ccall((:GDALGCPsToGeoTransform, libgdal), Cint, (Cint, Ptr{GDAL_GCP}, Ptr{Cdouble}, Cint), nGCPCount, pasGCPs, padfGeoTransform, bApproxOK))
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
function gdalinvgeotransform(padfGeoTransformIn, padfInvGeoTransformOut)
    aftercare(ccall((:GDALInvGeoTransform, libgdal), Cint, (Ptr{Cdouble}, Ptr{Cdouble}), padfGeoTransformIn, padfInvGeoTransformOut))
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
function gdalapplygeotransform(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALApplyGeoTransform, libgdal), Cvoid, (Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALComposeGeoTransforms(const double * padfGT1,
                             const double * padfGT2,
                             double * padfGTOut) -> void

Compose two geotransforms.

### Parameters
* **padfGT1**: the first geotransform, six values.
* **padfGT2**: the second geotransform, six values.
* **padfGTOut**: the output geotransform, six values, may safely be the same array as padfGT1 or padfGT2.
"""
function gdalcomposegeotransforms(padfGeoTransform1, padfGeoTransform2, padfGeoTransformOut)
    aftercare(ccall((:GDALComposeGeoTransforms, libgdal), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), padfGeoTransform1, padfGeoTransform2, padfGeoTransformOut))
end

"""
    GDALGetMetadataDomainList(GDALMajorObjectH hObject) -> char **

Fetch list of metadata domains.
"""
function gdalgetmetadatadomainlist(hObject)
    aftercare(ccall((:GDALGetMetadataDomainList, libgdal), Ptr{Cstring}, (GDALMajorObjectH,), hObject))
end

"""
    GDALGetMetadata(GDALMajorObjectH hObject,
                    const char * pszDomain) -> char **

Fetch metadata.
"""
function gdalgetmetadata(arg1, arg2)
    aftercare(ccall((:GDALGetMetadata, libgdal), Ptr{Cstring}, (GDALMajorObjectH, Cstring), arg1, arg2))
end

"""
    GDALSetMetadata(GDALMajorObjectH hObject,
                    CSLConstList papszMD,
                    const char * pszDomain) -> CPLErr

Set metadata.
"""
function gdalsetmetadata(arg1, arg2, arg3)
    aftercare(ccall((:GDALSetMetadata, libgdal), CPLErr, (GDALMajorObjectH, CSLConstList, Cstring), arg1, arg2, arg3))
end

"""
    GDALGetMetadataItem(GDALMajorObjectH hObject,
                        const char * pszName,
                        const char * pszDomain) -> const char *

Fetch single metadata item.
"""
function gdalgetmetadataitem(arg1, arg2, arg3)
    aftercare(ccall((:GDALGetMetadataItem, libgdal), Cstring, (GDALMajorObjectH, Cstring, Cstring), arg1, arg2, arg3), false)
end

"""
    GDALSetMetadataItem(GDALMajorObjectH hObject,
                        const char * pszName,
                        const char * pszValue,
                        const char * pszDomain) -> CPLErr

Set single metadata item.
"""
function gdalsetmetadataitem(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALSetMetadataItem, libgdal), CPLErr, (GDALMajorObjectH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4))
end

"""
    GDALGetDescription(GDALMajorObjectH hObject) -> const char *

Fetch object description.
"""
function gdalgetdescription(arg1)
    aftercare(ccall((:GDALGetDescription, libgdal), Cstring, (GDALMajorObjectH,), arg1), false)
end

"""
    GDALSetDescription(GDALMajorObjectH hObject,
                       const char * pszNewDesc) -> void

Set object description.
"""
function gdalsetdescription(arg1, arg2)
    aftercare(ccall((:GDALSetDescription, libgdal), Cvoid, (GDALMajorObjectH, Cstring), arg1, arg2))
end

"""
    GDALGetDatasetDriver(GDALDatasetH hDataset) -> GDALDriverH

Fetch the driver to which this dataset relates.
"""
function gdalgetdatasetdriver(arg1)
    aftercare(ccall((:GDALGetDatasetDriver, libgdal), GDALDriverH, (GDALDatasetH,), arg1))
end

"""
    GDALGetFileList(GDALDatasetH hDS) -> char **

Fetch files forming dataset.
"""
function gdalgetfilelist(arg1)
    aftercare(ccall((:GDALGetFileList, libgdal), Ptr{Cstring}, (GDALDatasetH,), arg1))
end

"""
    GDALClose(GDALDatasetH hDS) -> void

Close GDAL dataset.

### Parameters
* **hDS**: The dataset to close. May be cast from a "GDALDataset *".
"""
function gdalclose(arg1)
    aftercare(ccall((:GDALClose, libgdal), Cvoid, (GDALDatasetH,), arg1))
end

"""
    GDALGetRasterXSize(GDALDatasetH hDataset) -> int

Fetch raster width in pixels.
"""
function gdalgetrasterxsize(arg1)
    aftercare(ccall((:GDALGetRasterXSize, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALGetRasterYSize(GDALDatasetH hDataset) -> int

Fetch raster height in pixels.
"""
function gdalgetrasterysize(arg1)
    aftercare(ccall((:GDALGetRasterYSize, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALGetRasterCount(GDALDatasetH hDS) -> int

Fetch the number of raster bands on this dataset.
"""
function gdalgetrastercount(arg1)
    aftercare(ccall((:GDALGetRasterCount, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALGetRasterBand(GDALDatasetH hDS,
                      int nBandId) -> GDALRasterBandH

Fetch a band object for a dataset.
"""
function gdalgetrasterband(arg1, arg2)
    aftercare(ccall((:GDALGetRasterBand, libgdal), GDALRasterBandH, (GDALDatasetH, Cint), arg1, arg2))
end

"""
    GDALAddBand(GDALDatasetH hDataset,
                GDALDataType eType,
                CSLConstList papszOptions) -> CPLErr

Add a band to a dataset.
"""
function gdaladdband(hDS, eType, papszOptions)
    aftercare(ccall((:GDALAddBand, libgdal), CPLErr, (GDALDatasetH, GDALDataType, CSLConstList), hDS, eType, papszOptions))
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
                         CSLConstList papszOptions) -> GDALAsyncReaderH

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
function gdalbeginasyncreader(hDS, nXOff, nYOff, nXSize, nYSize, pBuf, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, papszOptions)
    aftercare(ccall((:GDALBeginAsyncReader, libgdal), GDALAsyncReaderH, (GDALDatasetH, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint, CSLConstList), hDS, nXOff, nYOff, nXSize, nYSize, pBuf, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, papszOptions))
end

"""
    GDALEndAsyncReader(GDALDatasetH hDS,
                       GDALAsyncReaderH hAsyncReaderH) -> void

End asynchronous request.

### Parameters
* **hDS**: handle to the dataset object.
* **hAsyncReaderH**: handle returned by GDALBeginAsyncReader()
"""
function gdalendasyncreader(hDS, hAsynchReaderH)
    aftercare(ccall((:GDALEndAsyncReader, libgdal), Cvoid, (GDALDatasetH, GDALAsyncReaderH), hDS, hAsynchReaderH))
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
function gdaldatasetrasterio(hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace)
    aftercare(ccall((:GDALDatasetRasterIO, libgdal), CPLErr, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint), hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace))
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
function gdaldatasetrasterioex(hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace, psExtraArg)
    aftercare(ccall((:GDALDatasetRasterIOEx, libgdal), CPLErr, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, GSpacing, GSpacing, GSpacing, Ptr{GDALRasterIOExtraArg}), hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace, psExtraArg))
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
                          CSLConstList papszOptions) -> CPLErr

Advise driver of upcoming read requests.
"""
function gdaldatasetadviseread(hDS, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, papszOptions)
    aftercare(ccall((:GDALDatasetAdviseRead, libgdal), CPLErr, (GDALDatasetH, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, CSLConstList), hDS, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, papszOptions))
end

"""
    GDALGetProjectionRef(GDALDatasetH hDS) -> const char *

Fetch the projection definition string for this dataset.
"""
function gdalgetprojectionref(arg1)
    aftercare(ccall((:GDALGetProjectionRef, libgdal), Cstring, (GDALDatasetH,), arg1), false)
end

"""
    GDALGetSpatialRef(GDALDatasetH hDS) -> OGRSpatialReferenceH

Fetch the spatial reference for this dataset.
"""
function gdalgetspatialref(arg1)
    aftercare(ccall((:GDALGetSpatialRef, libgdal), OGRSpatialReferenceH, (GDALDatasetH,), arg1))
end

"""
    GDALSetProjection(GDALDatasetH hDS,
                      const char * pszProjection) -> CPLErr

Set the projection reference string for this dataset.
"""
function gdalsetprojection(arg1, arg2)
    aftercare(ccall((:GDALSetProjection, libgdal), CPLErr, (GDALDatasetH, Cstring), arg1, arg2))
end

"""
    GDALSetSpatialRef(GDALDatasetH hDS,
                      OGRSpatialReferenceH hSRS) -> CPLErr

Set the spatial reference system for this dataset.
"""
function gdalsetspatialref(arg1, arg2)
    aftercare(ccall((:GDALSetSpatialRef, libgdal), CPLErr, (GDALDatasetH, OGRSpatialReferenceH), arg1, arg2))
end

"""
    GDALGetGeoTransform(GDALDatasetH hDS,
                        double * padfTransform) -> CPLErr

Fetch the affine transformation coefficients.
"""
function gdalgetgeotransform(arg1, arg2)
    aftercare(ccall((:GDALGetGeoTransform, libgdal), CPLErr, (GDALDatasetH, Ptr{Cdouble}), arg1, arg2))
end

"""
    GDALSetGeoTransform(GDALDatasetH hDS,
                        double * padfTransform) -> CPLErr

Set the affine transformation coefficients.
"""
function gdalsetgeotransform(arg1, arg2)
    aftercare(ccall((:GDALSetGeoTransform, libgdal), CPLErr, (GDALDatasetH, Ptr{Cdouble}), arg1, arg2))
end

"""
    GDALGetGCPCount(GDALDatasetH hDS) -> int

Get number of GCPs.
"""
function gdalgetgcpcount(arg1)
    aftercare(ccall((:GDALGetGCPCount, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALGetGCPProjection(GDALDatasetH hDS) -> const char *

Get output projection for GCPs.
"""
function gdalgetgcpprojection(arg1)
    aftercare(ccall((:GDALGetGCPProjection, libgdal), Cstring, (GDALDatasetH,), arg1), false)
end

"""
    GDALGetGCPSpatialRef(GDALDatasetH hDS) -> OGRSpatialReferenceH

Get output spatial reference system for GCPs.
"""
function gdalgetgcpspatialref(arg1)
    aftercare(ccall((:GDALGetGCPSpatialRef, libgdal), OGRSpatialReferenceH, (GDALDatasetH,), arg1))
end

"""
    GDALGetGCPs(GDALDatasetH hDS) -> const GDAL_GCP *

Fetch GCPs.
"""
function gdalgetgcps(arg1)
    aftercare(ccall((:GDALGetGCPs, libgdal), Ptr{GDAL_GCP}, (GDALDatasetH,), arg1))
end

"""
    GDALSetGCPs(GDALDatasetH hDS,
                int nGCPCount,
                const GDAL_GCP * pasGCPList,
                const char * pszGCPProjection) -> CPLErr

Assign GCPs.
"""
function gdalsetgcps(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALSetGCPs, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{GDAL_GCP}, Cstring), arg1, arg2, arg3, arg4))
end

"""
    GDALSetGCPs2(GDALDatasetH hDS,
                 int nGCPCount,
                 const GDAL_GCP * pasGCPList,
                 OGRSpatialReferenceH hSRS) -> CPLErr

Assign GCPs.
"""
function gdalsetgcps2(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALSetGCPs2, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{GDAL_GCP}, OGRSpatialReferenceH), arg1, arg2, arg3, arg4))
end

"""
    GDALGetInternalHandle(GDALDatasetH hDS,
                          const char * pszRequest) -> void *

Fetch a format specific internally meaningful handle.
"""
function gdalgetinternalhandle(arg1, arg2)
    aftercare(ccall((:GDALGetInternalHandle, libgdal), Ptr{Cvoid}, (GDALDatasetH, Cstring), arg1, arg2))
end

"""
    GDALReferenceDataset(GDALDatasetH hDataset) -> int

Add one to dataset reference count.
"""
function gdalreferencedataset(arg1)
    aftercare(ccall((:GDALReferenceDataset, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALDereferenceDataset(GDALDatasetH hDataset) -> int

Subtract one from dataset reference count.
"""
function gdaldereferencedataset(arg1)
    aftercare(ccall((:GDALDereferenceDataset, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""
    GDALReleaseDataset(GDALDatasetH hDataset) -> int

Drop a reference to this object, and destroy if no longer referenced.
"""
function gdalreleasedataset(arg1)
    aftercare(ccall((:GDALReleaseDataset, libgdal), Cint, (GDALDatasetH,), arg1))
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
function gdalbuildoverviews(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    aftercare(ccall((:GDALBuildOverviews, libgdal), CPLErr, (GDALDatasetH, Cstring, Cint, Ptr{Cint}, Cint, Ptr{Cint}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8))
end

"""
    GDALGetOpenDatasets(GDALDatasetH ** ppahDSList,
                        int * pnCount) -> void

Fetch all open GDAL dataset handles.
"""
function gdalgetopendatasets(hDS, pnCount)
    aftercare(ccall((:GDALGetOpenDatasets, libgdal), Cvoid, (Ptr{Ptr{GDALDatasetH}}, Ptr{Cint}), hDS, pnCount))
end

"""
    GDALGetAccess(GDALDatasetH hDS) -> int

Return access flag.
"""
function gdalgetaccess(hDS)
    aftercare(ccall((:GDALGetAccess, libgdal), Cint, (GDALDatasetH,), hDS))
end

"""
    GDALFlushCache(GDALDatasetH hDS) -> void

Flush all write cached data to disk.
"""
function gdalflushcache(hDS)
    aftercare(ccall((:GDALFlushCache, libgdal), Cvoid, (GDALDatasetH,), hDS))
end

"""
    GDALCreateDatasetMaskBand(GDALDatasetH hDS,
                              int nFlags) -> CPLErr

Adds a mask band to the dataset.
"""
function gdalcreatedatasetmaskband(hDS, nFlags)
    aftercare(ccall((:GDALCreateDatasetMaskBand, libgdal), CPLErr, (GDALDatasetH, Cint), hDS, nFlags))
end

"""
    GDALDatasetCopyWholeRaster(GDALDatasetH hSrcDS,
                               GDALDatasetH hDstDS,
                               CSLConstList papszOptions,
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
function gdaldatasetcopywholeraster(hSrcDS, hDstDS, papszOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALDatasetCopyWholeRaster, libgdal), CPLErr, (GDALDatasetH, GDALDatasetH, CSLConstList, GDALProgressFunc, Ptr{Cvoid}), hSrcDS, hDstDS, papszOptions, pfnProgress, pProgressData))
end

"""
    GDALRasterBandCopyWholeRaster(GDALRasterBandH hSrcBand,
                                  GDALRasterBandH hDstBand,
                                  const char *const *const papszOptions,
                                  GDALProgressFunc pfnProgress,
                                  void * pProgressData) -> CPLErr

Copy a whole raster band.

### Parameters
* **hSrcBand**: the source band
* **hDstBand**: the destination band
* **papszOptions**: transfer hints in "StringList" Name=Value format.
* **pfnProgress**: progress reporting function.
* **pProgressData**: callback data for progress function.

### Returns
CE_None on success, or CE_Failure on failure.
"""
function gdalrasterbandcopywholeraster(hSrcBand, hDstBand, constpapszOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALRasterBandCopyWholeRaster, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hDstBand, constpapszOptions, pfnProgress, pProgressData))
end

"""
    GDALRegenerateOverviews(GDALRasterBandH hSrcBand,
                            int nOverviewCount,
                            GDALRasterBandH * pahOvrBands,
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
function gdalregenerateoverviews(hSrcBand, nOverviewCount, pahOverviewBands, pszResampling, pfnProgress, pProgressData)
    aftercare(ccall((:GDALRegenerateOverviews, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{GDALRasterBandH}, Cstring, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, nOverviewCount, pahOverviewBands, pszResampling, pfnProgress, pProgressData))
end

"""
    GDALDatasetGetLayerCount(GDALDatasetH hDS) -> int

Get the number of layers in this dataset.

### Parameters
* **hDS**: the dataset handle.

### Returns
layer count.
"""
function gdaldatasetgetlayercount(arg1)
    aftercare(ccall((:GDALDatasetGetLayerCount, libgdal), Cint, (GDALDatasetH,), arg1))
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
function gdaldatasetgetlayer(arg1, arg2)
    aftercare(ccall((:GDALDatasetGetLayer, libgdal), OGRLayerH, (GDALDatasetH, Cint), arg1, arg2))
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
function gdaldatasetgetlayerbyname(arg1, arg2)
    aftercare(ccall((:GDALDatasetGetLayerByName, libgdal), OGRLayerH, (GDALDatasetH, Cstring), arg1, arg2))
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
function gdaldatasetdeletelayer(arg1, arg2)
    aftercare(ccall((:GDALDatasetDeleteLayer, libgdal), OGRErr, (GDALDatasetH, Cint), arg1, arg2))
end

"""
    GDALDatasetCreateLayer(GDALDatasetH hDS,
                           const char * pszName,
                           OGRSpatialReferenceH hSpatialRef,
                           OGRwkbGeometryType eGType,
                           CSLConstList papszOptions) -> OGRLayerH

This function attempts to create a new layer on the dataset with the indicated name, coordinate system, geometry type.

### Parameters
* **hDS**: the dataset handle
* **pszName**: the name for the new layer. This should ideally not match any existing layer on the datasource.
* **hSpatialRef**: the coordinate system to use for the new layer, or NULL if no coordinate system is available. The driver might only increase the reference counter of the object to take ownership, and not make a full copy, so do not use OSRDestroySpatialReference(), but OSRRelease() instead when you are done with the object.
* **eGType**: the geometry type for the layer. Use wkbUnknown if there are no constraints on the types geometry to be written.
* **papszOptions**: a StringList of name=value options. Options are driver specific.

### Returns
NULL is returned on failure, or a new OGRLayer handle on success.
"""
function gdaldatasetcreatelayer(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALDatasetCreateLayer, libgdal), OGRLayerH, (GDALDatasetH, Cstring, OGRSpatialReferenceH, OGRwkbGeometryType, CSLConstList), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALDatasetCopyLayer(GDALDatasetH hDS,
                         OGRLayerH hSrcLayer,
                         const char * pszNewName,
                         CSLConstList papszOptions) -> OGRLayerH

Duplicate an existing layer.

### Parameters
* **hDS**: the dataset handle.
* **hSrcLayer**: source layer.
* **pszNewName**: the name of the layer to create.
* **papszOptions**: a StringList of name=value options. Options are driver specific.

### Returns
a handle to the layer, or NULL if an error occurs.
"""
function gdaldatasetcopylayer(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALDatasetCopyLayer, libgdal), OGRLayerH, (GDALDatasetH, OGRLayerH, Cstring, CSLConstList), arg1, arg2, arg3, arg4))
end

"""
    GDALDatasetResetReading(GDALDatasetH hDS) -> void

Reset feature reading to start on the first feature.

### Parameters
* **hDS**: dataset handle
"""
function gdaldatasetresetreading(arg1)
    aftercare(ccall((:GDALDatasetResetReading, libgdal), Cvoid, (GDALDatasetH,), arg1))
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
function gdaldatasetgetnextfeature(hDS, phBelongingLayer, pdfProgressPct, pfnProgress, pProgressData)
    aftercare(ccall((:GDALDatasetGetNextFeature, libgdal), OGRFeatureH, (GDALDatasetH, Ptr{OGRLayerH}, Ptr{Cdouble}, GDALProgressFunc, Ptr{Cvoid}), hDS, phBelongingLayer, pdfProgressPct, pfnProgress, pProgressData))
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
function gdaldatasettestcapability(arg1, arg2)
    aftercare(ccall((:GDALDatasetTestCapability, libgdal), Cint, (GDALDatasetH, Cstring), arg1, arg2))
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
an OGRLayer containing the results of the query. Deallocate with GDALDatasetReleaseResultSet().
"""
function gdaldatasetexecutesql(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALDatasetExecuteSQL, libgdal), OGRLayerH, (GDALDatasetH, Cstring, OGRGeometryH, Cstring), arg1, arg2, arg3, arg4))
end

"""
    GDALDatasetAbortSQL(GDALDatasetH hDS) -> OGRErr

Abort any SQL statement running in the data store.

### Parameters
* **hDS**: the dataset handle.

### Returns
OGRERR_NONE on success, or OGRERR_UNSUPPORTED_OPERATION if AbortSQL is not supported for this datasource. .
"""
function gdaldatasetabortsql(arg1)
    aftercare(ccall((:GDALDatasetAbortSQL, libgdal), OGRErr, (GDALDatasetH,), arg1))
end

"""
    GDALDatasetReleaseResultSet(GDALDatasetH hDS,
                                OGRLayerH hLayer) -> void

Release results of ExecuteSQL().

### Parameters
* **hDS**: the dataset handle.
* **hLayer**: the result of a previous ExecuteSQL() call.
"""
function gdaldatasetreleaseresultset(arg1, arg2)
    aftercare(ccall((:GDALDatasetReleaseResultSet, libgdal), Cvoid, (GDALDatasetH, OGRLayerH), arg1, arg2))
end

"""
    GDALDatasetGetStyleTable(GDALDatasetH hDS) -> OGRStyleTableH

Returns dataset style table.

### Parameters
* **hDS**: the dataset handle

### Returns
handle to a style table which should not be modified or freed by the caller.
"""
function gdaldatasetgetstyletable(arg1)
    aftercare(ccall((:GDALDatasetGetStyleTable, libgdal), OGRStyleTableH, (GDALDatasetH,), arg1))
end

"""
    GDALDatasetSetStyleTableDirectly(GDALDatasetH hDS,
                                     OGRStyleTableH hStyleTable) -> void

Set dataset style table.

### Parameters
* **hDS**: the dataset handle
* **hStyleTable**: style table handle to set
"""
function gdaldatasetsetstyletabledirectly(arg1, arg2)
    aftercare(ccall((:GDALDatasetSetStyleTableDirectly, libgdal), Cvoid, (GDALDatasetH, OGRStyleTableH), arg1, arg2))
end

"""
    GDALDatasetSetStyleTable(GDALDatasetH hDS,
                             OGRStyleTableH hStyleTable) -> void

Set dataset style table.

### Parameters
* **hDS**: the dataset handle
* **hStyleTable**: style table handle to set
"""
function gdaldatasetsetstyletable(arg1, arg2)
    aftercare(ccall((:GDALDatasetSetStyleTable, libgdal), Cvoid, (GDALDatasetH, OGRStyleTableH), arg1, arg2))
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
function gdaldatasetstarttransaction(hDS, bForce)
    aftercare(ccall((:GDALDatasetStartTransaction, libgdal), OGRErr, (GDALDatasetH, Cint), hDS, bForce))
end

"""
    GDALDatasetCommitTransaction(GDALDatasetH hDS) -> OGRErr

For datasources which support transactions, CommitTransaction commits a transaction.

### Returns
OGRERR_NONE on success.
"""
function gdaldatasetcommittransaction(hDS)
    aftercare(ccall((:GDALDatasetCommitTransaction, libgdal), OGRErr, (GDALDatasetH,), hDS))
end

"""
    GDALDatasetRollbackTransaction(GDALDatasetH hDS) -> OGRErr

For datasources which support transactions, RollbackTransaction will roll back a datasource to its state before the start of the current transaction.

### Returns
OGRERR_NONE on success.
"""
function gdaldatasetrollbacktransaction(hDS)
    aftercare(ccall((:GDALDatasetRollbackTransaction, libgdal), OGRErr, (GDALDatasetH,), hDS))
end

"""
    GDALDatasetClearStatistics(GDALDatasetH hDS) -> void

Clear statistics.
"""
function gdaldatasetclearstatistics(hDS)
    aftercare(ccall((:GDALDatasetClearStatistics, libgdal), Cvoid, (GDALDatasetH,), hDS))
end

"""
    GDALGetRasterDataType(GDALRasterBandH hBand) -> GDALDataType

Fetch the pixel data type for this band.
"""
function gdalgetrasterdatatype(arg1)
    aftercare(ccall((:GDALGetRasterDataType, libgdal), GDALDataType, (GDALRasterBandH,), arg1))
end

"""
    GDALGetBlockSize(GDALRasterBandH hBand,
                     int * pnXSize,
                     int * pnYSize) -> void

Fetch the "natural" block size of this band.
"""
function gdalgetblocksize(arg1, pnXSize, pnYSize)
    aftercare(ccall((:GDALGetBlockSize, libgdal), Cvoid, (GDALRasterBandH, Ptr{Cint}, Ptr{Cint}), arg1, pnXSize, pnYSize))
end

"""
    GDALGetActualBlockSize(GDALRasterBandH hBand,
                           int nXBlockOff,
                           int nYBlockOff,
                           int * pnXValid,
                           int * pnYValid) -> CPLErr

Retrieve the actual block size for a given block offset.
"""
function gdalgetactualblocksize(arg1, nXBlockOff, nYBlockOff, pnXValid, pnYValid)
    aftercare(ccall((:GDALGetActualBlockSize, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cint}, Ptr{Cint}), arg1, nXBlockOff, nYBlockOff, pnXValid, pnYValid))
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
                         CSLConstList papszOptions) -> CPLErr

Advise driver of upcoming read requests.
"""
function gdalrasteradviseread(hRB, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, papszOptions)
    aftercare(ccall((:GDALRasterAdviseRead, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, CSLConstList), hRB, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, papszOptions))
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
function gdalrasterio(hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace)
    aftercare(ccall((:GDALRasterIO, libgdal), CPLErr, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Cint), hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace))
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
function gdalrasterioex(hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace, psExtraArg)
    aftercare(ccall((:GDALRasterIOEx, libgdal), CPLErr, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, GSpacing, GSpacing, Ptr{GDALRasterIOExtraArg}), hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace, psExtraArg))
end

"""
    GDALReadBlock(GDALRasterBandH hBand,
                  int nXOff,
                  int nYOff,
                  void * pData) -> CPLErr

Read a block of image data efficiently.
"""
function gdalreadblock(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALReadBlock, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

"""
    GDALWriteBlock(GDALRasterBandH hBand,
                   int nXOff,
                   int nYOff,
                   void * pData) -> CPLErr

Write a block of image data efficiently.
"""
function gdalwriteblock(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALWriteBlock, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

"""
    GDALGetRasterBandXSize(GDALRasterBandH hBand) -> int

Fetch XSize of raster.
"""
function gdalgetrasterbandxsize(arg1)
    aftercare(ccall((:GDALGetRasterBandXSize, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterBandYSize(GDALRasterBandH hBand) -> int

Fetch YSize of raster.
"""
function gdalgetrasterbandysize(arg1)
    aftercare(ccall((:GDALGetRasterBandYSize, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterAccess(GDALRasterBandH hBand) -> GDALAccess

Find out if we have update permission for this band.
"""
function gdalgetrasteraccess(arg1)
    aftercare(ccall((:GDALGetRasterAccess, libgdal), GDALAccess, (GDALRasterBandH,), arg1))
end

"""
    GDALGetBandNumber(GDALRasterBandH hBand) -> int

Fetch the band number.
"""
function gdalgetbandnumber(arg1)
    aftercare(ccall((:GDALGetBandNumber, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetBandDataset(GDALRasterBandH hBand) -> GDALDatasetH

Fetch the owning dataset handle.
"""
function gdalgetbanddataset(arg1)
    aftercare(ccall((:GDALGetBandDataset, libgdal), GDALDatasetH, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterColorInterpretation(GDALRasterBandH hBand) -> GDALColorInterp

How should this band be interpreted as color?
"""
function gdalgetrastercolorinterpretation(arg1)
    aftercare(ccall((:GDALGetRasterColorInterpretation, libgdal), GDALColorInterp, (GDALRasterBandH,), arg1))
end

"""
    GDALSetRasterColorInterpretation(GDALRasterBandH hBand,
                                     GDALColorInterp eColorInterp) -> CPLErr

Set color interpretation of a band.
"""
function gdalsetrastercolorinterpretation(arg1, arg2)
    aftercare(ccall((:GDALSetRasterColorInterpretation, libgdal), CPLErr, (GDALRasterBandH, GDALColorInterp), arg1, arg2))
end

"""
    GDALGetRasterColorTable(GDALRasterBandH hBand) -> GDALColorTableH

Fetch the color table associated with band.
"""
function gdalgetrastercolortable(arg1)
    aftercare(ccall((:GDALGetRasterColorTable, libgdal), GDALColorTableH, (GDALRasterBandH,), arg1))
end

"""
    GDALSetRasterColorTable(GDALRasterBandH hBand,
                            GDALColorTableH hCT) -> CPLErr

Set the raster color table.
"""
function gdalsetrastercolortable(arg1, arg2)
    aftercare(ccall((:GDALSetRasterColorTable, libgdal), CPLErr, (GDALRasterBandH, GDALColorTableH), arg1, arg2))
end

"""
    GDALHasArbitraryOverviews(GDALRasterBandH hBand) -> int

Check for arbitrary overviews.
"""
function gdalhasarbitraryoverviews(arg1)
    aftercare(ccall((:GDALHasArbitraryOverviews, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetOverviewCount(GDALRasterBandH hBand) -> int

Return the number of overview layers available.
"""
function gdalgetoverviewcount(arg1)
    aftercare(ccall((:GDALGetOverviewCount, libgdal), Cint, (GDALRasterBandH,), arg1))
end

"""
    GDALGetOverview(GDALRasterBandH hBand,
                    int i) -> GDALRasterBandH

Fetch overview raster band object.
"""
function gdalgetoverview(arg1, arg2)
    aftercare(ccall((:GDALGetOverview, libgdal), GDALRasterBandH, (GDALRasterBandH, Cint), arg1, arg2))
end

"""
    GDALGetRasterNoDataValue(GDALRasterBandH hBand,
                             int * pbSuccess) -> double

Fetch the no data value for this band.
"""
function gdalgetrasternodatavalue(arg1, arg2)
    aftercare(ccall((:GDALGetRasterNoDataValue, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, arg2))
end

"""
    GDALSetRasterNoDataValue(GDALRasterBandH hBand,
                             double dfValue) -> CPLErr

Set the no data value for this band.
"""
function gdalsetrasternodatavalue(arg1, arg2)
    aftercare(ccall((:GDALSetRasterNoDataValue, libgdal), CPLErr, (GDALRasterBandH, Cdouble), arg1, arg2))
end

"""
    GDALDeleteRasterNoDataValue(GDALRasterBandH hBand) -> CPLErr

Remove the no data value for this band.
"""
function gdaldeleterasternodatavalue(arg1)
    aftercare(ccall((:GDALDeleteRasterNoDataValue, libgdal), CPLErr, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterCategoryNames(GDALRasterBandH hBand) -> char **

Fetch the list of category names for this raster.
"""
function gdalgetrastercategorynames(arg1)
    aftercare(ccall((:GDALGetRasterCategoryNames, libgdal), Ptr{Cstring}, (GDALRasterBandH,), arg1))
end

"""
    GDALSetRasterCategoryNames(GDALRasterBandH hBand,
                               CSLConstList papszNames) -> CPLErr

Set the category names for this band.
"""
function gdalsetrastercategorynames(arg1, arg2)
    aftercare(ccall((:GDALSetRasterCategoryNames, libgdal), CPLErr, (GDALRasterBandH, CSLConstList), arg1, arg2))
end

"""
    GDALGetRasterMinimum(GDALRasterBandH hBand,
                         int * pbSuccess) -> double

Fetch the minimum value for this band.
"""
function gdalgetrasterminimum(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterMinimum, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

"""
    GDALGetRasterMaximum(GDALRasterBandH hBand,
                         int * pbSuccess) -> double

Fetch the maximum value for this band.
"""
function gdalgetrastermaximum(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterMaximum, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
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
function gdalgetrasterstatistics(arg1, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev)
    aftercare(ccall((:GDALGetRasterStatistics, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), arg1, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev))
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
function gdalcomputerasterstatistics(arg1, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pfnProgress, pProgressData)
    aftercare(ccall((:GDALComputeRasterStatistics, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, GDALProgressFunc, Ptr{Cvoid}), arg1, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pfnProgress, pProgressData))
end

"""
    GDALSetRasterStatistics(GDALRasterBandH hBand,
                            double dfMin,
                            double dfMax,
                            double dfMean,
                            double dfStdDev) -> CPLErr

Set statistics on band.
"""
function gdalsetrasterstatistics(hBand, dfMin, dfMax, dfMean, dfStdDev)
    aftercare(ccall((:GDALSetRasterStatistics, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cdouble, Cdouble), hBand, dfMin, dfMax, dfMean, dfStdDev))
end

"""
    GDALRasterBandAsMDArray(GDALRasterBandH hBand) -> GDALMDArrayH

Return a view of this raster band as a 2D multidimensional GDALMDArray.

### Returns
a new array, or NULL.
"""
function gdalrasterbandasmdarray(arg1)
    aftercare(ccall((:GDALRasterBandAsMDArray, libgdal), GDALMDArrayH, (GDALRasterBandH,), arg1))
end

"""
    GDALGetRasterUnitType(GDALRasterBandH hBand) -> const char *

Return raster unit type.
"""
function gdalgetrasterunittype(arg1)
    aftercare(ccall((:GDALGetRasterUnitType, libgdal), Cstring, (GDALRasterBandH,), arg1), false)
end

"""
    GDALSetRasterUnitType(GDALRasterBandH hBand,
                          const char * pszNewValue) -> CPLErr

Set unit type.
"""
function gdalsetrasterunittype(hBand, pszNewValue)
    aftercare(ccall((:GDALSetRasterUnitType, libgdal), CPLErr, (GDALRasterBandH, Cstring), hBand, pszNewValue))
end

"""
    GDALGetRasterOffset(GDALRasterBandH hBand,
                        int * pbSuccess) -> double

Fetch the raster value offset.
"""
function gdalgetrasteroffset(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterOffset, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

"""
    GDALSetRasterOffset(GDALRasterBandH hBand,
                        double dfNewOffset) -> CPLErr

Set scaling offset.
"""
function gdalsetrasteroffset(hBand, dfNewOffset)
    aftercare(ccall((:GDALSetRasterOffset, libgdal), CPLErr, (GDALRasterBandH, Cdouble), hBand, dfNewOffset))
end

"""
    GDALGetRasterScale(GDALRasterBandH hBand,
                       int * pbSuccess) -> double

Fetch the raster value scale.
"""
function gdalgetrasterscale(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterScale, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

"""
    GDALSetRasterScale(GDALRasterBandH hBand,
                       double dfNewOffset) -> CPLErr

Set scaling ratio.
"""
function gdalsetrasterscale(hBand, dfNewOffset)
    aftercare(ccall((:GDALSetRasterScale, libgdal), CPLErr, (GDALRasterBandH, Cdouble), hBand, dfNewOffset))
end

"""
    GDALComputeRasterMinMax(GDALRasterBandH hBand,
                            int bApproxOK,
                            double adfMinMax) -> void

Compute the min/max values for a band.
"""
function gdalcomputerasterminmax(hBand, bApproxOK, adfMinMax)
    aftercare(ccall((:GDALComputeRasterMinMax, libgdal), Cvoid, (GDALRasterBandH, Cint, Ptr{Cdouble}), hBand, bApproxOK, adfMinMax))
end

"""
    GDALFlushRasterCache(GDALRasterBandH hBand) -> CPLErr

Flush raster data cache.
"""
function gdalflushrastercache(hBand)
    aftercare(ccall((:GDALFlushRasterCache, libgdal), CPLErr, (GDALRasterBandH,), hBand))
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
function gdalgetrasterhistogram(hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetRasterHistogram, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cint}, Cint, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData))
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
function gdalgetrasterhistogramex(hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetRasterHistogramEx, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{GUIntBig}, Cint, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData))
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
function gdalgetdefaulthistogram(hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetDefaultHistogram, libgdal), CPLErr, (GDALRasterBandH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cint}}, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData))
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
function gdalgetdefaulthistogramex(hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetDefaultHistogramEx, libgdal), CPLErr, (GDALRasterBandH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{GUIntBig}}, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData))
end

"""
    GDALSetDefaultHistogram(GDALRasterBandH hBand,
                            double dfMin,
                            double dfMax,
                            int nBuckets,
                            int * panHistogram) -> CPLErr

Set default histogram.
"""
function gdalsetdefaulthistogram(hBand, dfMin, dfMax, nBuckets, panHistogram)
    aftercare(ccall((:GDALSetDefaultHistogram, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cint}), hBand, dfMin, dfMax, nBuckets, panHistogram))
end

"""
    GDALSetDefaultHistogramEx(GDALRasterBandH hBand,
                              double dfMin,
                              double dfMax,
                              int nBuckets,
                              GUIntBig * panHistogram) -> CPLErr

Set default histogram.
"""
function gdalsetdefaulthistogramex(hBand, dfMin, dfMax, nBuckets, panHistogram)
    aftercare(ccall((:GDALSetDefaultHistogramEx, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{GUIntBig}), hBand, dfMin, dfMax, nBuckets, panHistogram))
end

"""
    GDALGetRandomRasterSample(GDALRasterBandH hBand,
                              int nSamples,
                              float * pafSampleBuf) -> int

Undocumented.

### Parameters
* **hBand**: undocumented.
* **nSamples**: undocumented.
* **pafSampleBuf**: undocumented.

### Returns
undocumented
"""
function gdalgetrandomrastersample(arg1, arg2, arg3)
    aftercare(ccall((:GDALGetRandomRasterSample, libgdal), Cint, (GDALRasterBandH, Cint, Ptr{Cfloat}), arg1, arg2, arg3))
end

"""
    GDALGetRasterSampleOverview(GDALRasterBandH hBand,
                                int nDesiredSamples) -> GDALRasterBandH

Fetch best sampling overview.
"""
function gdalgetrastersampleoverview(arg1, arg2)
    aftercare(ccall((:GDALGetRasterSampleOverview, libgdal), GDALRasterBandH, (GDALRasterBandH, Cint), arg1, arg2))
end

"""
    GDALGetRasterSampleOverviewEx(GDALRasterBandH hBand,
                                  GUIntBig nDesiredSamples) -> GDALRasterBandH

Fetch best sampling overview.
"""
function gdalgetrastersampleoverviewex(arg1, arg2)
    aftercare(ccall((:GDALGetRasterSampleOverviewEx, libgdal), GDALRasterBandH, (GDALRasterBandH, GUIntBig), arg1, arg2))
end

"""
    GDALFillRaster(GDALRasterBandH hBand,
                   double dfRealValue,
                   double dfImaginaryValue) -> CPLErr

Fill this band with a constant value.
"""
function gdalfillraster(hBand, dfRealValue, dfImaginaryValue)
    aftercare(ccall((:GDALFillRaster, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble), hBand, dfRealValue, dfImaginaryValue))
end

"""
    GDALComputeBandStats(GDALRasterBandH hSrcBand,
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
function gdalcomputebandstats(hBand, nSampleStep, pdfMean, pdfStdDev, pfnProgress, pProgressData)
    aftercare(ccall((:GDALComputeBandStats, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, GDALProgressFunc, Ptr{Cvoid}), hBand, nSampleStep, pdfMean, pdfStdDev, pfnProgress, pProgressData))
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
function gdaloverviewmagnitudecorrection(hBaseBand, nOverviewCount, pahOverviews, pfnProgress, pProgressData)
    aftercare(ccall((:GDALOverviewMagnitudeCorrection, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{GDALRasterBandH}, GDALProgressFunc, Ptr{Cvoid}), hBaseBand, nOverviewCount, pahOverviews, pfnProgress, pProgressData))
end

"""
    GDALGetDefaultRAT(GDALRasterBandH hBand) -> GDALRasterAttributeTableH

Fetch default Raster Attribute Table.
"""
function gdalgetdefaultrat(hBand)
    aftercare(ccall((:GDALGetDefaultRAT, libgdal), GDALRasterAttributeTableH, (GDALRasterBandH,), hBand))
end

"""
    GDALSetDefaultRAT(GDALRasterBandH hBand,
                      GDALRasterAttributeTableH hRAT) -> CPLErr

Set default Raster Attribute Table.
"""
function gdalsetdefaultrat(arg1, arg2)
    aftercare(ccall((:GDALSetDefaultRAT, libgdal), CPLErr, (GDALRasterBandH, GDALRasterAttributeTableH), arg1, arg2))
end

"""
    GDALAddDerivedBandPixelFunc(const char * pszFuncName,
                                GDALDerivedPixelFunc pfnNewFunction) -> CPLErr

This adds a pixel function to the global list of available pixel functions for derived bands.

### Parameters
* **pszFuncName**: Name used to access pixel function
* **pfnNewFunction**: Pixel function associated with name. An existing pixel function registered with the same name will be replaced with the new one.

### Returns
CE_None, invalid (NULL) parameters are currently ignored.
"""
function gdaladdderivedbandpixelfunc(pszName, pfnPixelFunc)
    aftercare(ccall((:GDALAddDerivedBandPixelFunc, libgdal), CPLErr, (Cstring, GDALDerivedPixelFunc), pszName, pfnPixelFunc))
end

"""
    GDALGetMaskBand(GDALRasterBandH hBand) -> GDALRasterBandH

Return the mask band associated with the band.
"""
function gdalgetmaskband(hBand)
    aftercare(ccall((:GDALGetMaskBand, libgdal), GDALRasterBandH, (GDALRasterBandH,), hBand))
end

"""
    GDALGetMaskFlags(GDALRasterBandH hBand) -> int

Return the status flags of the mask band associated with the band.
"""
function gdalgetmaskflags(hBand)
    aftercare(ccall((:GDALGetMaskFlags, libgdal), Cint, (GDALRasterBandH,), hBand))
end

"""
    GDALCreateMaskBand(GDALRasterBandH hBand,
                       int nFlags) -> CPLErr

Adds a mask band to the current band.
"""
function gdalcreatemaskband(hBand, nFlags)
    aftercare(ccall((:GDALCreateMaskBand, libgdal), CPLErr, (GDALRasterBandH, Cint), hBand, nFlags))
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
function gdalgetdatacoveragestatus(hBand, nXOff, nYOff, nXSize, nYSize, nMaskFlagStop, pdfDataPct)
    aftercare(ccall((:GDALGetDataCoverageStatus, libgdal), Cint, (GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Ptr{Cdouble}), hBand, nXOff, nYOff, nXSize, nYSize, nMaskFlagStop, pdfDataPct))
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
function gdalargetnextupdatedregion(hARIO, dfTimeout, pnXBufOff, pnYBufOff, pnXBufSize, pnYBufSize)
    aftercare(ccall((:GDALARGetNextUpdatedRegion, libgdal), GDALAsyncStatusType, (GDALAsyncReaderH, Cdouble, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), hARIO, dfTimeout, pnXBufOff, pnYBufOff, pnXBufSize, pnYBufSize))
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
function gdalarlockbuffer(hARIO, dfTimeout)
    aftercare(ccall((:GDALARLockBuffer, libgdal), Cint, (GDALAsyncReaderH, Cdouble), hARIO, dfTimeout))
end

"""
    GDALARUnlockBuffer(GDALAsyncReaderH hARIO) -> void

Unlock image buffer.

### Parameters
* **hARIO**: handle to async reader.
"""
function gdalarunlockbuffer(hARIO)
    aftercare(ccall((:GDALARUnlockBuffer, libgdal), Cvoid, (GDALAsyncReaderH,), hARIO))
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
function gdalgeneralcmdlineprocessor(nArgc, ppapszArgv, nOptions)
    aftercare(ccall((:GDALGeneralCmdLineProcessor, libgdal), Cint, (Cint, Ptr{Ptr{Cstring}}, Cint), nArgc, ppapszArgv, nOptions))
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
function gdalswapwords(pData, nWordSize, nWordCount, nWordSkip)
    aftercare(ccall((:GDALSwapWords, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Cint, Cint), pData, nWordSize, nWordCount, nWordSkip))
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
function gdalswapwordsex(pData, nWordSize, nWordCount, nWordSkip)
    aftercare(ccall((:GDALSwapWordsEx, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Csize_t, Cint), pData, nWordSize, nWordCount, nWordSkip))
end

"""
    GDALCopyWords(const void * pSrcData,
                  GDALDataType eSrcType,
                  int nSrcPixelStride,
                  void * pDstData,
                  GDALDataType eDstType,
                  int nDstPixelStride,
                  int nWordCount) -> void

Copy pixel words from buffer to buffer.
"""
function gdalcopywords(pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount)
    aftercare(ccall((:GDALCopyWords, libgdal), Cvoid, (Ptr{Cvoid}, GDALDataType, Cint, Ptr{Cvoid}, GDALDataType, Cint, Cint), pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount))
end

"""
    GDALCopyWords64(const void * pSrcData,
                    GDALDataType eSrcType,
                    int nSrcPixelStride,
                    void * pDstData,
                    GDALDataType eDstType,
                    int nDstPixelStride,
                    GPtrDiff_t nWordCount) -> void

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
function gdalcopywords64(pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount)
    aftercare(ccall((:GDALCopyWords64, libgdal), Cvoid, (Ptr{Cvoid}, GDALDataType, Cint, Ptr{Cvoid}, GDALDataType, Cint, GPtrDiff_t), pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount))
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
function gdalcopybits(pabySrcData, nSrcOffset, nSrcStep, pabyDstData, nDstOffset, nDstStep, nBitCount, nStepCount)
    aftercare(ccall((:GDALCopyBits, libgdal), Cvoid, (Ptr{GByte}, Cint, Cint, Ptr{GByte}, Cint, Cint, Cint, Cint), pabySrcData, nSrcOffset, nSrcStep, pabyDstData, nDstOffset, nDstStep, nBitCount, nStepCount))
end

"""
    GDALLoadWorldFile(const char * pszFilename,
                      double * padfGeoTransform) -> int

Read ESRI world file.

### Parameters
* **pszFilename**: the world file name.
* **padfGeoTransform**: the six double array into which the geotransformation should be placed.

### Returns
TRUE on success or FALSE on failure.
"""
function gdalloadworldfile(arg1, arg2)
    aftercare(ccall((:GDALLoadWorldFile, libgdal), Cint, (Cstring, Ptr{Cdouble}), arg1, arg2))
end

"""
    GDALReadWorldFile(const char * pszBaseFilename,
                      const char * pszExtension,
                      double * padfGeoTransform) -> int

Read ESRI world file.

### Parameters
* **pszBaseFilename**: the target raster file.
* **pszExtension**: the extension to use (i.e. "wld") or NULL to derive it from the pszBaseFilename
* **padfGeoTransform**: the six double array into which the geotransformation should be placed.

### Returns
TRUE on success or FALSE on failure.
"""
function gdalreadworldfile(arg1, arg2, arg3)
    aftercare(ccall((:GDALReadWorldFile, libgdal), Cint, (Cstring, Cstring, Ptr{Cdouble}), arg1, arg2, arg3))
end

"""
    GDALWriteWorldFile(const char * pszBaseFilename,
                       const char * pszExtension,
                       double * padfGeoTransform) -> int

Write ESRI world file.

### Parameters
* **pszBaseFilename**: the target raster file.
* **pszExtension**: the extension to use (i.e. "wld"). Must not be NULL
* **padfGeoTransform**: the six double array from which the geotransformation should be read.

### Returns
TRUE on success or FALSE on failure.
"""
function gdalwriteworldfile(arg1, arg2, arg3)
    aftercare(ccall((:GDALWriteWorldFile, libgdal), Cint, (Cstring, Cstring, Ptr{Cdouble}), arg1, arg2, arg3))
end

"""
    GDALLoadTabFile(const char * pszFilename,
                    double * padfGeoTransform,
                    char ** ppszWKT,
                    int * pnGCPCount,
                    GDAL_GCP ** ppasGCPs) -> int

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
function gdalloadtabfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALLoadTabFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALReadTabFile(const char * pszBaseFilename,
                    double * padfGeoTransform,
                    char ** ppszWKT,
                    int * pnGCPCount,
                    GDAL_GCP ** ppasGCPs) -> int

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
function gdalreadtabfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALReadTabFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALLoadOziMapFile(const char * pszFilename,
                       double * padfGeoTransform,
                       char ** ppszWKT,
                       int * pnGCPCount,
                       GDAL_GCP ** ppasGCPs) -> int

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
function gdalloadozimapfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALLoadOziMapFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALReadOziMapFile(const char * pszBaseFilename,
                       double * padfGeoTransform,
                       char ** ppszWKT,
                       int * pnGCPCount,
                       GDAL_GCP ** ppasGCPs) -> int

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
function gdalreadozimapfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALReadOziMapFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

"""
    GDALDecToDMS(double dfAngle,
                 const char * pszAxis,
                 int nPrecision) -> const char *

Translate a decimal degrees value to a DMS string with hemisphere.
"""
function gdaldectodms(arg1, arg2, arg3)
    aftercare(ccall((:GDALDecToDMS, libgdal), Cstring, (Cdouble, Cstring, Cint), arg1, arg2, arg3), false)
end

"""
    GDALPackedDMSToDec(double dfPacked) -> double

Convert a packed DMS value (DDDMMMSSS.SS) into decimal degrees.
"""
function gdalpackeddmstodec(arg1)
    aftercare(ccall((:GDALPackedDMSToDec, libgdal), Cdouble, (Cdouble,), arg1))
end

"""
    GDALDecToPackedDMS(double dfDec) -> double

Convert decimal degrees into packed DMS value (DDDMMMSSS.SS).
"""
function gdaldectopackeddms(arg1)
    aftercare(ccall((:GDALDecToPackedDMS, libgdal), Cdouble, (Cdouble,), arg1))
end

"""
    GDALExtractRPCInfo(CSLConstList papszMD,
                       GDALRPCInfo * psRPC) -> int

Extract RPC info from metadata, and apply to an RPCInfo structure.

### Parameters
* **papszMD**: Dictionary of metadata representing RPC
* **psRPC**: (output) Pointer to structure to hold the RPC values.

### Returns
TRUE in case of success. FALSE in case of failure.
"""
function gdalextractrpcinfo(arg1, arg2)
    aftercare(ccall((:GDALExtractRPCInfo, libgdal), Cint, (CSLConstList, Ptr{GDALRPCInfo}), arg1, arg2))
end

"""
    GDALCreateColorTable(GDALPaletteInterp eInterp) -> GDALColorTableH

Construct a new color table.
"""
function gdalcreatecolortable(arg1)
    aftercare(ccall((:GDALCreateColorTable, libgdal), GDALColorTableH, (GDALPaletteInterp,), arg1))
end

"""
    GDALDestroyColorTable(GDALColorTableH hTable) -> void

Destroys a color table.
"""
function gdaldestroycolortable(arg1)
    aftercare(ccall((:GDALDestroyColorTable, libgdal), Cvoid, (GDALColorTableH,), arg1))
end

"""
    GDALCloneColorTable(GDALColorTableH hTable) -> GDALColorTableH

Make a copy of a color table.
"""
function gdalclonecolortable(arg1)
    aftercare(ccall((:GDALCloneColorTable, libgdal), GDALColorTableH, (GDALColorTableH,), arg1))
end

"""
    GDALGetPaletteInterpretation(GDALColorTableH hTable) -> GDALPaletteInterp

Fetch palette interpretation.
"""
function gdalgetpaletteinterpretation(arg1)
    aftercare(ccall((:GDALGetPaletteInterpretation, libgdal), GDALPaletteInterp, (GDALColorTableH,), arg1))
end

"""
    GDALGetColorEntryCount(GDALColorTableH hTable) -> int

Get number of color entries in table.
"""
function gdalgetcolorentrycount(arg1)
    aftercare(ccall((:GDALGetColorEntryCount, libgdal), Cint, (GDALColorTableH,), arg1))
end

"""
    GDALGetColorEntry(GDALColorTableH hTable,
                      int i) -> const GDALColorEntry *

Fetch a color entry from table.
"""
function gdalgetcolorentry(arg1, arg2)
    aftercare(ccall((:GDALGetColorEntry, libgdal), Ptr{GDALColorEntry}, (GDALColorTableH, Cint), arg1, arg2))
end

"""
    GDALGetColorEntryAsRGB(GDALColorTableH hTable,
                           int i,
                           GDALColorEntry * poEntry) -> int

Fetch a table entry in RGB format.
"""
function gdalgetcolorentryasrgb(arg1, arg2, arg3)
    aftercare(ccall((:GDALGetColorEntryAsRGB, libgdal), Cint, (GDALColorTableH, Cint, Ptr{GDALColorEntry}), arg1, arg2, arg3))
end

"""
    GDALSetColorEntry(GDALColorTableH hTable,
                      int i,
                      const GDALColorEntry * poEntry) -> void

Set entry in color table.
"""
function gdalsetcolorentry(arg1, arg2, arg3)
    aftercare(ccall((:GDALSetColorEntry, libgdal), Cvoid, (GDALColorTableH, Cint, Ptr{GDALColorEntry}), arg1, arg2, arg3))
end

"""
    GDALCreateColorRamp(GDALColorTableH hTable,
                        int nStartIndex,
                        const GDALColorEntry * psStartColor,
                        int nEndIndex,
                        const GDALColorEntry * psEndColor) -> void

Create color ramp.
"""
function gdalcreatecolorramp(hTable, nStartIndex, psStartColor, nEndIndex, psEndColor)
    aftercare(ccall((:GDALCreateColorRamp, libgdal), Cvoid, (GDALColorTableH, Cint, Ptr{GDALColorEntry}, Cint, Ptr{GDALColorEntry}), hTable, nStartIndex, psStartColor, nEndIndex, psEndColor))
end

"""
    GDALCreateRasterAttributeTable() -> GDALRasterAttributeTableH

Construct empty table.
"""
function gdalcreaterasterattributetable()
    aftercare(ccall((:GDALCreateRasterAttributeTable, libgdal), GDALRasterAttributeTableH, ()))
end

"""
    GDALDestroyRasterAttributeTable(GDALRasterAttributeTableH hRAT) -> void

Destroys a RAT.
"""
function gdaldestroyrasterattributetable(arg1)
    aftercare(ccall((:GDALDestroyRasterAttributeTable, libgdal), Cvoid, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATGetColumnCount(GDALRasterAttributeTableH hRAT) -> int

Fetch table column count.
"""
function gdalratgetcolumncount(arg1)
    aftercare(ccall((:GDALRATGetColumnCount, libgdal), Cint, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATGetNameOfCol(GDALRasterAttributeTableH hRAT,
                        int iCol) -> const char *

Fetch name of indicated column.

### Parameters
* **hRAT**: RAT handle.
* **iCol**: column index.

### Returns
name.
"""
function gdalratgetnameofcol(arg1, arg2)
    aftercare(ccall((:GDALRATGetNameOfCol, libgdal), Cstring, (GDALRasterAttributeTableH, Cint), arg1, arg2), false)
end

"""
    GDALRATGetUsageOfCol(GDALRasterAttributeTableH hRAT,
                         int iCol) -> GDALRATFieldUsage

Fetch column usage value.

### Parameters
* **hRAT**: RAT handle.
* **iCol**: column index.

### Returns
usage.
"""
function gdalratgetusageofcol(arg1, arg2)
    aftercare(ccall((:GDALRATGetUsageOfCol, libgdal), GDALRATFieldUsage, (GDALRasterAttributeTableH, Cint), arg1, arg2))
end

"""
    GDALRATGetTypeOfCol(GDALRasterAttributeTableH hRAT,
                        int iCol) -> GDALRATFieldType

Fetch column type.

### Parameters
* **hRAT**: RAT handle.
* **iCol**: column index.

### Returns
type.
"""
function gdalratgettypeofcol(arg1, arg2)
    aftercare(ccall((:GDALRATGetTypeOfCol, libgdal), GDALRATFieldType, (GDALRasterAttributeTableH, Cint), arg1, arg2))
end

"""
    GDALRATGetColOfUsage(GDALRasterAttributeTableH hRAT,
                         GDALRATFieldUsage eUsage) -> int

Fetch column index for given usage.
"""
function gdalratgetcolofusage(arg1, arg2)
    aftercare(ccall((:GDALRATGetColOfUsage, libgdal), Cint, (GDALRasterAttributeTableH, GDALRATFieldUsage), arg1, arg2))
end

"""
    GDALRATGetRowCount(GDALRasterAttributeTableH hRAT) -> int

Fetch row count.
"""
function gdalratgetrowcount(arg1)
    aftercare(ccall((:GDALRATGetRowCount, libgdal), Cint, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATGetValueAsString(GDALRasterAttributeTableH hRAT,
                            int iRow,
                            int iField) -> const char *

Fetch field value as a string.
"""
function gdalratgetvalueasstring(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetValueAsString, libgdal), Cstring, (GDALRasterAttributeTableH, Cint, Cint), arg1, arg2, arg3), false)
end

"""
    GDALRATGetValueAsInt(GDALRasterAttributeTableH hRAT,
                         int iRow,
                         int iField) -> int

Fetch field value as a integer.
"""
function gdalratgetvalueasint(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetValueAsInt, libgdal), Cint, (GDALRasterAttributeTableH, Cint, Cint), arg1, arg2, arg3))
end

"""
    GDALRATGetValueAsDouble(GDALRasterAttributeTableH hRAT,
                            int iRow,
                            int iField) -> double

Fetch field value as a double.
"""
function gdalratgetvalueasdouble(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetValueAsDouble, libgdal), Cdouble, (GDALRasterAttributeTableH, Cint, Cint), arg1, arg2, arg3))
end

"""
    GDALRATSetValueAsString(GDALRasterAttributeTableH hRAT,
                            int iRow,
                            int iField,
                            const char * pszValue) -> void

Set field value from string.

### Parameters
* **hRAT**: RAT handle.
* **iRow**: row index.
* **iField**: field index.
* **pszValue**: value.
"""
function gdalratsetvalueasstring(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATSetValueAsString, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint, Cint, Cstring), arg1, arg2, arg3, arg4))
end

"""
    GDALRATSetValueAsInt(GDALRasterAttributeTableH hRAT,
                         int iRow,
                         int iField,
                         int nValue) -> void

Set field value from integer.
"""
function gdalratsetvalueasint(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATSetValueAsInt, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint, Cint, Cint), arg1, arg2, arg3, arg4))
end

"""
    GDALRATSetValueAsDouble(GDALRasterAttributeTableH hRAT,
                            int iRow,
                            int iField,
                            double dfValue) -> void

Set field value from double.
"""
function gdalratsetvalueasdouble(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATSetValueAsDouble, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint, Cint, Cdouble), arg1, arg2, arg3, arg4))
end

"""
    GDALRATChangesAreWrittenToFile(GDALRasterAttributeTableH hRAT) -> int

Determine whether changes made to this RAT are reflected directly in the dataset.
"""
function gdalratchangesarewrittentofile(hRAT)
    aftercare(ccall((:GDALRATChangesAreWrittenToFile, libgdal), Cint, (GDALRasterAttributeTableH,), hRAT))
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
function gdalratvaluesioasdouble(hRAT, eRWFlag, iField, iStartRow, iLength, pdfData)
    aftercare(ccall((:GDALRATValuesIOAsDouble, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRWFlag, Cint, Cint, Cint, Ptr{Cdouble}), hRAT, eRWFlag, iField, iStartRow, iLength, pdfData))
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
function gdalratvaluesioasinteger(hRAT, eRWFlag, iField, iStartRow, iLength, pnData)
    aftercare(ccall((:GDALRATValuesIOAsInteger, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRWFlag, Cint, Cint, Cint, Ptr{Cint}), hRAT, eRWFlag, iField, iStartRow, iLength, pnData))
end

"""
    GDALRATValuesIOAsString(GDALRasterAttributeTableH hRAT,
                            GDALRWFlag eRWFlag,
                            int iField,
                            int iStartRow,
                            int iLength,
                            CSLConstList papszStrList) -> CPLErr

Read or Write a block of strings to/from the Attribute Table.
"""
function gdalratvaluesioasstring(hRAT, eRWFlag, iField, iStartRow, iLength, papszStrList)
    aftercare(ccall((:GDALRATValuesIOAsString, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRWFlag, Cint, Cint, Cint, CSLConstList), hRAT, eRWFlag, iField, iStartRow, iLength, papszStrList))
end

"""
    GDALRATSetRowCount(GDALRasterAttributeTableH hRAT,
                       int nNewCount) -> void

Set row count.

### Parameters
* **hRAT**: RAT handle.
* **nNewCount**: the new number of rows.
"""
function gdalratsetrowcount(arg1, arg2)
    aftercare(ccall((:GDALRATSetRowCount, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint), arg1, arg2))
end

"""
    GDALRATCreateColumn(GDALRasterAttributeTableH hRAT,
                        const char * pszFieldName,
                        GDALRATFieldType eFieldType,
                        GDALRATFieldUsage eFieldUsage) -> CPLErr

Create new column.
"""
function gdalratcreatecolumn(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATCreateColumn, libgdal), CPLErr, (GDALRasterAttributeTableH, Cstring, GDALRATFieldType, GDALRATFieldUsage), arg1, arg2, arg3, arg4))
end

"""
    GDALRATSetLinearBinning(GDALRasterAttributeTableH hRAT,
                            double dfRow0Min,
                            double dfBinSize) -> CPLErr

Set linear binning information.
"""
function gdalratsetlinearbinning(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATSetLinearBinning, libgdal), CPLErr, (GDALRasterAttributeTableH, Cdouble, Cdouble), arg1, arg2, arg3))
end

"""
    GDALRATGetLinearBinning(GDALRasterAttributeTableH hRAT,
                            double * pdfRow0Min,
                            double * pdfBinSize) -> int

Get linear binning information.
"""
function gdalratgetlinearbinning(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetLinearBinning, libgdal), Cint, (GDALRasterAttributeTableH, Ptr{Cdouble}, Ptr{Cdouble}), arg1, arg2, arg3))
end

"""
    GDALRATSetTableType(GDALRasterAttributeTableH hRAT,
                        const GDALRATTableType eInTableType) -> CPLErr

Set RAT Table Type.
"""
function gdalratsettabletype(hRAT, eInTableType)
    aftercare(ccall((:GDALRATSetTableType, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRATTableType), hRAT, eInTableType))
end

"""
    GDALRATGetTableType(GDALRasterAttributeTableH hRAT) -> GDALRATTableType

Get Rat Table Type.
"""
function gdalratgettabletype(hRAT)
    aftercare(ccall((:GDALRATGetTableType, libgdal), GDALRATTableType, (GDALRasterAttributeTableH,), hRAT))
end

"""
    GDALRATInitializeFromColorTable(GDALRasterAttributeTableH hRAT,
                                    GDALColorTableH hCT) -> CPLErr

Initialize from color table.
"""
function gdalratinitializefromcolortable(arg1, arg2)
    aftercare(ccall((:GDALRATInitializeFromColorTable, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALColorTableH), arg1, arg2))
end

"""
    GDALRATTranslateToColorTable(GDALRasterAttributeTableH hRAT,
                                 int nEntryCount) -> GDALColorTableH

Translate to a color table.
"""
function gdalrattranslatetocolortable(arg1, nEntryCount)
    aftercare(ccall((:GDALRATTranslateToColorTable, libgdal), GDALColorTableH, (GDALRasterAttributeTableH, Cint), arg1, nEntryCount))
end

"""
    GDALRATDumpReadable(GDALRasterAttributeTableH hRAT,
                        FILE * fp) -> void

Dump RAT in readable form.
"""
function gdalratdumpreadable(arg1, arg2)
    aftercare(ccall((:GDALRATDumpReadable, libgdal), Cvoid, (GDALRasterAttributeTableH, Ptr{Cint}), arg1, arg2))
end

"""
    GDALRATClone(const GDALRasterAttributeTableH hRAT) -> GDALRasterAttributeTableH

Copy Raster Attribute Table.
"""
function gdalratclone(arg1)
    aftercare(ccall((:GDALRATClone, libgdal), GDALRasterAttributeTableH, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATSerializeJSON(GDALRasterAttributeTableH hRAT) -> void *

Serialize Raster Attribute Table in Json format.
"""
function gdalratserializejson(arg1)
    aftercare(ccall((:GDALRATSerializeJSON, libgdal), Ptr{Cvoid}, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALRATGetRowOfValue(GDALRasterAttributeTableH hRAT,
                         double dfValue) -> int

Get row for pixel value.
"""
function gdalratgetrowofvalue(arg1, arg2)
    aftercare(ccall((:GDALRATGetRowOfValue, libgdal), Cint, (GDALRasterAttributeTableH, Cdouble), arg1, arg2))
end

"""
    GDALRATRemoveStatistics(GDALRasterAttributeTableH hRAT) -> void

Remove Statistics from RAT.
"""
function gdalratremovestatistics(arg1)
    aftercare(ccall((:GDALRATRemoveStatistics, libgdal), Cvoid, (GDALRasterAttributeTableH,), arg1))
end

"""
    GDALSetCacheMax(int nNewSizeInBytes) -> void

Set maximum cache memory.

### Parameters
* **nNewSizeInBytes**: the maximum number of bytes for caching.
"""
function gdalsetcachemax(nBytes)
    aftercare(ccall((:GDALSetCacheMax, libgdal), Cvoid, (Cint,), nBytes))
end

"""
    GDALGetCacheMax() -> int

Get maximum cache memory.

### Returns
maximum in bytes.
"""
function gdalgetcachemax()
    aftercare(ccall((:GDALGetCacheMax, libgdal), Cint, ()))
end

"""
    GDALGetCacheUsed() -> int

Get cache memory used.

### Returns
the number of bytes of memory currently in use by the GDALRasterBlock memory caching.
"""
function gdalgetcacheused()
    aftercare(ccall((:GDALGetCacheUsed, libgdal), Cint, ()))
end

"""
    GDALSetCacheMax64(GIntBig nNewSizeInBytes) -> void

Set maximum cache memory.

### Parameters
* **nNewSizeInBytes**: the maximum number of bytes for caching.
"""
function gdalsetcachemax64(nBytes)
    aftercare(ccall((:GDALSetCacheMax64, libgdal), Cvoid, (GIntBig,), nBytes))
end

"""
    GDALGetCacheMax64() -> GIntBig

Get maximum cache memory.

### Returns
maximum in bytes.
"""
function gdalgetcachemax64()
    aftercare(ccall((:GDALGetCacheMax64, libgdal), GIntBig, ()))
end

"""
    GDALGetCacheUsed64() -> GIntBig

Get cache memory used.

### Returns
the number of bytes of memory currently in use by the GDALRasterBlock memory caching.
"""
function gdalgetcacheused64()
    aftercare(ccall((:GDALGetCacheUsed64, libgdal), GIntBig, ()))
end

"""
    GDALFlushCacheBlock() -> int

Try to flush one cached raster block.

### Returns
TRUE if one block was flushed, FALSE if there are no cached blocks or if they are currently locked.
"""
function gdalflushcacheblock()
    aftercare(ccall((:GDALFlushCacheBlock, libgdal), Cint, ()))
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
                             CSLConstList papszOptions) -> CPLVirtualMem *

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
function gdaldatasetgetvirtualmem(hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALDatasetGetVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, GIntBig, GIntBig, Csize_t, Csize_t, Cint, CSLConstList), hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions))
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
                                CSLConstList papszOptions) -> CPLVirtualMem *

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
function gdalrasterbandgetvirtualmem(hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALRasterBandGetVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, GIntBig, Csize_t, Csize_t, Cint, CSLConstList), hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions))
end

"""
    GDALGetVirtualMemAuto(GDALRasterBandH hBand,
                          GDALRWFlag eRWFlag,
                          int * pnPixelSpace,
                          GIntBig * pnLineSpace,
                          CSLConstList papszOptions) -> CPLVirtualMem *

Create a CPLVirtualMem object from a GDAL raster band object.
"""
function gdalgetvirtualmemauto(hBand, eRWFlag, pnPixelSpace, pnLineSpace, papszOptions)
    aftercare(ccall((:GDALGetVirtualMemAuto, libgdal), Ptr{CPLVirtualMem}, (GDALRasterBandH, GDALRWFlag, Ptr{Cint}, Ptr{GIntBig}, CSLConstList), hBand, eRWFlag, pnPixelSpace, pnLineSpace, papszOptions))
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
                                  CSLConstList papszOptions) -> CPLVirtualMem *

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
function gdaldatasetgettiledvirtualmem(hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nBandCount, panBandMap, eTileOrganization, nCacheSize, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALDatasetGetTiledVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, GDALTileOrganization, Csize_t, Cint, CSLConstList), hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nBandCount, panBandMap, eTileOrganization, nCacheSize, bSingleThreadUsage, papszOptions))
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
                                     CSLConstList papszOptions) -> CPLVirtualMem *

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
function gdalrasterbandgettiledvirtualmem(hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nCacheSize, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALRasterBandGetTiledVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Csize_t, Cint, CSLConstList), hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nCacheSize, bSingleThreadUsage, papszOptions))
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
function gdalcreatepansharpenedvrt(pszXML, hPanchroBand, nInputSpectralBands, pahInputSpectralBands)
    aftercare(ccall((:GDALCreatePansharpenedVRT, libgdal), GDALDatasetH, (Cstring, GDALRasterBandH, Cint, Ptr{GDALRasterBandH}), pszXML, hPanchroBand, nInputSpectralBands, pahInputSpectralBands))
end

"""
    GDALGetJPEG2000Structure(const char * pszFilename,
                             CSLConstList papszOptions) -> CPLXMLNode *

Dump the structure of a JPEG2000 file as a XML tree.

### Parameters
* **pszFilename**: filename.
* **papszOptions**: NULL terminated list of options, or NULL. Allowed options are BINARY_CONTENT=YES, TEXT_CONTENT=YES, CODESTREAM=YES, ALL=YES.

### Returns
XML tree (to be freed with CPLDestroyXMLNode()) or NULL in case of error
"""
function gdalgetjpeg2000structure(pszFilename, papszOptions)
    aftercare(ccall((:GDALGetJPEG2000Structure, libgdal), Ptr{CPLXMLNode}, (Cstring, CSLConstList), pszFilename, papszOptions))
end

"""
    GDALCreateMultiDimensional(GDALDriverH hDriver,
                               const char * pszName,
                               CSLConstList papszRootGroupOptions,
                               CSLConstList papszOptions) -> GDALDatasetH

Create a new multidimensioanl dataset with this driver.
"""
function gdalcreatemultidimensional(hDriver, pszName, papszRootGroupOptions, papszOptions)
    aftercare(ccall((:GDALCreateMultiDimensional, libgdal), GDALDatasetH, (GDALDriverH, Cstring, CSLConstList, CSLConstList), hDriver, pszName, papszRootGroupOptions, papszOptions))
end

"""
    GDALExtendedDataTypeCreate(GDALDataType eType) -> GDALExtendedDataTypeH

Return a new GDALExtendedDataType of class GEDTC_NUMERIC.

### Parameters
* **eType**: Numeric data type.

### Returns
a new GDALExtendedDataTypeH handle, or nullptr.
"""
function gdalextendeddatatypecreate(eType)
    aftercare(ccall((:GDALExtendedDataTypeCreate, libgdal), GDALExtendedDataTypeH, (GDALDataType,), eType))
end

"""
    GDALExtendedDataTypeCreateString(size_t nMaxStringLength) -> GDALExtendedDataTypeH

Return a new GDALExtendedDataType of class GEDTC_STRING.

### Returns
a new GDALExtendedDataTypeH handle, or nullptr.
"""
function gdalextendeddatatypecreatestring(nMaxStringLength)
    aftercare(ccall((:GDALExtendedDataTypeCreateString, libgdal), GDALExtendedDataTypeH, (Csize_t,), nMaxStringLength))
end

"""
    GDALExtendedDataTypeCreateCompound(const char * pszName,
                                       size_t nTotalSize,
                                       size_t nComponents,
                                       const GDALEDTComponentH * comps) -> GDALExtendedDataTypeH

Return a new GDALExtendedDataType of class GEDTC_COMPOUND.

### Parameters
* **pszName**: Type name.
* **nTotalSize**: Total size of the type in bytes. Should be large enough to store all components.
* **nComponents**: Number of components in comps array.
* **comps**: Components.

### Returns
a new GDALExtendedDataTypeH handle, or nullptr.
"""
function gdalextendeddatatypecreatecompound(pszName, nTotalSize, nComponents, comps)
    aftercare(ccall((:GDALExtendedDataTypeCreateCompound, libgdal), GDALExtendedDataTypeH, (Cstring, Csize_t, Csize_t, Ptr{GDALEDTComponentH}), pszName, nTotalSize, nComponents, comps))
end

"""
    GDALExtendedDataTypeRelease(GDALExtendedDataTypeH hEDT) -> void

Release the GDAL in-memory object associated with a GDALExtendedDataTypeH.
"""
function gdalextendeddatatyperelease(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeRelease, libgdal), Cvoid, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetName(GDALExtendedDataTypeH hEDT) -> const char *

Return type name.
"""
function gdalextendeddatatypegetname(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetName, libgdal), Cstring, (GDALExtendedDataTypeH,), hEDT), false)
end

"""
    GDALExtendedDataTypeGetClass(GDALExtendedDataTypeH hEDT) -> GDALExtendedDataTypeClass

Return type class.
"""
function gdalextendeddatatypegetclass(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetClass, libgdal), GDALExtendedDataTypeClass, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetNumericDataType(GDALExtendedDataTypeH hEDT) -> GDALDataType

Return numeric data type (only valid when GetClass() == GEDTC_NUMERIC)
"""
function gdalextendeddatatypegetnumericdatatype(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetNumericDataType, libgdal), GDALDataType, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetSize(GDALExtendedDataTypeH hEDT) -> size_t

Return data type size in bytes.
"""
function gdalextendeddatatypegetsize(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetSize, libgdal), Csize_t, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetMaxStringLength(GDALExtendedDataTypeH hEDT) -> size_t

Return the maximum length of a string in bytes.
"""
function gdalextendeddatatypegetmaxstringlength(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetMaxStringLength, libgdal), Csize_t, (GDALExtendedDataTypeH,), hEDT))
end

"""
    GDALExtendedDataTypeGetComponents(GDALExtendedDataTypeH hEDT,
                                      size_t * pnCount) -> GDALEDTComponentH *

Return the components of the data type (only valid when GetClass() == GEDTC_COMPOUND)

### Parameters
* **hEDT**: Data type
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
an array of *pnCount components.
"""
function gdalextendeddatatypegetcomponents(hEDT, pnCount)
    aftercare(ccall((:GDALExtendedDataTypeGetComponents, libgdal), Ptr{GDALEDTComponentH}, (GDALExtendedDataTypeH, Ptr{Csize_t}), hEDT, pnCount))
end

"""
    GDALExtendedDataTypeFreeComponents(GDALEDTComponentH * components,
                                       size_t nCount) -> void

Free the return of GDALExtendedDataTypeGetComponents().

### Parameters
* **components**: return value of GDALExtendedDataTypeGetComponents()
* **nCount**: *pnCount value returned by GDALExtendedDataTypeGetComponents()
"""
function gdalextendeddatatypefreecomponents(components, nCount)
    aftercare(ccall((:GDALExtendedDataTypeFreeComponents, libgdal), Cvoid, (Ptr{GDALEDTComponentH}, Csize_t), components, nCount))
end

"""
    GDALExtendedDataTypeCanConvertTo(GDALExtendedDataTypeH hSourceEDT,
                                     GDALExtendedDataTypeH hTargetEDT) -> int

Return whether this data type can be converted to the other one.

### Parameters
* **hSourceEDT**: Source data type for the conversion being considered.
* **hTargetEDT**: Target data type for the conversion being considered.

### Returns
TRUE if hSourceEDT can be convert to hTargetEDT. FALSE otherwise.
"""
function gdalextendeddatatypecanconvertto(hSourceEDT, hTargetEDT)
    aftercare(ccall((:GDALExtendedDataTypeCanConvertTo, libgdal), Cint, (GDALExtendedDataTypeH, GDALExtendedDataTypeH), hSourceEDT, hTargetEDT))
end

"""
    GDALExtendedDataTypeEquals(GDALExtendedDataTypeH hFirstEDT,
                               GDALExtendedDataTypeH hSecondEDT) -> int

Return whether this data type is equal to another one.

### Parameters
* **hFirstEDT**: First data type.
* **hSecondEDT**: Second data type.

### Returns
TRUE if they are equal. FALSE otherwise.
"""
function gdalextendeddatatypeequals(hFirstEDT, hSecondEDT)
    aftercare(ccall((:GDALExtendedDataTypeEquals, libgdal), Cint, (GDALExtendedDataTypeH, GDALExtendedDataTypeH), hFirstEDT, hSecondEDT))
end

"""
    GDALEDTComponentCreate(const char * pszName,
                           size_t nOffset,
                           GDALExtendedDataTypeH hType) -> GDALEDTComponentH

Create a new GDALEDTComponent.
"""
function gdaledtcomponentcreate(pszName, nOffset, hType)
    aftercare(ccall((:GDALEDTComponentCreate, libgdal), GDALEDTComponentH, (Cstring, Csize_t, GDALExtendedDataTypeH), pszName, nOffset, hType))
end

"""
    GDALEDTComponentRelease(GDALEDTComponentH hComp) -> void

Release the GDAL in-memory object associated with a GDALEDTComponentH.
"""
function gdaledtcomponentrelease(hComp)
    aftercare(ccall((:GDALEDTComponentRelease, libgdal), Cvoid, (GDALEDTComponentH,), hComp))
end

"""
    GDALEDTComponentGetName(GDALEDTComponentH hComp) -> const char *

Return the name.
"""
function gdaledtcomponentgetname(hComp)
    aftercare(ccall((:GDALEDTComponentGetName, libgdal), Cstring, (GDALEDTComponentH,), hComp), false)
end

"""
    GDALEDTComponentGetOffset(GDALEDTComponentH hComp) -> size_t

Return the offset (in bytes) of the component in the compound data type.
"""
function gdaledtcomponentgetoffset(hComp)
    aftercare(ccall((:GDALEDTComponentGetOffset, libgdal), Csize_t, (GDALEDTComponentH,), hComp))
end

"""
    GDALEDTComponentGetType(GDALEDTComponentH hComp) -> GDALExtendedDataTypeH

Return the data type of the component.
"""
function gdaledtcomponentgettype(hComp)
    aftercare(ccall((:GDALEDTComponentGetType, libgdal), GDALExtendedDataTypeH, (GDALEDTComponentH,), hComp))
end

"""
    GDALDatasetGetRootGroup(GDALDatasetH hDS) -> GDALGroupH

Return the root GDALGroup of this dataset.
"""
function gdaldatasetgetrootgroup(hDS)
    aftercare(ccall((:GDALDatasetGetRootGroup, libgdal), GDALGroupH, (GDALDatasetH,), hDS))
end

"""
    GDALGroupRelease(GDALGroupH hGroup) -> void

Release the GDAL in-memory object associated with a GDALGroupH.
"""
function gdalgrouprelease(hGroup)
    aftercare(ccall((:GDALGroupRelease, libgdal), Cvoid, (GDALGroupH,), hGroup))
end

"""
    GDALGroupGetName(GDALGroupH hGroup) -> const char *

Return the name of the group.
"""
function gdalgroupgetname(hGroup)
    aftercare(ccall((:GDALGroupGetName, libgdal), Cstring, (GDALGroupH,), hGroup), false)
end

"""
    GDALGroupGetFullName(GDALGroupH hGroup) -> const char *

Return the full name of the group.
"""
function gdalgroupgetfullname(hGroup)
    aftercare(ccall((:GDALGroupGetFullName, libgdal), Cstring, (GDALGroupH,), hGroup), false)
end

"""
    GDALGroupGetMDArrayNames(GDALGroupH hGroup,
                             CSLConstList papszOptions) -> char **

Return the list of multidimensional array names contained in this group.

### Returns
the array names, to be freed with CSLDestroy()
"""
function gdalgroupgetmdarraynames(hGroup, papszOptions)
    aftercare(ccall((:GDALGroupGetMDArrayNames, libgdal), Ptr{Cstring}, (GDALGroupH, CSLConstList), hGroup, papszOptions))
end

"""
    GDALGroupOpenMDArray(GDALGroupH hGroup,
                         const char * pszMDArrayName,
                         CSLConstList papszOptions) -> GDALMDArrayH

Open and return a multidimensional array.

### Returns
the array, to be freed with GDALMDArrayRelease(), or nullptr.
"""
function gdalgroupopenmdarray(hGroup, pszMDArrayName, papszOptions)
    aftercare(ccall((:GDALGroupOpenMDArray, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszMDArrayName, papszOptions))
end

"""
    GDALGroupOpenMDArrayFromFullname(GDALGroupH hGroup,
                                     const char * pszFullname,
                                     CSLConstList papszOptions) -> GDALMDArrayH

Open and return a multidimensional array from its fully qualified name.

### Returns
the array, to be freed with GDALMDArrayRelease(), or nullptr.
"""
function gdalgroupopenmdarrayfromfullname(hGroup, pszMDArrayName, papszOptions)
    aftercare(ccall((:GDALGroupOpenMDArrayFromFullname, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszMDArrayName, papszOptions))
end

"""
    GDALGroupResolveMDArray(GDALGroupH hGroup,
                            const char * pszName,
                            const char * pszStartingPoint,
                            CSLConstList papszOptions) -> GDALMDArrayH

Locate an array in a group and its subgroups by name.
"""
function gdalgroupresolvemdarray(hGroup, pszName, pszStartingPoint, papszOptions)
    aftercare(ccall((:GDALGroupResolveMDArray, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, Cstring, CSLConstList), hGroup, pszName, pszStartingPoint, papszOptions))
end

"""
    GDALGroupGetGroupNames(GDALGroupH hGroup,
                           CSLConstList papszOptions) -> char **

Return the list of sub-groups contained in this group.

### Returns
the group names, to be freed with CSLDestroy()
"""
function gdalgroupgetgroupnames(hGroup, papszOptions)
    aftercare(ccall((:GDALGroupGetGroupNames, libgdal), Ptr{Cstring}, (GDALGroupH, CSLConstList), hGroup, papszOptions))
end

"""
    GDALGroupOpenGroup(GDALGroupH hGroup,
                       const char * pszSubGroupName,
                       CSLConstList papszOptions) -> GDALGroupH

Open and return a sub-group.

### Returns
the sub-group, to be freed with GDALGroupRelease(), or nullptr.
"""
function gdalgroupopengroup(hGroup, pszSubGroupName, papszOptions)
    aftercare(ccall((:GDALGroupOpenGroup, libgdal), GDALGroupH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszSubGroupName, papszOptions))
end

"""
    GDALGroupOpenGroupFromFullname(GDALGroupH hGroup,
                                   const char * pszFullname,
                                   CSLConstList papszOptions) -> GDALGroupH

Open and return a sub-group from its fully qualified name.

### Returns
the sub-group, to be freed with GDALGroupRelease(), or nullptr.
"""
function gdalgroupopengroupfromfullname(hGroup, pszMDArrayName, papszOptions)
    aftercare(ccall((:GDALGroupOpenGroupFromFullname, libgdal), GDALGroupH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszMDArrayName, papszOptions))
end

"""
    GDALGroupGetDimensions(GDALGroupH hGroup,
                           size_t * pnCount,
                           CSLConstList papszOptions) -> GDALDimensionH *

Return the list of dimensions contained in this group and used by its arrays.

### Parameters
* **hGroup**: Group.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.
* **papszOptions**: Driver specific options determining how dimensions should be retrieved. Pass nullptr for default behavior.

### Returns
an array of *pnCount dimensions.
"""
function gdalgroupgetdimensions(hGroup, pnCount, papszOptions)
    aftercare(ccall((:GDALGroupGetDimensions, libgdal), Ptr{GDALDimensionH}, (GDALGroupH, Ptr{Csize_t}, CSLConstList), hGroup, pnCount, papszOptions))
end

"""
    GDALGroupGetAttribute(GDALGroupH hGroup,
                          const char * pszName) -> GDALAttributeH

Return an attribute by its name.
"""
function gdalgroupgetattribute(hGroup, pszName)
    aftercare(ccall((:GDALGroupGetAttribute, libgdal), GDALAttributeH, (GDALGroupH, Cstring), hGroup, pszName))
end

"""
    GDALGroupGetAttributes(GDALGroupH hGroup,
                           size_t * pnCount,
                           CSLConstList papszOptions) -> GDALAttributeH *

Return the list of attributes contained in this group.

### Parameters
* **hGroup**: Group.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.
* **papszOptions**: Driver specific options determining how attributes should be retrieved. Pass nullptr for default behavior.

### Returns
an array of *pnCount attributes.
"""
function gdalgroupgetattributes(hGroup, pnCount, papszOptions)
    aftercare(ccall((:GDALGroupGetAttributes, libgdal), Ptr{GDALAttributeH}, (GDALGroupH, Ptr{Csize_t}, CSLConstList), hGroup, pnCount, papszOptions))
end

"""
    GDALGroupGetStructuralInfo(GDALGroupH hGroup) -> CSLConstList

Return structural information on the group.
"""
function gdalgroupgetstructuralinfo(hGroup)
    aftercare(ccall((:GDALGroupGetStructuralInfo, libgdal), CSLConstList, (GDALGroupH,), hGroup))
end

"""
    GDALGroupCreateGroup(GDALGroupH hGroup,
                         const char * pszSubGroupName,
                         CSLConstList papszOptions) -> GDALGroupH

Create a sub-group within a group.

### Returns
the sub-group, to be freed with GDALGroupRelease(), or nullptr.
"""
function gdalgroupcreategroup(hGroup, pszSubGroupName, papszOptions)
    aftercare(ccall((:GDALGroupCreateGroup, libgdal), GDALGroupH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszSubGroupName, papszOptions))
end

"""
    GDALGroupCreateDimension(GDALGroupH hGroup,
                             const char * pszName,
                             const char * pszType,
                             const char * pszDirection,
                             GUInt64 nSize,
                             CSLConstList papszOptions) -> GDALDimensionH

Create a dimension within a group.

### Returns
the dimension, to be freed with GDALDimensionRelease(), or nullptr.
"""
function gdalgroupcreatedimension(hGroup, pszName, pszType, pszDirection, nSize, papszOptions)
    aftercare(ccall((:GDALGroupCreateDimension, libgdal), GDALDimensionH, (GDALGroupH, Cstring, Cstring, Cstring, GUInt64, CSLConstList), hGroup, pszName, pszType, pszDirection, nSize, papszOptions))
end

"""
    GDALGroupCreateMDArray(GDALGroupH hGroup,
                           const char * pszName,
                           size_t nDimensions,
                           GDALDimensionH * pahDimensions,
                           GDALExtendedDataTypeH hEDT,
                           CSLConstList papszOptions) -> GDALMDArrayH

Create a multidimensional array within a group.

### Returns
the array, to be freed with GDALMDArrayRelease(), or nullptr.
"""
function gdalgroupcreatemdarray(hGroup, pszName, nDimensions, pahDimensions, hEDT, papszOptions)
    aftercare(ccall((:GDALGroupCreateMDArray, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, Csize_t, Ptr{GDALDimensionH}, GDALExtendedDataTypeH, CSLConstList), hGroup, pszName, nDimensions, pahDimensions, hEDT, papszOptions))
end

"""
    GDALGroupCreateAttribute(GDALGroupH hGroup,
                             const char * pszName,
                             size_t nDimensions,
                             const GUInt64 * panDimensions,
                             GDALExtendedDataTypeH hEDT,
                             CSLConstList papszOptions) -> GDALAttributeH

Create a attribute within a group.

### Returns
the attribute, to be freed with GDALAttributeRelease(), or nullptr.
"""
function gdalgroupcreateattribute(hGroup, pszName, nDimensions, panDimensions, hEDT, papszOptions)
    aftercare(ccall((:GDALGroupCreateAttribute, libgdal), GDALAttributeH, (GDALGroupH, Cstring, Csize_t, Ptr{GUInt64}, GDALExtendedDataTypeH, CSLConstList), hGroup, pszName, nDimensions, panDimensions, hEDT, papszOptions))
end

"""
    GDALMDArrayRelease(GDALMDArrayH hMDArray) -> void

Release the GDAL in-memory object associated with a GDALMDArray.
"""
function gdalmdarrayrelease(hMDArray)
    aftercare(ccall((:GDALMDArrayRelease, libgdal), Cvoid, (GDALMDArrayH,), hMDArray))
end

"""
    GDALMDArrayGetName(GDALMDArrayH hArray) -> const char *

Return array name.
"""
function gdalmdarraygetname(hArray)
    aftercare(ccall((:GDALMDArrayGetName, libgdal), Cstring, (GDALMDArrayH,), hArray), false)
end

"""
    GDALMDArrayGetFullName(GDALMDArrayH hArray) -> const char *

Return array full name.
"""
function gdalmdarraygetfullname(hArray)
    aftercare(ccall((:GDALMDArrayGetFullName, libgdal), Cstring, (GDALMDArrayH,), hArray), false)
end

"""
    GDALMDArrayGetTotalElementsCount(GDALMDArrayH hArray) -> GUInt64

Return the total number of values in the array.
"""
function gdalmdarraygettotalelementscount(hArray)
    aftercare(ccall((:GDALMDArrayGetTotalElementsCount, libgdal), GUInt64, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetDimensionCount(GDALMDArrayH hArray) -> size_t

Return the number of dimensions.
"""
function gdalmdarraygetdimensioncount(hArray)
    aftercare(ccall((:GDALMDArrayGetDimensionCount, libgdal), Csize_t, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetDimensions(GDALMDArrayH hArray,
                             size_t * pnCount) -> GDALDimensionH *

Return the dimensions of the array.

### Parameters
* **hArray**: Array.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
an array of *pnCount dimensions.
"""
function gdalmdarraygetdimensions(hArray, pnCount)
    aftercare(ccall((:GDALMDArrayGetDimensions, libgdal), Ptr{GDALDimensionH}, (GDALMDArrayH, Ptr{Csize_t}), hArray, pnCount))
end

"""
    GDALMDArrayGetDataType(GDALMDArrayH hArray) -> GDALExtendedDataTypeH

Return the data type.
"""
function gdalmdarraygetdatatype(hArray)
    aftercare(ccall((:GDALMDArrayGetDataType, libgdal), GDALExtendedDataTypeH, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayRead(GDALMDArrayH hArray,
                    const GUInt64 * arrayStartIdx,
                    const size_t * count,
                    const GInt64 * arrayStep,
                    const GPtrDiff_t * bufferStride,
                    GDALExtendedDataTypeH bufferDataType,
                    void * pDstBuffer,
                    const void * pDstBufferAllocStart,
                    size_t nDstBufferAllocSize) -> int

Read part or totality of a multidimensional array.

### Returns
TRUE in case of success.
"""
function gdalmdarrayread(hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pDstBuffer, pDstBufferAllocStart, nDstBufferllocSize)
    aftercare(ccall((:GDALMDArrayRead, libgdal), Cint, (GDALMDArrayH, Ptr{GUInt64}, Ptr{Csize_t}, Ptr{GInt64}, Ptr{GPtrDiff_t}, GDALExtendedDataTypeH, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pDstBuffer, pDstBufferAllocStart, nDstBufferllocSize))
end

"""
    GDALMDArrayWrite(GDALMDArrayH hArray,
                     const GUInt64 * arrayStartIdx,
                     const size_t * count,
                     const GInt64 * arrayStep,
                     const GPtrDiff_t * bufferStride,
                     GDALExtendedDataTypeH bufferDataType,
                     const void * pSrcBuffer,
                     const void * pSrcBufferAllocStart,
                     size_t nSrcBufferAllocSize) -> int

Write part or totality of a multidimensional array.

### Returns
TRUE in case of success.
"""
function gdalmdarraywrite(hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pSrcBuffer, psrcBufferAllocStart, nSrcBufferllocSize)
    aftercare(ccall((:GDALMDArrayWrite, libgdal), Cint, (GDALMDArrayH, Ptr{GUInt64}, Ptr{Csize_t}, Ptr{GInt64}, Ptr{GPtrDiff_t}, GDALExtendedDataTypeH, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pSrcBuffer, psrcBufferAllocStart, nSrcBufferllocSize))
end

"""
    GDALMDArrayAdviseRead(GDALMDArrayH hArray,
                          const GUInt64 * arrayStartIdx,
                          const size_t * count) -> int

Advise driver of upcoming read requests.

### Returns
TRUE in case of success.
"""
function gdalmdarrayadviseread(hArray, arrayStartIdx, count)
    aftercare(ccall((:GDALMDArrayAdviseRead, libgdal), Cint, (GDALMDArrayH, Ptr{GUInt64}, Ptr{Csize_t}), hArray, arrayStartIdx, count))
end

"""
    GDALMDArrayGetAttribute(GDALMDArrayH hArray,
                            const char * pszName) -> GDALAttributeH

Return an attribute by its name.
"""
function gdalmdarraygetattribute(hArray, pszName)
    aftercare(ccall((:GDALMDArrayGetAttribute, libgdal), GDALAttributeH, (GDALMDArrayH, Cstring), hArray, pszName))
end

"""
    GDALMDArrayGetAttributes(GDALMDArrayH hArray,
                             size_t * pnCount,
                             CSLConstList papszOptions) -> GDALAttributeH *

Return the list of attributes contained in this array.

### Parameters
* **hArray**: Array.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.
* **papszOptions**: Driver specific options determining how attributes should be retrieved. Pass nullptr for default behavior.

### Returns
an array of *pnCount attributes.
"""
function gdalmdarraygetattributes(hArray, pnCount, papszOptions)
    aftercare(ccall((:GDALMDArrayGetAttributes, libgdal), Ptr{GDALAttributeH}, (GDALMDArrayH, Ptr{Csize_t}, CSLConstList), hArray, pnCount, papszOptions))
end

"""
    GDALMDArrayCreateAttribute(GDALMDArrayH hArray,
                               const char * pszName,
                               size_t nDimensions,
                               const GUInt64 * panDimensions,
                               GDALExtendedDataTypeH hEDT,
                               CSLConstList papszOptions) -> GDALAttributeH

Create a attribute within an array.

### Returns
the attribute, to be freed with GDALAttributeRelease(), or nullptr.
"""
function gdalmdarraycreateattribute(hArray, pszName, nDimensions, panDimensions, hEDT, papszOptions)
    aftercare(ccall((:GDALMDArrayCreateAttribute, libgdal), GDALAttributeH, (GDALMDArrayH, Cstring, Csize_t, Ptr{GUInt64}, GDALExtendedDataTypeH, CSLConstList), hArray, pszName, nDimensions, panDimensions, hEDT, papszOptions))
end

"""
    GDALMDArrayGetRawNoDataValue(GDALMDArrayH hArray) -> const void *

Return the nodata value as a "raw" value.

### Returns
nullptr or a pointer to GetDataType().GetSize() bytes.
"""
function gdalmdarraygetrawnodatavalue(hArray)
    aftercare(ccall((:GDALMDArrayGetRawNoDataValue, libgdal), Ptr{Cvoid}, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetNoDataValueAsDouble(GDALMDArrayH hArray,
                                      int * pbHasNoDataValue) -> double

Return the nodata value as a double.

### Parameters
* **hArray**: Array handle.
* **pbHasNoDataValue**: Pointer to a output boolean that will be set to true if a nodata value exists and can be converted to double. Might be nullptr.

### Returns
the nodata value as a double. A 0.0 value might also indicate the absence of a nodata value or an error in the conversion (*pbHasNoDataValue will be set to false then).
"""
function gdalmdarraygetnodatavalueasdouble(hArray, pbHasNoDataValue)
    aftercare(ccall((:GDALMDArrayGetNoDataValueAsDouble, libgdal), Cdouble, (GDALMDArrayH, Ptr{Cint}), hArray, pbHasNoDataValue))
end

"""
    GDALMDArraySetRawNoDataValue(GDALMDArrayH hArray,
                                 const void * pNoData) -> int

Set the nodata value as a "raw" value.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetrawnodatavalue(hArray, arg1)
    aftercare(ccall((:GDALMDArraySetRawNoDataValue, libgdal), Cint, (GDALMDArrayH, Ptr{Cvoid}), hArray, arg1))
end

"""
    GDALMDArraySetNoDataValueAsDouble(GDALMDArrayH hArray,
                                      double dfNoDataValue) -> int

Set the nodata value as a double.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetnodatavalueasdouble(hArray, dfNoDataValue)
    aftercare(ccall((:GDALMDArraySetNoDataValueAsDouble, libgdal), Cint, (GDALMDArrayH, Cdouble), hArray, dfNoDataValue))
end

"""
    GDALMDArraySetScale(GDALMDArrayH hArray,
                        double dfScale) -> int

Set the scale value to apply to raw values.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetscale(hArray, dfScale)
    aftercare(ccall((:GDALMDArraySetScale, libgdal), Cint, (GDALMDArrayH, Cdouble), hArray, dfScale))
end

"""
    GDALMDArrayGetScale(GDALMDArrayH hArray,
                        int * pbHasValue) -> double

Get the scale value to apply to raw values.

### Returns
the scale value
"""
function gdalmdarraygetscale(hArray, pbHasValue)
    aftercare(ccall((:GDALMDArrayGetScale, libgdal), Cdouble, (GDALMDArrayH, Ptr{Cint}), hArray, pbHasValue))
end

"""
    GDALMDArraySetOffset(GDALMDArrayH hArray,
                         double dfOffset) -> int

Set the scale value to apply to raw values.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetoffset(hArray, dfOffset)
    aftercare(ccall((:GDALMDArraySetOffset, libgdal), Cint, (GDALMDArrayH, Cdouble), hArray, dfOffset))
end

"""
    GDALMDArrayGetOffset(GDALMDArrayH hArray,
                         int * pbHasValue) -> double

Get the scale value to apply to raw values.

### Returns
the scale value
"""
function gdalmdarraygetoffset(hArray, pbHasValue)
    aftercare(ccall((:GDALMDArrayGetOffset, libgdal), Cdouble, (GDALMDArrayH, Ptr{Cint}), hArray, pbHasValue))
end

"""
    GDALMDArrayGetBlockSize(GDALMDArrayH hArray,
                            size_t * pnCount) -> GUInt64 *

Return the "natural" block size of the array along all dimensions.

### Returns
the block size, in number of elemnts along each dimension.
"""
function gdalmdarraygetblocksize(hArray, pnCount)
    aftercare(ccall((:GDALMDArrayGetBlockSize, libgdal), Ptr{GUInt64}, (GDALMDArrayH, Ptr{Csize_t}), hArray, pnCount))
end

"""
    GDALMDArraySetUnit(GDALMDArrayH hArray,
                       const char * pszUnit) -> int

Set the variable unit.

### Parameters
* **hArray**: array.
* **pszUnit**: unit name.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetunit(hArray, arg1)
    aftercare(ccall((:GDALMDArraySetUnit, libgdal), Cint, (GDALMDArrayH, Cstring), hArray, arg1))
end

"""
    GDALMDArrayGetUnit(GDALMDArrayH hArray) -> const char *

Return the array unit.
"""
function gdalmdarraygetunit(hArray)
    aftercare(ccall((:GDALMDArrayGetUnit, libgdal), Cstring, (GDALMDArrayH,), hArray), false)
end

"""
    GDALMDArraySetSpatialRef(GDALMDArrayH hArray,
                             OGRSpatialReferenceH hSRS) -> int

Assign a spatial reference system object to the the array.

### Returns
TRUE in case of success.
"""
function gdalmdarraysetspatialref(arg1, arg2)
    aftercare(ccall((:GDALMDArraySetSpatialRef, libgdal), Cint, (GDALMDArrayH, OGRSpatialReferenceH), arg1, arg2))
end

"""
    GDALMDArrayGetSpatialRef(GDALMDArrayH hArray) -> OGRSpatialReferenceH

Return the spatial reference system object associated with the array.
"""
function gdalmdarraygetspatialref(hArray)
    aftercare(ccall((:GDALMDArrayGetSpatialRef, libgdal), OGRSpatialReferenceH, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetProcessingChunkSize(GDALMDArrayH hArray,
                                      size_t * pnCount,
                                      size_t nMaxChunkMemory) -> size_t *

Return an optimal chunk size for read/write oerations, given the natural block size and memory constraints specified.

### Parameters
* **hArray**: Array.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.
* **nMaxChunkMemory**: Maximum amount of memory, in bytes, to use for the chunk.

### Returns
the chunk size, in number of elemnts along each dimension.
"""
function gdalmdarraygetprocessingchunksize(hArray, pnCount, nMaxChunkMemory)
    aftercare(ccall((:GDALMDArrayGetProcessingChunkSize, libgdal), Ptr{Csize_t}, (GDALMDArrayH, Ptr{Csize_t}, Csize_t), hArray, pnCount, nMaxChunkMemory))
end

"""
    GDALMDArrayGetStructuralInfo(GDALMDArrayH hArray) -> CSLConstList

Return structural information on the array.
"""
function gdalmdarraygetstructuralinfo(hArray)
    aftercare(ccall((:GDALMDArrayGetStructuralInfo, libgdal), CSLConstList, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetView(GDALMDArrayH hArray,
                       const char * pszViewExpr) -> GDALMDArrayH

Return a view of the array using slicing or field access.
"""
function gdalmdarraygetview(hArray, pszViewExpr)
    aftercare(ccall((:GDALMDArrayGetView, libgdal), GDALMDArrayH, (GDALMDArrayH, Cstring), hArray, pszViewExpr))
end

"""
    GDALMDArrayTranspose(GDALMDArrayH hArray,
                         size_t nNewAxisCount,
                         const int * panMapNewAxisToOldAxis) -> GDALMDArrayH

Return a view of the array whose axis have been reordered.
"""
function gdalmdarraytranspose(hArray, nNewAxisCount, panMapNewAxisToOldAxis)
    aftercare(ccall((:GDALMDArrayTranspose, libgdal), GDALMDArrayH, (GDALMDArrayH, Csize_t, Ptr{Cint}), hArray, nNewAxisCount, panMapNewAxisToOldAxis))
end

"""
    GDALMDArrayGetUnscaled(GDALMDArrayH hArray) -> GDALMDArrayH

Return an array that is the unscaled version of the current one.
"""
function gdalmdarraygetunscaled(hArray)
    aftercare(ccall((:GDALMDArrayGetUnscaled, libgdal), GDALMDArrayH, (GDALMDArrayH,), hArray))
end

"""
    GDALMDArrayGetMask(GDALMDArrayH hArray,
                       CSLConstList papszOptions) -> GDALMDArrayH

Return an array that is a mask for the current array.
"""
function gdalmdarraygetmask(hArray, papszOptions)
    aftercare(ccall((:GDALMDArrayGetMask, libgdal), GDALMDArrayH, (GDALMDArrayH, CSLConstList), hArray, papszOptions))
end

"""
    GDALMDArrayAsClassicDataset(GDALMDArrayH hArray,
                                size_t iXDim,
                                size_t iYDim) -> GDALDatasetH

Return a view of this array as a "classic" GDALDataset (ie 2D)

### Parameters
* **hArray**: Array.
* **iXDim**: Index of the dimension that will be used as the X/width axis.
* **iYDim**: Index of the dimension that will be used as the Y/height axis.

### Returns
a new GDALDataset that must be freed with GDALClose(), or nullptr
"""
function gdalmdarrayasclassicdataset(hArray, iXDim, iYDim)
    aftercare(ccall((:GDALMDArrayAsClassicDataset, libgdal), GDALDatasetH, (GDALMDArrayH, Csize_t, Csize_t), hArray, iXDim, iYDim))
end

"""
    GDALMDArrayGetStatistics(GDALMDArrayH hArray,
                             GDALDatasetH hDS,
                             int bApproxOK,
                             int bForce,
                             double * pdfMin,
                             double * pdfMax,
                             double * pdfMean,
                             double * pdfStdDev,
                             GUInt64 * pnValidCount,
                             GDALProgressFunc pfnProgress,
                             void * pProgressData) -> CPLErr

Fetch statistics.
"""
function gdalmdarraygetstatistics(hArray, arg1, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, pfnProgress, pProgressData)
    aftercare(ccall((:GDALMDArrayGetStatistics, libgdal), CPLErr, (GDALMDArrayH, GDALDatasetH, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{GUInt64}, GDALProgressFunc, Ptr{Cvoid}), hArray, arg1, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, pfnProgress, pProgressData))
end

"""
    GDALMDArrayComputeStatistics(GDALMDArrayH hArray,
                                 GDALDatasetH hDS,
                                 int bApproxOK,
                                 double * pdfMin,
                                 double * pdfMax,
                                 double * pdfMean,
                                 double * pdfStdDev,
                                 GUInt64 * pnValidCount,
                                 GDALProgressFunc pfnProgress,
                                 void * pProgressData) -> int

Compute statistics.
"""
function gdalmdarraycomputestatistics(hArray, arg1, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, arg2, pProgressData)
    aftercare(ccall((:GDALMDArrayComputeStatistics, libgdal), Cint, (GDALMDArrayH, GDALDatasetH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{GUInt64}, GDALProgressFunc, Ptr{Cvoid}), hArray, arg1, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, arg2, pProgressData))
end

"""
    GDALAttributeRelease(GDALAttributeH hAttr) -> void

Release the GDAL in-memory object associated with a GDALAttribute.
"""
function gdalattributerelease(hAttr)
    aftercare(ccall((:GDALAttributeRelease, libgdal), Cvoid, (GDALAttributeH,), hAttr))
end

"""
    GDALReleaseAttributes(GDALAttributeH * attributes,
                          size_t nCount) -> void

Free the return of GDALGroupGetAttributes() or GDALMDArrayGetAttributes()

### Parameters
* **attributes**: return pointer of above methods
* **nCount**: *pnCount value returned by above methods
"""
function gdalreleaseattributes(attributes, nCount)
    aftercare(ccall((:GDALReleaseAttributes, libgdal), Cvoid, (Ptr{GDALAttributeH}, Csize_t), attributes, nCount))
end

"""
    GDALAttributeGetName(GDALAttributeH hAttr) -> const char *

Return the name of the attribute.
"""
function gdalattributegetname(hAttr)
    aftercare(ccall((:GDALAttributeGetName, libgdal), Cstring, (GDALAttributeH,), hAttr), false)
end

"""
    GDALAttributeGetFullName(GDALAttributeH hAttr) -> const char *

Return the full name of the attribute.
"""
function gdalattributegetfullname(hAttr)
    aftercare(ccall((:GDALAttributeGetFullName, libgdal), Cstring, (GDALAttributeH,), hAttr), false)
end

"""
    GDALAttributeGetTotalElementsCount(GDALAttributeH hAttr) -> GUInt64

Return the total number of values in the attribute.
"""
function gdalattributegettotalelementscount(hAttr)
    aftercare(ccall((:GDALAttributeGetTotalElementsCount, libgdal), GUInt64, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeGetDimensionCount(GDALAttributeH hAttr) -> size_t

Return the number of dimensions.
"""
function gdalattributegetdimensioncount(hAttr)
    aftercare(ccall((:GDALAttributeGetDimensionCount, libgdal), Csize_t, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeGetDimensionsSize(GDALAttributeH hAttr,
                                   size_t * pnCount) -> GUInt64 *

Return the dimension sizes of the attribute.

### Parameters
* **hAttr**: Attribute.
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
an array of *pnCount values.
"""
function gdalattributegetdimensionssize(hAttr, pnCount)
    aftercare(ccall((:GDALAttributeGetDimensionsSize, libgdal), Ptr{GUInt64}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnCount))
end

"""
    GDALAttributeGetDataType(GDALAttributeH hAttr) -> GDALExtendedDataTypeH

Return the data type.
"""
function gdalattributegetdatatype(hAttr)
    aftercare(ccall((:GDALAttributeGetDataType, libgdal), GDALExtendedDataTypeH, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeReadAsRaw(GDALAttributeH hAttr,
                           size_t * pnSize) -> GByte *

Return the raw value of an attribute.

### Parameters
* **hAttr**: Attribute.
* **pnSize**: Pointer to the number of bytes returned. Must NOT be NULL.

### Returns
a buffer of *pnSize bytes.
"""
function gdalattributereadasraw(hAttr, pnSize)
    aftercare(ccall((:GDALAttributeReadAsRaw, libgdal), Ptr{GByte}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnSize))
end

"""
    GDALAttributeFreeRawResult(GDALAttributeH hAttr,
                               GByte * raw,
                               size_t nSize) -> void

Free the return of GDALAttributeAsRaw()
"""
function gdalattributefreerawresult(hAttr, raw, nSize)
    aftercare(ccall((:GDALAttributeFreeRawResult, libgdal), Cvoid, (GDALAttributeH, Ptr{GByte}, Csize_t), hAttr, raw, nSize))
end

"""
    GDALAttributeReadAsString(GDALAttributeH hAttr) -> const char *

Return the value of an attribute as a string.

### Returns
a string, or nullptr.
"""
function gdalattributereadasstring(hAttr)
    aftercare(ccall((:GDALAttributeReadAsString, libgdal), Cstring, (GDALAttributeH,), hAttr), false)
end

"""
    GDALAttributeReadAsInt(GDALAttributeH hAttr) -> int

Return the value of an attribute as a integer.

### Returns
a integer, or INT_MIN in case of error.
"""
function gdalattributereadasint(hAttr)
    aftercare(ccall((:GDALAttributeReadAsInt, libgdal), Cint, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeReadAsDouble(GDALAttributeH hAttr) -> double

Return the value of an attribute as a double.

### Returns
a double value.
"""
function gdalattributereadasdouble(hAttr)
    aftercare(ccall((:GDALAttributeReadAsDouble, libgdal), Cdouble, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeReadAsStringArray(GDALAttributeH hAttr) -> char **

Return the value of an attribute as an array of strings.
"""
function gdalattributereadasstringarray(hAttr)
    aftercare(ccall((:GDALAttributeReadAsStringArray, libgdal), Ptr{Cstring}, (GDALAttributeH,), hAttr))
end

"""
    GDALAttributeReadAsIntArray(GDALAttributeH hAttr,
                                size_t * pnCount) -> int *

Return the value of an attribute as an array of integers.

### Parameters
* **hAttr**: Attribute
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
array to be freed with CPLFree(), or nullptr.
"""
function gdalattributereadasintarray(hAttr, pnCount)
    aftercare(ccall((:GDALAttributeReadAsIntArray, libgdal), Ptr{Cint}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnCount))
end

"""
    GDALAttributeReadAsDoubleArray(GDALAttributeH hAttr,
                                   size_t * pnCount) -> double *

Return the value of an attribute as an array of doubles.

### Parameters
* **hAttr**: Attribute
* **pnCount**: Pointer to the number of values returned. Must NOT be NULL.

### Returns
array to be freed with CPLFree(), or nullptr.
"""
function gdalattributereadasdoublearray(hAttr, pnCount)
    aftercare(ccall((:GDALAttributeReadAsDoubleArray, libgdal), Ptr{Cdouble}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnCount))
end

"""
    GDALAttributeWriteRaw(GDALAttributeH hAttr,
                          const void * pabyValue,
                          size_t nLength) -> int

Write an attribute from raw values expressed in GetDataType()

### Parameters
* **hAttr**: Attribute
* **pabyValue**: Buffer of nLen bytes.
* **nLength**: Size of pabyValue in bytes. Should be equal to GetTotalElementsCount() * GetDataType().GetSize()

### Returns
TRUE in case of success.
"""
function gdalattributewriteraw(hAttr, arg1, arg2)
    aftercare(ccall((:GDALAttributeWriteRaw, libgdal), Cint, (GDALAttributeH, Ptr{Cvoid}, Csize_t), hAttr, arg1, arg2))
end

"""
    GDALAttributeWriteString(GDALAttributeH hAttr,
                             const char * pszVal) -> int

Write an attribute from a string value.

### Parameters
* **hAttr**: Attribute
* **pszVal**: Pointer to a string.

### Returns
TRUE in case of success.
"""
function gdalattributewritestring(hAttr, arg1)
    aftercare(ccall((:GDALAttributeWriteString, libgdal), Cint, (GDALAttributeH, Cstring), hAttr, arg1))
end

"""
    GDALAttributeWriteStringArray(GDALAttributeH hAttr,
                                  CSLConstList papszValues) -> int

Write an attribute from an array of strings.

### Parameters
* **hAttr**: Attribute
* **papszValues**: Array of strings.

### Returns
TRUE in case of success.
"""
function gdalattributewritestringarray(hAttr, arg1)
    aftercare(ccall((:GDALAttributeWriteStringArray, libgdal), Cint, (GDALAttributeH, CSLConstList), hAttr, arg1))
end

"""
    GDALAttributeWriteInt(GDALAttributeH hAttr,
                          int nVal) -> int

Write an attribute from a integer value.

### Parameters
* **hAttr**: Attribute
* **nVal**: Value.

### Returns
TRUE in case of success.
"""
function gdalattributewriteint(hAttr, arg1)
    aftercare(ccall((:GDALAttributeWriteInt, libgdal), Cint, (GDALAttributeH, Cint), hAttr, arg1))
end

"""
    GDALAttributeWriteDouble(GDALAttributeH hAttr,
                             double dfVal) -> int

Write an attribute from a double value.

### Parameters
* **hAttr**: Attribute
* **dfVal**: Value.

### Returns
TRUE in case of success.
"""
function gdalattributewritedouble(hAttr, arg1)
    aftercare(ccall((:GDALAttributeWriteDouble, libgdal), Cint, (GDALAttributeH, Cdouble), hAttr, arg1))
end

"""
    GDALAttributeWriteDoubleArray(GDALAttributeH hAttr,
                                  const double * padfValues,
                                  size_t nCount) -> int

Write an attribute from an array of double.

### Parameters
* **hAttr**: Attribute
* **padfValues**: Array of double.
* **nCount**: Should be equal to GetTotalElementsCount().

### Returns
TRUE in case of success.
"""
function gdalattributewritedoublearray(hAttr, arg1, arg2)
    aftercare(ccall((:GDALAttributeWriteDoubleArray, libgdal), Cint, (GDALAttributeH, Ptr{Cdouble}, Csize_t), hAttr, arg1, arg2))
end

"""
    GDALDimensionRelease(GDALDimensionH hDim) -> void

Release the GDAL in-memory object associated with a GDALDimension.
"""
function gdaldimensionrelease(hDim)
    aftercare(ccall((:GDALDimensionRelease, libgdal), Cvoid, (GDALDimensionH,), hDim))
end

"""
    GDALReleaseDimensions(GDALDimensionH * dims,
                          size_t nCount) -> void

Free the return of GDALGroupGetDimensions() or GDALMDArrayGetDimensions()

### Parameters
* **dims**: return pointer of above methods
* **nCount**: *pnCount value returned by above methods
"""
function gdalreleasedimensions(dims, nCount)
    aftercare(ccall((:GDALReleaseDimensions, libgdal), Cvoid, (Ptr{GDALDimensionH}, Csize_t), dims, nCount))
end

"""
    GDALDimensionGetName(GDALDimensionH hDim) -> const char *

Return dimension name.
"""
function gdaldimensiongetname(hDim)
    aftercare(ccall((:GDALDimensionGetName, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

"""
    GDALDimensionGetFullName(GDALDimensionH hDim) -> const char *

Return dimension full name.
"""
function gdaldimensiongetfullname(hDim)
    aftercare(ccall((:GDALDimensionGetFullName, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

"""
    GDALDimensionGetType(GDALDimensionH hDim) -> const char *

Return dimension type.
"""
function gdaldimensiongettype(hDim)
    aftercare(ccall((:GDALDimensionGetType, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

"""
    GDALDimensionGetDirection(GDALDimensionH hDim) -> const char *

Return dimension direction.
"""
function gdaldimensiongetdirection(hDim)
    aftercare(ccall((:GDALDimensionGetDirection, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

"""
    GDALDimensionGetSize(GDALDimensionH hDim) -> GUInt64

Return the size, that is the number of values along the dimension.
"""
function gdaldimensiongetsize(hDim)
    aftercare(ccall((:GDALDimensionGetSize, libgdal), GUInt64, (GDALDimensionH,), hDim))
end

"""
    GDALDimensionGetIndexingVariable(GDALDimensionH hDim) -> GDALMDArrayH

Return the variable that is used to index the dimension (if there is one).
"""
function gdaldimensiongetindexingvariable(hDim)
    aftercare(ccall((:GDALDimensionGetIndexingVariable, libgdal), GDALMDArrayH, (GDALDimensionH,), hDim))
end

"""
    GDALDimensionSetIndexingVariable(GDALDimensionH hDim,
                                     GDALMDArrayH hArray) -> int

Set the variable that is used to index the dimension.

### Returns
TRUE in case of success.
"""
function gdaldimensionsetindexingvariable(hDim, hArray)
    aftercare(ccall((:GDALDimensionSetIndexingVariable, libgdal), Cint, (GDALDimensionH, GDALMDArrayH), hDim, hArray))
end
