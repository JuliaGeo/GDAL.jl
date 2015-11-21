function createfromwkb(arg1::Ptr{Cuchar},arg2::OGRSpatialReferenceH,arg3::Ptr{OGRGeometryH},arg4::Integer)
    ccall((:OGR_G_CreateFromWkb,libgdal),OGRErr,(Ptr{Cuchar},OGRSpatialReferenceH,Ptr{OGRGeometryH},Cint),arg1,arg2,arg3,arg4)
end

function createfromwkt(arg1::Vector{UTF8String},arg2::OGRSpatialReferenceH,arg3::Ptr{OGRGeometryH})
    ccall((:OGR_G_CreateFromWkt,libgdal),OGRErr,(Ptr{Ptr{UInt8}},OGRSpatialReferenceH,Ptr{OGRGeometryH}),arg1,arg2,arg3)
end

function createfromfgf(arg1::Ptr{Cuchar},arg2::OGRSpatialReferenceH,arg3::Ptr{OGRGeometryH},arg4::Integer,arg5::Vector{Cint})
    ccall((:OGR_G_CreateFromFgf,libgdal),OGRErr,(Ptr{Cuchar},OGRSpatialReferenceH,Ptr{OGRGeometryH},Cint,Ptr{Cint}),arg1,arg2,arg3,arg4,arg5)
end

function destroygeometry(arg1::OGRGeometryH)
    ccall((:OGR_G_DestroyGeometry,libgdal),Void,(OGRGeometryH,),arg1)
end

function creategeometry(arg1::OGRwkbGeometryType)
    checknull(ccall((:OGR_G_CreateGeometry,libgdal),OGRGeometryH,(OGRwkbGeometryType,),arg1))
end

function approximatearcangles(dfCenterX::Real,dfCenterY::Real,dfZ::Real,dfPrimaryRadius::Real,dfSecondaryAxis::Real,dfRotation::Real,dfStartAngle::Real,dfEndAngle::Real,dfMaxAngleStepSizeDegrees::Real)
    checknull(ccall((:OGR_G_ApproximateArcAngles,libgdal),OGRGeometryH,(Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),dfCenterX,dfCenterY,dfZ,dfPrimaryRadius,dfSecondaryAxis,dfRotation,dfStartAngle,dfEndAngle,dfMaxAngleStepSizeDegrees))
end

