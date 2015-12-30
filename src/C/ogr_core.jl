# Julia wrapper for header: /usr/local/include/ogr_core.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0



"""
    OGRMalloc(size_t) -> void *
"""
function OGRMalloc(arg1::Csize_t)
    ccall((:OGRMalloc,libgdal),Ptr{Void},(Csize_t,),arg1)
end


"""
    OGRCalloc(size_t,
              size_t) -> void *
"""
function OGRCalloc(arg1::Csize_t,arg2::Csize_t)
    ccall((:OGRCalloc,libgdal),Ptr{Void},(Csize_t,Csize_t),arg1,arg2)
end


"""
    OGRRealloc(void *,
               size_t) -> void *
"""
function OGRRealloc(arg1::Ptr{Void},arg2::Csize_t)
    ccall((:OGRRealloc,libgdal),Ptr{Void},(Ptr{Void},Csize_t),arg1,arg2)
end


"""
    OGRStrdup(const char *) -> char *
"""
function OGRStrdup(arg1::Ptr{UInt8})
    ccall((:OGRStrdup,libgdal),Ptr{UInt8},(Ptr{UInt8},),arg1)
end


"""
    OGRFree(void *) -> void
"""
function OGRFree(arg1::Ptr{Void})
    ccall((:OGRFree,libgdal),Void,(Ptr{Void},),arg1)
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
    ccall((:OGRGeometryTypeToName,libgdal),Ptr{UInt8},(OGRwkbGeometryType,),eType)
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
function OGRMergeGeometryTypes(eMain::OGRwkbGeometryType,eExtra::OGRwkbGeometryType)
    ccall((:OGRMergeGeometryTypes,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,OGRwkbGeometryType),eMain,eExtra)
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
function OGRMergeGeometryTypesEx(eMain::OGRwkbGeometryType,eExtra::OGRwkbGeometryType,bAllowPromotingToCurves::Cint)
    ccall((:OGRMergeGeometryTypesEx,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,OGRwkbGeometryType,Cint),eMain,eExtra,bAllowPromotingToCurves)
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
    ccall((:OGR_GT_Flatten,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
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
    ccall((:OGR_GT_SetZ,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
end


"""
    OGR_GT_SetModifier(OGRwkbGeometryType eType,
                       int bSetZ,
                       int bSetM) -> OGRwkbGeometryType
"""
function OGR_GT_SetModifier(eType::OGRwkbGeometryType,bSetZ::Cint,bSetM::Cint)
    ccall((:OGR_GT_SetModifier,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,Cint,Cint),eType,bSetZ,bSetM)
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
    ccall((:OGR_GT_HasZ,libgdal),Cint,(OGRwkbGeometryType,),eType)
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
function OGR_GT_IsSubClassOf(eType::OGRwkbGeometryType,eSuperType::OGRwkbGeometryType)
    ccall((:OGR_GT_IsSubClassOf,libgdal),Cint,(OGRwkbGeometryType,OGRwkbGeometryType),eType,eSuperType)
end


"""
    OGR_GT_IsCurve(OGRwkbGeometryType) -> int

Return if a geometry type is an instance of Curve.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is an instance of Curve
"""
function OGR_GT_IsCurve(arg1::OGRwkbGeometryType)
    ccall((:OGR_GT_IsCurve,libgdal),Cint,(OGRwkbGeometryType,),arg1)
end


"""
    OGR_GT_IsSurface(OGRwkbGeometryType) -> int

Return if a geometry type is an instance of Surface.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is an instance of Surface
"""
function OGR_GT_IsSurface(arg1::OGRwkbGeometryType)
    ccall((:OGR_GT_IsSurface,libgdal),Cint,(OGRwkbGeometryType,),arg1)
end


"""
    OGR_GT_IsNonLinear(OGRwkbGeometryType) -> int

Return if a geometry type is a non-linear geometry type.

### Parameters
* **eGeomType**: the geometry type

### Returns
TRUE if the geometry type is a non-linear geometry type.
"""
function OGR_GT_IsNonLinear(arg1::OGRwkbGeometryType)
    ccall((:OGR_GT_IsNonLinear,libgdal),Cint,(OGRwkbGeometryType,),arg1)
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
    ccall((:OGR_GT_GetCollection,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
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
    ccall((:OGR_GT_GetCurve,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
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
    ccall((:OGR_GT_GetLinear,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
end


"""
    OGRParseDate(const char * pszInput,
                 OGRField * psOutput,
                 int nOptions) -> int
"""
function OGRParseDate(pszInput::Ptr{UInt8},psOutput::Ptr{OGRField},nOptions::Cint)
    ccall((:OGRParseDate,libgdal),Cint,(Ptr{UInt8},Ptr{OGRField},Cint),pszInput,psOutput,nOptions)
end


"""
    GDALVersionInfo(const char *) -> const char *

Get runtime version information.

### Parameters
* **pszRequest**: the type of version info desired, as listed above.

### Returns
an internal string containing the requested information.
"""
function GDALVersionInfo(arg1::Ptr{UInt8})
    ccall((:GDALVersionInfo,libgdal),Ptr{UInt8},(Ptr{UInt8},),arg1)
end


"""
    GDALCheckVersion(int nVersionMajor,
                     int nVersionMinor,
                     const char * pszCallingComponentName) -> int

Return TRUE if GDAL library version at runtime matches nVersionMajor.nVersionMinor.

### Parameters
* **nVersionMajor**: Major version to be tested against
* **nVersionMinor**: Minor version to be tested against
* **pszCallingComponentName**: If not NULL, in case of version mismatch, the method will issue a failure mentionning the name of the calling component.

### Returns
TRUE if GDAL library version at runtime matches nVersionMajor.nVersionMinor, FALSE otherwise.
"""
function GDALCheckVersion(nVersionMajor::Cint,nVersionMinor::Cint,pszCallingComponentName::Ptr{UInt8})
    ccall((:GDALCheckVersion,libgdal),Cint,(Cint,Cint,Ptr{UInt8}),nVersionMajor,nVersionMinor,pszCallingComponentName)
end
