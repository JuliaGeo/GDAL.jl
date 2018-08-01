# Julia wrapper for header: /usr/local/include/ogr_core.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0



"""
    OGRMalloc(size_t size) -> void *
"""
function OGRMalloc()
    ccall((:OGRMalloc, libgdal), Ptr{Cvoid}, ())
end


"""
    OGRCalloc(size_t count,
              size_t size) -> void *
"""
function OGRCalloc()
    ccall((:OGRCalloc, libgdal), Ptr{Cvoid}, ())
end


"""
    OGRRealloc(void * pOld,
               size_t size) -> void *
"""
function OGRRealloc(arg1, size_t::Cint)
    ccall((:OGRRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Cint), arg1, size_t)
end


"""
"""
function OGRStrdup(arg1)
    ccall((:OGRStrdup, libgdal), Cstring, (Cstring,), arg1)
end


"""
    OGRFree(void * pMemory) -> void
"""
function OGRFree(arg1)
    ccall((:OGRFree, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    OGRGeometryTypeToName(OGRwkbGeometryType eType) -> const char *

Fetch a human readable name corresponding to an OGRwkbGeometryType value.

### Parameters
* **eType**: the geometry type.

### Returns
internal human readable string, or NULL on failure.
"""
function OGRGeometryTypeToName(eType::OGRwkbGeometryType)
    ccall((:OGRGeometryTypeToName, libgdal), Cstring, (OGRwkbGeometryType,), eType)
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
function OGRMergeGeometryTypes(eMain::OGRwkbGeometryType, eExtra::OGRwkbGeometryType)
    ccall((:OGRMergeGeometryTypes, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, OGRwkbGeometryType), eMain, eExtra)
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
function OGRMergeGeometryTypesEx(eMain::OGRwkbGeometryType, eExtra::OGRwkbGeometryType, bAllowPromotingToCurves::Cint)
    ccall((:OGRMergeGeometryTypesEx, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, OGRwkbGeometryType, Cint), eMain, eExtra, bAllowPromotingToCurves)
end


"""
    OGR_GT_Flatten(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the 2D geometry type corresponding to the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
2D geometry type corresponding to the passed geometry type.
"""
function OGR_GT_Flatten(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_Flatten, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType)
end


"""
    OGR_GT_SetZ(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the 3D geometry type corresponding to the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
3D geometry type corresponding to the passed geometry type.
"""
function OGR_GT_SetZ(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_SetZ, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType)
end


"""
    OGR_GT_SetM(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the measured geometry type corresponding to the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
measured geometry type corresponding to the passed geometry type.
"""
function OGR_GT_SetM(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_SetM, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType)
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
function OGR_GT_SetModifier(eType::OGRwkbGeometryType, bSetZ::Cint, bSetM::Cint)
    ccall((:OGR_GT_SetModifier, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, Cint, Cint), eType, bSetZ, bSetM)
end


"""
    OGR_GT_HasZ(OGRwkbGeometryType eType) -> int

Return if the geometry type is a 3D geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
TRUE if the geometry type is a 3D geometry type.
"""
function OGR_GT_HasZ(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_HasZ, libgdal), Cint, (OGRwkbGeometryType,), eType)
end


"""
    OGR_GT_HasM(OGRwkbGeometryType eType) -> int

Return if the geometry type is a measured type.

### Parameters
* **eType**: Input geometry type

### Returns
TRUE if the geometry type is a measured type.
"""
function OGR_GT_HasM(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_HasM, libgdal), Cint, (OGRwkbGeometryType,), eType)
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
function OGR_GT_IsSubClassOf(eType::OGRwkbGeometryType, eSuperType::OGRwkbGeometryType)
    ccall((:OGR_GT_IsSubClassOf, libgdal), Cint, (OGRwkbGeometryType, OGRwkbGeometryType), eType, eSuperType)
end


"""
    OGR_GT_IsCurve(OGRwkbGeometryType eGeomType) -> int

Return if a geometry type is an instance of Curve.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is an instance of Curve
"""
function OGR_GT_IsCurve(arg1::OGRwkbGeometryType)
    ccall((:OGR_GT_IsCurve, libgdal), Cint, (OGRwkbGeometryType,), arg1)
end


"""
    OGR_GT_IsSurface(OGRwkbGeometryType eGeomType) -> int

Return if a geometry type is an instance of Surface.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is an instance of Surface
"""
function OGR_GT_IsSurface(arg1::OGRwkbGeometryType)
    ccall((:OGR_GT_IsSurface, libgdal), Cint, (OGRwkbGeometryType,), arg1)
end


"""
    OGR_GT_IsNonLinear(OGRwkbGeometryType eGeomType) -> int

Return if a geometry type is a non-linear geometry type.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is a non-linear geometry type.
"""
function OGR_GT_IsNonLinear(arg1::OGRwkbGeometryType)
    ccall((:OGR_GT_IsNonLinear, libgdal), Cint, (OGRwkbGeometryType,), arg1)
end


"""
    OGR_GT_GetCollection(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the collection type that can contain the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
the collection type that can contain the passed geometry type or wkbUnknown
"""
function OGR_GT_GetCollection(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_GetCollection, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType)
end


"""
    OGR_GT_GetCurve(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the curve geometry type that can contain the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
the curve type that can contain the passed geometry type
"""
function OGR_GT_GetCurve(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_GetCurve, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType)
end


"""
    OGR_GT_GetLinear(OGRwkbGeometryType eType) -> OGRwkbGeometryType

Returns the non-curve geometry type that can contain the passed geometry type.

### Parameters
* **eType**: Input geometry type

### Returns
the non-curve type that can contain the passed geometry type
"""
function OGR_GT_GetLinear(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_GetLinear, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType)
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
function OGRParseDate(pszInput, psOutput, nOptions::Cint)
    ccall((:OGRParseDate, libgdal), Cint, (Cstring, Ptr{OGRField}, Cint), pszInput, psOutput, nOptions)
end


"""
    GDALVersionInfo(const char *) -> const char *

Get runtime version information.

### Parameters
* **pszRequest**: the type of version info desired, as listed above.

### Returns
an internal string containing the requested information.
"""
function GDALVersionInfo(arg1)
    ccall((:GDALVersionInfo, libgdal), Cstring, (Cstring,), arg1)
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
function GDALCheckVersion(nVersionMajor::Cint, nVersionMinor::Cint, pszCallingComponentName)
    ccall((:GDALCheckVersion, libgdal), Cint, (Cint, Cint, Cstring), nVersionMajor, nVersionMinor, pszCallingComponentName)
end
