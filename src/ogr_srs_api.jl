function axisenumtoname(eOrientation::OGRAxisOrientation)
    bytestring(ccall((:OSRAxisEnumToName,libgdal),Ptr{UInt8},(OGRAxisOrientation,),eOrientation))
end

function newspatialreference(arg1::AbstractString)
    checknull(ccall((:OSRNewSpatialReference,libgdal),OGRSpatialReferenceH,(Ptr{UInt8},),arg1))
end

function clonegeogcs(arg1::OGRSpatialReferenceH)
    checknull(ccall((:OSRCloneGeogCS,libgdal),OGRSpatialReferenceH,(OGRSpatialReferenceH,),arg1))
end

function clone(arg1::OGRSpatialReferenceH)
    checknull(ccall((:OSRClone,libgdal),OGRSpatialReferenceH,(OGRSpatialReferenceH,),arg1))
end

function destroyspatialreference(arg1::OGRSpatialReferenceH)
    ccall((:OSRDestroySpatialReference,libgdal),Void,(OGRSpatialReferenceH,),arg1)
end

function reference(arg1::OGRSpatialReferenceH)
    ccall((:OSRReference,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function dereference(arg1::OGRSpatialReferenceH)
    ccall((:OSRDereference,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function release(arg1::OGRSpatialReferenceH)
    ccall((:OSRRelease,libgdal),Void,(OGRSpatialReferenceH,),arg1)
end

function validate(arg1::OGRSpatialReferenceH)
    ccall((:OSRValidate,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function fixupordering(arg1::OGRSpatialReferenceH)
    ccall((:OSRFixupOrdering,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function fixup(arg1::OGRSpatialReferenceH)
    ccall((:OSRFixup,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function stripctparms(arg1::OGRSpatialReferenceH)
    ccall((:OSRStripCTParms,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function importfromepsg(arg1::OGRSpatialReferenceH,arg2::Integer)
    ccall((:OSRImportFromEPSG,libgdal),OGRErr,(OGRSpatialReferenceH,Cint),arg1,arg2)
end

function importfromepsga(arg1::OGRSpatialReferenceH,arg2::Integer)
    ccall((:OSRImportFromEPSGA,libgdal),OGRErr,(OGRSpatialReferenceH,Cint),arg1,arg2)
end

function importfromwkt(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRImportFromWkt,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function importfromproj4(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRImportFromProj4,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function importfromesri(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRImportFromESRI,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function importfrompci(hSRS::OGRSpatialReferenceH,arg1::AbstractString,arg2::AbstractString,arg3::Vector{Float64})
    ccall((:OSRImportFromPCI,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{Cdouble}),hSRS,arg1,arg2,arg3)
end

function importfromusgs(arg1::OGRSpatialReferenceH,arg2::Clong,arg3::Clong,arg4::Vector{Float64},arg5::Clong)
    ccall((:OSRImportFromUSGS,libgdal),OGRErr,(OGRSpatialReferenceH,Clong,Clong,Ptr{Cdouble},Clong),arg1,arg2,arg3,arg4,arg5)
end

function importfromxml(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRImportFromXML,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function importfromdict(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::AbstractString)
    ccall((:OSRImportFromDict,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3)
end

function importfrompanorama(arg1::OGRSpatialReferenceH,arg2::Clong,arg3::Clong,arg4::Clong,arg5::Vector{Float64})
    ccall((:OSRImportFromPanorama,libgdal),OGRErr,(OGRSpatialReferenceH,Clong,Clong,Clong,Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5)
end

function importfromozi(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRImportFromOzi,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function importfrommicoordsys(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRImportFromMICoordSys,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function importfromerm(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::AbstractString,arg4::AbstractString)
    ccall((:OSRImportFromERM,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function importfromurl(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRImportFromUrl,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function exporttowkt(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRExportToWkt,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function exporttoprettywkt(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String},arg3::Integer)
    ccall((:OSRExportToPrettyWkt,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}},Cint),arg1,arg2,arg3)
end

function exporttoproj4(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRExportToProj4,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function exporttopci(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String},arg3::Vector{UTF8String},arg4::Ptr{Ptr{Cdouble}})
    ccall((:OSRExportToPCI,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}},Ptr{Ptr{Cdouble}}),arg1,arg2,arg3,arg4)
end

function exporttousgs(arg1::OGRSpatialReferenceH,arg2::Ptr{Clong},arg3::Ptr{Clong},arg4::Ptr{Ptr{Cdouble}},arg5::Ptr{Clong})
    ccall((:OSRExportToUSGS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Clong},Ptr{Clong},Ptr{Ptr{Cdouble}},Ptr{Clong}),arg1,arg2,arg3,arg4,arg5)
end

function exporttoxml(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String},arg3::AbstractString)
    ccall((:OSRExportToXML,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}},Ptr{UInt8}),arg1,arg2,arg3)
end

function exporttopanorama(arg1::OGRSpatialReferenceH,arg2::Ptr{Clong},arg3::Ptr{Clong},arg4::Ptr{Clong},arg5::Ptr{Clong},arg6::Vector{Float64})
    ccall((:OSRExportToPanorama,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Clong},Ptr{Clong},Ptr{Clong},Ptr{Clong},Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5,arg6)
end

function exporttomicoordsys(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRExportToMICoordSys,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function exporttoerm(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::AbstractString,arg4::AbstractString)
    ccall((:OSRExportToERM,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function morphtoesri(arg1::OGRSpatialReferenceH)
    ccall((:OSRMorphToESRI,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function morphfromesri(arg1::OGRSpatialReferenceH)
    ccall((:OSRMorphFromESRI,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end

function setattrvalue(hSRS::OGRSpatialReferenceH,pszNodePath::AbstractString,pszNewNodeValue::AbstractString)
    ccall((:OSRSetAttrValue,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8}),hSRS,pszNodePath,pszNewNodeValue)
end

function getattrvalue(hSRS::OGRSpatialReferenceH,pszName::AbstractString,iChild::Integer)
    bytestring(ccall((:OSRGetAttrValue,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8},Cint),hSRS,pszName,iChild))
end

function setangularunits(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetAngularUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function getangularunits(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRGetAngularUnits,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function setlinearunits(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetLinearUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function settargetlinearunits(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::AbstractString,arg4::Real)
    ccall((:OSRSetTargetLinearUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Cdouble),arg1,arg2,arg3,arg4)
end

function setlinearunitsandupdateparameters(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetLinearUnitsAndUpdateParameters,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function getlinearunits(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRGetLinearUnits,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function gettargetlinearunits(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Vector{UTF8String})
    ccall((:OSRGetTargetLinearUnits,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3)
end

function getprimemeridian(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRGetPrimeMeridian,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function isgeographic(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsGeographic,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function islocal(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsLocal,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function isprojected(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsProjected,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function iscompound(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsCompound,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function isgeocentric(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsGeocentric,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function isvertical(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsVertical,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end

function issamegeogcs(arg1::OGRSpatialReferenceH,arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSameGeogCS,libgdal),Cint,(OGRSpatialReferenceH,OGRSpatialReferenceH),arg1,arg2)
end

function issamevertcs(arg1::OGRSpatialReferenceH,arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSameVertCS,libgdal),Cint,(OGRSpatialReferenceH,OGRSpatialReferenceH),arg1,arg2)
end

function issame(arg1::OGRSpatialReferenceH,arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSame,libgdal),Cint,(OGRSpatialReferenceH,OGRSpatialReferenceH),arg1,arg2)
end

function setlocalcs(hSRS::OGRSpatialReferenceH,pszName::AbstractString)
    ccall((:OSRSetLocalCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end

function setprojcs(hSRS::OGRSpatialReferenceH,pszName::AbstractString)
    ccall((:OSRSetProjCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end

function setgeoccs(hSRS::OGRSpatialReferenceH,pszName::AbstractString)
    ccall((:OSRSetGeocCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end

function setwellknowngeogcs(hSRS::OGRSpatialReferenceH,pszName::AbstractString)
    ccall((:OSRSetWellKnownGeogCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end

function setfromuserinput(hSRS::OGRSpatialReferenceH,arg1::AbstractString)
    ccall((:OSRSetFromUserInput,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,arg1)
end

function copygeogcsfrom(hSRS::OGRSpatialReferenceH,hSrcSRS::OGRSpatialReferenceH)
    ccall((:OSRCopyGeogCSFrom,libgdal),OGRErr,(OGRSpatialReferenceH,OGRSpatialReferenceH),hSRS,hSrcSRS)
end

function settowgs84(hSRS::OGRSpatialReferenceH,arg1::Real,arg2::Real,arg3::Real,arg4::Real,arg5::Real,arg6::Real,arg7::Real)
    ccall((:OSRSetTOWGS84,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,arg1,arg2,arg3,arg4,arg5,arg6,arg7)
end

function gettowgs84(hSRS::OGRSpatialReferenceH,arg1::Vector{Float64},arg2::Integer)
    ccall((:OSRGetTOWGS84,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Cdouble},Cint),hSRS,arg1,arg2)
end

function setcompoundcs(hSRS::OGRSpatialReferenceH,pszName::AbstractString,hHorizSRS::OGRSpatialReferenceH,hVertSRS::OGRSpatialReferenceH)
    ccall((:OSRSetCompoundCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},OGRSpatialReferenceH,OGRSpatialReferenceH),hSRS,pszName,hHorizSRS,hVertSRS)
end

function setgeogcs(hSRS::OGRSpatialReferenceH,pszGeogName::AbstractString,pszDatumName::AbstractString,pszEllipsoidName::AbstractString,dfSemiMajor::Real,dfInvFlattening::Real,pszPMName::AbstractString,dfPMOffset::Real,pszUnits::AbstractString,dfConvertToRadians::Real)
    ccall((:OSRSetGeogCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8},Cdouble,Cdouble,Ptr{UInt8},Cdouble,Ptr{UInt8},Cdouble),hSRS,pszGeogName,pszDatumName,pszEllipsoidName,dfSemiMajor,dfInvFlattening,pszPMName,dfPMOffset,pszUnits,dfConvertToRadians)
end

function setvertcs(hSRS::OGRSpatialReferenceH,pszVertCSName::AbstractString,pszVertDatumName::AbstractString,nVertDatumType::Integer)
    ccall((:OSRSetVertCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Cint),hSRS,pszVertCSName,pszVertDatumName,nVertDatumType)
end

function getsemimajor(arg1::OGRSpatialReferenceH,arg2::Ptr{OGRErr})
    ccall((:OSRGetSemiMajor,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{OGRErr}),arg1,arg2)
end

function getsemiminor(arg1::OGRSpatialReferenceH,arg2::Ptr{OGRErr})
    ccall((:OSRGetSemiMinor,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{OGRErr}),arg1,arg2)
end

function getinvflattening(arg1::OGRSpatialReferenceH,arg2::Ptr{OGRErr})
    ccall((:OSRGetInvFlattening,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{OGRErr}),arg1,arg2)
end

function setauthority(hSRS::OGRSpatialReferenceH,pszTargetKey::AbstractString,pszAuthority::AbstractString,nCode::Integer)
    ccall((:OSRSetAuthority,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Cint),hSRS,pszTargetKey,pszAuthority,nCode)
end

function getauthoritycode(hSRS::OGRSpatialReferenceH,pszTargetKey::AbstractString)
    bytestring(ccall((:OSRGetAuthorityCode,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszTargetKey))
end

function getauthorityname(hSRS::OGRSpatialReferenceH,pszTargetKey::AbstractString)
    bytestring(ccall((:OSRGetAuthorityName,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszTargetKey))
end

function setprojection(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRSetProjection,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end

function setprojparm(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetProjParm,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function getprojparm(hSRS::OGRSpatialReferenceH,pszParmName::AbstractString,dfDefault::Real,arg1::Ptr{OGRErr})
    ccall((:OSRGetProjParm,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble,Ptr{OGRErr}),hSRS,pszParmName,dfDefault,arg1)
end

function setnormprojparm(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetNormProjParm,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end

function getnormprojparm(hSRS::OGRSpatialReferenceH,pszParmName::AbstractString,dfDefault::Real,arg1::Ptr{OGRErr})
    ccall((:OSRGetNormProjParm,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble,Ptr{OGRErr}),hSRS,pszParmName,dfDefault,arg1)
end

function setutm(hSRS::OGRSpatialReferenceH,nZone::Integer,bNorth::Integer)
    ccall((:OSRSetUTM,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cint),hSRS,nZone,bNorth)
end

function getutmzone(hSRS::OGRSpatialReferenceH,pbNorth::Vector{Cint})
    ccall((:OSRGetUTMZone,libgdal),Cint,(OGRSpatialReferenceH,Ptr{Cint}),hSRS,pbNorth)
end

function setstateplane(hSRS::OGRSpatialReferenceH,nZone::Integer,bNAD83::Integer)
    ccall((:OSRSetStatePlane,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cint),hSRS,nZone,bNAD83)
end

function setstateplanewithunits(hSRS::OGRSpatialReferenceH,nZone::Integer,bNAD83::Integer,pszOverrideUnitName::AbstractString,dfOverrideUnit::Real)
    ccall((:OSRSetStatePlaneWithUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cint,Ptr{UInt8},Cdouble),hSRS,nZone,bNAD83,pszOverrideUnitName,dfOverrideUnit)
end

function autoidentifyepsg(hSRS::OGRSpatialReferenceH)
    ccall((:OSRAutoIdentifyEPSG,libgdal),OGRErr,(OGRSpatialReferenceH,),hSRS)
end

function epsgtreatsaslatlong(hSRS::OGRSpatialReferenceH)
    ccall((:OSREPSGTreatsAsLatLong,libgdal),Cint,(OGRSpatialReferenceH,),hSRS)
end

function epsgtreatsasnorthingeasting(hSRS::OGRSpatialReferenceH)
    ccall((:OSREPSGTreatsAsNorthingEasting,libgdal),Cint,(OGRSpatialReferenceH,),hSRS)
end

function getaxis(hSRS::OGRSpatialReferenceH,pszTargetKey::AbstractString,iAxis::Integer,peOrientation::Ptr{OGRAxisOrientation})
    bytestring(ccall((:OSRGetAxis,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8},Cint,Ptr{OGRAxisOrientation}),hSRS,pszTargetKey,iAxis,peOrientation))
end

function setaxes(pszTargetKey::AbstractString,pszXAxisName::AbstractString,eXAxisOrientation::OGRAxisOrientation,pszYAxisName::AbstractString,eYAxisOrientation::OGRAxisOrientation)
    ccall((:OSRSetAxes,libgdal),OGRErr,(Ptr{UInt8},Ptr{UInt8},OGRAxisOrientation,Ptr{UInt8},OGRAxisOrientation),pszTargetKey,pszXAxisName,eXAxisOrientation,pszYAxisName,eYAxisOrientation)
end

function setacea(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfStdP2::Real,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetACEA,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setae(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetAE,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setbonne(hSRS::OGRSpatialReferenceH,dfStandardParallel::Real,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetBonne,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStandardParallel,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function setcea(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetCEA,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function setcs(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetCS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setec(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfStdP2::Real,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function seteckert(hSRS::OGRSpatialReferenceH,nVariation::Integer,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEckert,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cdouble,Cdouble,Cdouble),hSRS,nVariation,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function seteckertiv(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEckertIV,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function seteckertvi(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEckertVI,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function setequirectangular(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEquirectangular,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setequirectangular2(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfPseudoStdParallel1::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEquirectangular2,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfPseudoStdParallel1,dfFalseEasting,dfFalseNorthing)
end

function setgs(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function setgh(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGH,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function setigh(hSRS::OGRSpatialReferenceH)
    ccall((:OSRSetIGH,libgdal),OGRErr,(OGRSpatialReferenceH,),hSRS)
end

function setgeos(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfSatelliteHeight::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGEOS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfSatelliteHeight,dfFalseEasting,dfFalseNorthing)
end

function setgaussschreibertmercator(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGaussSchreiberTMercator,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function setgnomonic(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGnomonic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setom(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfAzimuth::Real,dfRectToSkew::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetOM,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfAzimuth,dfRectToSkew,dfScale,dfFalseEasting,dfFalseNorthing)
end

function sethom(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfAzimuth::Real,dfRectToSkew::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetHOM,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfAzimuth,dfRectToSkew,dfScale,dfFalseEasting,dfFalseNorthing)
end

function sethom2pno(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfLat1::Real,dfLong1::Real,dfLat2::Real,dfLong2::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetHOM2PNO,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfLat1,dfLong1,dfLat2,dfLong2,dfScale,dfFalseEasting,dfFalseNorthing)
end

function setiwmpolyconic(hSRS::OGRSpatialReferenceH,dfLat1::Real,dfLat2::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetIWMPolyconic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfLat1,dfLat2,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setkrovak(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfAzimuth::Real,dfPseudoStdParallelLat::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetKrovak,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfAzimuth,dfPseudoStdParallelLat,dfScale,dfFalseEasting,dfFalseNorthing)
end

function setlaea(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetLAEA,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setlcc(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfStdP2::Real,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetLCC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setlcc1sp(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetLCC1SP,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function setlccb(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfStdP2::Real,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetLCCB,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setmc(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetMC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setmercator(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetMercator,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function setmollweide(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetMollweide,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function setnzmg(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetNZMG,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setos(hSRS::OGRSpatialReferenceH,dfOriginLat::Real,dfCMeridian::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetOS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfOriginLat,dfCMeridian,dfScale,dfFalseEasting,dfFalseNorthing)
end

function setorthographic(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetOrthographic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setpolyconic(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetPolyconic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setps(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetPS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function setrobinson(hSRS::OGRSpatialReferenceH,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetRobinson,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setsinusoidal(hSRS::OGRSpatialReferenceH,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetSinusoidal,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setstereographic(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetStereographic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function setsoc(hSRS::OGRSpatialReferenceH,dfLatitudeOfOrigin::Real,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetSOC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfLatitudeOfOrigin,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end

function settm(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetTM,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function settmvariant(hSRS::OGRSpatialReferenceH,pszVariantName::AbstractString,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetTMVariant,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,pszVariantName,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function settmg(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetTMG,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function settmso(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetTMSO,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end

function setvdg(hSRS::OGRSpatialReferenceH,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetVDG,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end

function setwagner(hSRS::OGRSpatialReferenceH,nVariation::Integer,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetWagner,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cdouble,Cdouble),hSRS,nVariation,dfFalseEasting,dfFalseNorthing)
end

function setqsc(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real)
    ccall((:OSRSetQSC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong)
end

function calcinvflattening(dfSemiMajor::Real,dfSemiMinor::Real)
    ccall((:OSRCalcInvFlattening,libgdal),Cdouble,(Cdouble,Cdouble),dfSemiMajor,dfSemiMinor)
end

function calcsemiminorfrominvflattening(dfSemiMajor::Real,dfInvFlattening::Real)
    ccall((:OSRCalcSemiMinorFromInvFlattening,libgdal),Cdouble,(Cdouble,Cdouble),dfSemiMajor,dfInvFlattening)
end

function cleanup()
    ccall((:OSRCleanup,libgdal),Void,())
end

function octnewcoordinatetransformation(hSourceSRS::OGRSpatialReferenceH,hTargetSRS::OGRSpatialReferenceH)
    checknull(ccall((:OCTNewCoordinateTransformation,libgdal),OGRCoordinateTransformationH,(OGRSpatialReferenceH,OGRSpatialReferenceH),hSourceSRS,hTargetSRS))
end

function octdestroycoordinatetransformation(arg1::OGRCoordinateTransformationH)
    ccall((:OCTDestroyCoordinateTransformation,libgdal),Void,(OGRCoordinateTransformationH,),arg1)
end

function octtransform(hCT::OGRCoordinateTransformationH,nCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64})
    ccall((:OCTTransform,libgdal),Cint,(OGRCoordinateTransformationH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),hCT,nCount,x,y,z)
end

function octtransformex(hCT::OGRCoordinateTransformationH,nCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},pabSuccess::Vector{Cint})
    ccall((:OCTTransformEx,libgdal),Cint,(OGRCoordinateTransformationH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),hCT,nCount,x,y,z,pabSuccess)
end

function octproj4normalize(pszProj4Src::AbstractString)
    bytestring(ccall((:OCTProj4Normalize,libgdal),Ptr{UInt8},(Ptr{UInt8},),pszProj4Src))
end

function octcleanupprojmutex()
    ccall((:OCTCleanupProjMutex,libgdal),Void,())
end

function optgetprojectionmethods()
    bytestring(unsafe_load(ccall((:OPTGetProjectionMethods,libgdal),Ptr{Ptr{UInt8}},())))
end

function optgetparameterlist(pszProjectionMethod::AbstractString,ppszUserName::Vector{UTF8String})
    bytestring(unsafe_load(ccall((:OPTGetParameterList,libgdal),Ptr{Ptr{UInt8}},(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszProjectionMethod,ppszUserName)))
end

function optgetparameterinfo(pszProjectionMethod::AbstractString,pszParameterName::AbstractString,ppszUserName::Vector{UTF8String},ppszType::Vector{UTF8String},pdfDefaultValue::Vector{Float64})
    ccall((:OPTGetParameterInfo,libgdal),Cint,(Ptr{UInt8},Ptr{UInt8},Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}},Ptr{Cdouble}),pszProjectionMethod,pszParameterName,ppszUserName,ppszType,pdfDefaultValue)
end

