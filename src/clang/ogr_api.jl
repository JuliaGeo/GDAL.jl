# Julia wrapper for header: /usr/local/include/ogr_api.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function OGR_G_CreateFromWkb(arg1::Ptr{Cuchar},arg2::OGRSpatialReferenceH,arg3::Ptr{OGRGeometryH},arg4::Cint)
    ccall((:OGR_G_CreateFromWkb,libgdal),OGRErr,(Ptr{Cuchar},OGRSpatialReferenceH,Ptr{OGRGeometryH},Cint),arg1,arg2,arg3,arg4)
end

function OGR_G_CreateFromWkt(arg1::Ptr{Ptr{UInt8}},arg2::OGRSpatialReferenceH,arg3::Ptr{OGRGeometryH})
    ccall((:OGR_G_CreateFromWkt,libgdal),OGRErr,(Ptr{Ptr{UInt8}},OGRSpatialReferenceH,Ptr{OGRGeometryH}),arg1,arg2,arg3)
end

function OGR_G_CreateFromFgf(arg1::Ptr{Cuchar},arg2::OGRSpatialReferenceH,arg3::Ptr{OGRGeometryH},arg4::Cint,arg5::Ptr{Cint})
    ccall((:OGR_G_CreateFromFgf,libgdal),OGRErr,(Ptr{Cuchar},OGRSpatialReferenceH,Ptr{OGRGeometryH},Cint,Ptr{Cint}),arg1,arg2,arg3,arg4,arg5)
end

function OGR_G_DestroyGeometry(arg1::OGRGeometryH)
    ccall((:OGR_G_DestroyGeometry,libgdal),Void,(OGRGeometryH,),arg1)
end

function OGR_G_CreateGeometry(arg1::OGRwkbGeometryType)
    ccall((:OGR_G_CreateGeometry,libgdal),OGRGeometryH,(OGRwkbGeometryType,),arg1)
end

function OGR_G_ApproximateArcAngles(dfCenterX::Cdouble,dfCenterY::Cdouble,dfZ::Cdouble,dfPrimaryRadius::Cdouble,dfSecondaryAxis::Cdouble,dfRotation::Cdouble,dfStartAngle::Cdouble,dfEndAngle::Cdouble,dfMaxAngleStepSizeDegrees::Cdouble)
    ccall((:OGR_G_ApproximateArcAngles,libgdal),OGRGeometryH,(Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),dfCenterX,dfCenterY,dfZ,dfPrimaryRadius,dfSecondaryAxis,dfRotation,dfStartAngle,dfEndAngle,dfMaxAngleStepSizeDegrees)
end