function forcetopolygon(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_ForceToPolygon,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function forcetolinestring(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_ForceToLineString,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function forcetomultipolygon(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_ForceToMultiPolygon,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function forcetomultipoint(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_ForceToMultiPoint,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function forcetomultilinestring(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_ForceToMultiLineString,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function forceto(hGeom::OGRGeometryH,eTargetType::OGRwkbGeometryType,papszOptions::Vector{UTF8String})
    checknull(ccall((:OGR_G_ForceTo,libgdal),OGRGeometryH,(OGRGeometryH,OGRwkbGeometryType,Ptr{Ptr{UInt8}}),hGeom,eTargetType,papszOptions))
end

function getdimension(arg1::OGRGeometryH)
    ccall((:OGR_G_GetDimension,libgdal),Cint,(OGRGeometryH,),arg1)
end

function getcoordinatedimension(arg1::OGRGeometryH)
    ccall((:OGR_G_GetCoordinateDimension,libgdal),Cint,(OGRGeometryH,),arg1)
end

function setcoordinatedimension(arg1::OGRGeometryH,arg2::Integer)
    ccall((:OGR_G_SetCoordinateDimension,libgdal),Void,(OGRGeometryH,Cint),arg1,arg2)
end

function clone(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_Clone,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function getenvelope(arg1::OGRGeometryH,arg2::Ptr{OGREnvelope})
    ccall((:OGR_G_GetEnvelope,libgdal),Void,(OGRGeometryH,Ptr{OGREnvelope}),arg1,arg2)
end

function getenvelope3d(arg1::OGRGeometryH,arg2::Ptr{OGREnvelope3D})
    ccall((:OGR_G_GetEnvelope3D,libgdal),Void,(OGRGeometryH,Ptr{OGREnvelope3D}),arg1,arg2)
end

function importfromwkb(arg1::OGRGeometryH,arg2::Ptr{Cuchar},arg3::Integer)
    ccall((:OGR_G_ImportFromWkb,libgdal),OGRErr,(OGRGeometryH,Ptr{Cuchar},Cint),arg1,arg2,arg3)
end

function exporttowkb(arg1::OGRGeometryH,arg2::OGRwkbByteOrder,arg3::Ptr{Cuchar})
    ccall((:OGR_G_ExportToWkb,libgdal),OGRErr,(OGRGeometryH,OGRwkbByteOrder,Ptr{Cuchar}),arg1,arg2,arg3)
end

function exporttoisowkb(arg1::OGRGeometryH,arg2::OGRwkbByteOrder,arg3::Ptr{Cuchar})
    ccall((:OGR_G_ExportToIsoWkb,libgdal),OGRErr,(OGRGeometryH,OGRwkbByteOrder,Ptr{Cuchar}),arg1,arg2,arg3)
end

function wkbsize(hGeom::OGRGeometryH)
    ccall((:OGR_G_WkbSize,libgdal),Cint,(OGRGeometryH,),hGeom)
end

function importfromwkt(arg1::OGRGeometryH,arg2::Vector{UTF8String})
    ccall((:OGR_G_ImportFromWkt,libgdal),OGRErr,(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function exporttowkt(arg1::OGRGeometryH,arg2::Vector{UTF8String})
    ccall((:OGR_G_ExportToWkt,libgdal),OGRErr,(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function exporttoisowkt(arg1::OGRGeometryH,arg2::Vector{UTF8String})
    ccall((:OGR_G_ExportToIsoWkt,libgdal),OGRErr,(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function getgeometrytype(arg1::OGRGeometryH)
    ccall((:OGR_G_GetGeometryType,libgdal),OGRwkbGeometryType,(OGRGeometryH,),arg1)
end

function getgeometryname(arg1::OGRGeometryH)
    bytestring(ccall((:OGR_G_GetGeometryName,libgdal),Ptr{UInt8},(OGRGeometryH,),arg1))
end

function dumpreadable(arg1::OGRGeometryH,arg2::Ptr{FILE},arg3::AbstractString)
    ccall((:OGR_G_DumpReadable,libgdal),Void,(OGRGeometryH,Ptr{FILE},Ptr{UInt8}),arg1,arg2,arg3)
end

function flattento2d(arg1::OGRGeometryH)
    ccall((:OGR_G_FlattenTo2D,libgdal),Void,(OGRGeometryH,),arg1)
end

function closerings(arg1::OGRGeometryH)
    ccall((:OGR_G_CloseRings,libgdal),Void,(OGRGeometryH,),arg1)
end

function createfromgml(arg1::AbstractString)
    checknull(ccall((:OGR_G_CreateFromGML,libgdal),OGRGeometryH,(Ptr{UInt8},),arg1))
end

function exporttogml(arg1::OGRGeometryH)
    bytestring(ccall((:OGR_G_ExportToGML,libgdal),Ptr{UInt8},(OGRGeometryH,),arg1))
end

function exporttogmlex(arg1::OGRGeometryH,papszOptions::Vector{UTF8String})
    bytestring(ccall((:OGR_G_ExportToGMLEx,libgdal),Ptr{UInt8},(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,papszOptions))
end

function createfromgmltree(arg1::Ptr{CPLXMLNode})
    checknull(ccall((:OGR_G_CreateFromGMLTree,libgdal),OGRGeometryH,(Ptr{CPLXMLNode},),arg1))
end

function exporttogmltree(arg1::OGRGeometryH)
    ccall((:OGR_G_ExportToGMLTree,libgdal),Ptr{CPLXMLNode},(OGRGeometryH,),arg1)
end

function exportenvelopetogmltree(arg1::OGRGeometryH)
    ccall((:OGR_G_ExportEnvelopeToGMLTree,libgdal),Ptr{CPLXMLNode},(OGRGeometryH,),arg1)
end

function exporttokml(arg1::OGRGeometryH,pszAltitudeMode::AbstractString)
    bytestring(ccall((:OGR_G_ExportToKML,libgdal),Ptr{UInt8},(OGRGeometryH,Ptr{UInt8}),arg1,pszAltitudeMode))
end

function exporttojson(arg1::OGRGeometryH)
    bytestring(ccall((:OGR_G_ExportToJson,libgdal),Ptr{UInt8},(OGRGeometryH,),arg1))
end

function exporttojsonex(arg1::OGRGeometryH,papszOptions::Vector{UTF8String})
    bytestring(ccall((:OGR_G_ExportToJsonEx,libgdal),Ptr{UInt8},(OGRGeometryH,Ptr{Ptr{UInt8}}),arg1,papszOptions))
end

function creategeometryfromjson(arg1::AbstractString)
    checknull(ccall((:OGR_G_CreateGeometryFromJson,libgdal),OGRGeometryH,(Ptr{UInt8},),arg1))
end

function assignspatialreference(arg1::OGRGeometryH,arg2::OGRSpatialReferenceH)
    ccall((:OGR_G_AssignSpatialReference,libgdal),Void,(OGRGeometryH,OGRSpatialReferenceH),arg1,arg2)
end

function getspatialreference(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_GetSpatialReference,libgdal),OGRSpatialReferenceH,(OGRGeometryH,),arg1))
end

function transform(arg1::OGRGeometryH,arg2::OGRCoordinateTransformationH)
    ccall((:OGR_G_Transform,libgdal),OGRErr,(OGRGeometryH,OGRCoordinateTransformationH),arg1,arg2)
end

function transformto(arg1::OGRGeometryH,arg2::OGRSpatialReferenceH)
    ccall((:OGR_G_TransformTo,libgdal),OGRErr,(OGRGeometryH,OGRSpatialReferenceH),arg1,arg2)
end

function simplify(hThis::OGRGeometryH,tolerance::Real)
    checknull(ccall((:OGR_G_Simplify,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble),hThis,tolerance))
end

function simplifypreservetopology(hThis::OGRGeometryH,tolerance::Real)
    checknull(ccall((:OGR_G_SimplifyPreserveTopology,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble),hThis,tolerance))
end

function segmentize(hGeom::OGRGeometryH,dfMaxLength::Real)
    ccall((:OGR_G_Segmentize,libgdal),Void,(OGRGeometryH,Cdouble),hGeom,dfMaxLength)
end

function intersects(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Intersects,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function equals(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Equals,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function disjoint(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Disjoint,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function touches(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Touches,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function crosses(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Crosses,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function within(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Within,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function contains(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Contains,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function overlaps(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Overlaps,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function boundary(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_Boundary,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function convexhull(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_ConvexHull,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function buffer(arg1::OGRGeometryH,arg2::Real,arg3::Integer)
    checknull(ccall((:OGR_G_Buffer,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble,Cint),arg1,arg2,arg3))
end

function intersection(arg1::OGRGeometryH,arg2::OGRGeometryH)
    checknull(ccall((:OGR_G_Intersection,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2))
end

function union(arg1::OGRGeometryH,arg2::OGRGeometryH)
    checknull(ccall((:OGR_G_Union,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2))
end

function unioncascaded(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_UnionCascaded,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function pointonsurface(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_PointOnSurface,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function difference(arg1::OGRGeometryH,arg2::OGRGeometryH)
    checknull(ccall((:OGR_G_Difference,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2))
end

function symdifference(arg1::OGRGeometryH,arg2::OGRGeometryH)
    checknull(ccall((:OGR_G_SymDifference,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2))
end

function distance(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Distance,libgdal),Cdouble,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function length(arg1::OGRGeometryH)
    ccall((:OGR_G_Length,libgdal),Cdouble,(OGRGeometryH,),arg1)
end

function area(arg1::OGRGeometryH)
    ccall((:OGR_G_Area,libgdal),Cdouble,(OGRGeometryH,),arg1)
end

function centroid(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Centroid,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function value(arg1::OGRGeometryH,dfDistance::Real)
    checknull(ccall((:OGR_G_Value,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble),arg1,dfDistance))
end

function empty(arg1::OGRGeometryH)
    ccall((:OGR_G_Empty,libgdal),Void,(OGRGeometryH,),arg1)
end

function isempty(arg1::OGRGeometryH)
    ccall((:OGR_G_IsEmpty,libgdal),Cint,(OGRGeometryH,),arg1)
end

function isvalid(arg1::OGRGeometryH)
    ccall((:OGR_G_IsValid,libgdal),Cint,(OGRGeometryH,),arg1)
end

function issimple(arg1::OGRGeometryH)
    ccall((:OGR_G_IsSimple,libgdal),Cint,(OGRGeometryH,),arg1)
end

function isring(arg1::OGRGeometryH)
    ccall((:OGR_G_IsRing,libgdal),Cint,(OGRGeometryH,),arg1)
end

function polygonize(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_Polygonize,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function intersect(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Intersect,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function equal(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_Equal,libgdal),Cint,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function symmetricdifference(arg1::OGRGeometryH,arg2::OGRGeometryH)
    checknull(ccall((:OGR_G_SymmetricDifference,libgdal),OGRGeometryH,(OGRGeometryH,OGRGeometryH),arg1,arg2))
end

function getarea(arg1::OGRGeometryH)
    ccall((:OGR_G_GetArea,libgdal),Cdouble,(OGRGeometryH,),arg1)
end

function getboundary(arg1::OGRGeometryH)
    checknull(ccall((:OGR_G_GetBoundary,libgdal),OGRGeometryH,(OGRGeometryH,),arg1))
end

function getpointcount(arg1::OGRGeometryH)
    ccall((:OGR_G_GetPointCount,libgdal),Cint,(OGRGeometryH,),arg1)
end

function getpoints(hGeom::OGRGeometryH,pabyX::Ptr{Void},nXStride::Integer,pabyY::Ptr{Void},nYStride::Integer,pabyZ::Ptr{Void},nZStride::Integer)
    ccall((:OGR_G_GetPoints,libgdal),Cint,(OGRGeometryH,Ptr{Void},Cint,Ptr{Void},Cint,Ptr{Void},Cint),hGeom,pabyX,nXStride,pabyY,nYStride,pabyZ,nZStride)
end

function getx(arg1::OGRGeometryH,arg2::Integer)
    ccall((:OGR_G_GetX,libgdal),Cdouble,(OGRGeometryH,Cint),arg1,arg2)
end

function gety(arg1::OGRGeometryH,arg2::Integer)
    ccall((:OGR_G_GetY,libgdal),Cdouble,(OGRGeometryH,Cint),arg1,arg2)
end

function getz(arg1::OGRGeometryH,arg2::Integer)
    ccall((:OGR_G_GetZ,libgdal),Cdouble,(OGRGeometryH,Cint),arg1,arg2)
end

function getpoint(arg1::OGRGeometryH,iPoint::Integer,arg2::Vector{Float64},arg3::Vector{Float64},arg4::Vector{Float64})
    ccall((:OGR_G_GetPoint,libgdal),Void,(OGRGeometryH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),arg1,iPoint,arg2,arg3,arg4)
end

function setpointcount(hGeom::OGRGeometryH,nNewPointCount::Integer)
    ccall((:OGR_G_SetPointCount,libgdal),Void,(OGRGeometryH,Cint),hGeom,nNewPointCount)
end

function setpoint(arg1::OGRGeometryH,iPoint::Integer,arg2::Real,arg3::Real,arg4::Real)
    ccall((:OGR_G_SetPoint,libgdal),Void,(OGRGeometryH,Cint,Cdouble,Cdouble,Cdouble),arg1,iPoint,arg2,arg3,arg4)
end

function setpoint_2d(arg1::OGRGeometryH,iPoint::Integer,arg2::Real,arg3::Real)
    ccall((:OGR_G_SetPoint_2D,libgdal),Void,(OGRGeometryH,Cint,Cdouble,Cdouble),arg1,iPoint,arg2,arg3)
end

function addpoint(arg1::OGRGeometryH,arg2::Real,arg3::Real,arg4::Real)
    ccall((:OGR_G_AddPoint,libgdal),Void,(OGRGeometryH,Cdouble,Cdouble,Cdouble),arg1,arg2,arg3,arg4)
end

function addpoint_2d(arg1::OGRGeometryH,arg2::Real,arg3::Real)
    ccall((:OGR_G_AddPoint_2D,libgdal),Void,(OGRGeometryH,Cdouble,Cdouble),arg1,arg2,arg3)
end

function setpoints(hGeom::OGRGeometryH,nPointsIn::Integer,pabyX::Ptr{Void},nXStride::Integer,pabyY::Ptr{Void},nYStride::Integer,pabyZ::Ptr{Void},nZStride::Integer)
    ccall((:OGR_G_SetPoints,libgdal),Void,(OGRGeometryH,Cint,Ptr{Void},Cint,Ptr{Void},Cint,Ptr{Void},Cint),hGeom,nPointsIn,pabyX,nXStride,pabyY,nYStride,pabyZ,nZStride)
end

function getgeometrycount(arg1::OGRGeometryH)
    ccall((:OGR_G_GetGeometryCount,libgdal),Cint,(OGRGeometryH,),arg1)
end

function getgeometryref(arg1::OGRGeometryH,arg2::Integer)
    checknull(ccall((:OGR_G_GetGeometryRef,libgdal),OGRGeometryH,(OGRGeometryH,Cint),arg1,arg2))
end

function addgeometry(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_AddGeometry,libgdal),OGRErr,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function addgeometrydirectly(arg1::OGRGeometryH,arg2::OGRGeometryH)
    ccall((:OGR_G_AddGeometryDirectly,libgdal),OGRErr,(OGRGeometryH,OGRGeometryH),arg1,arg2)
end

function removegeometry(arg1::OGRGeometryH,arg2::Integer,arg3::Integer)
    ccall((:OGR_G_RemoveGeometry,libgdal),OGRErr,(OGRGeometryH,Cint,Cint),arg1,arg2,arg3)
end

function hascurvegeometry(arg1::OGRGeometryH,bLookForNonLinear::Integer)
    ccall((:OGR_G_HasCurveGeometry,libgdal),Cint,(OGRGeometryH,Cint),arg1,bLookForNonLinear)
end

function getlineargeometry(hGeom::OGRGeometryH,dfMaxAngleStepSizeDegrees::Real,papszOptions::Vector{UTF8String})
    checknull(ccall((:OGR_G_GetLinearGeometry,libgdal),OGRGeometryH,(OGRGeometryH,Cdouble,Ptr{Ptr{UInt8}}),hGeom,dfMaxAngleStepSizeDegrees,papszOptions))
end

function getcurvegeometry(hGeom::OGRGeometryH,papszOptions::Vector{UTF8String})
    checknull(ccall((:OGR_G_GetCurveGeometry,libgdal),OGRGeometryH,(OGRGeometryH,Ptr{Ptr{UInt8}}),hGeom,papszOptions))
end

function buildpolygonfromedges(hLinesAsCollection::OGRGeometryH,bBestEffort::Integer,bAutoClose::Integer,dfTolerance::Real,peErr::Ptr{OGRErr})
    checknull(ccall((:OGRBuildPolygonFromEdges,libgdal),OGRGeometryH,(OGRGeometryH,Cint,Cint,Cdouble,Ptr{OGRErr}),hLinesAsCollection,bBestEffort,bAutoClose,dfTolerance,peErr))
end

function setgenerate_db2_v72_byte_order(bGenerate_DB2_V72_BYTE_ORDER::Integer)
    ccall((:OGRSetGenerate_DB2_V72_BYTE_ORDER,libgdal),OGRErr,(Cint,),bGenerate_DB2_V72_BYTE_ORDER)
end

function getgenerate_db2_v72_byte_order()
    ccall((:OGRGetGenerate_DB2_V72_BYTE_ORDER,libgdal),Cint,())
end

function setnonlineargeometriesenabledflag(bFlag::Integer)
    ccall((:OGRSetNonLinearGeometriesEnabledFlag,libgdal),Void,(Cint,),bFlag)
end

function getnonlineargeometriesenabledflag()
    ccall((:OGRGetNonLinearGeometriesEnabledFlag,libgdal),Cint,())
end

function create(arg1::AbstractString,arg2::OGRFieldType)
    checknull(ccall((:OGR_Fld_Create,libgdal),OGRFieldDefnH,(Ptr{UInt8},OGRFieldType),arg1,arg2))
end

function destroy(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_Destroy,libgdal),Void,(OGRFieldDefnH,),arg1)
end

function setname(arg1::OGRFieldDefnH,arg2::AbstractString)
    ccall((:OGR_Fld_SetName,libgdal),Void,(OGRFieldDefnH,Ptr{UInt8}),arg1,arg2)
end

function getnameref(arg1::OGRFieldDefnH)
    bytestring(ccall((:OGR_Fld_GetNameRef,libgdal),Ptr{UInt8},(OGRFieldDefnH,),arg1))
end

function gettype(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetType,libgdal),OGRFieldType,(OGRFieldDefnH,),arg1)
end

function settype(arg1::OGRFieldDefnH,arg2::OGRFieldType)
    ccall((:OGR_Fld_SetType,libgdal),Void,(OGRFieldDefnH,OGRFieldType),arg1,arg2)
end

function getsubtype(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetSubType,libgdal),OGRFieldSubType,(OGRFieldDefnH,),arg1)
end

function setsubtype(arg1::OGRFieldDefnH,arg2::OGRFieldSubType)
    ccall((:OGR_Fld_SetSubType,libgdal),Void,(OGRFieldDefnH,OGRFieldSubType),arg1,arg2)
end

function getjustify(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetJustify,libgdal),OGRJustification,(OGRFieldDefnH,),arg1)
end

function setjustify(arg1::OGRFieldDefnH,arg2::OGRJustification)
    ccall((:OGR_Fld_SetJustify,libgdal),Void,(OGRFieldDefnH,OGRJustification),arg1,arg2)
end

function getwidth(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetWidth,libgdal),Cint,(OGRFieldDefnH,),arg1)
end

function setwidth(arg1::OGRFieldDefnH,arg2::Integer)
    ccall((:OGR_Fld_SetWidth,libgdal),Void,(OGRFieldDefnH,Cint),arg1,arg2)
end

function getprecision(arg1::OGRFieldDefnH)
    ccall((:OGR_Fld_GetPrecision,libgdal),Cint,(OGRFieldDefnH,),arg1)
end

function setprecision(arg1::OGRFieldDefnH,arg2::Integer)
    ccall((:OGR_Fld_SetPrecision,libgdal),Void,(OGRFieldDefnH,Cint),arg1,arg2)
end

function set(arg1::OGRFieldDefnH,arg2::AbstractString,arg3::OGRFieldType,arg4::Integer,arg5::Integer,arg6::OGRJustification)
    ccall((:OGR_Fld_Set,libgdal),Void,(OGRFieldDefnH,Ptr{UInt8},OGRFieldType,Cint,Cint,OGRJustification),arg1,arg2,arg3,arg4,arg5,arg6)
end

function isignored(hDefn::OGRFieldDefnH)
    ccall((:OGR_Fld_IsIgnored,libgdal),Cint,(OGRFieldDefnH,),hDefn)
end

function setignored(hDefn::OGRFieldDefnH,arg1::Integer)
    ccall((:OGR_Fld_SetIgnored,libgdal),Void,(OGRFieldDefnH,Cint),hDefn,arg1)
end

function isnullable(hDefn::OGRFieldDefnH)
    ccall((:OGR_Fld_IsNullable,libgdal),Cint,(OGRFieldDefnH,),hDefn)
end

function setnullable(hDefn::OGRFieldDefnH,arg1::Integer)
    ccall((:OGR_Fld_SetNullable,libgdal),Void,(OGRFieldDefnH,Cint),hDefn,arg1)
end

function getdefault(hDefn::OGRFieldDefnH)
    bytestring(ccall((:OGR_Fld_GetDefault,libgdal),Ptr{UInt8},(OGRFieldDefnH,),hDefn))
end

function setdefault(hDefn::OGRFieldDefnH,arg1::AbstractString)
    ccall((:OGR_Fld_SetDefault,libgdal),Void,(OGRFieldDefnH,Ptr{UInt8}),hDefn,arg1)
end

function isdefaultdriverspecific(hDefn::OGRFieldDefnH)
    ccall((:OGR_Fld_IsDefaultDriverSpecific,libgdal),Cint,(OGRFieldDefnH,),hDefn)
end

function getfieldtypename(arg1::OGRFieldType)
    bytestring(ccall((:OGR_GetFieldTypeName,libgdal),Ptr{UInt8},(OGRFieldType,),arg1))
end

function getfieldsubtypename(arg1::OGRFieldSubType)
    bytestring(ccall((:OGR_GetFieldSubTypeName,libgdal),Ptr{UInt8},(OGRFieldSubType,),arg1))
end

function aretypesubtypecompatible(eType::OGRFieldType,eSubType::OGRFieldSubType)
    ccall((:OGR_AreTypeSubTypeCompatible,libgdal),Cint,(OGRFieldType,OGRFieldSubType),eType,eSubType)
end

function create(arg1::AbstractString,arg2::OGRwkbGeometryType)
    checknull(ccall((:OGR_GFld_Create,libgdal),OGRGeomFieldDefnH,(Ptr{UInt8},OGRwkbGeometryType),arg1,arg2))
end

function destroy(arg1::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_Destroy,libgdal),Void,(OGRGeomFieldDefnH,),arg1)
end

function setname(arg1::OGRGeomFieldDefnH,arg2::AbstractString)
    ccall((:OGR_GFld_SetName,libgdal),Void,(OGRGeomFieldDefnH,Ptr{UInt8}),arg1,arg2)
end

function getnameref(arg1::OGRGeomFieldDefnH)
    bytestring(ccall((:OGR_GFld_GetNameRef,libgdal),Ptr{UInt8},(OGRGeomFieldDefnH,),arg1))
end

function gettype(arg1::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_GetType,libgdal),OGRwkbGeometryType,(OGRGeomFieldDefnH,),arg1)
end

function settype(arg1::OGRGeomFieldDefnH,arg2::OGRwkbGeometryType)
    ccall((:OGR_GFld_SetType,libgdal),Void,(OGRGeomFieldDefnH,OGRwkbGeometryType),arg1,arg2)
end

function getspatialref(arg1::OGRGeomFieldDefnH)
    checknull(ccall((:OGR_GFld_GetSpatialRef,libgdal),OGRSpatialReferenceH,(OGRGeomFieldDefnH,),arg1))
end

function setspatialref(arg1::OGRGeomFieldDefnH,hSRS::OGRSpatialReferenceH)
    ccall((:OGR_GFld_SetSpatialRef,libgdal),Void,(OGRGeomFieldDefnH,OGRSpatialReferenceH),arg1,hSRS)
end

function isnullable(hDefn::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_IsNullable,libgdal),Cint,(OGRGeomFieldDefnH,),hDefn)
end

function setnullable(hDefn::OGRGeomFieldDefnH,arg1::Integer)
    ccall((:OGR_GFld_SetNullable,libgdal),Void,(OGRGeomFieldDefnH,Cint),hDefn,arg1)
end

function isignored(hDefn::OGRGeomFieldDefnH)
    ccall((:OGR_GFld_IsIgnored,libgdal),Cint,(OGRGeomFieldDefnH,),hDefn)
end

function setignored(hDefn::OGRGeomFieldDefnH,arg1::Integer)
    ccall((:OGR_GFld_SetIgnored,libgdal),Void,(OGRGeomFieldDefnH,Cint),hDefn,arg1)
end

function create(arg1::AbstractString)
    checknull(ccall((:OGR_FD_Create,libgdal),OGRFeatureDefnH,(Ptr{UInt8},),arg1))
end

function destroy(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_Destroy,libgdal),Void,(OGRFeatureDefnH,),arg1)
end

function release(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_Release,libgdal),Void,(OGRFeatureDefnH,),arg1)
end

function getname(arg1::OGRFeatureDefnH)
    bytestring(ccall((:OGR_FD_GetName,libgdal),Ptr{UInt8},(OGRFeatureDefnH,),arg1))
end

function getfieldcount(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_GetFieldCount,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function getfielddefn(arg1::OGRFeatureDefnH,arg2::Integer)
    checknull(ccall((:OGR_FD_GetFieldDefn,libgdal),OGRFieldDefnH,(OGRFeatureDefnH,Cint),arg1,arg2))
end

function getfieldindex(arg1::OGRFeatureDefnH,arg2::AbstractString)
    ccall((:OGR_FD_GetFieldIndex,libgdal),Cint,(OGRFeatureDefnH,Ptr{UInt8}),arg1,arg2)
end

function addfielddefn(arg1::OGRFeatureDefnH,arg2::OGRFieldDefnH)
    ccall((:OGR_FD_AddFieldDefn,libgdal),Void,(OGRFeatureDefnH,OGRFieldDefnH),arg1,arg2)
end

function deletefielddefn(hDefn::OGRFeatureDefnH,iField::Integer)
    ccall((:OGR_FD_DeleteFieldDefn,libgdal),OGRErr,(OGRFeatureDefnH,Cint),hDefn,iField)
end

function reorderfielddefns(hDefn::OGRFeatureDefnH,panMap::Vector{Cint})
    ccall((:OGR_FD_ReorderFieldDefns,libgdal),OGRErr,(OGRFeatureDefnH,Ptr{Cint}),hDefn,panMap)
end

function getgeomtype(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_GetGeomType,libgdal),OGRwkbGeometryType,(OGRFeatureDefnH,),arg1)
end

function setgeomtype(arg1::OGRFeatureDefnH,arg2::OGRwkbGeometryType)
    ccall((:OGR_FD_SetGeomType,libgdal),Void,(OGRFeatureDefnH,OGRwkbGeometryType),arg1,arg2)
end

function isgeometryignored(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_IsGeometryIgnored,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function setgeometryignored(arg1::OGRFeatureDefnH,arg2::Integer)
    ccall((:OGR_FD_SetGeometryIgnored,libgdal),Void,(OGRFeatureDefnH,Cint),arg1,arg2)
end

function isstyleignored(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_IsStyleIgnored,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function setstyleignored(arg1::OGRFeatureDefnH,arg2::Integer)
    ccall((:OGR_FD_SetStyleIgnored,libgdal),Void,(OGRFeatureDefnH,Cint),arg1,arg2)
end

function reference(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_Reference,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function dereference(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_Dereference,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function getreferencecount(arg1::OGRFeatureDefnH)
    ccall((:OGR_FD_GetReferenceCount,libgdal),Cint,(OGRFeatureDefnH,),arg1)
end

function getgeomfieldcount(hFDefn::OGRFeatureDefnH)
    ccall((:OGR_FD_GetGeomFieldCount,libgdal),Cint,(OGRFeatureDefnH,),hFDefn)
end

function getgeomfielddefn(hFDefn::OGRFeatureDefnH,i::Integer)
    checknull(ccall((:OGR_FD_GetGeomFieldDefn,libgdal),OGRGeomFieldDefnH,(OGRFeatureDefnH,Cint),hFDefn,i))
end

function getgeomfieldindex(hFDefn::OGRFeatureDefnH,pszName::AbstractString)
    ccall((:OGR_FD_GetGeomFieldIndex,libgdal),Cint,(OGRFeatureDefnH,Ptr{UInt8}),hFDefn,pszName)
end

function addgeomfielddefn(hFDefn::OGRFeatureDefnH,hGFldDefn::OGRGeomFieldDefnH)
    ccall((:OGR_FD_AddGeomFieldDefn,libgdal),Void,(OGRFeatureDefnH,OGRGeomFieldDefnH),hFDefn,hGFldDefn)
end

function deletegeomfielddefn(hFDefn::OGRFeatureDefnH,iGeomField::Integer)
    ccall((:OGR_FD_DeleteGeomFieldDefn,libgdal),OGRErr,(OGRFeatureDefnH,Cint),hFDefn,iGeomField)
end

function issame(hFDefn::OGRFeatureDefnH,hOtherFDefn::OGRFeatureDefnH)
    ccall((:OGR_FD_IsSame,libgdal),Cint,(OGRFeatureDefnH,OGRFeatureDefnH),hFDefn,hOtherFDefn)
end

function create(arg1::OGRFeatureDefnH)
    checknull(ccall((:OGR_F_Create,libgdal),OGRFeatureH,(OGRFeatureDefnH,),arg1))
end

function destroy(arg1::OGRFeatureH)
    ccall((:OGR_F_Destroy,libgdal),Void,(OGRFeatureH,),arg1)
end

function getdefnref(arg1::OGRFeatureH)
    checknull(ccall((:OGR_F_GetDefnRef,libgdal),OGRFeatureDefnH,(OGRFeatureH,),arg1))
end

function setgeometrydirectly(arg1::OGRFeatureH,arg2::OGRGeometryH)
    ccall((:OGR_F_SetGeometryDirectly,libgdal),OGRErr,(OGRFeatureH,OGRGeometryH),arg1,arg2)
end

function setgeometry(arg1::OGRFeatureH,arg2::OGRGeometryH)
    ccall((:OGR_F_SetGeometry,libgdal),OGRErr,(OGRFeatureH,OGRGeometryH),arg1,arg2)
end

function getgeometryref(arg1::OGRFeatureH)
    checknull(ccall((:OGR_F_GetGeometryRef,libgdal),OGRGeometryH,(OGRFeatureH,),arg1))
end

function stealgeometry(arg1::OGRFeatureH)
    checknull(ccall((:OGR_F_StealGeometry,libgdal),OGRGeometryH,(OGRFeatureH,),arg1))
end

function clone(arg1::OGRFeatureH)
    checknull(ccall((:OGR_F_Clone,libgdal),OGRFeatureH,(OGRFeatureH,),arg1))
end

function equal(arg1::OGRFeatureH,arg2::OGRFeatureH)
    ccall((:OGR_F_Equal,libgdal),Cint,(OGRFeatureH,OGRFeatureH),arg1,arg2)
end

function getfieldcount(arg1::OGRFeatureH)
    ccall((:OGR_F_GetFieldCount,libgdal),Cint,(OGRFeatureH,),arg1)
end

function getfielddefnref(arg1::OGRFeatureH,arg2::Integer)
    checknull(ccall((:OGR_F_GetFieldDefnRef,libgdal),OGRFieldDefnH,(OGRFeatureH,Cint),arg1,arg2))
end

function getfieldindex(arg1::OGRFeatureH,arg2::AbstractString)
    ccall((:OGR_F_GetFieldIndex,libgdal),Cint,(OGRFeatureH,Ptr{UInt8}),arg1,arg2)
end

function isfieldset(arg1::OGRFeatureH,arg2::Integer)
    ccall((:OGR_F_IsFieldSet,libgdal),Cint,(OGRFeatureH,Cint),arg1,arg2)
end

function unsetfield(arg1::OGRFeatureH,arg2::Integer)
    ccall((:OGR_F_UnsetField,libgdal),Void,(OGRFeatureH,Cint),arg1,arg2)
end

function getrawfieldref(arg1::OGRFeatureH,arg2::Integer)
    ccall((:OGR_F_GetRawFieldRef,libgdal),Ptr{OGRField},(OGRFeatureH,Cint),arg1,arg2)
end

function getfieldasinteger(arg1::OGRFeatureH,arg2::Integer)
    ccall((:OGR_F_GetFieldAsInteger,libgdal),Cint,(OGRFeatureH,Cint),arg1,arg2)
end

function getfieldasinteger64(arg1::OGRFeatureH,arg2::Integer)
    ccall((:OGR_F_GetFieldAsInteger64,libgdal),GIntBig,(OGRFeatureH,Cint),arg1,arg2)
end

function getfieldasdouble(arg1::OGRFeatureH,arg2::Integer)
    ccall((:OGR_F_GetFieldAsDouble,libgdal),Cdouble,(OGRFeatureH,Cint),arg1,arg2)
end

function getfieldasstring(arg1::OGRFeatureH,arg2::Integer)
    bytestring(ccall((:OGR_F_GetFieldAsString,libgdal),Ptr{UInt8},(OGRFeatureH,Cint),arg1,arg2))
end

function getfieldasintegerlist(arg1::OGRFeatureH,arg2::Integer,arg3::Vector{Cint})
    ccall((:OGR_F_GetFieldAsIntegerList,libgdal),Ptr{Cint},(OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3)
end

function getfieldasinteger64list(arg1::OGRFeatureH,arg2::Integer,arg3::Vector{Cint})
    ccall((:OGR_F_GetFieldAsInteger64List,libgdal),Ptr{GIntBig},(OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3)
end

function getfieldasdoublelist(arg1::OGRFeatureH,arg2::Integer,arg3::Vector{Cint})
    ccall((:OGR_F_GetFieldAsDoubleList,libgdal),Ptr{Cdouble},(OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3)
end

function getfieldasstringlist(arg1::OGRFeatureH,arg2::Integer)
    bytestring(unsafe_load(ccall((:OGR_F_GetFieldAsStringList,libgdal),Ptr{Ptr{UInt8}},(OGRFeatureH,Cint),arg1,arg2)))
end

function getfieldasbinary(arg1::OGRFeatureH,arg2::Integer,arg3::Vector{Cint})
    ccall((:OGR_F_GetFieldAsBinary,libgdal),Ptr{GByte},(OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3)
end

function getfieldasdatetime(arg1::OGRFeatureH,arg2::Integer,arg3::Vector{Cint},arg4::Vector{Cint},arg5::Vector{Cint},arg6::Vector{Cint},arg7::Vector{Cint},arg8::Vector{Cint},arg9::Vector{Cint})
    ccall((:OGR_F_GetFieldAsDateTime,libgdal),Cint,(OGRFeatureH,Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
end

function getfieldasdatetimeex(hFeat::OGRFeatureH,iField::Integer,pnYear::Vector{Cint},pnMonth::Vector{Cint},pnDay::Vector{Cint},pnHour::Vector{Cint},pnMinute::Vector{Cint},pfSecond::Ptr{Cfloat},pnTZFlag::Vector{Cint})
    ccall((:OGR_F_GetFieldAsDateTimeEx,libgdal),Cint,(OGRFeatureH,Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cfloat},Ptr{Cint}),hFeat,iField,pnYear,pnMonth,pnDay,pnHour,pnMinute,pfSecond,pnTZFlag)
end

function setfieldinteger(arg1::OGRFeatureH,arg2::Integer,arg3::Integer)
    ccall((:OGR_F_SetFieldInteger,libgdal),Void,(OGRFeatureH,Cint,Cint),arg1,arg2,arg3)
end

function setfieldinteger64(arg1::OGRFeatureH,arg2::Integer,arg3::GIntBig)
    ccall((:OGR_F_SetFieldInteger64,libgdal),Void,(OGRFeatureH,Cint,GIntBig),arg1,arg2,arg3)
end

function setfielddouble(arg1::OGRFeatureH,arg2::Integer,arg3::Real)
    ccall((:OGR_F_SetFieldDouble,libgdal),Void,(OGRFeatureH,Cint,Cdouble),arg1,arg2,arg3)
end

function setfieldstring(arg1::OGRFeatureH,arg2::Integer,arg3::AbstractString)
    ccall((:OGR_F_SetFieldString,libgdal),Void,(OGRFeatureH,Cint,Ptr{UInt8}),arg1,arg2,arg3)
end

function setfieldintegerlist(arg1::OGRFeatureH,arg2::Integer,arg3::Integer,arg4::Vector{Cint})
    ccall((:OGR_F_SetFieldIntegerList,libgdal),Void,(OGRFeatureH,Cint,Cint,Ptr{Cint}),arg1,arg2,arg3,arg4)
end

function setfieldinteger64list(arg1::OGRFeatureH,arg2::Integer,arg3::Integer,arg4::Ptr{GIntBig})
    ccall((:OGR_F_SetFieldInteger64List,libgdal),Void,(OGRFeatureH,Cint,Cint,Ptr{GIntBig}),arg1,arg2,arg3,arg4)
end

function setfielddoublelist(arg1::OGRFeatureH,arg2::Integer,arg3::Integer,arg4::Vector{Float64})
    ccall((:OGR_F_SetFieldDoubleList,libgdal),Void,(OGRFeatureH,Cint,Cint,Ptr{Cdouble}),arg1,arg2,arg3,arg4)
end

function setfieldstringlist(arg1::OGRFeatureH,arg2::Integer,arg3::Vector{UTF8String})
    ccall((:OGR_F_SetFieldStringList,libgdal),Void,(OGRFeatureH,Cint,Ptr{Ptr{UInt8}}),arg1,arg2,arg3)
end

function setfieldraw(arg1::OGRFeatureH,arg2::Integer,arg3::Ptr{OGRField})
    ccall((:OGR_F_SetFieldRaw,libgdal),Void,(OGRFeatureH,Cint,Ptr{OGRField}),arg1,arg2,arg3)
end

function setfieldbinary(arg1::OGRFeatureH,arg2::Integer,arg3::Integer,arg4::Ptr{GByte})
    ccall((:OGR_F_SetFieldBinary,libgdal),Void,(OGRFeatureH,Cint,Cint,Ptr{GByte}),arg1,arg2,arg3,arg4)
end

function setfielddatetime(arg1::OGRFeatureH,arg2::Integer,arg3::Integer,arg4::Integer,arg5::Integer,arg6::Integer,arg7::Integer,arg8::Integer,arg9::Integer)
    ccall((:OGR_F_SetFieldDateTime,libgdal),Void,(OGRFeatureH,Cint,Cint,Cint,Cint,Cint,Cint,Cint,Cint),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
end

function setfielddatetimeex(arg1::OGRFeatureH,arg2::Integer,arg3::Integer,arg4::Integer,arg5::Integer,arg6::Integer,arg7::Integer,arg8::Cfloat,arg9::Integer)
    ccall((:OGR_F_SetFieldDateTimeEx,libgdal),Void,(OGRFeatureH,Cint,Cint,Cint,Cint,Cint,Cint,Cfloat,Cint),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
end

function getgeomfieldcount(hFeat::OGRFeatureH)
    ccall((:OGR_F_GetGeomFieldCount,libgdal),Cint,(OGRFeatureH,),hFeat)
end

function getgeomfielddefnref(hFeat::OGRFeatureH,iField::Integer)
    checknull(ccall((:OGR_F_GetGeomFieldDefnRef,libgdal),OGRGeomFieldDefnH,(OGRFeatureH,Cint),hFeat,iField))
end

function getgeomfieldindex(hFeat::OGRFeatureH,pszName::AbstractString)
    ccall((:OGR_F_GetGeomFieldIndex,libgdal),Cint,(OGRFeatureH,Ptr{UInt8}),hFeat,pszName)
end

function getgeomfieldref(hFeat::OGRFeatureH,iField::Integer)
    checknull(ccall((:OGR_F_GetGeomFieldRef,libgdal),OGRGeometryH,(OGRFeatureH,Cint),hFeat,iField))
end

function setgeomfielddirectly(hFeat::OGRFeatureH,iField::Integer,hGeom::OGRGeometryH)
    ccall((:OGR_F_SetGeomFieldDirectly,libgdal),OGRErr,(OGRFeatureH,Cint,OGRGeometryH),hFeat,iField,hGeom)
end

function setgeomfield(hFeat::OGRFeatureH,iField::Integer,hGeom::OGRGeometryH)
    ccall((:OGR_F_SetGeomField,libgdal),OGRErr,(OGRFeatureH,Cint,OGRGeometryH),hFeat,iField,hGeom)
end

function getfid(arg1::OGRFeatureH)
    ccall((:OGR_F_GetFID,libgdal),GIntBig,(OGRFeatureH,),arg1)
end

function setfid(arg1::OGRFeatureH,arg2::GIntBig)
    ccall((:OGR_F_SetFID,libgdal),OGRErr,(OGRFeatureH,GIntBig),arg1,arg2)
end

function dumpreadable(arg1::OGRFeatureH,arg2::Ptr{FILE})
    ccall((:OGR_F_DumpReadable,libgdal),Void,(OGRFeatureH,Ptr{FILE}),arg1,arg2)
end

function setfrom(arg1::OGRFeatureH,arg2::OGRFeatureH,arg3::Integer)
    ccall((:OGR_F_SetFrom,libgdal),OGRErr,(OGRFeatureH,OGRFeatureH,Cint),arg1,arg2,arg3)
end

function setfromwithmap(arg1::OGRFeatureH,arg2::OGRFeatureH,arg3::Integer,arg4::Vector{Cint})
    ccall((:OGR_F_SetFromWithMap,libgdal),OGRErr,(OGRFeatureH,OGRFeatureH,Cint,Ptr{Cint}),arg1,arg2,arg3,arg4)
end

function getstylestring(arg1::OGRFeatureH)
    bytestring(ccall((:OGR_F_GetStyleString,libgdal),Ptr{UInt8},(OGRFeatureH,),arg1))
end

function setstylestring(arg1::OGRFeatureH,arg2::AbstractString)
    ccall((:OGR_F_SetStyleString,libgdal),Void,(OGRFeatureH,Ptr{UInt8}),arg1,arg2)
end

function setstylestringdirectly(arg1::OGRFeatureH,arg2::AbstractString)
    ccall((:OGR_F_SetStyleStringDirectly,libgdal),Void,(OGRFeatureH,Ptr{UInt8}),arg1,arg2)
end

function getstyletable(arg1::OGRFeatureH)
    checknull(ccall((:OGR_F_GetStyleTable,libgdal),OGRStyleTableH,(OGRFeatureH,),arg1))
end

function setstyletabledirectly(arg1::OGRFeatureH,arg2::OGRStyleTableH)
    ccall((:OGR_F_SetStyleTableDirectly,libgdal),Void,(OGRFeatureH,OGRStyleTableH),arg1,arg2)
end

function setstyletable(arg1::OGRFeatureH,arg2::OGRStyleTableH)
    ccall((:OGR_F_SetStyleTable,libgdal),Void,(OGRFeatureH,OGRStyleTableH),arg1,arg2)
end

function fillunsetwithdefault(hFeat::OGRFeatureH,bNotNullableOnly::Integer,papszOptions::Vector{UTF8String})
    ccall((:OGR_F_FillUnsetWithDefault,libgdal),Void,(OGRFeatureH,Cint,Ptr{Ptr{UInt8}}),hFeat,bNotNullableOnly,papszOptions)
end

function validate(arg1::OGRFeatureH,nValidateFlags::Integer,bEmitError::Integer)
    ccall((:OGR_F_Validate,libgdal),Cint,(OGRFeatureH,Cint,Cint),arg1,nValidateFlags,bEmitError)
end

function getname(arg1::OGRLayerH)
    bytestring(ccall((:OGR_L_GetName,libgdal),Ptr{UInt8},(OGRLayerH,),arg1))
end

function getgeomtype(arg1::OGRLayerH)
    ccall((:OGR_L_GetGeomType,libgdal),OGRwkbGeometryType,(OGRLayerH,),arg1)
end

function getspatialfilter(arg1::OGRLayerH)
    checknull(ccall((:OGR_L_GetSpatialFilter,libgdal),OGRGeometryH,(OGRLayerH,),arg1))
end

function setspatialfilter(arg1::OGRLayerH,arg2::OGRGeometryH)
    ccall((:OGR_L_SetSpatialFilter,libgdal),Void,(OGRLayerH,OGRGeometryH),arg1,arg2)
end

function setspatialfilterrect(arg1::OGRLayerH,arg2::Real,arg3::Real,arg4::Real,arg5::Real)
    ccall((:OGR_L_SetSpatialFilterRect,libgdal),Void,(OGRLayerH,Cdouble,Cdouble,Cdouble,Cdouble),arg1,arg2,arg3,arg4,arg5)
end

function setspatialfilterex(arg1::OGRLayerH,iGeomField::Integer,hGeom::OGRGeometryH)
    ccall((:OGR_L_SetSpatialFilterEx,libgdal),Void,(OGRLayerH,Cint,OGRGeometryH),arg1,iGeomField,hGeom)
end

function setspatialfilterrectex(arg1::OGRLayerH,iGeomField::Integer,dfMinX::Real,dfMinY::Real,dfMaxX::Real,dfMaxY::Real)
    ccall((:OGR_L_SetSpatialFilterRectEx,libgdal),Void,(OGRLayerH,Cint,Cdouble,Cdouble,Cdouble,Cdouble),arg1,iGeomField,dfMinX,dfMinY,dfMaxX,dfMaxY)
end

function setattributefilter(arg1::OGRLayerH,arg2::AbstractString)
    ccall((:OGR_L_SetAttributeFilter,libgdal),OGRErr,(OGRLayerH,Ptr{UInt8}),arg1,arg2)
end

function resetreading(arg1::OGRLayerH)
    ccall((:OGR_L_ResetReading,libgdal),Void,(OGRLayerH,),arg1)
end

function getnextfeature(arg1::OGRLayerH)
    checknull(ccall((:OGR_L_GetNextFeature,libgdal),OGRFeatureH,(OGRLayerH,),arg1))
end

function setnextbyindex(arg1::OGRLayerH,arg2::GIntBig)
    ccall((:OGR_L_SetNextByIndex,libgdal),OGRErr,(OGRLayerH,GIntBig),arg1,arg2)
end

function getfeature(arg1::OGRLayerH,arg2::GIntBig)
    checknull(ccall((:OGR_L_GetFeature,libgdal),OGRFeatureH,(OGRLayerH,GIntBig),arg1,arg2))
end

function setfeature(arg1::OGRLayerH,arg2::OGRFeatureH)
    ccall((:OGR_L_SetFeature,libgdal),OGRErr,(OGRLayerH,OGRFeatureH),arg1,arg2)
end

function createfeature(arg1::OGRLayerH,arg2::OGRFeatureH)
    ccall((:OGR_L_CreateFeature,libgdal),OGRErr,(OGRLayerH,OGRFeatureH),arg1,arg2)
end

function deletefeature(arg1::OGRLayerH,arg2::GIntBig)
    ccall((:OGR_L_DeleteFeature,libgdal),OGRErr,(OGRLayerH,GIntBig),arg1,arg2)
end

function getlayerdefn(arg1::OGRLayerH)
    checknull(ccall((:OGR_L_GetLayerDefn,libgdal),OGRFeatureDefnH,(OGRLayerH,),arg1))
end

function getspatialref(arg1::OGRLayerH)
    checknull(ccall((:OGR_L_GetSpatialRef,libgdal),OGRSpatialReferenceH,(OGRLayerH,),arg1))
end

function findfieldindex(arg1::OGRLayerH,arg2::AbstractString,bExactMatch::Integer)
    ccall((:OGR_L_FindFieldIndex,libgdal),Cint,(OGRLayerH,Ptr{UInt8},Cint),arg1,arg2,bExactMatch)
end

function getfeaturecount(arg1::OGRLayerH,arg2::Integer)
    ccall((:OGR_L_GetFeatureCount,libgdal),GIntBig,(OGRLayerH,Cint),arg1,arg2)
end

function getextent(arg1::OGRLayerH,arg2::Ptr{OGREnvelope},arg3::Integer)
    ccall((:OGR_L_GetExtent,libgdal),OGRErr,(OGRLayerH,Ptr{OGREnvelope},Cint),arg1,arg2,arg3)
end

function getextentex(arg1::OGRLayerH,iGeomField::Integer,psExtent::Ptr{OGREnvelope},bForce::Integer)
    ccall((:OGR_L_GetExtentEx,libgdal),OGRErr,(OGRLayerH,Cint,Ptr{OGREnvelope},Cint),arg1,iGeomField,psExtent,bForce)
end

function testcapability(arg1::OGRLayerH,arg2::AbstractString)
    ccall((:OGR_L_TestCapability,libgdal),Cint,(OGRLayerH,Ptr{UInt8}),arg1,arg2)
end

function createfield(arg1::OGRLayerH,arg2::OGRFieldDefnH,arg3::Integer)
    ccall((:OGR_L_CreateField,libgdal),OGRErr,(OGRLayerH,OGRFieldDefnH,Cint),arg1,arg2,arg3)
end

function creategeomfield(hLayer::OGRLayerH,hFieldDefn::OGRGeomFieldDefnH,bForce::Integer)
    ccall((:OGR_L_CreateGeomField,libgdal),OGRErr,(OGRLayerH,OGRGeomFieldDefnH,Cint),hLayer,hFieldDefn,bForce)
end

function deletefield(arg1::OGRLayerH,iField::Integer)
    ccall((:OGR_L_DeleteField,libgdal),OGRErr,(OGRLayerH,Cint),arg1,iField)
end

function reorderfields(arg1::OGRLayerH,panMap::Vector{Cint})
    ccall((:OGR_L_ReorderFields,libgdal),OGRErr,(OGRLayerH,Ptr{Cint}),arg1,panMap)
end

function reorderfield(arg1::OGRLayerH,iOldFieldPos::Integer,iNewFieldPos::Integer)
    ccall((:OGR_L_ReorderField,libgdal),OGRErr,(OGRLayerH,Cint,Cint),arg1,iOldFieldPos,iNewFieldPos)
end

function alterfielddefn(arg1::OGRLayerH,iField::Integer,hNewFieldDefn::OGRFieldDefnH,nFlags::Integer)
    ccall((:OGR_L_AlterFieldDefn,libgdal),OGRErr,(OGRLayerH,Cint,OGRFieldDefnH,Cint),arg1,iField,hNewFieldDefn,nFlags)
end

function starttransaction(arg1::OGRLayerH)
    ccall((:OGR_L_StartTransaction,libgdal),OGRErr,(OGRLayerH,),arg1)
end

function committransaction(arg1::OGRLayerH)
    ccall((:OGR_L_CommitTransaction,libgdal),OGRErr,(OGRLayerH,),arg1)
end

function rollbacktransaction(arg1::OGRLayerH)
    ccall((:OGR_L_RollbackTransaction,libgdal),OGRErr,(OGRLayerH,),arg1)
end

function reference(arg1::OGRLayerH)
    ccall((:OGR_L_Reference,libgdal),Cint,(OGRLayerH,),arg1)
end

function dereference(arg1::OGRLayerH)
    ccall((:OGR_L_Dereference,libgdal),Cint,(OGRLayerH,),arg1)
end

function getrefcount(arg1::OGRLayerH)
    ccall((:OGR_L_GetRefCount,libgdal),Cint,(OGRLayerH,),arg1)
end

function synctodisk(arg1::OGRLayerH)
    ccall((:OGR_L_SyncToDisk,libgdal),OGRErr,(OGRLayerH,),arg1)
end

function getfeaturesread(arg1::OGRLayerH)
    ccall((:OGR_L_GetFeaturesRead,libgdal),GIntBig,(OGRLayerH,),arg1)
end

function getfidcolumn(arg1::OGRLayerH)
    bytestring(ccall((:OGR_L_GetFIDColumn,libgdal),Ptr{UInt8},(OGRLayerH,),arg1))
end

function getgeometrycolumn(arg1::OGRLayerH)
    bytestring(ccall((:OGR_L_GetGeometryColumn,libgdal),Ptr{UInt8},(OGRLayerH,),arg1))
end

function getstyletable(arg1::OGRLayerH)
    checknull(ccall((:OGR_L_GetStyleTable,libgdal),OGRStyleTableH,(OGRLayerH,),arg1))
end

function setstyletabledirectly(arg1::OGRLayerH,arg2::OGRStyleTableH)
    ccall((:OGR_L_SetStyleTableDirectly,libgdal),Void,(OGRLayerH,OGRStyleTableH),arg1,arg2)
end

function setstyletable(arg1::OGRLayerH,arg2::OGRStyleTableH)
    ccall((:OGR_L_SetStyleTable,libgdal),Void,(OGRLayerH,OGRStyleTableH),arg1,arg2)
end

function setignoredfields(arg1::OGRLayerH,arg2::Vector{UTF8String})
    ccall((:OGR_L_SetIgnoredFields,libgdal),OGRErr,(OGRLayerH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function intersection(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Vector{UTF8String},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Intersection,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function union(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Vector{UTF8String},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Union,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function symdifference(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Vector{UTF8String},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_SymDifference,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function identity(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Vector{UTF8String},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Identity,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function update(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Vector{UTF8String},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Update,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function clip(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Vector{UTF8String},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Clip,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function erase(arg1::OGRLayerH,arg2::OGRLayerH,arg3::OGRLayerH,arg4::Vector{UTF8String},arg5::GDALProgressFunc,arg6::Ptr{Void})
    ccall((:OGR_L_Erase,libgdal),OGRErr,(OGRLayerH,OGRLayerH,OGRLayerH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function destroy(arg1::OGRDataSourceH)
    ccall((:OGR_DS_Destroy,libgdal),Void,(OGRDataSourceH,),arg1)
end

function getname(arg1::OGRDataSourceH)
    bytestring(ccall((:OGR_DS_GetName,libgdal),Ptr{UInt8},(OGRDataSourceH,),arg1))
end

function getlayercount(arg1::OGRDataSourceH)
    ccall((:OGR_DS_GetLayerCount,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function getlayer(arg1::OGRDataSourceH,arg2::Integer)
    checknull(ccall((:OGR_DS_GetLayer,libgdal),OGRLayerH,(OGRDataSourceH,Cint),arg1,arg2))
end

function getlayerbyname(arg1::OGRDataSourceH,arg2::AbstractString)
    checknull(ccall((:OGR_DS_GetLayerByName,libgdal),OGRLayerH,(OGRDataSourceH,Ptr{UInt8}),arg1,arg2))
end

function deletelayer(arg1::OGRDataSourceH,arg2::Integer)
    ccall((:OGR_DS_DeleteLayer,libgdal),OGRErr,(OGRDataSourceH,Cint),arg1,arg2)
end

function getdriver(arg1::OGRDataSourceH)
    checknull(ccall((:OGR_DS_GetDriver,libgdal),OGRSFDriverH,(OGRDataSourceH,),arg1))
end

function createlayer(arg1::OGRDataSourceH,arg2::AbstractString,arg3::OGRSpatialReferenceH,arg4::OGRwkbGeometryType,arg5::Vector{UTF8String})
    checknull(ccall((:OGR_DS_CreateLayer,libgdal),OGRLayerH,(OGRDataSourceH,Ptr{UInt8},OGRSpatialReferenceH,OGRwkbGeometryType,Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4,arg5))
end

function copylayer(arg1::OGRDataSourceH,arg2::OGRLayerH,arg3::AbstractString,arg4::Vector{UTF8String})
    checknull(ccall((:OGR_DS_CopyLayer,libgdal),OGRLayerH,(OGRDataSourceH,OGRLayerH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4))
end

function testcapability(arg1::OGRDataSourceH,arg2::AbstractString)
    ccall((:OGR_DS_TestCapability,libgdal),Cint,(OGRDataSourceH,Ptr{UInt8}),arg1,arg2)
end

function executesql(arg1::OGRDataSourceH,arg2::AbstractString,arg3::OGRGeometryH,arg4::AbstractString)
    checknull(ccall((:OGR_DS_ExecuteSQL,libgdal),OGRLayerH,(OGRDataSourceH,Ptr{UInt8},OGRGeometryH,Ptr{UInt8}),arg1,arg2,arg3,arg4))
end

function releaseresultset(arg1::OGRDataSourceH,arg2::OGRLayerH)
    ccall((:OGR_DS_ReleaseResultSet,libgdal),Void,(OGRDataSourceH,OGRLayerH),arg1,arg2)
end

function reference(arg1::OGRDataSourceH)
    ccall((:OGR_DS_Reference,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function dereference(arg1::OGRDataSourceH)
    ccall((:OGR_DS_Dereference,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function getrefcount(arg1::OGRDataSourceH)
    ccall((:OGR_DS_GetRefCount,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function getsummaryrefcount(arg1::OGRDataSourceH)
    ccall((:OGR_DS_GetSummaryRefCount,libgdal),Cint,(OGRDataSourceH,),arg1)
end

function synctodisk(arg1::OGRDataSourceH)
    ccall((:OGR_DS_SyncToDisk,libgdal),OGRErr,(OGRDataSourceH,),arg1)
end

function getstyletable(arg1::OGRDataSourceH)
    checknull(ccall((:OGR_DS_GetStyleTable,libgdal),OGRStyleTableH,(OGRDataSourceH,),arg1))
end

function setstyletabledirectly(arg1::OGRDataSourceH,arg2::OGRStyleTableH)
    ccall((:OGR_DS_SetStyleTableDirectly,libgdal),Void,(OGRDataSourceH,OGRStyleTableH),arg1,arg2)
end

function setstyletable(arg1::OGRDataSourceH,arg2::OGRStyleTableH)
    ccall((:OGR_DS_SetStyleTable,libgdal),Void,(OGRDataSourceH,OGRStyleTableH),arg1,arg2)
end

function getname(arg1::OGRSFDriverH)
    bytestring(ccall((:OGR_Dr_GetName,libgdal),Ptr{UInt8},(OGRSFDriverH,),arg1))
end

function open(arg1::OGRSFDriverH,arg2::AbstractString,arg3::Integer)
    checknull(ccall((:OGR_Dr_Open,libgdal),OGRDataSourceH,(OGRSFDriverH,Ptr{UInt8},Cint),arg1,arg2,arg3))
end

function testcapability(arg1::OGRSFDriverH,arg2::AbstractString)
    ccall((:OGR_Dr_TestCapability,libgdal),Cint,(OGRSFDriverH,Ptr{UInt8}),arg1,arg2)
end

function createdatasource(arg1::OGRSFDriverH,arg2::AbstractString,arg3::Vector{UTF8String})
    checknull(ccall((:OGR_Dr_CreateDataSource,libgdal),OGRDataSourceH,(OGRSFDriverH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3))
end

function copydatasource(arg1::OGRSFDriverH,arg2::OGRDataSourceH,arg3::AbstractString,arg4::Vector{UTF8String})
    checknull(ccall((:OGR_Dr_CopyDataSource,libgdal),OGRDataSourceH,(OGRSFDriverH,OGRDataSourceH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3,arg4))
end

function deletedatasource(arg1::OGRSFDriverH,arg2::AbstractString)
    ccall((:OGR_Dr_DeleteDataSource,libgdal),OGRErr,(OGRSFDriverH,Ptr{UInt8}),arg1,arg2)
end

function open(arg1::AbstractString,arg2::Integer,arg3::Ptr{OGRSFDriverH})
    checknull(ccall((:OGROpen,libgdal),OGRDataSourceH,(Ptr{UInt8},Cint,Ptr{OGRSFDriverH}),arg1,arg2,arg3))
end

function openshared(arg1::AbstractString,arg2::Integer,arg3::Ptr{OGRSFDriverH})
    checknull(ccall((:OGROpenShared,libgdal),OGRDataSourceH,(Ptr{UInt8},Cint,Ptr{OGRSFDriverH}),arg1,arg2,arg3))
end

function releasedatasource(arg1::OGRDataSourceH)
    ccall((:OGRReleaseDataSource,libgdal),OGRErr,(OGRDataSourceH,),arg1)
end

function registerdriver(arg1::OGRSFDriverH)
    ccall((:OGRRegisterDriver,libgdal),Void,(OGRSFDriverH,),arg1)
end

function deregisterdriver(arg1::OGRSFDriverH)
    ccall((:OGRDeregisterDriver,libgdal),Void,(OGRSFDriverH,),arg1)
end

function getdrivercount()
    ccall((:OGRGetDriverCount,libgdal),Cint,())
end

function getdriver(arg1::Integer)
    checknull(ccall((:OGRGetDriver,libgdal),OGRSFDriverH,(Cint,),arg1))
end

function getdriverbyname(arg1::AbstractString)
    checknull(ccall((:OGRGetDriverByName,libgdal),OGRSFDriverH,(Ptr{UInt8},),arg1))
end

function getopendscount()
    ccall((:OGRGetOpenDSCount,libgdal),Cint,())
end

function getopends(iDS::Integer)
    checknull(ccall((:OGRGetOpenDS,libgdal),OGRDataSourceH,(Cint,),iDS))
end

function registerall()
    ccall((:OGRRegisterAll,libgdal),Void,())
end

function cleanupall()
    ccall((:OGRCleanupAll,libgdal),Void,())
end

function create(hStyleTable::OGRStyleTableH)
    checknull(ccall((:OGR_SM_Create,libgdal),OGRStyleMgrH,(OGRStyleTableH,),hStyleTable))
end

function destroy(hSM::OGRStyleMgrH)
    ccall((:OGR_SM_Destroy,libgdal),Void,(OGRStyleMgrH,),hSM)
end

function initfromfeature(hSM::OGRStyleMgrH,hFeat::OGRFeatureH)
    bytestring(ccall((:OGR_SM_InitFromFeature,libgdal),Ptr{UInt8},(OGRStyleMgrH,OGRFeatureH),hSM,hFeat))
end

function initstylestring(hSM::OGRStyleMgrH,pszStyleString::AbstractString)
    ccall((:OGR_SM_InitStyleString,libgdal),Cint,(OGRStyleMgrH,Ptr{UInt8}),hSM,pszStyleString)
end

function getpartcount(hSM::OGRStyleMgrH,pszStyleString::AbstractString)
    ccall((:OGR_SM_GetPartCount,libgdal),Cint,(OGRStyleMgrH,Ptr{UInt8}),hSM,pszStyleString)
end

function getpart(hSM::OGRStyleMgrH,nPartId::Integer,pszStyleString::AbstractString)
    checknull(ccall((:OGR_SM_GetPart,libgdal),OGRStyleToolH,(OGRStyleMgrH,Cint,Ptr{UInt8}),hSM,nPartId,pszStyleString))
end

function addpart(hSM::OGRStyleMgrH,hST::OGRStyleToolH)
    ccall((:OGR_SM_AddPart,libgdal),Cint,(OGRStyleMgrH,OGRStyleToolH),hSM,hST)
end

function addstyle(hSM::OGRStyleMgrH,pszStyleName::AbstractString,pszStyleString::AbstractString)
    ccall((:OGR_SM_AddStyle,libgdal),Cint,(OGRStyleMgrH,Ptr{UInt8},Ptr{UInt8}),hSM,pszStyleName,pszStyleString)
end

function create(eClassId::OGRSTClassId)
    checknull(ccall((:OGR_ST_Create,libgdal),OGRStyleToolH,(OGRSTClassId,),eClassId))
end

function destroy(hST::OGRStyleToolH)
    ccall((:OGR_ST_Destroy,libgdal),Void,(OGRStyleToolH,),hST)
end

function gettype(hST::OGRStyleToolH)
    ccall((:OGR_ST_GetType,libgdal),OGRSTClassId,(OGRStyleToolH,),hST)
end

function getunit(hST::OGRStyleToolH)
    ccall((:OGR_ST_GetUnit,libgdal),OGRSTUnitId,(OGRStyleToolH,),hST)
end

function setunit(hST::OGRStyleToolH,eUnit::OGRSTUnitId,dfGroundPaperScale::Real)
    ccall((:OGR_ST_SetUnit,libgdal),Void,(OGRStyleToolH,OGRSTUnitId,Cdouble),hST,eUnit,dfGroundPaperScale)
end

function getparamstr(hST::OGRStyleToolH,eParam::Integer,bValueIsNull::Vector{Cint})
    bytestring(ccall((:OGR_ST_GetParamStr,libgdal),Ptr{UInt8},(OGRStyleToolH,Cint,Ptr{Cint}),hST,eParam,bValueIsNull))
end

function getparamnum(hST::OGRStyleToolH,eParam::Integer,bValueIsNull::Vector{Cint})
    ccall((:OGR_ST_GetParamNum,libgdal),Cint,(OGRStyleToolH,Cint,Ptr{Cint}),hST,eParam,bValueIsNull)
end

function getparamdbl(hST::OGRStyleToolH,eParam::Integer,bValueIsNull::Vector{Cint})
    ccall((:OGR_ST_GetParamDbl,libgdal),Cdouble,(OGRStyleToolH,Cint,Ptr{Cint}),hST,eParam,bValueIsNull)
end

function setparamstr(hST::OGRStyleToolH,eParam::Integer,pszValue::AbstractString)
    ccall((:OGR_ST_SetParamStr,libgdal),Void,(OGRStyleToolH,Cint,Ptr{UInt8}),hST,eParam,pszValue)
end

function setparamnum(hST::OGRStyleToolH,eParam::Integer,nValue::Integer)
    ccall((:OGR_ST_SetParamNum,libgdal),Void,(OGRStyleToolH,Cint,Cint),hST,eParam,nValue)
end

function setparamdbl(hST::OGRStyleToolH,eParam::Integer,dfValue::Real)
    ccall((:OGR_ST_SetParamDbl,libgdal),Void,(OGRStyleToolH,Cint,Cdouble),hST,eParam,dfValue)
end

function getstylestring(hST::OGRStyleToolH)
    bytestring(ccall((:OGR_ST_GetStyleString,libgdal),Ptr{UInt8},(OGRStyleToolH,),hST))
end

function getrgbfromstring(hST::OGRStyleToolH,pszColor::AbstractString,pnRed::Vector{Cint},pnGreen::Vector{Cint},pnBlue::Vector{Cint},pnAlpha::Vector{Cint})
    ccall((:OGR_ST_GetRGBFromString,libgdal),Cint,(OGRStyleToolH,Ptr{UInt8},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint}),hST,pszColor,pnRed,pnGreen,pnBlue,pnAlpha)
end

function create()
    checknull(ccall((:OGR_STBL_Create,libgdal),OGRStyleTableH,()))
end

function destroy(hSTBL::OGRStyleTableH)
    ccall((:OGR_STBL_Destroy,libgdal),Void,(OGRStyleTableH,),hSTBL)
end

function addstyle(hStyleTable::OGRStyleTableH,pszName::AbstractString,pszStyleString::AbstractString)
    ccall((:OGR_STBL_AddStyle,libgdal),Cint,(OGRStyleTableH,Ptr{UInt8},Ptr{UInt8}),hStyleTable,pszName,pszStyleString)
end

function savestyletable(hStyleTable::OGRStyleTableH,pszFilename::AbstractString)
    ccall((:OGR_STBL_SaveStyleTable,libgdal),Cint,(OGRStyleTableH,Ptr{UInt8}),hStyleTable,pszFilename)
end

function loadstyletable(hStyleTable::OGRStyleTableH,pszFilename::AbstractString)
    ccall((:OGR_STBL_LoadStyleTable,libgdal),Cint,(OGRStyleTableH,Ptr{UInt8}),hStyleTable,pszFilename)
end

function find(hStyleTable::OGRStyleTableH,pszName::AbstractString)
    bytestring(ccall((:OGR_STBL_Find,libgdal),Ptr{UInt8},(OGRStyleTableH,Ptr{UInt8}),hStyleTable,pszName))
end

function resetstylestringreading(hStyleTable::OGRStyleTableH)
    ccall((:OGR_STBL_ResetStyleStringReading,libgdal),Void,(OGRStyleTableH,),hStyleTable)
end

function getnextstyle(hStyleTable::OGRStyleTableH)
    bytestring(ccall((:OGR_STBL_GetNextStyle,libgdal),Ptr{UInt8},(OGRStyleTableH,),hStyleTable))
end

function getlaststylename(hStyleTable::OGRStyleTableH)
    bytestring(ccall((:OGR_STBL_GetLastStyleName,libgdal),Ptr{UInt8},(OGRStyleTableH,),hStyleTable))
end

