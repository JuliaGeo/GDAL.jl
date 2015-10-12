# Julia wrapper for header: /usr/local/include/ogr_core.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function OGRMalloc(arg1::Csize_t)
    ccall((:OGRMalloc,libgdal),Ptr{Void},(Csize_t,),arg1)
end

function OGRCalloc(arg1::Csize_t,arg2::Csize_t)
    ccall((:OGRCalloc,libgdal),Ptr{Void},(Csize_t,Csize_t),arg1,arg2)
end

function OGRRealloc(arg1::Ptr{Void},arg2::Csize_t)
    ccall((:OGRRealloc,libgdal),Ptr{Void},(Ptr{Void},Csize_t),arg1,arg2)
end

function OGRStrdup(arg1::Ptr{UInt8})
    ccall((:OGRStrdup,libgdal),Ptr{UInt8},(Ptr{UInt8},),arg1)
end

function OGRFree(arg1::Ptr{Void})
    ccall((:OGRFree,libgdal),Void,(Ptr{Void},),arg1)
end

function OGRGeometryTypeToName(eType::OGRwkbGeometryType)
    ccall((:OGRGeometryTypeToName,libgdal),Ptr{UInt8},(OGRwkbGeometryType,),eType)
end

function OGRMergeGeometryTypes(eMain::OGRwkbGeometryType,eExtra::OGRwkbGeometryType)
    ccall((:OGRMergeGeometryTypes,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,OGRwkbGeometryType),eMain,eExtra)
end

function OGRMergeGeometryTypesEx(eMain::OGRwkbGeometryType,eExtra::OGRwkbGeometryType,bAllowPromotingToCurves::Cint)
    ccall((:OGRMergeGeometryTypesEx,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,OGRwkbGeometryType,Cint),eMain,eExtra,bAllowPromotingToCurves)
end

function OGR_GT_Flatten(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_Flatten,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
end

function OGR_GT_SetZ(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_SetZ,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
end

function OGR_GT_SetModifier(eType::OGRwkbGeometryType,bSetZ::Cint,bSetM::Cint)
    ccall((:OGR_GT_SetModifier,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,Cint,Cint),eType,bSetZ,bSetM)
end

function OGR_GT_HasZ(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_HasZ,libgdal),Cint,(OGRwkbGeometryType,),eType)
end

function OGR_GT_IsSubClassOf(eType::OGRwkbGeometryType,eSuperType::OGRwkbGeometryType)
    ccall((:OGR_GT_IsSubClassOf,libgdal),Cint,(OGRwkbGeometryType,OGRwkbGeometryType),eType,eSuperType)
end

function OGR_GT_IsCurve(arg1::OGRwkbGeometryType)
    ccall((:OGR_GT_IsCurve,libgdal),Cint,(OGRwkbGeometryType,),arg1)
end

function OGR_GT_IsSurface(arg1::OGRwkbGeometryType)
    ccall((:OGR_GT_IsSurface,libgdal),Cint,(OGRwkbGeometryType,),arg1)
end

function OGR_GT_IsNonLinear(arg1::OGRwkbGeometryType)
    ccall((:OGR_GT_IsNonLinear,libgdal),Cint,(OGRwkbGeometryType,),arg1)
end

function OGR_GT_GetCollection(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_GetCollection,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
end

function OGR_GT_GetCurve(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_GetCurve,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
end

function OGR_GT_GetLinear(eType::OGRwkbGeometryType)
    ccall((:OGR_GT_GetLinear,libgdal),OGRwkbGeometryType,(OGRwkbGeometryType,),eType)
end

function OGRParseDate(pszInput::Ptr{UInt8},psOutput::Ptr{OGRField},nOptions::Cint)
    ccall((:OGRParseDate,libgdal),Cint,(Ptr{UInt8},Ptr{OGRField},Cint),pszInput,psOutput,nOptions)
end

function GDALVersionInfo(arg1::Ptr{UInt8})
    ccall((:GDALVersionInfo,libgdal),Ptr{UInt8},(Ptr{UInt8},),arg1)
end

function GDALCheckVersion(nVersionMajor::Cint,nVersionMinor::Cint,pszCallingComponentName::Ptr{UInt8})
    ccall((:GDALCheckVersion,libgdal),Cint,(Cint,Cint,Ptr{UInt8}),nVersionMajor,nVersionMinor,pszCallingComponentName)
end
