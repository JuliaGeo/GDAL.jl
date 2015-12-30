

"""
    OSRAxisEnumToName(OGRAxisOrientation eOrientation) -> const char *

Return the string representation for the OGRAxisOrientation enumeration.

### Returns
an internal string
"""
function axisenumtoname(eOrientation::OGRAxisOrientation)
    bytestring(ccall((:OSRAxisEnumToName,libgdal),Ptr{UInt8},(OGRAxisOrientation,),eOrientation))
end


"""
    OSRNewSpatialReference(const char *) -> OGRSpatialReferenceH

Constructor.
"""
function newspatialreference(arg1::AbstractString)
    checknull(ccall((:OSRNewSpatialReference,libgdal),OGRSpatialReferenceH,(Ptr{UInt8},),arg1))
end


"""
    OSRCloneGeogCS(OGRSpatialReferenceH) -> OGRSpatialReferenceH

Make a duplicate of the GEOGCS node of this OGRSpatialReference object.
"""
function clonegeogcs(arg1::OGRSpatialReferenceH)
    checknull(ccall((:OSRCloneGeogCS,libgdal),OGRSpatialReferenceH,(OGRSpatialReferenceH,),arg1))
end


"""
    OSRClone(OGRSpatialReferenceH) -> OGRSpatialReferenceH

Make a duplicate of this OGRSpatialReference.
"""
function clone(arg1::OGRSpatialReferenceH)
    checknull(ccall((:OSRClone,libgdal),OGRSpatialReferenceH,(OGRSpatialReferenceH,),arg1))
end