function OGR_G_ForceToPolygon(arg1::OGRGeometryH)
    ccall((:OGR_G_ForceToPolygon,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_ForceToLineString(arg1::OGRGeometryH)
    ccall((:OGR_G_ForceToLineString,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_ForceToMultiPolygon(arg1::OGRGeometryH)
    ccall((:OGR_G_ForceToMultiPolygon,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_ForceToMultiPoint(arg1::OGRGeometryH)
    ccall((:OGR_G_ForceToMultiPoint,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_ForceToMultiLineString(arg1::OGRGeometryH)
    ccall((:OGR_G_ForceToMultiLineString,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_ForceTo(hGeom::OGRGeometryH,eTargetType::OGRwkbGeometryType,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:OGR_G_ForceTo,libgdal),OGRGeometryH,(OGRGeometryH,OGRwkbGeometryType,Ptr{Ptr{UInt8}}),hGeom,eTargetType,papszOptions)
end

function OGR_G_GetDimension(arg1::OGRGeometryH)
    ccall((:OGR_G_GetDimension,libgdal),Cint,(OGRGeometryH,),arg1)
end

function OGR_G_GetCoordinateDimension(arg1::OGRGeometryH)
    ccall((:OGR_G_GetCoordinateDimension,libgdal),Cint,(OGRGeometryH,),arg1)
end

function OGR_G_SetCoordinateDimension(arg1::OGRGeometryH,arg2::Cint)
    ccall((:OGR_G_SetCoordinateDimension,libgdal),Void,(OGRGeometryH,Cint),arg1,arg2)
end

function OGR_G_Clone(arg1::OGRGeometryH)
    ccall((:OGR_G_Clone,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_GetEnvelope(arg1::OGRGeometryH,arg2::Ptr{OGREnvelope})
    ccall((:OGR_G_GetEnvelope,libgdal),Void,(OGRGeometryH,Ptr{OGREnvelope}),arg1,arg2)
end

function OGR_G_GetEnvelope3D(arg1::OGRGeometryH,arg2::Ptr{OGREnvelope3D})
    ccall((:OGR_G_GetEnvelope3D,libgdal),Void,(OGRGeometryH,Ptr{OGREnvelope3D}),arg1,arg2)
end

function OGR_G_ImportFromWkb(arg1::OGRGeometryH,arg2::Ptr{Cuchar},arg3::Cint)
    ccall((:OGR_G_ImportFromWkb,libgdal),OGRErr,(OGRGeometryH,Ptr{Cuchar},Cint),arg1,arg2,arg3)
end

function OGR_G_ExportToWkb(arg1::OGRGeometryH,arg2::OGRwkbByteOrder,arg3::Ptr{Cuchar})
    ccall((:OGR_G_ExportToWkb,libgdal),OGRErr,(OGRGeometryH,OGRwkbByteOrder,Ptr{Cuchar}),arg1,arg2,arg3)
end

function OGR_G_ExportToIsoWkb(arg1::OGRGeometryH,arg2::OGRwkbByteOrder,arg3::Ptr{Cuchar})
    ccall((:OGR_G_ExportToIsoWkb,libgdal),OGRErr,(OGRGeometryH,OGRwkbByteOrder,Ptr{Cuchar}),arg1,arg2,arg3)
end

function OGR_G_WkbSize(hGeom::OGRGeometryH)
    ccall((:OGR_G_WkbSize,libgdal),Cint,(OGRGeometryH,),hGeom)
end

function OGR_G_ImportFromWkt(arg1::OGRGeometryH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OGR_G_ImportFromWkt,libgdal),OGRErr,(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OGR_G_ExportToWkt(arg1::OGRGeometryH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OGR_G_ExportToWkt,libgdal),OGRErr,(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OGR_G_ExportToIsoWkt(arg1::OGRGeometryH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OGR_G_ExportToIsoWkt,libgdal),OGRErr,(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OGR_G_GetGeometryType(arg1::OGRGeometryH)
    ccall((:OGR_G_GetGeometryType,libgdal),OGRwkbGeometryType,(OGRGeometryH,),arg1)
end

function OGR_G_GetGeometryName(arg1::OGRGeometryH)
    ccall((:OGR_G_GetGeometryName,libgdal),Ptr{UInt8},(OGRGeometryH,),arg1)
end

function OGR_G_DumpReadable(arg1::OGRGeometryH,arg2::Ptr{FILE},arg3::Ptr{UInt8})
    ccall((:OGR_G_DumpReadable,libgdal),Void,(OGRGeometryH,Ptr{FILE},Ptr{UInt8}),arg1,arg2,arg3)
end

function OGR_G_FlattenTo2D(arg1::OGRGeometryH)
    ccall((:OGR_G_FlattenTo2D,libgdal),Void,(OGRGeometryH,),arg1)
end

function OGR_G_CloseRings(arg1::OGRGeometryH)
    ccall((:OGR_G_CloseRings,libgdal),Void,(OGRGeometryH,),arg1)
end

function OGR_G_CreateFromGML(arg1::Ptr{UInt8})
    ccall((:OGR_G_CreateFromGML,libgdal),OGRGeometryH,(Ptr{UInt8},),arg1)
end

function OGR_G_ExportToGML(arg1::OGRGeometryH)
    ccall((:OGR_G_ExportToGML,libgdal),Ptr{UInt8},(OGRGeometryH,),arg1)
end

function OGR_G_ExportToGMLEx(arg1::OGRGeometryH,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:OGR_G_ExportToGMLEx,libgdal),Ptr{UInt8},(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,papszOptions)
end

function OGR_G_CreateFromGMLTree(arg1::Ptr{CPLXMLNode})
    ccall((:OGR_G_CreateFromGMLTree,libgdal),OGRGeometryH,(Ptr{CPLXMLNode},),arg1)
end

function OGR_G_ExportToGMLTree(arg1::OGRGeometryH)
    ccall((:OGR_G_ExportToGMLTree,libgdal),Ptr{CPLXMLNode},(OGRGeometryH,),arg1)
end

function OGR_G_ExportEnvelopeToGMLTree(arg1::OGRGeometryH)
    ccall((:OGR_G_ExportEnvelopeToGMLTree,libgdal),Ptr{CPLXMLNode},(OGRGeometryH,),arg1)
end

function OGR_G_ExportToKML(arg1::OGRGeometryH,pszAltitudeMode::Ptr{UInt8})
    ccall((:OGR_G_ExportToKML,libgdal),Ptr{UInt8},(OGRGeometryH,Ptr{UInt8}),arg1,pszAltitudeMode)
end

function OGR_G_ExportToJson(arg1::OGRGeometryH)
    ccall((:OGR_G_ExportToJson,libgdal),Ptr{UInt8},(OGRGeometryH,),arg1)
end

function OGR_G_ExportToJsonEx(arg1::OGRGeometryH,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:OGR_G_ExportToJsonEx,libgdal),Ptr{UInt8},(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,papszOptions)
end

function OGR_G_CreateGeometryFromJson(arg1::Ptr{UInt8})
    ccall((:OGR_G_CreateGeometryFromJson,libgdal),OGRGeometryH,(Ptr{UInt8},),arg1)
end

function OGR_G_AssignSpatialReference(arg1::OGRGeometryH,arg2::OGRSpatialReferenceH)
    ccall((:OGR_G_AssignSpatialReference,libgdal),Void,(OGRGeometryH,OGRSpatialReferenceH),arg1,arg2)
end

function OGR_G_GetSpatialReference(arg1::OGRGeometryH)
    ccall((:OGR_G_GetSpatialReference,libgdal),OGRSpatialReferenceH,(OGRGeometryH,),arg1)
end

function OGR_G_Transform(arg1::OGRGeometryH,arg2::OGRCoordinateTransformationH)
    ccall((:OGR_G_Transform,libgdal),OGRErr,(OGRGeometryH,OGRCoordinateTransformationH),arg1,arg2)
end

function OGR_G_TransformTo(arg1::OGRGeometryH,arg2::OGRSpatialReferenceH)
    ccall((:OGR_G_TransformTo,libgdal),OGRErr,(OGRGeometryH,OGRSpatialReferenceH),arg1,arg2)
end

function OGR_G_Simplify(hThis::OGRGeometryH,tolerance::Cdouble)
    ccall((:OGR_G_Simplify,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble),hThis,tolerance)
end

function OGR_G_SimplifyPreserveTopology(hThis::OGRGeometryH,tolerance::Cdouble)
    ccall((:OGR_G_SimplifyPreserveTopology,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble),hThis,tolerance)
end

function OGR_G_Segmentize(hGeom::OGRGeometryH,dfMaxLength::Cdouble)
    ccall((:OGR_G_Segmentize,libgdal),Void,(OGRGeometryH,Cdouble),hGeom,dfMaxLength)
end

function OGR_G_Intersects(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Intersects,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Equals(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Equals,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Disjoint(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Disjoint,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Touches(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Touches,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Crosses(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Crosses,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Within(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Within,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Contains(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Contains,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Overlaps(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Overlaps,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Boundary(arg1::OGRGeometryH)
    ccall((:OGR_G_Boundary,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_ConvexHull(arg1::OGRGeometryH)
    ccall((:OGR_G_ConvexHull,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_Buffer(arg1::OGRGeometryH,arg2::Cdouble,arg3::Cint)
    ccall((:OGR_G_Buffer,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble,Cint),arg1,arg2,arg3)
end

function OGR_G_Intersection(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Intersection,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Union(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Union,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_UnionCascaded(arg1::OGRGeometryH)
    ccall((:OGR_G_UnionCascaded,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_PointOnSurface(arg1::OGRGeometryH)
    ccall((:OGR_G_PointOnSurface,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_Difference(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Difference,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_SymDifference(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_SymDifference,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Distance(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Distance,libgdal),Cdouble,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Length(arg1::OGRGeometryH)
    ccall((:OGR_G_Length,libgdal),Cdouble,(OGRGeometryH,),arg1)
end

function OGR_G_Area(arg1::OGRGeometryH)
    ccall((:OGR_G_Area,libgdal),Cdouble,(OGRGeometryH,),arg1)
end

function OGR_G_Centroid(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Centroid,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Value(arg1::OGRGeometryH,dfDistance::Cdouble)
    ccall((:OGR_G_Value,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble),arg1,dfDistance)
end

function OGR_G_Empty(arg1::OGRGeometryH)
    ccall((:OGR_G_Empty,libgdal),Void,(OGRGeometryH,),arg1)
end

function OGR_G_IsEmpty(arg1::OGRGeometryH)
    ccall((:OGR_G_IsEmpty,libgdal),Cint,(OGRGeometryH,),arg1)
end

function OGR_G_IsValid(arg1::OGRGeometryH)
    ccall((:OGR_G_IsValid,libgdal),Cint,(OGRGeometryH,),arg1)
end

function OGR_G_IsSimple(arg1::OGRGeometryH)
    ccall((:OGR_G_IsSimple,libgdal),Cint,(OGRGeometryH,),arg1)
end

function OGR_G_IsRing(arg1::OGRGeometryH)
    ccall((:OGR_G_IsRing,libgdal),Cint,(OGRGeometryH,),arg1)
end

function OGR_G_Polygonize(arg1::OGRGeometryH)
    ccall((:OGR_G_Polygonize,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_Intersect(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Intersect,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_Equal(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Equal,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_SymmetricDifference(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_SymmetricDifference,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_GetArea(arg1::OGRGeometryH)
    ccall((:OGR_G_GetArea,libgdal),Cdouble,(OGRGeometryH,),arg1)
end

function OGR_G_GetBoundary(arg1::OGRGeometryH)
    ccall((:OGR_G_GetBoundary,libgdal),OGRGeometryH,(OGRGeometryH,),arg1)
end

function OGR_G_GetPointCount(arg1::OGRGeometryH)
    ccall((:OGR_G_GetPointCount,libgdal),Cint,(OGRGeometryH,),arg1)
end

function OGR_G_GetPoints(hGeom::OGRGeometryH,pabyX::Ptr{Void},nXStride::Cint,pabyY::Ptr{Void},nYStride::Cint,pabyZ::Ptr{Void},nZStride::Cint)
    ccall((:OGR_G_GetPoints,libgdal),Cint,(OGRGeometryH,Ptr{Void},Cint,Ptr{Void},Cint,Ptr{Void},Cint),hGeom,pabyX,nXStride,pabyY,nYStride,pabyZ,nZStride)
end

function OGR_G_GetX(arg1::OGRGeometryH,arg2::Cint)
    ccall((:OGR_G_GetX,libgdal),Cdouble,(OGRGeometryH,Cint),arg1,arg2)
end

function OGR_G_GetY(arg1::OGRGeometryH,arg2::Cint)
    ccall((:OGR_G_GetY,libgdal),Cdouble,(OGRGeometryH,Cint),arg1,arg2)
end

function OGR_G_GetZ(arg1::OGRGeometryH,arg2::Cint)
    ccall((:OGR_G_GetZ,libgdal),Cdouble,(OGRGeometryH,Cint),arg1,arg2)
end

function OGR_G_GetPoint(arg1::OGRGeometryH,iPoint::Cint,arg2::Ptr{Cdouble},arg3::Ptr{Cdouble},arg4::Ptr{Cdouble})
    ccall((:OGR_G_GetPoint,libgdal),Void,(OGRGeometryH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),arg1,iPoint,arg2,arg3,arg4)
end

function OGR_G_SetPointCount(hGeom::OGRGeometryH,nNewPointCount::Cint)
    ccall((:OGR_G_SetPointCount,libgdal),Void,(OGRGeometryH,Cint),hGeom,nNewPointCount)
end

function OGR_G_SetPoint(arg1::OGRGeometryH,iPoint::Cint,arg2::Cdouble,arg3::Cdouble,arg4::Cdouble)
    ccall((:OGR_G_SetPoint,libgdal),Void,(OGRGeometryH,Cint,Cdouble,Cdouble,Cdouble),arg1,iPoint,arg2,arg3,arg4)
end

function OGR_G_SetPoint_2D(arg1::OGRGeometryH,iPoint::Cint,arg2::Cdouble,arg3::Cdouble)
    ccall((:OGR_G_SetPoint_2D,libgdal),Void,(OGRGeometryH,Cint,Cdouble,Cdouble),arg1,iPoint,arg2,arg3)
end

function OGR_G_AddPoint(arg1::OGRGeometryH,arg2::Cdouble,arg3::Cdouble,arg4::Cdouble)
    ccall((:OGR_G_AddPoint,libgdal),Void,(OGRGeometryH,Cdouble,Cdouble,Cdouble),arg1,arg2,arg3,arg4)
end

function OGR_G_AddPoint_2D(arg1::OGRGeometryH,arg2::Cdouble,arg3::Cdouble)
    ccall((:OGR_G_AddPoint_2D,libgdal),Void,(OGRGeometryH,Cdouble,Cdouble),arg1,arg2,arg3)
end

function OGR_G_SetPoints(hGeom::OGRGeometryH,nPointsIn::Cint,pabyX::Ptr{Void},nXStride::Cint,pabyY::Ptr{Void},nYStride::Cint,pabyZ::Ptr{Void},nZStride::Cint)
    ccall((:OGR_G_SetPoints,libgdal),Void,(OGRGeometryH,Cint,Ptr{Void},Cint,Ptr{Void},Cint,Ptr{Void},Cint),hGeom,nPointsIn,pabyX,nXStride,pabyY,nYStride,pabyZ,nZStride)
end

function OGR_G_GetGeometryCount(arg1::OGRGeometryH)
    ccall((:OGR_G_GetGeometryCount,libgdal),Cint,(OGRGeometryH,),arg1)
end

function OGR_G_GetGeometryRef(arg1::OGRGeometryH,arg2::Cint)
    ccall((:OGR_G_GetGeometryRef,libgdal),OGRGeometryH,(OGRGeometryH,Cint),arg1,arg2)
end

function OGR_G_AddGeometry(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_AddGeometry,libgdal),OGRErr,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_AddGeometryDirectly(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_AddGeometryDirectly,libgdal),OGRErr,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function OGR_G_RemoveGeometry(arg1::OGRGeometryH,arg2::Cint,arg3::Cint)
    ccall((:OGR_G_RemoveGeometry,libgdal),OGRErr,(OGRGeometryH,Cint,Cint),arg1,arg2,arg3)
end

function OGR_G_HasCurveGeometry(arg1::OGRGeometryH,bLookForNonLinear::Cint)
    ccall((:OGR_G_HasCurveGeometry,libgdal),Cint,(OGRGeometryH,Cint),arg1,bLookForNonLinear)
end

function OGR_G_GetLinearGeometry(hGeom::OGRGeometryH,dfMaxAngleStepSizeDegrees::Cdouble,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:OGR_G_GetLinearGeometry,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble,Ptr{Ptr{UInt8}}),hGeom,dfMaxAngleStepSizeDegrees,papszOptions)
end

function OGR_G_GetCurveGeometry(hGeom::OGRGeometryH,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:OGR_G_GetCurveGeometry,libgdal),OGRGeometryH,(OGRGeometryH,Ptr{Ptr{UInt8}}),hGeom,papszOptions)
end

function OGRBuildPolygonFromEdges(hLinesAsCollection::OGRGeometryH,bBestEffort::Cint,bAutoClose::Cint,dfTolerance::Cdouble,peErr::Ptr{OGRErr})
    ccall((:OGRBuildPolygonFromEdges,libgdal),OGRGeometryH,(OGRGeometryH,Cint,Cint,Cdouble,Ptr{OGRErr}),hLinesAsCollection,bBestEffort,bAutoClose,dfTolerance,peErr)
end

function OGRSetGenerate_DB2_V72_BYTE_ORDER(bGenerate_DB2_V72_BYTE_ORDER::Cint)
    ccall((:OGRSetGenerate_DB2_V72_BYTE_ORDER,libgdal),OGRErr,(Cint,),bGenerate_DB2_V72_BYTE_ORDER)
end

function OGRGetGenerate_DB2_V72_BYTE_ORDER()
    ccall((:OGRGetGenerate_DB2_V72_BYTE_ORDER,libgdal),Cint,())
end

function OGRSetNonLinearGeometriesEnabledFlag(bFlag::Cint)
    ccall((:OGRSetNonLinearGeometriesEnabledFlag,libgdal),Void,(Cint,),bFlag)
end

function OGRGetNonLinearGeometriesEnabledFlag()
    ccall((:OGRGetNonLinearGeometriesEnabledFlag,libgdal),Cint,())
end

function OGR_Fld_Create(arg1::Ptr{UInt8},arg2::OGRFieldType)
    ccall((:OGR_Fld_Create,libgdal),OGRFieldDefnH,(Ptr{UInt8},OGRFieldType),arg1,arg2)
end

function OGR_Fld_Destroy(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_Destroy,libgdal),Void,(OGRFieldDefnH,),arg1)
end

function OGR_Fld_SetName(arg1::OGRFieldDefnH,arg2::Ptr{UInt8})
    ccall((:OGR_Fld_SetName,libgdal),Void,(OGRFieldDefnH,Ptr{UInt8}),arg1,arg2)
end

function OGR_Fld_GetNameRef(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetNameRef,libgdal),Ptr{UInt8},(OGRFieldDefnH,),arg1)
end

function OGR_Fld_GetType(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetType,libgdal),OGRFieldType,(OGRFieldDefnH,),arg1)
end

function OGR_Fld_SetType(arg1::OGRFieldDefnH,arg2::OGRFieldType)
    ccall((:OGR_Fld_SetType,libgdal),Void,(OGRFieldDefnH,OGRFieldType),arg1,arg2)
end

function OGR_Fld_GetSubType(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetSubType,libgdal),OGRFieldSubType,(OGRFieldDefnH,),arg1)
end

function OGR_Fld_SetSubType(arg1::OGRFieldDefnH,arg2::OGRFieldSubType)
    ccall((:OGR_Fld_SetSubType,libgdal),Void,(OGRFieldDefnH,OGRFieldSubType),arg1,arg2)
end

function OGR_Fld_GetJustify(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetJustify,libgdal),OGRJustification,(OGRFieldDefnH,),arg1)
end

function OGR_Fld_SetJustify(arg1::OGRFieldDefnH,arg2::OGRJustification)
    ccall((:OGR_Fld_SetJustify,libgdal),Void,(OGRFieldDefnH,OGRJustification),arg1,arg2)
end

function OGR_Fld_GetWidth(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetWidth,libgdal),Cint,(OGRFieldDefnH,),arg1)
end

function OGR_Fld_SetWidth(arg1::OGRFieldDefnH,arg2::Cint)
    ccall((:OGR_Fld_SetWidth,libgdal),Void,(OGRFieldDefnH,Cint),arg1,arg2)
end

function OGR_Fld_GetPrecision(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetPrecision,libgdal),Cint,(OGRFieldDefnH,),arg1)
end

function OGR_Fld_SetPrecision(arg1::OGRFieldDefnH,arg2::Cint)
    ccall((:OGR_Fld_SetPrecision,libgdal),Void,(OGRFieldDefnH,Cint),arg1,arg2)
end

function OGR_Fld_Set(arg1::OGRFieldDefnH,arg2::Ptr{UInt8},arg3::OGRFieldType,arg4::Cint,arg5::Cint,arg6::OGRJustification)
    ccall((:OGR_Fld_Set,libgdal),Void,(OGRFieldDefnH,Ptr{UInt8},OGRFieldType,Cint,Cint,OGRJustification),arg1,arg2,arg3,arg4,arg5,arg6)
end

function OGR_Fld_IsIgnored(hDefn::OGRFieldDefnH)
    ccall((:OGR_Fld_IsIgnored,libgdal),Cint,(OGRFieldDefnH,),hDefn)
end

function OGR_Fld_SetIgnored(hDefn::OGRFieldDefnH,arg1::Cint)
    ccall((:OGR_Fld_SetIgnored,libgdal),Void,(OGRFieldDefnH,Cint),hDefn,arg1)
end

function OGR_Fld_IsNullable(hDefn::OGRFieldDefnH)
    ccall((:OGR_Fld_IsNullable,libgdal),Cint,(OGRFieldDefnH,),hDefn)
end

function OGR_Fld_SetNullable(hDefn::OGRFieldDefnH,arg1::Cint)
    ccall((:OGR_Fld_SetNullable,libgdal),Void,(OGRFieldDefnH,Cint),hDefn,arg1)
end

function OGR_Fld_GetDefault(hDefn::OGRFieldDefnH)
    ccall((:OGR_Fld_GetDefault,libgdal),Ptr{UInt8},(OGRFieldDefnH,),hDefn)
end

function OGR_Fld_SetDefault(hDefn::OGRFieldDefnH,arg1::Ptr{UInt8})
    ccall((:OGR_Fld_SetDefault,libgdal),Void,(OGRFieldDefnH,Ptr{UInt8}),hDefn,arg1)
end

function OGR_Fld_IsDefaultDriverSpecific(hDefn::OGRFieldDefnH)
    ccall((:OGR_Fld_IsDefaultDriverSpecific,libgdal),Cint,(OGRFieldDefnH,),hDefn)
end

function OGR_GetFieldTypeName(arg1::OGRFieldType)
    ccall((:OGR_GetFieldTypeName,libgdal),Ptr{UInt8},(OGRFieldType,),arg1)
end

function OGR_GetFieldSubTypeName(arg1::OGRFieldSubType)
    ccall((:OGR_GetFieldSubTypeName,libgdal),Ptr{UInt8},(OGRFieldSubType,),arg1)
end

function OGR_AreTypeSubTypeCompatible(eType::OGRFieldType,eSubType::OGRFieldSubType)
    ccall((:OGR_AreTypeSubTypeCompatible,libgdal),Cint,(OGRFieldType,OGRFieldSubType),eType,eSubType)
end

function OGR_GFld_Create(arg1::Ptr{UInt8},arg2::OGRwkbGeometryType)
    ccall((:OGR_GFld_Create,libgdal),OGRGeomFieldDefnH,(Ptr{UInt8},OGRwkbGeometryType),arg1,arg2)
end

function OGR_GFld_Destroy(arg1::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_Destroy,libgdal),Void,(OGRGeomFieldDefnH,),arg1)
end

function OGR_GFld_SetName(arg1::OGRGeomFieldDefnH,arg2::Ptr{UInt8})
    ccall((:OGR_GFld_SetName,libgdal),Void,(OGRGeomFieldDefnH,Ptr{UInt8}),arg1,arg2)
end

function OGR_GFld_GetNameRef(arg1::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_GetNameRef,libgdal),Ptr{UInt8},(OGRGeomFieldDefnH,),arg1)
end

function OGR_GFld_GetType(arg1::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_GetType,libgdal),OGRwkbGeometryType,(OGRGeomFieldDefnH,),arg1)
end

function OGR_GFld_SetType(arg1::OGRGeomFieldDefnH,arg2::OGRwkbGeometryType)
    ccall((:OGR_GFld_SetType,libgdal),Void,(OGRGeomFieldDefnH,OGRwkbGeometryType),arg1,arg2)
end

function OGR_GFld_GetSpatialRef(arg1::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_GetSpatialRef,libgdal),OGRSpatialReferenceH,(OGRGeomFieldDefnH,),arg1)
end

function OGR_GFld_SetSpatialRef(arg1::OGRGeomFieldDefnH,hSRS::OGRSpatialReferenceH)
    ccall((:OGR_GFld_SetSpatialRef,libgdal),Void,(OGRGeomFieldDefnH,OGRSpatialReferenceH),arg1,hSRS)
end

function OGR_GFld_IsNullable(hDefn::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_IsNullable,libgdal),Cint,(OGRGeomFieldDefnH,),hDefn)
end

function OGR_GFld_SetNullable(hDefn::OGRGeomFieldDefnH,arg1::Cint)
    ccall((:OGR_GFld_SetNullable,libgdal),Void,(OGRGeomFieldDefnH,Cint),hDefn,arg1)
end

function OGR_GFld_IsIgnored(hDefn::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_IsIgnored,libgdal),Cint,(OGRGeomFieldDefnH,),hDefn)
end

function OGR_GFld_SetIgnored(hDefn::OGRGeomFieldDefnH,arg1::Cint)
    ccall((:OGR_GFld_SetIgnored,libgdal),Void,(OGRGeomFieldDefnH,Cint),hDefn,arg1)
end

function OGR_FD_Create(arg1::Ptr{UInt8})
    ccall((:OGR_FD_Create,libgdal),OGRFeatureDefnH,(Ptr{UInt8},),arg1)
end

function OGR_FD_Destroy(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_Destroy,libgdal),Void,(OGRFeatureDefnH,),arg1)
end

function OGR_FD_Release(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_Release,libgdal),Void,(OGRFeatureDefnH,),arg1)
end

function OGR_FD_GetName(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_GetName,libgdal),Ptr{UInt8},(OGRFeatureDefnH,),arg1)
end

function OGR_FD_GetFieldCount(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_GetFieldCount,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function OGR_FD_GetFieldDefn(arg1::OGRFeatureDefnH,arg2::Cint)
    ccall((:OGR_FD_GetFieldDefn,libgdal),OGRFieldDefnH,(OGRFeatureDefnH,Cint),arg1,arg2)
end

function OGR_FD_GetFieldIndex(arg1::OGRFeatureDefnH,arg2::Ptr{UInt8})
    ccall((:OGR_FD_GetFieldIndex,libgdal),Cint,(OGRFeatureDefnH,Ptr{UInt8}),arg1,arg2)
end

function OGR_FD_AddFieldDefn(arg1::OGRFeatureDefnH,arg2::OGRFieldDefnH)
    ccall((:OGR_FD_AddFieldDefn,libgdal),Void,(OGRFeatureDefnH,OGRFieldDefnH),arg1,arg2)
end

function OGR_FD_DeleteFieldDefn(hDefn::OGRFeatureDefnH,iField::Cint)
    ccall((:OGR_FD_DeleteFieldDefn,libgdal),OGRErr,(OGRFeatureDefnH,Cint),hDefn,iField)
end

function OGR_FD_ReorderFieldDefns(hDefn::OGRFeatureDefnH,panMap::Ptr{Cint})
    ccall((:OGR_FD_ReorderFieldDefns,libgdal),OGRErr,(OGRFeatureDefnH,Ptr{Cint}),hDefn,panMap)
end

function OGR_FD_GetGeomType(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_GetGeomType,libgdal),OGRwkbGeometryType,(OGRFeatureDefnH,),arg1)
end

function OGR_FD_SetGeomType(arg1::OGRFeatureDefnH,arg2::OGRwkbGeometryType)
    ccall((:OGR_FD_SetGeomType,libgdal),Void,(OGRFeatureDefnH,OGRwkbGeometryType),arg1,arg2)
end

function OGR_FD_IsGeometryIgnored(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_IsGeometryIgnored,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function OGR_FD_SetGeometryIgnored(arg1::OGRFeatureDefnH,arg2::Cint)
    ccall((:OGR_FD_SetGeometryIgnored,libgdal),Void,(OGRFeatureDefnH,Cint),arg1,arg2)
end

function OGR_FD_IsStyleIgnored(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_IsStyleIgnored,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function OGR_FD_SetStyleIgnored(arg1::OGRFeatureDefnH,arg2::Cint)
    ccall((:OGR_FD_SetStyleIgnored,libgdal),Void,(OGRFeatureDefnH,Cint),arg1,arg2)
end

function OGR_FD_Reference(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_Reference,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function OGR_FD_Dereference(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_Dereference,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function OGR_FD_GetReferenceCount(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_GetReferenceCount,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function OGR_FD_GetGeomFieldCount(hFDefn::OGRFeatureDefnH)
    ccall((:OGR_FD_GetGeomFieldCount,libgdal),Cint,(OGRFeatureDefnH,),hFDefn)
end

function OGR_FD_GetGeomFieldDefn(hFDefn::OGRFeatureDefnH,i::Cint)
    ccall((:OGR_FD_GetGeomFieldDefn,libgdal),OGRGeomFieldDefnH,(OGRFeatureDefnH,Cint),hFDefn,i)
end

function OGR_FD_GetGeomFieldIndex(hFDefn::OGRFeatureDefnH,pszName::Ptr{UInt8})
    ccall((:OGR_FD_GetGeomFieldIndex,libgdal),Cint,(OGRFeatureDefnH,Ptr{UInt8}),hFDefn,pszName)
end

function OGR_FD_AddGeomFieldDefn(hFDefn::OGRFeatureDefnH,hGFldDefn::OGRGeomFieldDefnH)
    ccall((:OGR_FD_AddGeomFieldDefn,libgdal),Void,(OGRFeatureDefnH,OGRGeomFieldDefnH),hFDefn,hGFldDefn)
end

function OGR_FD_DeleteGeomFieldDefn(hFDefn::OGRFeatureDefnH,iGeomField::Cint)
    ccall((:OGR_FD_DeleteGeomFieldDefn,libgdal),OGRErr,(OGRFeatureDefnH,Cint),hFDefn,iGeomField)
end

function OGR_FD_IsSame(hFDefn::OGRFeatureDefnH,hOtherFDefn::OGRFeatureDefnH)
    ccall((:OGR_FD_IsSame,libgdal),Cint,(OGRFeatureDefnH,OGRFeatureDefnH),hFDefn,hOtherFDefn)
end

function OGR_F_Create(arg1::OGRFeatureDefnH)
    ccall((:OGR_F_Create,libgdal),OGRFeatureH,(OGRFeatureDefnH,),arg1)
end

function OGR_F_Destroy(arg1::OGRFeatureH)
    ccall((:OGR_F_Destroy,libgdal),Void,(OGRFeatureH,),arg1)
end

function OGR_F_GetDefnRef(arg1::OGRFeatureH)
    ccall((:OGR_F_GetDefnRef,libgdal),OGRFeatureDefnH,(OGRFeatureH,),arg1)
end

function OGR_F_SetGeometryDirectly(arg1::OGRFeatureH,arg2::OGRGeometryH)
    ccall((:OGR_F_SetGeometryDirectly,libgdal),OGRErr,(OGRFeatureH,OGRGeometryH),arg1,arg2)
end

function OGR_F_SetGeometry(arg1::OGRFeatureH,arg2::OGRGeometryH)
    ccall((:OGR_F_SetGeometry,libgdal),OGRErr,(OGRFeatureH,OGRGeometryH),arg1,arg2)
end

function OGR_F_GetGeometryRef(arg1::OGRFeatureH)
    ccall((:OGR_F_GetGeometryRef,libgdal),OGRGeometryH,(OGRFeatureH,),arg1)
end

function OGR_F_StealGeometry(arg1::OGRFeatureH)
    ccall((:OGR_F_StealGeometry,libgdal),OGRGeometryH,(OGRFeatureH,),arg1)
end

function OGR_F_Clone(arg1::OGRFeatureH)
    ccall((:OGR_F_Clone,libgdal),OGRFeatureH,(OGRFeatureH,),arg1)
end

function OGR_F_Equal(arg1::OGRFeatureH,arg2::OGRFeatureH)
    ccall((:OGR_F_Equal,libgdal),Cint,(OGRFeatureH,OGRFeatureH),arg1,arg2)
end

function OGR_F_GetFieldCount(arg1::OGRFeatureH)
    ccall((:OGR_F_GetFieldCount,libgdal),Cint,(OGRFeatureH,),arg1)
end

function OGR_F_GetFieldDefnRef(arg1::OGRFeatureH,arg2::Cint)
    ccall((:OGR_F_GetFieldDefnRef,libgdal),OGRFieldDefnH,(OGRFeatureH,Cint),arg1,arg2)
end

function OGR_F_GetFieldIndex(arg1::OGRFeatureH,arg2::Ptr{UInt8})
    ccall((:OGR_F_GetFieldIndex,libgdal),Cint,(OGRFeatureH,Ptr{UInt8}),arg1,arg2)
end

function OGR_F_IsFieldSet(arg1::OGRFeatureH,arg2::Cint)
    ccall((:OGR_F_IsFieldSet,libgdal),Cint,(OGRFeatureH,Cint),arg1,arg2)
end

function OGR_F_UnsetField(arg1::OGRFeatureH,arg2::Cint)
    ccall((:OGR_F_UnsetField,libgdal),Void,(OGRFeatureH,Cint),arg1,arg2)
end

function OGR_F_GetRawFieldRef(arg1::OGRFeatureH,arg2::Cint)
    ccall((:OGR_F_GetRawFieldRef,libgdal),Ptr{OGRField},(OGRFeatureH,Cint),arg1,arg2)
end

function OGR_F_GetFieldAsInteger(arg1::OGRFeatureH,arg2::Cint)
    ccall((:OGR_F_GetFieldAsInteger,libgdal),Cint,(OGRFeatureH,Cint),arg1,arg2)
end

function OGR_F_GetFieldAsInteger64(arg1::OGRFeatureH,arg2::Cint)
    ccall((:OGR_F_GetFieldAsInteger64,libgdal),GIntBig,(OGRFeatureH,Cint),arg1,arg2)
end

function OGR_F_GetFieldAsDouble(arg1::OGRFeatureH,arg2::Cint)
    ccall((:OGR_F_GetFieldAsDouble,libgdal),Cdouble,(OGRFeatureH,Cint),arg1,arg2)
end

function OGR_F_GetFieldAsString(arg1::OGRFeatureH,arg2::Cint)
    ccall((:OGR_F_GetFieldAsString,libgdal),Ptr{UInt8},(OGRFeatureH,Cint),arg1,arg2)
end

function OGR_F_GetFieldAsIntegerList(arg1::OGRFeatureH,arg2::Cint,arg3::Ptr{Cint})
    ccall((:OGR_F_GetFieldAsIntegerList,libgdal),Ptr{Cint},(OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3)
end

function OGR_F_GetFieldAsInteger64List(arg1::OGRFeatureH,arg2::Cint,arg3::Ptr{Cint})
    ccall((:OGR_F_GetFieldAsInteger64List,libgdal),Ptr{GIntBig},(OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3)
end

function OGR_F_GetFieldAsDoubleList(arg1::OGRFeatureH,arg2::Cint,arg3::Ptr{Cint})
    ccall((:OGR_F_GetFieldAsDoubleList,libgdal),Ptr{Cdouble},(OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3)
end

function OGR_F_GetFieldAsStringList(arg1::OGRFeatureH,arg2::Cint)
    ccall((:OGR_F_GetFieldAsStringList,libgdal),Ptr{Ptr{UInt8}},(OGRFeatureH,Cint),arg1,arg2)
end

function OGR_F_GetFieldAsBinary(arg1::OGRFeatureH,arg2::Cint,arg3::Ptr{Cint})
    ccall((:OGR_F_GetFieldAsBinary,libgdal),Ptr{GByte},(OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3)
end

function OGR_F_GetFieldAsDateTime(arg1::OGRFeatureH,arg2::Cint,arg3::Ptr{Cint},arg4::Ptr{Cint},arg5::Ptr{Cint},arg6::Ptr{Cint},arg7::Ptr{Cint},arg8::Ptr{Cint},arg9::Ptr{Cint})
    ccall((:OGR_F_GetFieldAsDateTime,libgdal),Cint,(OGRFeatureH,Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
end

function OGR_F_GetFieldAsDateTimeEx(hFeat::OGRFeatureH,iField::Cint,pnYear::Ptr{Cint},pnMonth::Ptr{Cint},pnDay::Ptr{Cint},pnHour::Ptr{Cint},pnMinute::Ptr{Cint},pfSecond::Ptr{Cfloat},pnTZFlag::Ptr{Cint})
    ccall((:OGR_F_GetFieldAsDateTimeEx,libgdal),Cint,(OGRFeatureH,Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cfloat},Ptr{Cint}),hFeat,iField,pnYear,pnMonth,pnDay,pnHour,pnMinute,pfSecond,pnTZFlag)
end

function OGR_F_SetFieldInteger(arg1::OGRFeatureH,arg2::Cint,arg3::Cint)
    ccall((:OGR_F_SetFieldInteger,libgdal),Void,(OGRFeatureH,Cint,Cint),arg1,arg2,arg3)
end

function OGR_F_SetFieldInteger64(arg1::OGRFeatureH,arg2::Cint,arg3::GIntBig)
    ccall((:OGR_F_SetFieldInteger64,libgdal),Void,(OGRFeatureH,Cint,GIntBig),arg1,arg2,arg3)
end

function OGR_F_SetFieldDouble(arg1::OGRFeatureH,arg2::Cint,arg3::Cdouble)
    ccall((:OGR_F_SetFieldDouble,libgdal),Void,(OGRFeatureH,Cint,Cdouble),arg1,arg2,arg3)
end

function OGR_F_SetFieldString(arg1::OGRFeatureH,arg2::Cint,arg3::Ptr{UInt8})
    ccall((:OGR_F_SetFieldString,libgdal),Void,(OGRFeatureH,Cint,Ptr{UInt8}),arg1,arg2,arg3)
end

function OGR_F_SetFieldIntegerList(arg1::OGRFeatureH,arg2::Cint,arg3::Cint,arg4::Ptr{Cint})
    ccall((:OGR_F_SetFieldIntegerList,libgdal),Void,(OGRFeatureH,Cint,Cint,Ptr{Cint}),arg1,arg2,arg3,arg4)
end

function OGR_F_SetFieldInteger64List(arg1::OGRFeatureH,arg2::Cint,arg3::Cint,arg4::Ptr{GIntBig})
    ccall((:OGR_F_SetFieldInteger64List,libgdal),Void,(OGRFeatureH,Cint,Cint,Ptr{GIntBig}),arg1,arg2,arg3,arg4)
end

function OGR_F_SetFieldDoubleList(arg1::OGRFeatureH,arg2::Cint,arg3::Cint,arg4::Ptr{Cdouble})
    ccall((:OGR_F_SetFieldDoubleList,libgdal),Void,(OGRFeatureH,Cint,Cint,Ptr{Cdouble}),arg1,arg2,arg3,arg4)
end

function OGR_F_SetFieldStringList(arg1::OGRFeatureH,arg2::Cint,arg3::Ptr{Ptr{UInt8}})
    ccall((:OGR_F_SetFieldStringList,libgdal),Void,(OGRFeatureH,Cint,Ptr{Ptr{UInt8}}),arg1,arg2,arg3)
end

function OGR_F_SetFieldRaw(arg1::OGRFeatureH,arg2::Cint,arg3::Ptr{OGRField})
    ccall((:OGR_F_SetFieldRaw,libgdal),Void,(OGRFeatureH,Cint,Ptr{OGRField}),arg1,arg2,arg3)
end

function OGR_F_SetFieldBinary(arg1::OGRFeatureH,arg2::Cint,arg3::Cint,arg4::Ptr{GByte})
    ccall((:OGR_F_SetFieldBinary,libgdal),Void,(OGRFeatureH,Cint,Cint,Ptr{GByte}),arg1,arg2,arg3,arg4)
end

function OGR_F_SetFieldDateTime(arg1::OGRFeatureH,arg2::Cint,arg3::Cint,arg4::Cint,arg5::Cint,arg6::Cint,arg7::Cint,arg8::Cint,arg9::Cint)
    ccall((:OGR_F_SetFieldDateTime,libgdal),Void,(OGRFeatureH,Cint,Cint,Cint,Cint,Cint,Cint,Cint,Cint),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
end

function OGR_F_SetFieldDateTimeEx(arg1::OGRFeatureH,arg2::Cint,arg3::Cint,arg4::Cint,arg5::Cint,arg6::Cint,arg7::Cint,arg8::Cfloat,arg9::Cint)
    ccall((:OGR_F_SetFieldDateTimeEx,libgdal),Void,(OGRFeatureH,Cint,Cint,Cint,Cint,Cint,Cint,Cfloat,Cint),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
end

function OGR_F_GetGeomFieldCount(hFeat::OGRFeatureH)
    ccall((:OGR_F_GetGeomFieldCount,libgdal),Cint,(OGRFeatureH,),hFeat)
end

function OGR_F_GetGeomFieldDefnRef(hFeat::OGRFeatureH,iField::Cint)
    ccall((:OGR_F_GetGeomFieldDefnRef,libgdal),OGRGeomFieldDefnH,(OGRFeatureH,Cint),hFeat,iField)
end

function OGR_F_GetGeomFieldIndex(hFeat::OGRFeatureH,pszName::Ptr{UInt8})
    ccall((:OGR_F_GetGeomFieldIndex,libgdal),Cint,(OGRFeatureH,Ptr{UInt8}),hFeat,pszName)
end

function OGR_F_GetGeomFieldRef(hFeat::OGRFeatureH,iField::Cint)
    ccall((:OGR_F_GetGeomFieldRef,libgdal),OGRGeometryH,(OGRFeatureH,Cint),hFeat,iField)
end

function OGR_F_SetGeomFieldDirectly(hFeat::OGRFeatureH,iField::Cint,hGeom::OGRGeometryH)
    ccall((:OGR_F_SetGeomFieldDirectly,libgdal),OGRErr,(OGRFeatureH,Cint,OGRGeometryH),hFeat,iField,hGeom)
end

function OGR_F_SetGeomField(hFeat::OGRFeatureH,iField::Cint,hGeom::OGRGeometryH)
    ccall((:OGR_F_SetGeomField,libgdal),OGRErr,(OGRFeatureH,Cint,OGRGeometryH),hFeat,iField,hGeom)
end

function OGR_F_GetFID(arg1::OGRFeatureH)
    ccall((:OGR_F_GetFID,libgdal),GIntBig,(OGRFeatureH,),arg1)
end

function OGR_F_SetFID(arg1::OGRFeatureH,arg2::GIntBig)
    ccall((:OGR_F_SetFID,libgdal),OGRErr,(OGRFeatureH,GIntBig),arg1,arg2)
end

function OGR_F_DumpReadable(arg1::OGRFeatureH,arg2::Ptr{FILE})
    ccall((:OGR_F_DumpReadable,libgdal),Void,(OGRFeatureH,Ptr{FILE}),arg1,arg2)
end

function OGR_F_SetFrom(arg1::OGRFeatureH,arg2::OGRFeatureH,arg3::Cint)
    ccall((:OGR_F_SetFrom,libgdal),OGRErr,(OGRFeatureH,OGRFeatureH,Cint),arg1,arg2,arg3)
end

function OGR_F_SetFromWithMap(arg1::OGRFeatureH,arg2::OGRFeatureH,arg3::Cint,arg4::Ptr{Cint})
    ccall((:OGR_F_SetFromWithMap,libgdal),OGRErr,(OGRFeatureH,OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3,arg4)
end

function OGR_F_GetStyleString(arg1::OGRFeatureH)
    ccall((:OGR_F_GetStyleString,libgdal),Ptr{UInt8},(OGRFeatureH,),arg1)
end

function OGR_F_SetStyleString(arg1::OGRFeatureH,arg2::Ptr{UInt8})
    ccall((:OGR_F_SetStyleString,libgdal),Void,(OGRFeatureH,Ptr{UInt8}),arg1,arg2)
end

function OGR_F_SetStyleStringDirectly(arg1::OGRFeatureH,arg2::Ptr{UInt8})
    ccall((:OGR_F_SetStyleStringDirectly,libgdal),Void,(OGRFeatureH,Ptr{UInt8}),arg1,arg2)
end

function OGR_F_GetStyleTable(arg1::OGRFeatureH)
    ccall((:OGR_F_GetStyleTable,libgdal),OGRStyleTableH,(OGRFeatureH,),arg1)
end

function OGR_F_SetStyleTableDirectly(arg1::OGRFeatureH,arg2::OGRStyleTableH)
    ccall((:OGR_F_SetStyleTableDirectly,libgdal),Void,(OGRFeatureH,OGRStyleTableH),arg1,arg2)
end

function OGR_F_SetStyleTable(arg1::OGRFeatureH,arg2::OGRStyleTableH)
    ccall((:OGR_F_SetStyleTable,libgdal),Void,(OGRFeatureH,OGRStyleTableH),arg1,arg2)
end

function OGR_F_FillUnsetWithDefault(hFeat::OGRFeatureH,bNotNullableOnly::Cint,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:OGR_F_FillUnsetWithDefault,libgdal),Void,(OGRFeatureH,Cint,Ptr{Ptr{UInt8}}),hFeat,bNotNullableOnly,papszOptions)
end

function OGR_F_Validate(arg1::OGRFeatureH,nValidateFlags::Cint,bEmitError::Cint)
    ccall((:OGR_F_Validate,libgdal),Cint,(OGRFeatureH,Cint,Cint),arg1,nValidateFlags,bEmitError)
end

function OGR_L_GetName(arg1::OGRLayerH)
    ccall((:OGR_L_GetName,libgdal),Ptr{UInt8},(OGRLayerH,),arg1)
end

function OGR_L_GetGeomType(arg1::OGRLayerH)
    ccall((:OGR_L_GetGeomType,libgdal),OGRwkbGeometryType,(OGRLayerH,),arg1)
end

function OGR_L_GetSpatialFilter(arg1::OGRLayerH)
    ccall((:OGR_L_GetSpatialFilter,libgdal),OGRGeometryH,(OGRLayerH,),arg1)
end

function OGR_L_SetSpatialFilter(arg1::OGRLayerH,arg2::OGRGeometryH)
    ccall((:OGR_L_SetSpatialFilter,libgdal),Void,(OGRLayerH,OGRGeometryH),arg1,arg2)
end

function OGR_L_SetSpatialFilterRect(arg1::OGRLayerH,arg2::Cdouble,arg3::Cdouble,arg4::Cdouble,arg5::Cdouble)
    ccall((:OGR_L_SetSpatialFilterRect,libgdal),Void,(OGRLayerH,Cdouble,Cdouble,Cdouble,Cdouble),arg1,arg2,arg3,arg4,arg5)
end

function OGR_L_SetSpatialFilterEx(arg1::OGRLayerH,iGeomField::Cint,hGeom::OGRGeometryH)
    ccall((:OGR_L_SetSpatialFilterEx,libgdal),Void,(OGRLayerH,Cint,OGRGeometryH),arg1,iGeomField,hGeom)
end

function OGR_L_SetSpatialFilterRectEx(arg1::OGRLayerH,iGeomField::Cint,dfMinX::Cdouble,dfMinY::Cdouble,dfMaxX::Cdouble,dfMaxY::Cdouble)
    ccall((:OGR_L_SetSpatialFilterRectEx,libgdal),Void,(OGRLayerH,Cint,Cdouble,Cdouble,Cdouble,Cdouble),arg1,iGeomField,dfMinX,dfMinY,dfMaxX,dfMaxY)
end

function OGR_L_SetAttributeFilter(arg1::OGRLayerH,arg2::Ptr{UInt8})
    ccall((:OGR_L_SetAttributeFilter,libgdal),OGRErr,(OGRLayerH,Ptr{UInt8}),arg1,arg2)
end

function OGR_L_ResetReading(arg1::OGRLayerH)
    ccall((:OGR_L_ResetReading,libgdal),Void,(OGRLayerH,),arg1)
end

function OGR_L_GetNextFeature(arg1::OGRLayerH)
    ccall((:OGR_L_GetNextFeature,libgdal),OGRFeatureH,(OGRLayerH,),arg1)
end

function OGR_L_SetNextByIndex(arg1::OGRLayerH,arg2::GIntBig)
    ccall((:OGR_L_SetNextByIndex,libgdal),OGRErr,(OGRLayerH,GIntBig),arg1,arg2)
end

function OGR_L_GetFeature(arg1::OGRLayerH,arg2::GIntBig)
    ccall((:OGR_L_GetFeature,libgdal),OGRFeatureH,(OGRLayerH,GIntBig),arg1,arg2)
end

function OGR_L_SetFeature(arg1::OGRLayerH,arg2::OGRFeatureH)
    ccall((:OGR_L_SetFeature,libgdal),OGRErr,(OGRLayerH,OGRFeatureH),arg1,arg2)
end

function OGR_L_CreateFeature(arg1::OGRLayerH,arg2::OGRFeatureH)
    ccall((:OGR_L_CreateFeature,libgdal),OGRErr,(OGRLayerH,OGRFeatureH),arg1,arg2)
end

function OGR_L_DeleteFeature(arg1::OGRLayerH,arg2::GIntBig)
    ccall((:OGR_L_DeleteFeature,libgdal),OGRErr,(OGRLayerH,GIntBig),arg1,arg2)
end

function OGR_L_GetLayerDefn(arg1::OGRLayerH)
    ccall((:OGR_L_GetLayerDefn,libgdal),OGRFeatureDefnH,(OGRLayerH,),arg1)
end

function OGR_L_GetSpatialRef(arg1::OGRLayerH)
    ccall((:OGR_L_GetSpatialRef,libgdal),OGRSpatialReferenceH,(OGRLayerH,),arg1)
end

function OGR_L_FindFieldIndex(arg1::OGRLayerH,arg2::Ptr{UInt8},bExactMatch::Cint)
    ccall((:OGR_L_FindFieldIndex,libgdal),Cint,(OGRLayerH,Ptr{UInt8},Cint),arg1,arg2,bExactMatch)
end

function OGR_L_GetFeatureCount(arg1::OGRLayerH,arg2::Cint)
    ccall((:OGR_L_GetFeatureCount,libgdal),GIntBig,(OGRLayerH,Cint),arg1,arg2)
end

function OGR_L_GetExtent(arg1::OGRLayerH,arg2::Ptr{OGREnvelope},arg3::Cint)
    ccall((:OGR_L_GetExtent,libgdal),OGRErr,(OGRLayerH,Ptr{OGREnvelope},Cint),arg1,arg2,arg3)
end

function OGR_L_GetExtentEx(arg1::OGRLayerH,iGeomField::Cint,psExtent::Ptr{OGREnvelope},bForce::Cint)
    ccall((:OGR_L_GetExtentEx,libgdal),OGRErr,(OGRLayerH,Cint,Ptr{OGREnvelope},Cint),arg1,iGeomField,psExtent,bForce)
end

function OGR_L_TestCapability(arg1::OGRLayerH,arg2::Ptr{UInt8})
    ccall((:OGR_L_TestCapability,libgdal),Cint,(OGRLayerH,Ptr{UInt8}),arg1,arg2)
end

function OGR_L_CreateField(arg1::OGRLayerH,arg2::OGRFieldDefnH,arg3::Cint)
    ccall((:OGR_L_CreateField,libgdal),OGRErr,(OGRLayerH,OGRFieldDefnH,Cint),arg1,arg2,arg3)
end

function OGR_L_CreateGeomField(hLayer::OGRLayerH,hFieldDefn::OGRGeomFieldDefnH,bForce::Cint)
    ccall((:OGR_L_CreateGeomField,libgdal),OGRErr,(OGRLayerH,OGRGeomFieldDefnH,Cint),hLayer,hFieldDefn,bForce)
end

function OGR_L_DeleteField(arg1::OGRLayerH,iField::Cint)
    ccall((:OGR_L_DeleteField,libgdal),OGRErr,(OGRLayerH,Cint),arg1,iField)
end

function OGR_L_ReorderFields(arg1::OGRLayerH,panMap::Ptr{Cint})
    ccall((:OGR_L_ReorderFields,libgdal),OGRErr,(OGRLayerH,Ptr{Cint}),arg1,panMap)
end

function OGR_L_ReorderField(arg1::OGRLayerH,iOldFieldPos::Cint,iNewFieldPos::Cint)
    ccall((:OGR_L_ReorderField,libgdal),OGRErr,(OGRLayerH,Cint,Cint),arg1,iOldFieldPos,iNewFieldPos)
end

function OGR_L_AlterFieldDefn(arg1::OGRLayerH,iField::Cint,hNewFieldDefn::OGRFieldDefnH,nFlags::Cint)
    ccall((:OGR_L_AlterFieldDefn,libgdal),OGRErr,(OGRLayerH,Cint,OGRFieldDefnH,Cint),arg1,iField,hNewFieldDefn,nFlags)
end

function OGR_L_StartTransaction(arg1::OGRLayerH)
    ccall((:OGR_L_StartTransaction,libgdal),OGRErr,(OGRLayerH,),arg1)
end

function OGR_L_CommitTransaction(arg1::OGRLayerH)
    ccall((:OGR_L_CommitTransaction,libgdal),OGRErr,(OGRLayerH,),arg1)
end

function OGR_L_RollbackTransaction(arg1::OGRLayerH)
    ccall((:OGR_L_RollbackTransaction,libgdal),OGRErr,(OGRLayerH,),arg1)
end

function OGR_L_Reference(arg1::OGRLayerH)
    ccall((:OGR_L_Reference,libgdal),Cint,(OGRLayerH,),arg1)
end

function OGR_L_Dereference(arg1::OGRLayerH)
    ccall((:OGR_L_Dereference,libgdal),Cint,(OGRLayerH,),arg1)
end

function OGR_L_GetRefCount(arg1::OGRLayerH)
    ccall((:OGR_L_GetRefCount,libgdal),Cint,(OGRLayerH,),arg1)
end

function OGR_L_SyncToDisk(arg1::OGRLayerH)
    ccall((:OGR_L_SyncToDisk,libgdal),OGRErr,(OGRLayerH,),arg1)
end

function OGR_L_GetFeaturesRead(arg1::OGRLayerH)
    ccall((:OGR_L_GetFeaturesRead,libgdal),GIntBig,(OGRLayerH,),arg1)
end

function OGR_L_GetFIDColumn(arg1::OGRLayerH)
    ccall((:OGR_L_GetFIDColumn,libgdal),Ptr{UInt8},(OGRLayerH,),arg1)
end

function OGR_L_GetGeometryColumn(arg1::OGRLayerH)
    ccall((:OGR_L_GetGeometryColumn,libgdal),Ptr{UInt8},(OGRLayerH,),arg1)
end

function OGR_L_GetStyleTable(arg1::OGRLayerH)
    ccall((:OGR_L_GetStyleTable,libgdal),OGRStyleTableH,(OGRLayerH,),arg1)
end

function OGR_L_SetStyleTableDirectly(arg1::OGRLayerH,arg2::OGRStyleTableH)
    ccall((:OGR_L_SetStyleTableDirectly,libgdal),Void,(OGRLayerH,OGRStyleTableH),arg1,arg2)
end

function OGR_L_SetStyleTable(arg1::OGRLayerH,arg2::OGRStyleTableH)
    ccall((:OGR_L_SetStyleTable,libgdal),Void,(OGRLayerH,OGRStyleTableH),arg1,arg2)
end

function OGR_L_SetIgnoredFields(arg1::OGRLayerH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OGR_L_SetIgnoredFields,libgdal),OGRErr,(OGRLayerH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OGR_L_Intersection(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Ptr{Ptr{UInt8}},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Intersection,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function OGR_L_Union(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Ptr{Ptr{UInt8}},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Union,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function OGR_L_SymDifference(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Ptr{Ptr{UInt8}},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_SymDifference,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function OGR_L_Identity(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Ptr{Ptr{UInt8}},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Identity,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function OGR_L_Update(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Ptr{Ptr{UInt8}},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Update,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function OGR_L_Clip(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Ptr{Ptr{UInt8}},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Clip,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function OGR_L_Erase(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Ptr{Ptr{UInt8}},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Erase,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function OGR_DS_Destroy(arg1::OGRDataSourceH)
    ccall((:OGR_DS_Destroy,libgdal),Void,(OGRDataSourceH,),arg1)
end

function OGR_DS_GetName(arg1::OGRDataSourceH)
    ccall((:OGR_DS_GetName,libgdal),Ptr{UInt8},(OGRDataSourceH,),arg1)
end

function OGR_DS_GetLayerCount(arg1::OGRDataSourceH)
    ccall((:OGR_DS_GetLayerCount,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function OGR_DS_GetLayer(arg1::OGRDataSourceH,arg2::Cint)
    ccall((:OGR_DS_GetLayer,libgdal),OGRLayerH,(OGRDataSourceH,Cint),arg1,arg2)
end

function OGR_DS_GetLayerByName(arg1::OGRDataSourceH,arg2::Ptr{UInt8})
    ccall((:OGR_DS_GetLayerByName,libgdal),OGRLayerH,(OGRDataSourceH,Ptr{UInt8}),arg1,arg2)
end

function OGR_DS_DeleteLayer(arg1::OGRDataSourceH,arg2::Cint)
    ccall((:OGR_DS_DeleteLayer,libgdal),OGRErr,(OGRDataSourceH,Cint),arg1,arg2)
end

function OGR_DS_GetDriver(arg1::OGRDataSourceH)
    ccall((:OGR_DS_GetDriver,libgdal),OGRSFDriverH,(OGRDataSourceH,),arg1)
end

function OGR_DS_CreateLayer(arg1::OGRDataSourceH,arg2::Ptr{UInt8},arg3::OGRSpatialReferenceH,arg4::OGRwkbGeometryType,arg5::Ptr{Ptr{UInt8}})
    ccall((:OGR_DS_CreateLayer,libgdal),OGRLayerH,(OGRDataSourceH,Ptr{UInt8},OGRSpatialReferenceH,OGRwkbGeometryType,Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4,arg5)
end

function OGR_DS_CopyLayer(arg1::OGRDataSourceH,arg2::OGRLayerH,arg3::Ptr{UInt8},arg4::Ptr{Ptr{UInt8}})
    ccall((:OGR_DS_CopyLayer,libgdal),OGRLayerH,(OGRDataSourceH,OGRLayerH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4)
end

function OGR_DS_TestCapability(arg1::OGRDataSourceH,arg2::Ptr{UInt8})
    ccall((:OGR_DS_TestCapability,libgdal),Cint,(OGRDataSourceH,Ptr{UInt8}),arg1,arg2)
end

function OGR_DS_ExecuteSQL(arg1::OGRDataSourceH,arg2::Ptr{UInt8},arg3::OGRGeometryH,arg4::Ptr{UInt8})
    ccall((:OGR_DS_ExecuteSQL,libgdal),OGRLayerH,(OGRDataSourceH,Ptr{UInt8},OGRGeometryH,Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function OGR_DS_ReleaseResultSet(arg1::OGRDataSourceH,arg2::OGRLayerH)
    ccall((:OGR_DS_ReleaseResultSet,libgdal),Void,(OGRDataSourceH,OGRLayerH),arg1,arg2)
end

function OGR_DS_Reference(arg1::OGRDataSourceH)
    ccall((:OGR_DS_Reference,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function OGR_DS_Dereference(arg1::OGRDataSourceH)
    ccall((:OGR_DS_Dereference,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function OGR_DS_GetRefCount(arg1::OGRDataSourceH)
    ccall((:OGR_DS_GetRefCount,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function OGR_DS_GetSummaryRefCount(arg1::OGRDataSourceH)
    ccall((:OGR_DS_GetSummaryRefCount,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function OGR_DS_SyncToDisk(arg1::OGRDataSourceH)
    ccall((:OGR_DS_SyncToDisk,libgdal),OGRErr,(OGRDataSourceH,),arg1)
end

function OGR_DS_GetStyleTable(arg1::OGRDataSourceH)
    ccall((:OGR_DS_GetStyleTable,libgdal),OGRStyleTableH,(OGRDataSourceH,),arg1)
end

function OGR_DS_SetStyleTableDirectly(arg1::OGRDataSourceH,arg2::OGRStyleTableH)
    ccall((:OGR_DS_SetStyleTableDirectly,libgdal),Void,(OGRDataSourceH,OGRStyleTableH),arg1,arg2)
end

function OGR_DS_SetStyleTable(arg1::OGRDataSourceH,arg2::OGRStyleTableH)
    ccall((:OGR_DS_SetStyleTable,libgdal),Void,(OGRDataSourceH,OGRStyleTableH),arg1,arg2)
end

function OGR_Dr_GetName(arg1::OGRSFDriverH)
    ccall((:OGR_Dr_GetName,libgdal),Ptr{UInt8},(OGRSFDriverH,),arg1)
end

function OGR_Dr_Open(arg1::OGRSFDriverH,arg2::Ptr{UInt8},arg3::Cint)
    ccall((:OGR_Dr_Open,libgdal),OGRDataSourceH,(OGRSFDriverH,Ptr{UInt8},Cint),arg1,arg2,arg3)
end

function OGR_Dr_TestCapability(arg1::OGRSFDriverH,arg2::Ptr{UInt8})
    ccall((:OGR_Dr_TestCapability,libgdal),Cint,(OGRSFDriverH,Ptr{UInt8}),arg1,arg2)
end

function OGR_Dr_CreateDataSource(arg1::OGRSFDriverH,arg2::Ptr{UInt8},arg3::Ptr{Ptr{UInt8}})
    ccall((:OGR_Dr_CreateDataSource,libgdal),OGRDataSourceH,(OGRSFDriverH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3)
end

function OGR_Dr_CopyDataSource(arg1::OGRSFDriverH,arg2::OGRDataSourceH,arg3::Ptr{UInt8},arg4::Ptr{Ptr{UInt8}})
    ccall((:OGR_Dr_CopyDataSource,libgdal),OGRDataSourceH,(OGRSFDriverH,OGRDataSourceH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4)
end

function OGR_Dr_DeleteDataSource(arg1::OGRSFDriverH,arg2::Ptr{UInt8})
    ccall((:OGR_Dr_DeleteDataSource,libgdal),OGRErr,(OGRSFDriverH,Ptr{UInt8}),arg1,arg2)
end

function OGROpen(arg1::Ptr{UInt8},arg2::Cint,arg3::Ptr{OGRSFDriverH})
    ccall((:OGROpen,libgdal),OGRDataSourceH,(Ptr{UInt8},Cint,Ptr{OGRSFDriverH}),arg1,arg2,arg3)
end

function OGROpenShared(arg1::Ptr{UInt8},arg2::Cint,arg3::Ptr{OGRSFDriverH})
    ccall((:OGROpenShared,libgdal),OGRDataSourceH,(Ptr{UInt8},Cint,Ptr{OGRSFDriverH}),arg1,arg2,arg3)
end

function OGRReleaseDataSource(arg1::OGRDataSourceH)
    ccall((:OGRReleaseDataSource,libgdal),OGRErr,(OGRDataSourceH,),arg1)
end

function OGRRegisterDriver(arg1::OGRSFDriverH)
    ccall((:OGRRegisterDriver,libgdal),Void,(OGRSFDriverH,),arg1)
end

function OGRDeregisterDriver(arg1::OGRSFDriverH)
    ccall((:OGRDeregisterDriver,libgdal),Void,(OGRSFDriverH,),arg1)
end

function OGRGetDriverCount()
    ccall((:OGRGetDriverCount,libgdal),Cint,())
end

function OGRGetDriver(arg1::Cint)
    ccall((:OGRGetDriver,libgdal),OGRSFDriverH,(Cint,),arg1)
end

function OGRGetDriverByName(arg1::Ptr{UInt8})
    ccall((:OGRGetDriverByName,libgdal),OGRSFDriverH,(Ptr{UInt8},),arg1)
end

function OGRGetOpenDSCount()
    ccall((:OGRGetOpenDSCount,libgdal),Cint,())
end

function OGRGetOpenDS(iDS::Cint)
    ccall((:OGRGetOpenDS,libgdal),OGRDataSourceH,(Cint,),iDS)
end

function OGRRegisterAll()
    ccall((:OGRRegisterAll,libgdal),Void,())
end

function OGRCleanupAll()
    ccall((:OGRCleanupAll,libgdal),Void,())
end

function OGR_SM_Create(hStyleTable::OGRStyleTableH)
    ccall((:OGR_SM_Create,libgdal),OGRStyleMgrH,(OGRStyleTableH,),hStyleTable)
end

function OGR_SM_Destroy(hSM::OGRStyleMgrH)
    ccall((:OGR_SM_Destroy,libgdal),Void,(OGRStyleMgrH,),hSM)
end

function OGR_SM_InitFromFeature(hSM::OGRStyleMgrH,hFeat::OGRFeatureH)
    ccall((:OGR_SM_InitFromFeature,libgdal),Ptr{UInt8},(OGRStyleMgrH,OGRFeatureH),hSM,hFeat)
end

function OGR_SM_InitStyleString(hSM::OGRStyleMgrH,pszStyleString::Ptr{UInt8})
    ccall((:OGR_SM_InitStyleString,libgdal),Cint,(OGRStyleMgrH,Ptr{UInt8}),hSM,pszStyleString)
end

function OGR_SM_GetPartCount(hSM::OGRStyleMgrH,pszStyleString::Ptr{UInt8})
    ccall((:OGR_SM_GetPartCount,libgdal),Cint,(OGRStyleMgrH,Ptr{UInt8}),hSM,pszStyleString)
end

function OGR_SM_GetPart(hSM::OGRStyleMgrH,nPartId::Cint,pszStyleString::Ptr{UInt8})
    ccall((:OGR_SM_GetPart,libgdal),OGRStyleToolH,(OGRStyleMgrH,Cint,Ptr{UInt8}),hSM,nPartId,pszStyleString)
end

function OGR_SM_AddPart(hSM::OGRStyleMgrH,hST::OGRStyleToolH)
    ccall((:OGR_SM_AddPart,libgdal),Cint,(OGRStyleMgrH,OGRStyleToolH),hSM,hST)
end

function OGR_SM_AddStyle(hSM::OGRStyleMgrH,pszStyleName::Ptr{UInt8},pszStyleString::Ptr{UInt8})
    ccall((:OGR_SM_AddStyle,libgdal),Cint,(OGRStyleMgrH,Ptr{UInt8},Ptr{UInt8}),hSM,pszStyleName,pszStyleString)
end

function OGR_ST_Create(eClassId::OGRSTClassId)
    ccall((:OGR_ST_Create,libgdal),OGRStyleToolH,(OGRSTClassId,),eClassId)
end

function OGR_ST_Destroy(hST::OGRStyleToolH)
    ccall((:OGR_ST_Destroy,libgdal),Void,(OGRStyleToolH,),hST)
end

function OGR_ST_GetType(hST::OGRStyleToolH)
    ccall((:OGR_ST_GetType,libgdal),OGRSTClassId,(OGRStyleToolH,),hST)
end

function OGR_ST_GetUnit(hST::OGRStyleToolH)
    ccall((:OGR_ST_GetUnit,libgdal),OGRSTUnitId,(OGRStyleToolH,),hST)
end

function OGR_ST_SetUnit(hST::OGRStyleToolH,eUnit::OGRSTUnitId,dfGroundPaperScale::Cdouble)
    ccall((:OGR_ST_SetUnit,libgdal),Void,(OGRStyleToolH,OGRSTUnitId,Cdouble),hST,eUnit,dfGroundPaperScale)
end

function OGR_ST_GetParamStr(hST::OGRStyleToolH,eParam::Cint,bValueIsNull::Ptr{Cint})
    ccall((:OGR_ST_GetParamStr,libgdal),Ptr{UInt8},(OGRStyleToolH,Cint,Ptr{Cint}),hST,eParam,bValueIsNull)
end

function OGR_ST_GetParamNum(hST::OGRStyleToolH,eParam::Cint,bValueIsNull::Ptr{Cint})
    ccall((:OGR_ST_GetParamNum,libgdal),Cint,(OGRStyleToolH,Cint,Ptr{Cint}),hST,eParam,bValueIsNull)
end

function OGR_ST_GetParamDbl(hST::OGRStyleToolH,eParam::Cint,bValueIsNull::Ptr{Cint})
    ccall((:OGR_ST_GetParamDbl,libgdal),Cdouble,(OGRStyleToolH,Cint,Ptr{Cint}),hST,eParam,bValueIsNull)
end

function OGR_ST_SetParamStr(hST::OGRStyleToolH,eParam::Cint,pszValue::Ptr{UInt8})
    ccall((:OGR_ST_SetParamStr,libgdal),Void,(OGRStyleToolH,Cint,Ptr{UInt8}),hST,eParam,pszValue)
end

function OGR_ST_SetParamNum(hST::OGRStyleToolH,eParam::Cint,nValue::Cint)
    ccall((:OGR_ST_SetParamNum,libgdal),Void,(OGRStyleToolH,Cint,Cint),hST,eParam,nValue)
end

function OGR_ST_SetParamDbl(hST::OGRStyleToolH,eParam::Cint,dfValue::Cdouble)
    ccall((:OGR_ST_SetParamDbl,libgdal),Void,(OGRStyleToolH,Cint,Cdouble),hST,eParam,dfValue)
end

function OGR_ST_GetStyleString(hST::OGRStyleToolH)
    ccall((:OGR_ST_GetStyleString,libgdal),Ptr{UInt8},(OGRStyleToolH,),hST)
end

function OGR_ST_GetRGBFromString(hST::OGRStyleToolH,pszColor::Ptr{UInt8},pnRed::Ptr{Cint},pnGreen::Ptr{Cint},pnBlue::Ptr{Cint},pnAlpha::Ptr{Cint})
    ccall((:OGR_ST_GetRGBFromString,libgdal),Cint,(OGRStyleToolH,Ptr{UInt8},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint}),hST,pszColor,pnRed,pnGreen,pnBlue,pnAlpha)
end

function OGR_STBL_Create()
    ccall((:OGR_STBL_Create,libgdal),OGRStyleTableH,())
end

function OGR_STBL_Destroy(hSTBL::OGRStyleTableH)
    ccall((:OGR_STBL_Destroy,libgdal),Void,(OGRStyleTableH,),hSTBL)
end

function OGR_STBL_AddStyle(hStyleTable::OGRStyleTableH,pszName::Ptr{UInt8},pszStyleString::Ptr{UInt8})
    ccall((:OGR_STBL_AddStyle,libgdal),Cint,(OGRStyleTableH,Ptr{UInt8},Ptr{UInt8}),hStyleTable,pszName,pszStyleString)
end

function OGR_STBL_SaveStyleTable(hStyleTable::OGRStyleTableH,pszFilename::Ptr{UInt8})
    ccall((:OGR_STBL_SaveStyleTable,libgdal),Cint,(OGRStyleTableH,Ptr{UInt8}),hStyleTable,pszFilename)
end

function OGR_STBL_LoadStyleTable(hStyleTable::OGRStyleTableH,pszFilename::Ptr{UInt8})
    ccall((:OGR_STBL_LoadStyleTable,libgdal),Cint,(OGRStyleTableH,Ptr{UInt8}),hStyleTable,pszFilename)
end

function OGR_STBL_Find(hStyleTable::OGRStyleTableH,pszName::Ptr{UInt8})
    ccall((:OGR_STBL_Find,libgdal),Ptr{UInt8},(OGRStyleTableH,Ptr{UInt8}),hStyleTable,pszName)
end

function OGR_STBL_ResetStyleStringReading(hStyleTable::OGRStyleTableH)
    ccall((:OGR_STBL_ResetStyleStringReading,libgdal),Void,(OGRStyleTableH,),hStyleTable)
end

function OGR_STBL_GetNextStyle(hStyleTable::OGRStyleTableH)
    ccall((:OGR_STBL_GetNextStyle,libgdal),Ptr{UInt8},(OGRStyleTableH,),hStyleTable)
end

function OGR_STBL_GetLastStyleName(hStyleTable::OGRStyleTableH)
    ccall((:OGR_STBL_GetLastStyleName,libgdal),Ptr{UInt8},(OGRStyleTableH,),hStyleTable)
end
