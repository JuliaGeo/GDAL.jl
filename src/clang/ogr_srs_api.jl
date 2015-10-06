# Julia wrapper for header: /usr/local/include/ogr_srs_api.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function OSRAxisEnumToName(eOrientation::OGRAxisOrientation)
    ccall((:OSRAxisEnumToName,libgdal),Ptr{UInt8},(OGRAxisOrientation,),eOrientation)
end

function OSRNewSpatialReference(arg1::Ptr{UInt8})
    ccall((:OSRNewSpatialReference,libgdal),OGRSpatialReferenceH,(Ptr{UInt8},),arg1)
end

function OSRCloneGeogCS(arg1::OGRSpatialReferenceH)
    ccall((:OSRCloneGeogCS,libgdal),OGRSpatialReferenceH,(OGRSpatialReferenceH,),arg1)
end

function OSRClone(arg1::OGRSpatialReferenceH)
    ccall((:OSRClone,libgdal),OGRSpatialReferenceH,(OGRSpatialReferenceH,),arg1)
end

function OSRDestroySpatialReference(arg1::OGRSpatialReferenceH)
    ccall((:OSRDestroySpatialReference,libgdal),Void,(OGRSpatialReferenceH,),arg1)
end

function OSRReference(arg1::OGRSpatialReferenceH)
    ccall((:OSRReference,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function OSRDereference(arg1::OGRSpatialReferenceH)
    ccall((:OSRDereference,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function OSRRelease(arg1::OGRSpatialReferenceH)
    ccall((:OSRRelease,libgdal),Void,(OGRSpatialReferenceH,),arg1)
end

function OSRValidate(arg1::OGRSpatialReferenceH)
    ccall((:OSRValidate,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function OSRFixupOrdering(arg1::OGRSpatialReferenceH)
    ccall((:OSRFixupOrdering,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function OSRFixup(arg1::OGRSpatialReferenceH)
    ccall((:OSRFixup,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function OSRStripCTParms(arg1::OGRSpatialReferenceH)
    ccall((:OSRStripCTParms,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function OSRImportFromEPSG(arg1::OGRSpatialReferenceH,arg2::Cint)
    ccall((:OSRImportFromEPSG,libgdal),OGRErr,(OGRSpatialReferenceH,Cint),arg1,arg2)
end

function OSRImportFromEPSGA(arg1::OGRSpatialReferenceH,arg2::Cint)
    ccall((:OSRImportFromEPSGA,libgdal),OGRErr,(OGRSpatialReferenceH,Cint),arg1,arg2)
end

function OSRImportFromWkt(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OSRImportFromWkt,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OSRImportFromProj4(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8})
    ccall((:OSRImportFromProj4,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function OSRImportFromESRI(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OSRImportFromESRI,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OSRImportFromPCI(hSRS::OGRSpatialReferenceH,arg1::Ptr{UInt8},arg2::Ptr{UInt8},arg3::Ptr{Cdouble})
    ccall((:OSRImportFromPCI,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{Cdouble}),hSRS,arg1,arg2,arg3)
end

function OSRImportFromUSGS(arg1::OGRSpatialReferenceH,arg2::Clong,arg3::Clong,arg4::Ptr{Cdouble},arg5::Clong)
    ccall((:OSRImportFromUSGS,libgdal),OGRErr,(OGRSpatialReferenceH,Clong,Clong,Ptr{Cdouble},Clong),arg1,arg2,arg3,arg4,arg5)
end

function OSRImportFromXML(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8})
    ccall((:OSRImportFromXML,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function OSRImportFromDict(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Ptr{UInt8})
    ccall((:OSRImportFromDict,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3)
end

function OSRImportFromPanorama(arg1::OGRSpatialReferenceH,arg2::Clong,arg3::Clong,arg4::Clong,arg5::Ptr{Cdouble})
    ccall((:OSRImportFromPanorama,libgdal),OGRErr,(OGRSpatialReferenceH,Clong,Clong,Clong,Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5)
end

function OSRImportFromOzi(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OSRImportFromOzi,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OSRImportFromMICoordSys(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8})
    ccall((:OSRImportFromMICoordSys,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function OSRImportFromERM(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Ptr{UInt8},arg4::Ptr{UInt8})
    ccall((:OSRImportFromERM,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function OSRImportFromUrl(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8})
    ccall((:OSRImportFromUrl,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function OSRExportToWkt(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OSRExportToWkt,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OSRExportToPrettyWkt(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}},arg3::Cint)
    ccall((:OSRExportToPrettyWkt,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}},Cint),arg1,arg2,arg3)
end

function OSRExportToProj4(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OSRExportToProj4,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OSRExportToPCI(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}},arg3::Ptr{Ptr{UInt8}},arg4::Ptr{Ptr{Cdouble}})
    ccall((:OSRExportToPCI,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}},Ptr{Ptr{Cdouble}}),arg1,arg2,arg3,arg4)
end

function OSRExportToUSGS(arg1::OGRSpatialReferenceH,arg2::Ptr{Clong},arg3::Ptr{Clong},arg4::Ptr{Ptr{Cdouble}},arg5::Ptr{Clong})
    ccall((:OSRExportToUSGS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Clong},Ptr{Clong},Ptr{Ptr{Cdouble}},Ptr{Clong}),arg1,arg2,arg3,arg4,arg5)
end

function OSRExportToXML(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}},arg3::Ptr{UInt8})
    ccall((:OSRExportToXML,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}},Ptr{UInt8}),arg1,arg2,arg3)
end

function OSRExportToPanorama(arg1::OGRSpatialReferenceH,arg2::Ptr{Clong},arg3::Ptr{Clong},arg4::Ptr{Clong},arg5::Ptr{Clong},arg6::Ptr{Cdouble})
    ccall((:OSRExportToPanorama,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Clong},Ptr{Clong},Ptr{Clong},Ptr{Clong},Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function OSRExportToMICoordSys(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OSRExportToMICoordSys,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OSRExportToERM(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Ptr{UInt8},arg4::Ptr{UInt8})
    ccall((:OSRExportToERM,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function OSRMorphToESRI(arg1::OGRSpatialReferenceH)
    ccall((:OSRMorphToESRI,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function OSRMorphFromESRI(arg1::OGRSpatialReferenceH)
    ccall((:OSRMorphFromESRI,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function OSRSetAttrValue(hSRS::OGRSpatialReferenceH,pszNodePath::Ptr{UInt8},pszNewNodeValue::Ptr{UInt8})
    ccall((:OSRSetAttrValue,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8}),hSRS,pszNodePath,pszNewNodeValue)
end

function OSRGetAttrValue(hSRS::OGRSpatialReferenceH,pszName::Ptr{UInt8},iChild::Cint)
    ccall((:OSRGetAttrValue,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8},Cint),hSRS,pszName,iChild)
end

function OSRSetAngularUnits(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Cdouble)
    ccall((:OSRSetAngularUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function OSRGetAngularUnits(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OSRGetAngularUnits,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OSRSetLinearUnits(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Cdouble)
    ccall((:OSRSetLinearUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function OSRSetTargetLinearUnits(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Ptr{UInt8},arg4::Cdouble)
    ccall((:OSRSetTargetLinearUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Cdouble),arg1,arg2,arg3,arg4)
end

function OSRSetLinearUnitsAndUpdateParameters(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Cdouble)
    ccall((:OSRSetLinearUnitsAndUpdateParameters,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function OSRGetLinearUnits(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OSRGetLinearUnits,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OSRGetTargetLinearUnits(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Ptr{Ptr{UInt8}})
    ccall((:OSRGetTargetLinearUnits,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3)
end

function OSRGetPrimeMeridian(arg1::OGRSpatialReferenceH,arg2::Ptr{Ptr{UInt8}})
    ccall((:OSRGetPrimeMeridian,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function OSRIsGeographic(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsGeographic,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function OSRIsLocal(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsLocal,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function OSRIsProjected(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsProjected,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function OSRIsCompound(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsCompound,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function OSRIsGeocentric(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsGeocentric,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function OSRIsVertical(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsVertical,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function OSRIsSameGeogCS(arg1::OGRSpatialReferenceH,arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSameGeogCS,libgdal),Cint,(OGRSpatialReferenceH,OGRSpatialReferenceH),arg1,arg2)
end

function OSRIsSameVertCS(arg1::OGRSpatialReferenceH,arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSameVertCS,libgdal),Cint,(OGRSpatialReferenceH,OGRSpatialReferenceH),arg1,arg2)
end

function OSRIsSame(arg1::OGRSpatialReferenceH,arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSame,libgdal),Cint,(OGRSpatialReferenceH,OGRSpatialReferenceH),arg1,arg2)
end

function OSRSetLocalCS(hSRS::OGRSpatialReferenceH,pszName::Ptr{UInt8})
    ccall((:OSRSetLocalCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end

function OSRSetProjCS(hSRS::OGRSpatialReferenceH,pszName::Ptr{UInt8})
    ccall((:OSRSetProjCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end

function OSRSetGeocCS(hSRS::OGRSpatialReferenceH,pszName::Ptr{UInt8})
    ccall((:OSRSetGeocCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end

function OSRSetWellKnownGeogCS(hSRS::OGRSpatialReferenceH,pszName::Ptr{UInt8})
    ccall((:OSRSetWellKnownGeogCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end

function OSRSetFromUserInput(hSRS::OGRSpatialReferenceH,arg1::Ptr{UInt8})
    ccall((:OSRSetFromUserInput,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,arg1)
end

function OSRCopyGeogCSFrom(hSRS::OGRSpatialReferenceH,hSrcSRS::OGRSpatialReferenceH)
    ccall((:OSRCopyGeogCSFrom,libgdal),OGRErr,(OGRSpatialReferenceH,OGRSpatialReferenceH),hSRS,hSrcSRS)
end

function OSRSetTOWGS84(hSRS::OGRSpatialReferenceH,arg1::Cdouble,arg2::Cdouble,arg3::Cdouble,arg4::Cdouble,arg5::Cdouble,arg6::Cdouble,arg7::Cdouble)
    ccall((:OSRSetTOWGS84,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,arg1,arg2,arg3,arg4,arg5,arg6,arg7)
end

function OSRGetTOWGS84(hSRS::OGRSpatialReferenceH,arg1::Ptr{Cdouble},arg2::Cint)
    ccall((:OSRGetTOWGS84,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Cdouble},Cint),hSRS,arg1,arg2)
end

function OSRSetCompoundCS(hSRS::OGRSpatialReferenceH,pszName::Ptr{UInt8},hHorizSRS::OGRSpatialReferenceH,hVertSRS::OGRSpatialReferenceH)
    ccall((:OSRSetCompoundCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},OGRSpatialReferenceH,OGRSpatialReferenceH),hSRS,pszName,hHorizSRS,hVertSRS)
end

function OSRSetGeogCS(hSRS::OGRSpatialReferenceH,pszGeogName::Ptr{UInt8},pszDatumName::Ptr{UInt8},pszEllipsoidName::Ptr{UInt8},dfSemiMajor::Cdouble,dfInvFlattening::Cdouble,pszPMName::Ptr{UInt8},dfPMOffset::Cdouble,pszUnits::Ptr{UInt8},dfConvertToRadians::Cdouble)
    ccall((:OSRSetGeogCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8},Cdouble,Cdouble,Ptr{UInt8},Cdouble,Ptr{UInt8},Cdouble),hSRS,pszGeogName,pszDatumName,pszEllipsoidName,dfSemiMajor,dfInvFlattening,pszPMName,dfPMOffset,pszUnits,dfConvertToRadians)
end

function OSRSetVertCS(hSRS::OGRSpatialReferenceH,pszVertCSName::Ptr{UInt8},pszVertDatumName::Ptr{UInt8},nVertDatumType::Cint)
    ccall((:OSRSetVertCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Cint),hSRS,pszVertCSName,pszVertDatumName,nVertDatumType)
end

function OSRGetSemiMajor(arg1::OGRSpatialReferenceH,arg2::Ptr{OGRErr})
    ccall((:OSRGetSemiMajor,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{OGRErr}),arg1,arg2)
end

function OSRGetSemiMinor(arg1::OGRSpatialReferenceH,arg2::Ptr{OGRErr})
    ccall((:OSRGetSemiMinor,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{OGRErr}),arg1,arg2)
end

function OSRGetInvFlattening(arg1::OGRSpatialReferenceH,arg2::Ptr{OGRErr})
    ccall((:OSRGetInvFlattening,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{OGRErr}),arg1,arg2)
end

function OSRSetAuthority(hSRS::OGRSpatialReferenceH,pszTargetKey::Ptr{UInt8},pszAuthority::Ptr{UInt8},nCode::Cint)
    ccall((:OSRSetAuthority,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Cint),hSRS,pszTargetKey,pszAuthority,nCode)
end

function OSRGetAuthorityCode(hSRS::OGRSpatialReferenceH,pszTargetKey::Ptr{UInt8})
    ccall((:OSRGetAuthorityCode,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszTargetKey)
end

function OSRGetAuthorityName(hSRS::OGRSpatialReferenceH,pszTargetKey::Ptr{UInt8})
    ccall((:OSRGetAuthorityName,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszTargetKey)
end

function OSRSetProjection(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8})
    ccall((:OSRSetProjection,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function OSRSetProjParm(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Cdouble)
    ccall((:OSRSetProjParm,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function OSRGetProjParm(hSRS::OGRSpatialReferenceH,pszParmName::Ptr{UInt8},dfDefault::Cdouble,arg1::Ptr{OGRErr})
    ccall((:OSRGetProjParm,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble,Ptr{OGRErr}),hSRS,pszParmName,dfDefault,arg1)
end

function OSRSetNormProjParm(arg1::OGRSpatialReferenceH,arg2::Ptr{UInt8},arg3::Cdouble)
    ccall((:OSRSetNormProjParm,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function OSRGetNormProjParm(hSRS::OGRSpatialReferenceH,pszParmName::Ptr{UInt8},dfDefault::Cdouble,arg1::Ptr{OGRErr})
    ccall((:OSRGetNormProjParm,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble,Ptr{OGRErr}),hSRS,pszParmName,dfDefault,arg1)
end

function OSRSetUTM(hSRS::OGRSpatialReferenceH,nZone::Cint,bNorth::Cint)
    ccall((:OSRSetUTM,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cint),hSRS,nZone,bNorth)
end

function OSRGetUTMZone(hSRS::OGRSpatialReferenceH,pbNorth::Ptr{Cint})
    ccall((:OSRGetUTMZone,libgdal),Cint,(OGRSpatialReferenceH,Ptr{Cint}),hSRS,pbNorth)
end

function OSRSetStatePlane(hSRS::OGRSpatialReferenceH,nZone::Cint,bNAD83::Cint)
    ccall((:OSRSetStatePlane,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cint),hSRS,nZone,bNAD83)
end

function OSRSetStatePlaneWithUnits(hSRS::OGRSpatialReferenceH,nZone::Cint,bNAD83::Cint,pszOverrideUnitName::Ptr{UInt8},dfOverrideUnit::Cdouble)
    ccall((:OSRSetStatePlaneWithUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cint,Ptr{UInt8},Cdouble),hSRS,nZone,bNAD83,pszOverrideUnitName,dfOverrideUnit)
end

function OSRAutoIdentifyEPSG(hSRS::OGRSpatialReferenceH)
    ccall((:OSRAutoIdentifyEPSG,libgdal),OGRErr,(OGRSpatialReferenceH,),hSRS)
end

function OSREPSGTreatsAsLatLong(hSRS::OGRSpatialReferenceH)
    ccall((:OSREPSGTreatsAsLatLong,libgdal),Cint,(OGRSpatialReferenceH,),hSRS)
end

function OSREPSGTreatsAsNorthingEasting(hSRS::OGRSpatialReferenceH)
    ccall((:OSREPSGTreatsAsNorthingEasting,libgdal),Cint,(OGRSpatialReferenceH,),hSRS)
end

function OSRGetAxis(hSRS::OGRSpatialReferenceH,pszTargetKey::Ptr{UInt8},iAxis::Cint,peOrientation::Ptr{OGRAxisOrientation})
    ccall((:OSRGetAxis,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8},Cint,Ptr{OGRAxisOrientation}),hSRS,pszTargetKey,iAxis,peOrientation)
end

function OSRSetAxes(pszTargetKey::Ptr{UInt8},pszXAxisName::Ptr{UInt8},eXAxisOrientation::OGRAxisOrientation,pszYAxisName::Ptr{UInt8},eYAxisOrientation::OGRAxisOrientation)
    ccall((:OSRSetAxes,libgdal),OGRErr,(Ptr{UInt8},Ptr{UInt8},OGRAxisOrientation,Ptr{UInt8},OGRAxisOrientation),pszTargetKey,pszXAxisName,eXAxisOrientation,pszYAxisName,eYAxisOrientation)
end

function OSRSetACEA(hSRS::OGRSpatialReferenceH,dfStdP1::Cdouble,dfStdP2::Cdouble,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetACEA,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetAE(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetAE,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetBonne(hSRS::OGRSpatialReferenceH,dfStandardParallel::Cdouble,dfCentralMeridian::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetBonne,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStandardParallel,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function OSRSetCEA(hSRS::OGRSpatialReferenceH,dfStdP1::Cdouble,dfCentralMeridian::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetCEA,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function OSRSetCS(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetCS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetEC(hSRS::OGRSpatialReferenceH,dfStdP1::Cdouble,dfStdP2::Cdouble,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetEC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetEckert(hSRS::OGRSpatialReferenceH,nVariation::Cint,dfCentralMeridian::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetEckert,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cdouble,Cdouble,Cdouble),hSRS,nVariation,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function OSRSetEckertIV(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetEckertIV,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function OSRSetEckertVI(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetEckertVI,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function OSRSetEquirectangular(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetEquirectangular,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetEquirectangular2(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfPseudoStdParallel1::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetEquirectangular2,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfPseudoStdParallel1,dfFalseEasting,dfFalseNorthing)
end

function OSRSetGS(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetGS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function OSRSetGH(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetGH,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function OSRSetIGH(hSRS::OGRSpatialReferenceH)
    ccall((:OSRSetIGH,libgdal),OGRErr,(OGRSpatialReferenceH,),hSRS)
end

function OSRSetGEOS(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Cdouble,dfSatelliteHeight::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetGEOS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfSatelliteHeight,dfFalseEasting,dfFalseNorthing)
end

function OSRSetGaussSchreiberTMercator(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetGaussSchreiberTMercator,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetGnomonic(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetGnomonic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetOM(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfAzimuth::Cdouble,dfRectToSkew::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetOM,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfAzimuth,dfRectToSkew,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetHOM(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfAzimuth::Cdouble,dfRectToSkew::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetHOM,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfAzimuth,dfRectToSkew,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetHOM2PNO(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfLat1::Cdouble,dfLong1::Cdouble,dfLat2::Cdouble,dfLong2::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetHOM2PNO,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfLat1,dfLong1,dfLat2,dfLong2,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetIWMPolyconic(hSRS::OGRSpatialReferenceH,dfLat1::Cdouble,dfLat2::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetIWMPolyconic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfLat1,dfLat2,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetKrovak(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfAzimuth::Cdouble,dfPseudoStdParallelLat::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetKrovak,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfAzimuth,dfPseudoStdParallelLat,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetLAEA(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetLAEA,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetLCC(hSRS::OGRSpatialReferenceH,dfStdP1::Cdouble,dfStdP2::Cdouble,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetLCC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetLCC1SP(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetLCC1SP,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetLCCB(hSRS::OGRSpatialReferenceH,dfStdP1::Cdouble,dfStdP2::Cdouble,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetLCCB,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetMC(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetMC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetMercator(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetMercator,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetMollweide(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetMollweide,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function OSRSetNZMG(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetNZMG,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetOS(hSRS::OGRSpatialReferenceH,dfOriginLat::Cdouble,dfCMeridian::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetOS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfOriginLat,dfCMeridian,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetOrthographic(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetOrthographic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetPolyconic(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetPolyconic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetPS(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetPS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetRobinson(hSRS::OGRSpatialReferenceH,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetRobinson,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetSinusoidal(hSRS::OGRSpatialReferenceH,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetSinusoidal,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetStereographic(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetStereographic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetSOC(hSRS::OGRSpatialReferenceH,dfLatitudeOfOrigin::Cdouble,dfCentralMeridian::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetSOC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfLatitudeOfOrigin,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function OSRSetTM(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetTM,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetTMVariant(hSRS::OGRSpatialReferenceH,pszVariantName::Ptr{UInt8},dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetTMVariant,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,pszVariantName,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetTMG(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetTMG,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetTMSO(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble,dfScale::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetTMSO,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function OSRSetVDG(hSRS::OGRSpatialReferenceH,dfCenterLong::Cdouble,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetVDG,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function OSRSetWagner(hSRS::OGRSpatialReferenceH,nVariation::Cint,dfFalseEasting::Cdouble,dfFalseNorthing::Cdouble)
    ccall((:OSRSetWagner,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cdouble,Cdouble),hSRS,nVariation,dfFalseEasting,dfFalseNorthing)
end

function OSRSetQSC(hSRS::OGRSpatialReferenceH,dfCenterLat::Cdouble,dfCenterLong::Cdouble)
    ccall((:OSRSetQSC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong)
end

function OSRCalcInvFlattening(dfSemiMajor::Cdouble,dfSemiMinor::Cdouble)
    ccall((:OSRCalcInvFlattening,libgdal),Cdouble,(Cdouble,Cdouble),dfSemiMajor,dfSemiMinor)
end

function OSRCalcSemiMinorFromInvFlattening(dfSemiMajor::Cdouble,dfInvFlattening::Cdouble)
    ccall((:OSRCalcSemiMinorFromInvFlattening,libgdal),Cdouble,(Cdouble,Cdouble),dfSemiMajor,dfInvFlattening)
end

function OSRCleanup()
    ccall((:OSRCleanup,libgdal),Void,())
end

function OCTNewCoordinateTransformation(hSourceSRS::OGRSpatialReferenceH,hTargetSRS::OGRSpatialReferenceH)
    ccall((:OCTNewCoordinateTransformation,libgdal),OGRCoordinateTransformationH,(OGRSpatialReferenceH,OGRSpatialReferenceH),hSourceSRS,hTargetSRS)
end

function OCTDestroyCoordinateTransformation(arg1::OGRCoordinateTransformationH)
    ccall((:OCTDestroyCoordinateTransformation,libgdal),Void,(OGRCoordinateTransformationH,),arg1)
end

function OCTTransform(hCT::OGRCoordinateTransformationH,nCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble})
    ccall((:OCTTransform,libgdal),Cint,(OGRCoordinateTransformationH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),hCT,nCount,x,y,z)
end

function OCTTransformEx(hCT::OGRCoordinateTransformationH,nCount::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},z::Ptr{Cdouble},pabSuccess::Ptr{Cint})
    ccall((:OCTTransformEx,libgdal),Cint,(OGRCoordinateTransformationH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),hCT,nCount,x,y,z,pabSuccess)
end

function OCTProj4Normalize(pszProj4Src::Ptr{UInt8})
    ccall((:OCTProj4Normalize,libgdal),Ptr{UInt8},(Ptr{UInt8},),pszProj4Src)
end

function OCTCleanupProjMutex()
    ccall((:OCTCleanupProjMutex,libgdal),Void,())
end

function OPTGetProjectionMethods()
    ccall((:OPTGetProjectionMethods,libgdal),Ptr{Ptr{UInt8}},())
end

function OPTGetParameterList(pszProjectionMethod::Ptr{UInt8},ppszUserName::Ptr{Ptr{UInt8}})
    ccall((:OPTGetParameterList,libgdal),Ptr{Ptr{UInt8}},(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszProjectionMethod,ppszUserName)
end

function OPTGetParameterInfo(pszProjectionMethod::Ptr{UInt8},pszParameterName::Ptr{UInt8},ppszUserName::Ptr{Ptr{UInt8}},ppszType::Ptr{Ptr{UInt8}},pdfDefaultValue::Ptr{Cdouble})
    ccall((:OPTGetParameterInfo,libgdal),Cint,(Ptr{UInt8},Ptr{UInt8},Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}},Ptr{Cdouble}),pszProjectionMethod,pszParameterName,ppszUserName,ppszType,pdfDefaultValue)
end