"""
    OSRDestroySpatialReference(OGRSpatialReferenceH) -> void

OGRSpatialReference destructor.

### Parameters
* **hSRS**: the object to delete
"""
function destroyspatialreference(arg1::OGRSpatialReferenceH)
    ccall((:OSRDestroySpatialReference,libgdal),Void,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRReference(OGRSpatialReferenceH) -> int

Increments the reference count by one.
"""
function reference(arg1::OGRSpatialReferenceH)
    ccall((:OSRReference,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRDereference(OGRSpatialReferenceH) -> int

Decrements the reference count by one.
"""
function dereference(arg1::OGRSpatialReferenceH)
    ccall((:OSRDereference,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRRelease(OGRSpatialReferenceH) -> void

Decrements the reference count by one, and destroy if zero.
"""
function release(arg1::OGRSpatialReferenceH)
    ccall((:OSRRelease,libgdal),Void,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRValidate(OGRSpatialReferenceH) -> OGRErr

Validate SRS tokens.
"""
function validate(arg1::OGRSpatialReferenceH)
    ccall((:OSRValidate,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRFixupOrdering(OGRSpatialReferenceH) -> OGRErr

Correct parameter ordering to match CT Specification.
"""
function fixupordering(arg1::OGRSpatialReferenceH)
    ccall((:OSRFixupOrdering,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRFixup(OGRSpatialReferenceH) -> OGRErr

Fixup as needed.
"""
function fixup(arg1::OGRSpatialReferenceH)
    ccall((:OSRFixup,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRStripCTParms(OGRSpatialReferenceH) -> OGRErr

Strip OGC CT Parameters.
"""
function stripctparms(arg1::OGRSpatialReferenceH)
    ccall((:OSRStripCTParms,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRImportFromEPSG(OGRSpatialReferenceH hSRS,
                      int nCode) -> OGRErr

Initialize SRS based on EPSG GCS or PCS code.
"""
function importfromepsg(arg1::OGRSpatialReferenceH,arg2::Integer)
    ccall((:OSRImportFromEPSG,libgdal),OGRErr,(OGRSpatialReferenceH,Cint),arg1,arg2)
end


"""
    OSRImportFromEPSGA(OGRSpatialReferenceH hSRS,
                       int nCode) -> OGRErr

Initialize SRS based on EPSG GCS or PCS code.
"""
function importfromepsga(arg1::OGRSpatialReferenceH,arg2::Integer)
    ccall((:OSRImportFromEPSGA,libgdal),OGRErr,(OGRSpatialReferenceH,Cint),arg1,arg2)
end


"""
    OSRImportFromWkt(OGRSpatialReferenceH,
                     char **) -> OGRErr

Import from WKT string.
"""
function importfromwkt(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRImportFromWkt,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end


"""
    OSRImportFromProj4(OGRSpatialReferenceH,
                       const char *) -> OGRErr

Import PROJ.4 coordinate string.
"""
function importfromproj4(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRImportFromProj4,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end


"""
    OSRImportFromESRI(OGRSpatialReferenceH,
                      char **) -> OGRErr

Import coordinate system from ESRI .prj format(s).
"""
function importfromesri(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRImportFromESRI,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end


"""
    OSRImportFromPCI(OGRSpatialReferenceH hSRS,
                     const char *,
                     const char *,
                     double *) -> OGRErr

Import coordinate system from PCI projection definition.
"""
function importfrompci(hSRS::OGRSpatialReferenceH,arg1::AbstractString,arg2::AbstractString,arg3::Vector{Float64})
    ccall((:OSRImportFromPCI,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{Cdouble}),hSRS,arg1,arg2,arg3)
end


"""
    OSRImportFromUSGS(OGRSpatialReferenceH,
                      long,
                      long,
                      double *,
                      long) -> OGRErr

Import coordinate system from USGS projection definition.
"""
function importfromusgs(arg1::OGRSpatialReferenceH,arg2::Clong,arg3::Clong,arg4::Vector{Float64},arg5::Clong)
    ccall((:OSRImportFromUSGS,libgdal),OGRErr,(OGRSpatialReferenceH,Clong,Clong,Ptr{Cdouble},Clong),arg1,arg2,arg3,arg4,arg5)
end


"""
    OSRImportFromXML(OGRSpatialReferenceH,
                     const char *) -> OGRErr

Import coordinate system from XML format (GML only currently).
"""
function importfromxml(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRImportFromXML,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end


"""
    OSRImportFromDict(OGRSpatialReferenceH,
                      const char *,
                      const char *) -> OGRErr
"""
function importfromdict(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::AbstractString)
    ccall((:OSRImportFromDict,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3)
end


"""
    OSRImportFromPanorama(OGRSpatialReferenceH,
                          long,
                          long,
                          long,
                          double *) -> OGRErr
"""
function importfrompanorama(arg1::OGRSpatialReferenceH,arg2::Clong,arg3::Clong,arg4::Clong,arg5::Vector{Float64})
    ccall((:OSRImportFromPanorama,libgdal),OGRErr,(OGRSpatialReferenceH,Clong,Clong,Clong,Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5)
end


"""
    OSRImportFromOzi(OGRSpatialReferenceH,
                     const char *const *) -> OGRErr

Import coordinate system from OziExplorer projection definition.

### Parameters
* **hSRS**: spatial reference object.
* **papszLines**: Map file lines. This is an array of strings containing the whole OziExplorer .MAP file. The array is terminated by a NULL pointer.

### Returns
OGRERR_NONE on success or an error code in case of failure.
"""
function importfromozi(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRImportFromOzi,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end


"""
    OSRImportFromMICoordSys(OGRSpatialReferenceH,
                            const char *) -> OGRErr

Import Mapinfo style CoordSys definition.
"""
function importfrommicoordsys(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRImportFromMICoordSys,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end


"""
    OSRImportFromERM(OGRSpatialReferenceH,
                     const char *,
                     const char *,
                     const char *) -> OGRErr

Create OGR WKT from ERMapper projection definitions.
"""
function importfromerm(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::AbstractString,arg4::AbstractString)
    ccall((:OSRImportFromERM,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end


"""
    OSRImportFromUrl(OGRSpatialReferenceH,
                     const char *) -> OGRErr

Set spatial reference from a URL.
"""
function importfromurl(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRImportFromUrl,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end


"""
    OSRExportToWkt(OGRSpatialReferenceH,
                   char **) -> OGRErr

Convert this SRS into WKT format.
"""
function exporttowkt(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRExportToWkt,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end


"""
    OSRExportToPrettyWkt(OGRSpatialReferenceH,
                         char **,
                         int) -> OGRErr

Convert this SRS into a a nicely formatted WKT string for display to a person.
"""
function exporttoprettywkt(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String},arg3::Integer)
    ccall((:OSRExportToPrettyWkt,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}},Cint),arg1,arg2,arg3)
end


"""
    OSRExportToProj4(OGRSpatialReferenceH,
                     char **) -> OGRErr

Export coordinate system in PROJ.4 format.
"""
function exporttoproj4(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRExportToProj4,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end


"""
    OSRExportToPCI(OGRSpatialReferenceH,
                   char **,
                   char **,
                   double **) -> OGRErr

Export coordinate system in PCI projection definition.
"""
function exporttopci(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String},arg3::Vector{UTF8String},arg4::Ptr{Ptr{Cdouble}})
    ccall((:OSRExportToPCI,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}},Ptr{Ptr{Cdouble}}),arg1,arg2,arg3,arg4)
end


"""
    OSRExportToUSGS(OGRSpatialReferenceH,
                    long *,
                    long *,
                    double **,
                    long *) -> OGRErr

Export coordinate system in USGS GCTP projection definition.
"""
function exporttousgs(arg1::OGRSpatialReferenceH,arg2::Ptr{Clong},arg3::Ptr{Clong},arg4::Ptr{Ptr{Cdouble}},arg5::Ptr{Clong})
    ccall((:OSRExportToUSGS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Clong},Ptr{Clong},Ptr{Ptr{Cdouble}},Ptr{Clong}),arg1,arg2,arg3,arg4,arg5)
end


"""
    OSRExportToXML(OGRSpatialReferenceH,
                   char **,
                   const char *) -> OGRErr

Export coordinate system in XML format.
"""
function exporttoxml(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String},arg3::AbstractString)
    ccall((:OSRExportToXML,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}},Ptr{UInt8}),arg1,arg2,arg3)
end


"""
    OSRExportToPanorama(OGRSpatialReferenceH,
                        long *,
                        long *,
                        long *,
                        long *,
                        double *) -> OGRErr
"""
function exporttopanorama(arg1::OGRSpatialReferenceH,arg2::Ptr{Clong},arg3::Ptr{Clong},arg4::Ptr{Clong},arg5::Ptr{Clong},arg6::Vector{Float64})
    ccall((:OSRExportToPanorama,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Clong},Ptr{Clong},Ptr{Clong},Ptr{Clong},Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5,arg6)
end


"""
    OSRExportToMICoordSys(OGRSpatialReferenceH,
                          char **) -> OGRErr

Export coordinate system in Mapinfo style CoordSys format.
"""
function exporttomicoordsys(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRExportToMICoordSys,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end


"""
    OSRExportToERM(OGRSpatialReferenceH,
                   char *,
                   char *,
                   char *) -> OGRErr

Convert coordinate system to ERMapper format.
"""
function exporttoerm(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::AbstractString,arg4::AbstractString)
    ccall((:OSRExportToERM,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end


"""
    OSRMorphToESRI(OGRSpatialReferenceH) -> OGRErr

Convert in place to ESRI WKT format.
"""
function morphtoesri(arg1::OGRSpatialReferenceH)
    ccall((:OSRMorphToESRI,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRMorphFromESRI(OGRSpatialReferenceH) -> OGRErr

Convert in place from ESRI WKT format.
"""
function morphfromesri(arg1::OGRSpatialReferenceH)
    ccall((:OSRMorphFromESRI,libgdal),OGRErr,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRSetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszNodePath,
                    const char * pszNewNodeValue) -> OGRErr

Set attribute value in spatial reference.
"""
function setattrvalue(hSRS::OGRSpatialReferenceH,pszNodePath::AbstractString,pszNewNodeValue::AbstractString)
    ccall((:OSRSetAttrValue,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8}),hSRS,pszNodePath,pszNewNodeValue)
end


"""
    OSRGetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszName,
                    int iChild) -> const char *

Fetch indicated attribute of named node.
"""
function getattrvalue(hSRS::OGRSpatialReferenceH,pszName::AbstractString,iChild::Integer)
    bytestring(ccall((:OSRGetAttrValue,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8},Cint),hSRS,pszName,iChild))
end


"""
    OSRSetAngularUnits(OGRSpatialReferenceH,
                       const char *,
                       double) -> OGRErr

Set the angular units for the geographic coordinate system.
"""
function setangularunits(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetAngularUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end


"""
    OSRGetAngularUnits(OGRSpatialReferenceH,
                       char **) -> double

Fetch angular geographic coordinate system units.
"""
function getangularunits(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRGetAngularUnits,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end


"""
    OSRSetLinearUnits(OGRSpatialReferenceH,
                      const char *,
                      double) -> OGRErr

Set the linear units for the projection.
"""
function setlinearunits(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetLinearUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end


"""
    OSRSetTargetLinearUnits(OGRSpatialReferenceH,
                            const char *,
                            const char *,
                            double) -> OGRErr

Set the linear units for the target node.
"""
function settargetlinearunits(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::AbstractString,arg4::Real)
    ccall((:OSRSetTargetLinearUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Cdouble),arg1,arg2,arg3,arg4)
end


"""
    OSRSetLinearUnitsAndUpdateParameters(OGRSpatialReferenceH,
                                         const char *,
                                         double) -> OGRErr

Set the linear units for the projection.
"""
function setlinearunitsandupdateparameters(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetLinearUnitsAndUpdateParameters,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end


"""
    OSRGetLinearUnits(OGRSpatialReferenceH,
                      char **) -> double

Fetch linear projection units.
"""
function getlinearunits(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRGetLinearUnits,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end


"""
    OSRGetTargetLinearUnits(OGRSpatialReferenceH,
                            const char *,
                            char **) -> double

Fetch linear projection units.
"""
function gettargetlinearunits(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Vector{UTF8String})
    ccall((:OSRGetTargetLinearUnits,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{Ptr{UInt8}}),arg1,arg2,arg3)
end


"""
    OSRGetPrimeMeridian(OGRSpatialReferenceH,
                        char **) -> double

Fetch prime meridian info.
"""
function getprimemeridian(arg1::OGRSpatialReferenceH,arg2::Vector{UTF8String})
    ccall((:OSRGetPrimeMeridian,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{Ptr{UInt8}}),arg1,arg2)
end


"""
    OSRIsGeographic(OGRSpatialReferenceH) -> int

Check if geographic coordinate system.
"""
function isgeographic(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsGeographic,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRIsLocal(OGRSpatialReferenceH) -> int

Check if local coordinate system.
"""
function islocal(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsLocal,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRIsProjected(OGRSpatialReferenceH) -> int

Check if projected coordinate system.
"""
function isprojected(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsProjected,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRIsCompound(OGRSpatialReferenceH) -> int

Check if the coordinate system is compound.
"""
function iscompound(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsCompound,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRIsGeocentric(OGRSpatialReferenceH) -> int

Check if geocentric coordinate system.
"""
function isgeocentric(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsGeocentric,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRIsVertical(OGRSpatialReferenceH) -> int

Check if vertical coordinate system.
"""
function isvertical(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsVertical,libgdal),Cint,(OGRSpatialReferenceH,),arg1)
end


"""
    OSRIsSameGeogCS(OGRSpatialReferenceH,
                    OGRSpatialReferenceH) -> int

Do the GeogCS'es match?
"""
function issamegeogcs(arg1::OGRSpatialReferenceH,arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSameGeogCS,libgdal),Cint,(OGRSpatialReferenceH,OGRSpatialReferenceH),arg1,arg2)
end


"""
    OSRIsSameVertCS(OGRSpatialReferenceH,
                    OGRSpatialReferenceH) -> int

Do the VertCS'es match?
"""
function issamevertcs(arg1::OGRSpatialReferenceH,arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSameVertCS,libgdal),Cint,(OGRSpatialReferenceH,OGRSpatialReferenceH),arg1,arg2)
end


"""
    OSRIsSame(OGRSpatialReferenceH,
              OGRSpatialReferenceH) -> int

Do these two spatial references describe the same system ?
"""
function issame(arg1::OGRSpatialReferenceH,arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSame,libgdal),Cint,(OGRSpatialReferenceH,OGRSpatialReferenceH),arg1,arg2)
end


"""
    OSRSetLocalCS(OGRSpatialReferenceH hSRS,
                  const char * pszName) -> OGRErr

Set the user visible LOCAL_CS name.
"""
function setlocalcs(hSRS::OGRSpatialReferenceH,pszName::AbstractString)
    ccall((:OSRSetLocalCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end


"""
    OSRSetProjCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function setprojcs(hSRS::OGRSpatialReferenceH,pszName::AbstractString)
    ccall((:OSRSetProjCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end


"""
    OSRSetGeocCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function setgeoccs(hSRS::OGRSpatialReferenceH,pszName::AbstractString)
    ccall((:OSRSetGeocCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end


"""
    OSRSetWellKnownGeogCS(OGRSpatialReferenceH hSRS,
                          const char * pszName) -> OGRErr

Set a GeogCS based on well known name.
"""
function setwellknowngeogcs(hSRS::OGRSpatialReferenceH,pszName::AbstractString)
    ccall((:OSRSetWellKnownGeogCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszName)
end


"""
    OSRSetFromUserInput(OGRSpatialReferenceH hSRS,
                        const char *) -> OGRErr

Set spatial reference from various text formats.
"""
function setfromuserinput(hSRS::OGRSpatialReferenceH,arg1::AbstractString)
    ccall((:OSRSetFromUserInput,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,arg1)
end


"""
    OSRCopyGeogCSFrom(OGRSpatialReferenceH hSRS,
                      OGRSpatialReferenceH hSrcSRS) -> OGRErr

Copy GEOGCS from another OGRSpatialReference.
"""
function copygeogcsfrom(hSRS::OGRSpatialReferenceH,hSrcSRS::OGRSpatialReferenceH)
    ccall((:OSRCopyGeogCSFrom,libgdal),OGRErr,(OGRSpatialReferenceH,OGRSpatialReferenceH),hSRS,hSrcSRS)
end


"""
    OSRSetTOWGS84(OGRSpatialReferenceH hSRS,
                  double,
                  double,
                  double,
                  double,
                  double,
                  double,
                  double) -> OGRErr

Set the Bursa-Wolf conversion to WGS84.
"""
function settowgs84(hSRS::OGRSpatialReferenceH,arg1::Real,arg2::Real,arg3::Real,arg4::Real,arg5::Real,arg6::Real,arg7::Real)
    ccall((:OSRSetTOWGS84,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,arg1,arg2,arg3,arg4,arg5,arg6,arg7)
end


"""
    OSRGetTOWGS84(OGRSpatialReferenceH hSRS,
                  double *,
                  int) -> OGRErr

Fetch TOWGS84 parameters, if available.
"""
function gettowgs84(hSRS::OGRSpatialReferenceH,arg1::Vector{Float64},arg2::Integer)
    ccall((:OSRGetTOWGS84,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{Cdouble},Cint),hSRS,arg1,arg2)
end


"""
    OSRSetCompoundCS(OGRSpatialReferenceH hSRS,
                     const char * pszName,
                     OGRSpatialReferenceH hHorizSRS,
                     OGRSpatialReferenceH hVertSRS) -> OGRErr

Setup a compound coordinate system.
"""
function setcompoundcs(hSRS::OGRSpatialReferenceH,pszName::AbstractString,hHorizSRS::OGRSpatialReferenceH,hVertSRS::OGRSpatialReferenceH)
    ccall((:OSRSetCompoundCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},OGRSpatialReferenceH,OGRSpatialReferenceH),hSRS,pszName,hHorizSRS,hVertSRS)
end


"""
    OSRSetGeogCS(OGRSpatialReferenceH hSRS,
                 const char * pszGeogName,
                 const char * pszDatumName,
                 const char * pszEllipsoidName,
                 double dfSemiMajor,
                 double dfInvFlattening,
                 const char * pszPMName,
                 double dfPMOffset,
                 const char * pszUnits,
                 double dfConvertToRadians) -> OGRErr

Set geographic coordinate system.
"""
function setgeogcs(hSRS::OGRSpatialReferenceH,pszGeogName::AbstractString,pszDatumName::AbstractString,pszEllipsoidName::AbstractString,dfSemiMajor::Real,dfInvFlattening::Real,pszPMName::AbstractString,dfPMOffset::Real,pszUnits::AbstractString,dfConvertToRadians::Real)
    ccall((:OSRSetGeogCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8},Cdouble,Cdouble,Ptr{UInt8},Cdouble,Ptr{UInt8},Cdouble),hSRS,pszGeogName,pszDatumName,pszEllipsoidName,dfSemiMajor,dfInvFlattening,pszPMName,dfPMOffset,pszUnits,dfConvertToRadians)
end


"""
    OSRSetVertCS(OGRSpatialReferenceH hSRS,
                 const char * pszVertCSName,
                 const char * pszVertDatumName,
                 int nVertDatumType) -> OGRErr

Setup the vertical coordinate system.
"""
function setvertcs(hSRS::OGRSpatialReferenceH,pszVertCSName::AbstractString,pszVertDatumName::AbstractString,nVertDatumType::Integer)
    ccall((:OSRSetVertCS,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Cint),hSRS,pszVertCSName,pszVertDatumName,nVertDatumType)
end


"""
    OSRGetSemiMajor(OGRSpatialReferenceH,
                    OGRErr *) -> double

Get spheroid semi major axis.
"""
function getsemimajor(arg1::OGRSpatialReferenceH,arg2::Ptr{OGRErr})
    ccall((:OSRGetSemiMajor,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{OGRErr}),arg1,arg2)
end


"""
    OSRGetSemiMinor(OGRSpatialReferenceH,
                    OGRErr *) -> double

Get spheroid semi minor axis.
"""
function getsemiminor(arg1::OGRSpatialReferenceH,arg2::Ptr{OGRErr})
    ccall((:OSRGetSemiMinor,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{OGRErr}),arg1,arg2)
end


"""
    OSRGetInvFlattening(OGRSpatialReferenceH,
                        OGRErr *) -> double

Get spheroid inverse flattening.
"""
function getinvflattening(arg1::OGRSpatialReferenceH,arg2::Ptr{OGRErr})
    ccall((:OSRGetInvFlattening,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{OGRErr}),arg1,arg2)
end


"""
    OSRSetAuthority(OGRSpatialReferenceH hSRS,
                    const char * pszTargetKey,
                    const char * pszAuthority,
                    int nCode) -> OGRErr

Set the authority for a node.
"""
function setauthority(hSRS::OGRSpatialReferenceH,pszTargetKey::AbstractString,pszAuthority::AbstractString,nCode::Integer)
    ccall((:OSRSetAuthority,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Ptr{UInt8},Cint),hSRS,pszTargetKey,pszAuthority,nCode)
end


"""
    OSRGetAuthorityCode(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority code for a node.
"""
function getauthoritycode(hSRS::OGRSpatialReferenceH,pszTargetKey::AbstractString)
    bytestring(ccall((:OSRGetAuthorityCode,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszTargetKey))
end


"""
    OSRGetAuthorityName(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority name for a node.
"""
function getauthorityname(hSRS::OGRSpatialReferenceH,pszTargetKey::AbstractString)
    bytestring(ccall((:OSRGetAuthorityName,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8}),hSRS,pszTargetKey))
end


"""
    OSRSetProjection(OGRSpatialReferenceH,
                     const char *) -> OGRErr

Set a projection name.
"""
function setprojection(arg1::OGRSpatialReferenceH,arg2::AbstractString)
    ccall((:OSRSetProjection,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8}),arg1,arg2)
end


"""
    OSRSetProjParm(OGRSpatialReferenceH,
                   const char *,
                   double) -> OGRErr

Set a projection parameter value.
"""
function setprojparm(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetProjParm,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end


"""
    OSRGetProjParm(OGRSpatialReferenceH hSRS,
                   const char * pszParmName,
                   double dfDefault,
                   OGRErr *) -> double

Fetch a projection parameter value.
"""
function getprojparm(hSRS::OGRSpatialReferenceH,pszParmName::AbstractString,dfDefault::Real,arg1::Ptr{OGRErr})
    ccall((:OSRGetProjParm,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble,Ptr{OGRErr}),hSRS,pszParmName,dfDefault,arg1)
end


"""
    OSRSetNormProjParm(OGRSpatialReferenceH,
                       const char *,
                       double) -> OGRErr

Set a projection parameter with a normalized value.
"""
function setnormprojparm(arg1::OGRSpatialReferenceH,arg2::AbstractString,arg3::Real)
    ccall((:OSRSetNormProjParm,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble),arg1,arg2,arg3)
end


"""
    OSRGetNormProjParm(OGRSpatialReferenceH hSRS,
                       const char * pszParmName,
                       double dfDefault,
                       OGRErr *) -> double

This function is the same as OGRSpatialReference::
"""
function getnormprojparm(hSRS::OGRSpatialReferenceH,pszParmName::AbstractString,dfDefault::Real,arg1::Ptr{OGRErr})
    ccall((:OSRGetNormProjParm,libgdal),Cdouble,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble,Ptr{OGRErr}),hSRS,pszParmName,dfDefault,arg1)
end


"""
    OSRSetUTM(OGRSpatialReferenceH hSRS,
              int nZone,
              int bNorth) -> OGRErr

Set UTM projection definition.
"""
function setutm(hSRS::OGRSpatialReferenceH,nZone::Integer,bNorth::Integer)
    ccall((:OSRSetUTM,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cint),hSRS,nZone,bNorth)
end


"""
    OSRGetUTMZone(OGRSpatialReferenceH hSRS,
                  int * pbNorth) -> int

Get utm zone information.
"""
function getutmzone(hSRS::OGRSpatialReferenceH,pbNorth::Vector{Cint})
    ccall((:OSRGetUTMZone,libgdal),Cint,(OGRSpatialReferenceH,Ptr{Cint}),hSRS,pbNorth)
end


"""
    OSRSetStatePlane(OGRSpatialReferenceH hSRS,
                     int nZone,
                     int bNAD83) -> OGRErr

Set State Plane projection definition.
"""
function setstateplane(hSRS::OGRSpatialReferenceH,nZone::Integer,bNAD83::Integer)
    ccall((:OSRSetStatePlane,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cint),hSRS,nZone,bNAD83)
end


"""
    OSRSetStatePlaneWithUnits(OGRSpatialReferenceH hSRS,
                              int nZone,
                              int bNAD83,
                              const char * pszOverrideUnitName,
                              double dfOverrideUnit) -> OGRErr

Set State Plane projection definition.
"""
function setstateplanewithunits(hSRS::OGRSpatialReferenceH,nZone::Integer,bNAD83::Integer,pszOverrideUnitName::AbstractString,dfOverrideUnit::Real)
    ccall((:OSRSetStatePlaneWithUnits,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cint,Ptr{UInt8},Cdouble),hSRS,nZone,bNAD83,pszOverrideUnitName,dfOverrideUnit)
end


"""
    OSRAutoIdentifyEPSG(OGRSpatialReferenceH hSRS) -> OGRErr

Set EPSG authority info if possible.
"""
function autoidentifyepsg(hSRS::OGRSpatialReferenceH)
    ccall((:OSRAutoIdentifyEPSG,libgdal),OGRErr,(OGRSpatialReferenceH,),hSRS)
end


"""
    OSREPSGTreatsAsLatLong(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this geographic coordinate system should be treated as having lat/long coordinate ordering.
"""
function epsgtreatsaslatlong(hSRS::OGRSpatialReferenceH)
    ccall((:OSREPSGTreatsAsLatLong,libgdal),Cint,(OGRSpatialReferenceH,),hSRS)
end


"""
    OSREPSGTreatsAsNorthingEasting(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this geographic coordinate system should be treated as having northing/easting coordinate ordering.
"""
function epsgtreatsasnorthingeasting(hSRS::OGRSpatialReferenceH)
    ccall((:OSREPSGTreatsAsNorthingEasting,libgdal),Cint,(OGRSpatialReferenceH,),hSRS)
end


"""
    OSRGetAxis(OGRSpatialReferenceH hSRS,
               const char * pszTargetKey,
               int iAxis,
               OGRAxisOrientation * peOrientation) -> const char *

Fetch the orientation of one axis.
"""
function getaxis(hSRS::OGRSpatialReferenceH,pszTargetKey::AbstractString,iAxis::Integer,peOrientation::Ptr{OGRAxisOrientation})
    bytestring(ccall((:OSRGetAxis,libgdal),Ptr{UInt8},(OGRSpatialReferenceH,Ptr{UInt8},Cint,Ptr{OGRAxisOrientation}),hSRS,pszTargetKey,iAxis,peOrientation))
end


"""
    OSRSetAxes(const char * pszTargetKey,
               const char * pszXAxisName,
               OGRAxisOrientation eXAxisOrientation,
               const char * pszYAxisName,
               OGRAxisOrientation eYAxisOrientation) -> OGRErr
"""
function setaxes(pszTargetKey::AbstractString,pszXAxisName::AbstractString,eXAxisOrientation::OGRAxisOrientation,pszYAxisName::AbstractString,eYAxisOrientation::OGRAxisOrientation)
    ccall((:OSRSetAxes,libgdal),OGRErr,(Ptr{UInt8},Ptr{UInt8},OGRAxisOrientation,Ptr{UInt8},OGRAxisOrientation),pszTargetKey,pszXAxisName,eXAxisOrientation,pszYAxisName,eYAxisOrientation)
end


"""
    OSRSetACEA(OGRSpatialReferenceH hSRS,
               double dfStdP1,
               double dfStdP2,
               double dfCenterLat,
               double dfCenterLong,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

Albers Conic Equal Area.
"""
function setacea(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfStdP2::Real,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetACEA,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetAE(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Azimuthal Equidistant.
"""
function setae(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetAE,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetBonne(OGRSpatialReferenceH hSRS,
                double dfStandardParallel,
                double dfCentralMeridian,
                double dfFalseEasting,
                double dfFalseNorthing) -> OGRErr

Bonne.
"""
function setbonne(hSRS::OGRSpatialReferenceH,dfStandardParallel::Real,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetBonne,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStandardParallel,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetCEA(OGRSpatialReferenceH hSRS,
              double dfStdP1,
              double dfCentralMeridian,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Cylindrical Equal Area.
"""
function setcea(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetCEA,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetCS(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Cassini-Soldner.
"""
function setcs(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetCS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetEC(OGRSpatialReferenceH hSRS,
             double dfStdP1,
             double dfStdP2,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Equidistant Conic.
"""
function setec(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfStdP2::Real,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetEckert(OGRSpatialReferenceH hSRS,
                 int nVariation,
                 double dfCentralMeridian,
                 double dfFalseEasting,
                 double dfFalseNorthing) -> OGRErr

Eckert I-VI.
"""
function seteckert(hSRS::OGRSpatialReferenceH,nVariation::Integer,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEckert,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cdouble,Cdouble,Cdouble),hSRS,nVariation,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetEckertIV(OGRSpatialReferenceH hSRS,
                   double dfCentralMeridian,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Eckert IV.
"""
function seteckertiv(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEckertIV,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetEckertVI(OGRSpatialReferenceH hSRS,
                   double dfCentralMeridian,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Eckert VI.
"""
function seteckertvi(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEckertVI,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetEquirectangular(OGRSpatialReferenceH hSRS,
                          double dfCenterLat,
                          double dfCenterLong,
                          double dfFalseEasting,
                          double dfFalseNorthing) -> OGRErr

Equirectangular.
"""
function setequirectangular(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEquirectangular,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetEquirectangular2(OGRSpatialReferenceH hSRS,
                           double dfCenterLat,
                           double dfCenterLong,
                           double dfPseudoStdParallel1,
                           double dfFalseEasting,
                           double dfFalseNorthing) -> OGRErr

Equirectangular generalized form.
"""
function setequirectangular2(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfPseudoStdParallel1::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetEquirectangular2,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfPseudoStdParallel1,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetGS(OGRSpatialReferenceH hSRS,
             double dfCentralMeridian,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Gall Stereograpic.
"""
function setgs(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetGH(OGRSpatialReferenceH hSRS,
             double dfCentralMeridian,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Goode Homolosine.
"""
function setgh(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGH,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetIGH(OGRSpatialReferenceH hSRS) -> OGRErr

Interrupted Goode Homolosine.
"""
function setigh(hSRS::OGRSpatialReferenceH)
    ccall((:OSRSetIGH,libgdal),OGRErr,(OGRSpatialReferenceH,),hSRS)
end


"""
    OSRSetGEOS(OGRSpatialReferenceH hSRS,
               double dfCentralMeridian,
               double dfSatelliteHeight,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

GEOS - Geostationary Satellite View.
"""
function setgeos(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfSatelliteHeight::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGEOS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfSatelliteHeight,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetGaussSchreiberTMercator(OGRSpatialReferenceH hSRS,
                                  double dfCenterLat,
                                  double dfCenterLong,
                                  double dfScale,
                                  double dfFalseEasting,
                                  double dfFalseNorthing) -> OGRErr

Gauss Schreiber Transverse Mercator.
"""
function setgaussschreibertmercator(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGaussSchreiberTMercator,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetGnomonic(OGRSpatialReferenceH hSRS,
                   double dfCenterLat,
                   double dfCenterLong,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Gnomonic.
"""
function setgnomonic(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetGnomonic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetOM(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfAzimuth,
             double dfRectToSkew,
             double dfScale,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Oblique Mercator (aka HOM (variant B)
"""
function setom(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfAzimuth::Real,dfRectToSkew::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetOM,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfAzimuth,dfRectToSkew,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetHOM(OGRSpatialReferenceH hSRS,
              double dfCenterLat,
              double dfCenterLong,
              double dfAzimuth,
              double dfRectToSkew,
              double dfScale,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Hotine Oblique Mercator using azimuth angle.
"""
function sethom(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfAzimuth::Real,dfRectToSkew::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetHOM,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfAzimuth,dfRectToSkew,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetHOM2PNO(OGRSpatialReferenceH hSRS,
                  double dfCenterLat,
                  double dfLat1,
                  double dfLong1,
                  double dfLat2,
                  double dfLong2,
                  double dfScale,
                  double dfFalseEasting,
                  double dfFalseNorthing) -> OGRErr

Hotine Oblique Mercator using two points on centerline.
"""
function sethom2pno(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfLat1::Real,dfLong1::Real,dfLat2::Real,dfLong2::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetHOM2PNO,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfLat1,dfLong1,dfLat2,dfLong2,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetIWMPolyconic(OGRSpatialReferenceH hSRS,
                       double dfLat1,
                       double dfLat2,
                       double dfCenterLong,
                       double dfFalseEasting,
                       double dfFalseNorthing) -> OGRErr

International Map of the World Polyconic.
"""
function setiwmpolyconic(hSRS::OGRSpatialReferenceH,dfLat1::Real,dfLat2::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetIWMPolyconic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfLat1,dfLat2,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetKrovak(OGRSpatialReferenceH hSRS,
                 double dfCenterLat,
                 double dfCenterLong,
                 double dfAzimuth,
                 double dfPseudoStdParallelLat,
                 double dfScale,
                 double dfFalseEasting,
                 double dfFalseNorthing) -> OGRErr

Krovak Oblique Conic Conformal.
"""
function setkrovak(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfAzimuth::Real,dfPseudoStdParallelLat::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetKrovak,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfAzimuth,dfPseudoStdParallelLat,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetLAEA(OGRSpatialReferenceH hSRS,
               double dfCenterLat,
               double dfCenterLong,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

Lambert Azimuthal Equal-Area.
"""
function setlaea(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetLAEA,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetLCC(OGRSpatialReferenceH hSRS,
              double dfStdP1,
              double dfStdP2,
              double dfCenterLat,
              double dfCenterLong,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Lambert Conformal Conic.
"""
function setlcc(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfStdP2::Real,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetLCC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetLCC1SP(OGRSpatialReferenceH hSRS,
                 double dfCenterLat,
                 double dfCenterLong,
                 double dfScale,
                 double dfFalseEasting,
                 double dfFalseNorthing) -> OGRErr

Lambert Conformal Conic 1SP.
"""
function setlcc1sp(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetLCC1SP,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetLCCB(OGRSpatialReferenceH hSRS,
               double dfStdP1,
               double dfStdP2,
               double dfCenterLat,
               double dfCenterLong,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

Lambert Conformal Conic (Belgium)
"""
function setlccb(hSRS::OGRSpatialReferenceH,dfStdP1::Real,dfStdP2::Real,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetLCCB,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfStdP1,dfStdP2,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetMC(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Miller Cylindrical.
"""
function setmc(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetMC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetMercator(OGRSpatialReferenceH hSRS,
                   double dfCenterLat,
                   double dfCenterLong,
                   double dfScale,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Mercator.
"""
function setmercator(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetMercator,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetMollweide(OGRSpatialReferenceH hSRS,
                    double dfCentralMeridian,
                    double dfFalseEasting,
                    double dfFalseNorthing) -> OGRErr

Mollweide.
"""
function setmollweide(hSRS::OGRSpatialReferenceH,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetMollweide,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetNZMG(OGRSpatialReferenceH hSRS,
               double dfCenterLat,
               double dfCenterLong,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

New Zealand Map Grid.
"""
function setnzmg(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetNZMG,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetOS(OGRSpatialReferenceH hSRS,
             double dfOriginLat,
             double dfCMeridian,
             double dfScale,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Oblique Stereographic.
"""
function setos(hSRS::OGRSpatialReferenceH,dfOriginLat::Real,dfCMeridian::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetOS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfOriginLat,dfCMeridian,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetOrthographic(OGRSpatialReferenceH hSRS,
                       double dfCenterLat,
                       double dfCenterLong,
                       double dfFalseEasting,
                       double dfFalseNorthing) -> OGRErr

Orthographic.
"""
function setorthographic(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetOrthographic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetPolyconic(OGRSpatialReferenceH hSRS,
                    double dfCenterLat,
                    double dfCenterLong,
                    double dfFalseEasting,
                    double dfFalseNorthing) -> OGRErr

Polyconic.
"""
function setpolyconic(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetPolyconic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetPS(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfScale,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Polar Stereographic.
"""
function setps(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetPS,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetRobinson(OGRSpatialReferenceH hSRS,
                   double dfCenterLong,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Robinson.
"""
function setrobinson(hSRS::OGRSpatialReferenceH,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetRobinson,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetSinusoidal(OGRSpatialReferenceH hSRS,
                     double dfCenterLong,
                     double dfFalseEasting,
                     double dfFalseNorthing) -> OGRErr

Sinusoidal.
"""
function setsinusoidal(hSRS::OGRSpatialReferenceH,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetSinusoidal,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetStereographic(OGRSpatialReferenceH hSRS,
                        double dfCenterLat,
                        double dfCenterLong,
                        double dfScale,
                        double dfFalseEasting,
                        double dfFalseNorthing) -> OGRErr

Stereographic.
"""
function setstereographic(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetStereographic,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetSOC(OGRSpatialReferenceH hSRS,
              double dfLatitudeOfOrigin,
              double dfCentralMeridian,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Swiss Oblique Cylindrical.
"""
function setsoc(hSRS::OGRSpatialReferenceH,dfLatitudeOfOrigin::Real,dfCentralMeridian::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetSOC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfLatitudeOfOrigin,dfCentralMeridian,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetTM(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfScale,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Transverse Mercator.
"""
function settm(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetTM,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetTMVariant(OGRSpatialReferenceH hSRS,
                    const char * pszVariantName,
                    double dfCenterLat,
                    double dfCenterLong,
                    double dfScale,
                    double dfFalseEasting,
                    double dfFalseNorthing) -> OGRErr

Transverse Mercator variant.
"""
function settmvariant(hSRS::OGRSpatialReferenceH,pszVariantName::AbstractString,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetTMVariant,libgdal),OGRErr,(OGRSpatialReferenceH,Ptr{UInt8},Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,pszVariantName,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetTMG(OGRSpatialReferenceH hSRS,
              double dfCenterLat,
              double dfCenterLong,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Tunesia Mining Grid.
"""
function settmg(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetTMG,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetTMSO(OGRSpatialReferenceH hSRS,
               double dfCenterLat,
               double dfCenterLong,
               double dfScale,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

Transverse Mercator (South Oriented)
"""
function settmso(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real,dfScale::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetTMSO,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong,dfScale,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetVDG(OGRSpatialReferenceH hSRS,
              double dfCenterLong,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

VanDerGrinten.
"""
function setvdg(hSRS::OGRSpatialReferenceH,dfCenterLong::Real,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetVDG,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble,Cdouble),hSRS,dfCenterLong,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetWagner(OGRSpatialReferenceH hSRS,
                 int nVariation,
                 double dfFalseEasting,
                 double dfFalseNorthing) -> OGRErr

Wagner I  VII.
"""
function setwagner(hSRS::OGRSpatialReferenceH,nVariation::Integer,dfFalseEasting::Real,dfFalseNorthing::Real)
    ccall((:OSRSetWagner,libgdal),OGRErr,(OGRSpatialReferenceH,Cint,Cdouble,Cdouble),hSRS,nVariation,dfFalseEasting,dfFalseNorthing)
end


"""
    OSRSetQSC(OGRSpatialReferenceH hSRS,
              double dfCenterLat,
              double dfCenterLong) -> OGRErr

Quadrilateralized Spherical Cube.
"""
function setqsc(hSRS::OGRSpatialReferenceH,dfCenterLat::Real,dfCenterLong::Real)
    ccall((:OSRSetQSC,libgdal),OGRErr,(OGRSpatialReferenceH,Cdouble,Cdouble),hSRS,dfCenterLat,dfCenterLong)
end


"""
    OSRCalcInvFlattening(double dfSemiMajor,
                         double dfSemiMinor) -> double

Compute inverse flattening from semi-major and semi-minor axis.

### Parameters
* **dfSemiMajor**: Semi-major axis length.
* **dfSemiMinor**: Semi-minor axis length.

### Returns
inverse flattening, or 0 if both axis are equal.
"""
function calcinvflattening(dfSemiMajor::Real,dfSemiMinor::Real)
    ccall((:OSRCalcInvFlattening,libgdal),Cdouble,(Cdouble,Cdouble),dfSemiMajor,dfSemiMinor)
end


"""
    OSRCalcSemiMinorFromInvFlattening(double dfSemiMajor,
                                      double dfInvFlattening) -> double

Compute semi-minor axis from semi-major axis and inverse flattening.

### Parameters
* **dfSemiMajor**: Semi-major axis length.
* **dfInvFlattening**: Inverse flattening or 0 for sphere.

### Returns
semi-minor axis
"""
function calcsemiminorfrominvflattening(dfSemiMajor::Real,dfInvFlattening::Real)
    ccall((:OSRCalcSemiMinorFromInvFlattening,libgdal),Cdouble,(Cdouble,Cdouble),dfSemiMajor,dfInvFlattening)
end


"""
    OSRCleanup(void) -> void

Cleanup cached SRS related memory.
"""
function cleanup()
    ccall((:OSRCleanup,libgdal),Void,())
end


"""
    OCTNewCoordinateTransformation(OGRSpatialReferenceH hSourceSRS,
                                   OGRSpatialReferenceH hTargetSRS) -> OGRCoordinateTransformationH

Create transformation object.

### Parameters
* **hSourceSRS**: source spatial reference system.
* **hTargetSRS**: target spatial reference system.

### Returns
NULL on failure or a ready to use transformation object.
"""
function octnewcoordinatetransformation(hSourceSRS::OGRSpatialReferenceH,hTargetSRS::OGRSpatialReferenceH)
    checknull(ccall((:OCTNewCoordinateTransformation,libgdal),OGRCoordinateTransformationH,(OGRSpatialReferenceH,OGRSpatialReferenceH),hSourceSRS,hTargetSRS))
end


"""
    OCTDestroyCoordinateTransformation(OGRCoordinateTransformationH) -> void

OGRCoordinateTransformation destructor.

### Parameters
* **hCT**: the object to delete
"""
function octdestroycoordinatetransformation(arg1::OGRCoordinateTransformationH)
    ccall((:OCTDestroyCoordinateTransformation,libgdal),Void,(OGRCoordinateTransformationH,),arg1)
end


"""
    OCTTransform(OGRCoordinateTransformationH hCT,
                 int nCount,
                 double * x,
                 double * y,
                 double * z) -> int
"""
function octtransform(hCT::OGRCoordinateTransformationH,nCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64})
    ccall((:OCTTransform,libgdal),Cint,(OGRCoordinateTransformationH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),hCT,nCount,x,y,z)
end


"""
    OCTTransformEx(OGRCoordinateTransformationH hCT,
                   int nCount,
                   double * x,
                   double * y,
                   double * z,
                   int * pabSuccess) -> int
"""
function octtransformex(hCT::OGRCoordinateTransformationH,nCount::Integer,x::Vector{Float64},y::Vector{Float64},z::Vector{Float64},pabSuccess::Vector{Cint})
    ccall((:OCTTransformEx,libgdal),Cint,(OGRCoordinateTransformationH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),hCT,nCount,x,y,z,pabSuccess)
end


"""
    OCTProj4Normalize(const char * pszProj4Src) -> char *
"""
function octproj4normalize(pszProj4Src::AbstractString)
    bytestring(ccall((:OCTProj4Normalize,libgdal),Ptr{UInt8},(Ptr{UInt8},),pszProj4Src))
end


"""
    OCTCleanupProjMutex(void) -> void
"""
function octcleanupprojmutex()
    ccall((:OCTCleanupProjMutex,libgdal),Void,())
end


"""
    OPTGetProjectionMethods() -> char **

Fetch list of possible projection methods.

### Returns
Returns NULL terminated list of projection methods. This should be freed with CSLDestroy() when no longer needed.
"""
function optgetprojectionmethods()
    bytestring(unsafe_load(ccall((:OPTGetProjectionMethods,libgdal),Ptr{Ptr{UInt8}},())))
end


"""
    OPTGetParameterList(const char * pszProjectionMethod,
                        char ** ppszUserName) -> char **

Fetch the parameters for a given projection method.

### Parameters
* **pszProjectionMethod**: internal name of projection methods to fetch the parameters for, such as "Transverse_Mercator" (SRS_PT_TRANSVERSE_MERCATOR).
* **ppszUserName**: pointer in which to return a user visible name for the projection name. The returned string should not be modified or freed by the caller. Legal to pass in NULL if user name not required.

### Returns
returns a NULL terminated list of internal parameter names that should be freed by the caller when no longer needed. Returns NULL if projection method is unknown.
"""
function optgetparameterlist(pszProjectionMethod::AbstractString,ppszUserName::Vector{UTF8String})
    bytestring(unsafe_load(ccall((:OPTGetParameterList,libgdal),Ptr{Ptr{UInt8}},(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszProjectionMethod,ppszUserName)))
end


"""
    OPTGetParameterInfo(const char * pszProjectionMethod,
                        const char * pszParameterName,
                        char ** ppszUserName,
                        char ** ppszType,
                        double * pdfDefaultValue) -> int

Fetch information about a single parameter of a projection method.

### Parameters
* **pszProjectionMethod**: name of projection method for which the parameter applies. Not currently used, but in the future this could affect defaults. This is the internal projection method name, such as "Tranverse_Mercator".
* **pszParameterName**: name of the parameter to fetch information about. This is the internal name such as "central_meridian" (SRS_PP_CENTRAL_MERIDIAN).
* **ppszUserName**: location at which to return the user visible name for the parameter. This pointer may be NULL to skip the user name. The returned name should not be modified or freed.
* **ppszType**: location at which to return the parameter type for the parameter. This pointer may be NULL to skip. The returned type should not be modified or freed. The type values are described above.
* **pdfDefaultValue**: location at which to put the default value for this parameter. The pointer may be NULL.

### Returns
TRUE if parameter found, or FALSE otherwise.
"""
function optgetparameterinfo(pszProjectionMethod::AbstractString,pszParameterName::AbstractString,ppszUserName::Vector{UTF8String},ppszType::Vector{UTF8String},pdfDefaultValue::Vector{Float64})
    ccall((:OPTGetParameterInfo,libgdal),Cint,(Ptr{UInt8},Ptr{UInt8},Ptr{Ptr{UInt8}},Ptr{Ptr{UInt8}},Ptr{Cdouble}),pszProjectionMethod,pszParameterName,ppszUserName,ppszType,pdfDefaultValue)
end
