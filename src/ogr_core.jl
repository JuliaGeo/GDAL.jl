# Julia wrapper for header: ogr_core.h
# Automatically generated using Clang.jl


"""
    OGRMalloc(size_t size) -> void *
"""
function ogrmalloc()
    aftercare(ccall((:OGRMalloc, libgdal), Ptr{Cvoid}, ()))
end

"""
    OGRCalloc(size_t count,
              size_t size) -> void *
"""
function ogrcalloc()
    aftercare(ccall((:OGRCalloc, libgdal), Ptr{Cvoid}, ()))
end

"""
    OGRRealloc(void * pOld,
               size_t size) -> void *
"""
function ogrrealloc(arg1, size_t)
    aftercare(ccall((:OGRRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Cint), arg1, size_t))
end

function ogrstrdup(arg1)
    aftercare(ccall((:OGRStrdup, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    OGRFree(void * pMemory) -> void
"""
function ogrfree(arg1)
    aftercare(ccall((:OGRFree, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

"""
    OGRGeometryTypeToName(OGRwkbGeometryType eType) -> const char *

Fetch a human readable name corresponding to an OGRwkbGeometryType value.

### Parameters
* **eType**: the geometry type.

### Returns
internal human readable string, or NULL on failure.
"""
function ogrgeometrytypetoname(eType)
    aftercare(ccall((:OGRGeometryTypeToName, libgdal), Cstring, (OGRwkbGeometryType,), eType), false)
end

"""
    OGRMergeGeometryTypes(OGRwkbGeometryType eMain,
                          OGRwkbGeometryType eExtra) -> OGRwkbGeometryType

Find common geometry type.

### Parameters
* **eMain**: the first input geometry type.
* **eExtra**: the second input geometry type.

### Returns
the merged geometry type.
"""
function ogrmergegeometrytypes(eMain, eExtra)
    aftercare(ccall((:OGRMergeGeometryTypes, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, OGRwkbGeometryType), eMain, eExtra))
end

"""
    OGRMergeGeometryTypesEx(OGRwkbGeometryType eMain,
                            OGRwkbGeometryType eExtra,
                            int bAllowPromotingToCurves) -> OGRwkbGeometryType

Find common geometry type.

### Parameters
* **eMain**: the first input geometry type.
* **eExtra**: the second input geometry type.
* **bAllowPromotingToCurves**: determine if promotion to curve type must be done.

### Returns
the merged geometry type.
"""
function ogrmergegeometrytypesex(eMain, eExtra, bAllowPromotingToCurves)
    aftercare(ccall((:OGRMergeGeometryTypesEx, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, OGRwkbGeometryType, Cint), eMain, eExtra, bAllowPromotingToCurves))
end

"""
    OGR_GT_Flatten(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the 2D geometry type corresponding to the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
2D geometry type corresponding to the passed geometry type.
"""
function ogr_gt_flatten(eType)
    aftercare(ccall((:OGR_GT_Flatten, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_SetZ(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the 3D geometry type corresponding to the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
3D geometry type corresponding to the passed geometry type.
"""
function ogr_gt_setz(eType)
    aftercare(ccall((:OGR_GT_SetZ, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_SetM(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the measured geometry type corresponding to the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
measured geometry type corresponding to the passed geometry type.
"""
function ogr_gt_setm(eType)
    aftercare(ccall((:OGR_GT_SetM, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_SetModifier(OGRwkbGeometryType eType,
                       int bHasZ,
                       int bHasM) -> OGRwkbGeometryType

Returns a XY, XYZ, XYM or XYZM geometry type depending on parameter.

### Parameters
* **eType**: Input geometry type
* **bHasZ**: TRUE if the output geometry type must be 3D.
* **bHasM**: TRUE if the output geometry type must be measured.

### Returns
Output geometry type.
"""
function ogr_gt_setmodifier(eType, bSetZ, bSetM)
    aftercare(ccall((:OGR_GT_SetModifier, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, Cint, Cint), eType, bSetZ, bSetM))
end

"""
    OGR_GT_HasZ(OGRwkbGeometryType eType) -> int

Return if the geometry type is a 3D geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
TRUE if the geometry type is a 3D geometry type.
"""
function ogr_gt_hasz(eType)
    aftercare(ccall((:OGR_GT_HasZ, libgdal), Cint, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_HasM(OGRwkbGeometryType eType) -> int

Return if the geometry type is a measured type.

### Parameters
* **eType**: Input geometry type

### Returns
TRUE if the geometry type is a measured type.
"""
function ogr_gt_hasm(eType)
    aftercare(ccall((:OGR_GT_HasM, libgdal), Cint, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_IsSubClassOf(OGRwkbGeometryType eType,
                        OGRwkbGeometryType eSuperType) -> int

Returns if a type is a subclass of another one.

### Parameters
* **eType**: Type.
* **eSuperType**: Super type

### Returns
TRUE if eType is a subclass of eSuperType.
"""
function ogr_gt_issubclassof(eType, eSuperType)
    aftercare(ccall((:OGR_GT_IsSubClassOf, libgdal), Cint, (OGRwkbGeometryType, OGRwkbGeometryType), eType, eSuperType))
end

"""
    OGR_GT_IsCurve(OGRwkbGeometryType eGeomType) -> int

Return if a geometry type is an instance of Curve.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is an instance of Curve
"""
function ogr_gt_iscurve(arg1)
    aftercare(ccall((:OGR_GT_IsCurve, libgdal), Cint, (OGRwkbGeometryType,), arg1))
end

"""
    OGR_GT_IsSurface(OGRwkbGeometryType eGeomType) -> int

Return if a geometry type is an instance of Surface.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is an instance of Surface
"""
function ogr_gt_issurface(arg1)
    aftercare(ccall((:OGR_GT_IsSurface, libgdal), Cint, (OGRwkbGeometryType,), arg1))
end

"""
    OGR_GT_IsNonLinear(OGRwkbGeometryType eGeomType) -> int

Return if a geometry type is a non-linear geometry type.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is a non-linear geometry type.
"""
function ogr_gt_isnonlinear(arg1)
    aftercare(ccall((:OGR_GT_IsNonLinear, libgdal), Cint, (OGRwkbGeometryType,), arg1))
end

"""
    OGR_GT_GetCollection(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the collection type that can contain the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
the collection type that can contain the passed geometry type or wkbUnknown
"""
function ogr_gt_getcollection(eType)
    aftercare(ccall((:OGR_GT_GetCollection, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_GetCurve(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the curve geometry type that can contain the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
the curve type that can contain the passed geometry type
"""
function ogr_gt_getcurve(eType)
    aftercare(ccall((:OGR_GT_GetCurve, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGR_GT_GetLinear(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the non-curve geometry type that can contain the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
the non-curve type that can contain the passed geometry type
"""
function ogr_gt_getlinear(eType)
    aftercare(ccall((:OGR_GT_GetLinear, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

"""
    OGRParseDate(const char * pszInput,
                 OGRField * psField,
                 int nOptions) -> int

Parse date string.

### Parameters
* **pszInput**: the input date string.
* **psField**: the OGRField that will be updated with the parsed result.
* **nOptions**: parsing options, for now always 0.

### Returns
TRUE if apparently successful or FALSE on failure.
"""
function ogrparsedate(pszInput, psOutput, nOptions)
    aftercare(ccall((:OGRParseDate, libgdal), Cint, (Cstring, Ptr{OGRField}, Cint), pszInput, psOutput, nOptions))
end

"""
    GDALVersionInfo(const char * pszRequest) -> const char *

Get runtime version information.

### Parameters
* **pszRequest**: the type of version info desired, as listed above.

### Returns
an internal string containing the requested information.
"""
function gdalversioninfo(arg1)
    aftercare(ccall((:GDALVersionInfo, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    GDALCheckVersion(int nVersionMajor,
                     int nVersionMinor,
                     const char * pszCallingComponentName) -> int

Return TRUE if GDAL library version at runtime matches nVersionMajor.nVersionMinor.

### Parameters
* **nVersionMajor**: Major version to be tested against
* **nVersionMinor**: Minor version to be tested against
* **pszCallingComponentName**: If not NULL, in case of version mismatch, the method will issue a failure mentioning the name of the calling component.

### Returns
TRUE if GDAL library version at runtime matches nVersionMajor.nVersionMinor, FALSE otherwise.
"""
function gdalcheckversion(nVersionMajor, nVersionMinor, pszCallingComponentName)
    aftercare(ccall((:GDALCheckVersion, libgdal), Cint, (Cint, Cint, Cstring), nVersionMajor, nVersionMinor, pszCallingComponentName))
end
