

"""
    OSRAxisEnumToName(OGRAxisOrientation eOrientation) -> const char *

Return the string representation for the OGRAxisOrientation enumeration.

### Returns
an internal string
"""
function axisenumtoname(eOrientation::OGRAxisOrientation)
    unsafe_string(ccall((:OSRAxisEnumToName, libgdal), Cstring, (OGRAxisOrientation,), eOrientation))
end


"""
    OSRNewSpatialReference(const char * pszWKT) -> OGRSpatialReferenceH

Constructor.
"""
function newspatialreference(arg1)
    failsafe(ccall((:OSRNewSpatialReference, libgdal), Ptr{OGRSpatialReferenceH}, (Cstring,), arg1))
end


"""
    OSRCloneGeogCS(OGRSpatialReferenceH hSource) -> OGRSpatialReferenceH

Make a duplicate of the GEOGCS node of this OGRSpatialReference object.
"""
function clonegeogcs(arg1::Ref{OGRSpatialReferenceH})
    failsafe(ccall((:OSRCloneGeogCS, libgdal), Ptr{OGRSpatialReferenceH}, (Ptr{Cvoid},), arg1))
end


"""
    OSRClone(OGRSpatialReferenceH hSRS) -> OGRSpatialReferenceH

Make a duplicate of this OGRSpatialReference.
"""
function clone(arg1::Ref{OGRSpatialReferenceH})
    failsafe(ccall((:OSRClone, libgdal), Ptr{OGRSpatialReferenceH}, (Ptr{Cvoid},), arg1))
end


"""
    OSRDestroySpatialReference(OGRSpatialReferenceH hSRS) -> void

OGRSpatialReference destructor.

### Parameters
* **hSRS**: the object to delete
"""
function destroyspatialreference(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRDestroySpatialReference, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    OSRReference(OGRSpatialReferenceH hSRS) -> int

Increments the reference count by one.
"""
function reference(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRReference, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    OSRDereference(OGRSpatialReferenceH hSRS) -> int

Decrements the reference count by one.
"""
function dereference(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRDereference, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    OSRRelease(OGRSpatialReferenceH hSRS) -> void

Decrements the reference count by one, and destroy if zero.
"""
function release(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRRelease, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    OSRValidate(OGRSpatialReferenceH) -> OGRErr

Validate SRS tokens.
"""
function validate(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRValidate, libgdal), OGRErr, (Ptr{Cvoid},), arg1)
end


"""
    OSRFixupOrdering(OGRSpatialReferenceH hSRS) -> OGRErr

Correct parameter ordering to match CT Specification.
"""
function fixupordering(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRFixupOrdering, libgdal), OGRErr, (Ptr{Cvoid},), arg1)
end


"""
    OSRFixup(OGRSpatialReferenceH hSRS) -> OGRErr

Fixup as needed.
"""
function fixup(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRFixup, libgdal), OGRErr, (Ptr{Cvoid},), arg1)
end


"""
    OSRStripCTParms(OGRSpatialReferenceH hSRS) -> OGRErr

Strip OGC CT Parameters.
"""
function stripctparms(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRStripCTParms, libgdal), OGRErr, (Ptr{Cvoid},), arg1)
end


"""
    OSRImportFromEPSG(OGRSpatialReferenceH hSRS,
                      int nCode) -> OGRErr

Initialize SRS based on EPSG GCS or PCS code.
"""
function importfromepsg(arg1::Ref{OGRSpatialReferenceH}, arg2::Integer)
    ccall((:OSRImportFromEPSG, libgdal), OGRErr, (Ptr{Cvoid}, Cint), arg1, arg2)
end


"""
    OSRImportFromEPSGA(OGRSpatialReferenceH hSRS,
                       int nCode) -> OGRErr

Initialize SRS based on EPSG GCS or PCS code.
"""
function importfromepsga(arg1::Ref{OGRSpatialReferenceH}, arg2::Integer)
    ccall((:OSRImportFromEPSGA, libgdal), OGRErr, (Ptr{Cvoid}, Cint), arg1, arg2)
end


"""
    OSRImportFromWkt(OGRSpatialReferenceH hSRS,
                     char ** ppszInput) -> OGRErr

Import from WKT string.
"""
function importfromwkt(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRImportFromWkt, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRImportFromProj4(OGRSpatialReferenceH,
                       const char *) -> OGRErr

Import PROJ.4 coordinate string.
"""
function importfromproj4(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRImportFromProj4, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    OSRImportFromESRI(OGRSpatialReferenceH,
                      char **) -> OGRErr

Import coordinate system from ESRI .prj format(s).
"""
function importfromesri(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRImportFromESRI, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRImportFromPCI(OGRSpatialReferenceH hSRS,
                     const char *,
                     const char *,
                     double *) -> OGRErr

Import coordinate system from PCI projection definition.
"""
function importfrompci(hSRS::Ref{OGRSpatialReferenceH}, arg1, arg2, arg3)
    ccall((:OSRImportFromPCI, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring, Ptr{Cdouble}), hSRS, arg1, arg2, arg3)
end


"""
    OSRImportFromUSGS(OGRSpatialReferenceH,
                      long,
                      long,
                      double *,
                      long) -> OGRErr

Import coordinate system from USGS projection definition.
"""
function importfromusgs(arg1::Ref{OGRSpatialReferenceH}, arg2::Clong, arg3::Clong, arg4, arg5::Clong)
    ccall((:OSRImportFromUSGS, libgdal), OGRErr, (Ptr{Cvoid}, Clong, Clong, Ptr{Cdouble}, Clong), arg1, arg2, arg3, arg4, arg5)
end


"""
    OSRImportFromXML(OGRSpatialReferenceH,
                     const char *) -> OGRErr

Import coordinate system from XML format (GML only currently).
"""
function importfromxml(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRImportFromXML, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    OSRImportFromDict(OGRSpatialReferenceH,
                      const char *,
                      const char *) -> OGRErr

Read SRS from WKT dictionary.

### Parameters
* **hSRS**: spatial reference system handle.
* **pszDictFile**: the name of the dictionary file to load.
* **pszCode**: the code to lookup in the dictionary.

### Returns
OGRERR_NONE on success, or OGRERR_SRS_UNSUPPORTED if the code isn't found, and OGRERR_SRS_FAILURE if something more dramatic goes wrong.
"""
function importfromdict(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3)
    ccall((:OSRImportFromDict, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring), arg1, arg2, arg3)
end


"""
    OSRImportFromPanorama(OGRSpatialReferenceH,
                          long,
                          long,
                          long,
                          double *) -> OGRErr

Import coordinate system from "Panorama" GIS projection definition.
"""
function importfrompanorama(arg1::Ref{OGRSpatialReferenceH}, arg2::Clong, arg3::Clong, arg4::Clong, arg5)
    ccall((:OSRImportFromPanorama, libgdal), OGRErr, (Ptr{Cvoid}, Clong, Clong, Clong, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5)
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
function importfromozi(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRImportFromOzi, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRImportFromMICoordSys(OGRSpatialReferenceH hSRS,
                            const char * pszCoordSys) -> OGRErr

Import Mapinfo style CoordSys definition.
"""
function importfrommicoordsys(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRImportFromMICoordSys, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    OSRImportFromERM(OGRSpatialReferenceH,
                     const char *,
                     const char *,
                     const char *) -> OGRErr

Create OGR WKT from ERMapper projection definitions.
"""
function importfromerm(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3, arg4)
    ccall((:OSRImportFromERM, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4)
end


"""
    OSRImportFromUrl(OGRSpatialReferenceH hSRS,
                     const char * pszUrl) -> OGRErr

Set spatial reference from a URL.
"""
function importfromurl(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRImportFromUrl, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    OSRExportToWkt(OGRSpatialReferenceH hSRS,
                   char ** ppszReturn) -> OGRErr

Convert this SRS into WKT format.
"""
function exporttowkt(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRExportToWkt, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRExportToPrettyWkt(OGRSpatialReferenceH hSRS,
                         char ** ppszReturn,
                         int bSimplify) -> OGRErr

Convert this SRS into a nicely formatted WKT string for display to a person.
"""
function exporttoprettywkt(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3::Integer)
    ccall((:OSRExportToPrettyWkt, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cstring}, Cint), arg1, arg2, arg3)
end


"""
    OSRExportToProj4(OGRSpatialReferenceH,
                     char **) -> OGRErr

Export coordinate system in PROJ.4 format.
"""
function exporttoproj4(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRExportToProj4, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRExportToPCI(OGRSpatialReferenceH,
                   char **,
                   char **,
                   double **) -> OGRErr

Export coordinate system in PCI projection definition.
"""
function exporttopci(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3, arg4)
    ccall((:OSRExportToPCI, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cstring}, Ptr{Cstring}, Ptr{Ptr{Cdouble}}), arg1, arg2, arg3, arg4)
end


"""
    OSRExportToUSGS(OGRSpatialReferenceH,
                    long *,
                    long *,
                    double **,
                    long *) -> OGRErr

Export coordinate system in USGS GCTP projection definition.
"""
function exporttousgs(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3, arg4, arg5)
    ccall((:OSRExportToUSGS, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Clong}, Ptr{Clong}, Ptr{Ptr{Cdouble}}, Ptr{Clong}), arg1, arg2, arg3, arg4, arg5)
end


"""
    OSRExportToXML(OGRSpatialReferenceH,
                   char **,
                   const char *) -> OGRErr

Export coordinate system in XML format.
"""
function exporttoxml(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3)
    ccall((:OSRExportToXML, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cstring}, Cstring), arg1, arg2, arg3)
end


"""
    OSRExportToPanorama(OGRSpatialReferenceH,
                        long *,
                        long *,
                        long *,
                        long *,
                        double *) -> OGRErr

Export coordinate system in "Panorama" GIS projection definition.
"""
function exporttopanorama(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3, arg4, arg5, arg6)
    ccall((:OSRExportToPanorama, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5, arg6)
end


"""
    OSRExportToMICoordSys(OGRSpatialReferenceH hSRS,
                          char ** ppszReturn) -> OGRErr

Export coordinate system in Mapinfo style CoordSys format.
"""
function exporttomicoordsys(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRExportToMICoordSys, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRExportToERM(OGRSpatialReferenceH,
                   char *,
                   char *,
                   char *) -> OGRErr

Convert coordinate system to ERMapper format.
"""
function exporttoerm(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3, arg4)
    ccall((:OSRExportToERM, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4)
end


"""
    OSRMorphToESRI(OGRSpatialReferenceH) -> OGRErr

Convert in place to ESRI WKT format.
"""
function morphtoesri(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRMorphToESRI, libgdal), OGRErr, (Ptr{Cvoid},), arg1)
end


"""
    OSRMorphFromESRI(OGRSpatialReferenceH) -> OGRErr

Convert in place from ESRI WKT format.
"""
function morphfromesri(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRMorphFromESRI, libgdal), OGRErr, (Ptr{Cvoid},), arg1)
end


"""
    OSRSetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszPath,
                    const char * pszValue) -> OGRErr

Set attribute value in spatial reference.
"""
function setattrvalue(hSRS::Ref{OGRSpatialReferenceH}, pszNodePath, pszNewNodeValue)
    ccall((:OSRSetAttrValue, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring), hSRS, pszNodePath, pszNewNodeValue)
end


"""
    OSRGetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszKey,
                    int iChild) -> const char *

Fetch indicated attribute of named node.
"""
function getattrvalue(hSRS::Ref{OGRSpatialReferenceH}, pszName, iChild::Integer)
    unsafe_string(ccall((:OSRGetAttrValue, libgdal), Cstring, (Ptr{Cvoid}, Cstring, Cint), hSRS, pszName, iChild))
end


"""
    OSRSetAngularUnits(OGRSpatialReferenceH hSRS,
                       const char * pszUnits,
                       double dfInRadians) -> OGRErr

Set the angular units for the geographic coordinate system.
"""
function setangularunits(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3::Real)
    ccall((:OSRSetAngularUnits, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRGetAngularUnits(OGRSpatialReferenceH hSRS,
                       char ** ppszName) -> double

Fetch angular geographic coordinate system units.
"""
function getangularunits(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRGetAngularUnits, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRSetLinearUnits(OGRSpatialReferenceH hSRS,
                      const char * pszUnits,
                      double dfInMeters) -> OGRErr

Set the linear units for the projection.
"""
function setlinearunits(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3::Real)
    ccall((:OSRSetLinearUnits, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRSetTargetLinearUnits(OGRSpatialReferenceH hSRS,
                            const char * pszTargetKey,
                            const char * pszUnits,
                            double dfInMeters) -> OGRErr

Set the linear units for the target node.
"""
function settargetlinearunits(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3, arg4::Real)
    ccall((:OSRSetTargetLinearUnits, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring, Cdouble), arg1, arg2, arg3, arg4)
end


"""
    OSRSetLinearUnitsAndUpdateParameters(OGRSpatialReferenceH hSRS,
                                         const char * pszUnits,
                                         double dfInMeters) -> OGRErr

Set the linear units for the projection.
"""
function setlinearunitsandupdateparameters(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3::Real)
    ccall((:OSRSetLinearUnitsAndUpdateParameters, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRGetLinearUnits(OGRSpatialReferenceH hSRS,
                      char ** ppszName) -> double

Fetch linear projection units.
"""
function getlinearunits(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRGetLinearUnits, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRGetTargetLinearUnits(OGRSpatialReferenceH hSRS,
                            const char * pszTargetKey,
                            char ** ppszName) -> double

Fetch linear projection units.
"""
function gettargetlinearunits(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3)
    ccall((:OSRGetTargetLinearUnits, libgdal), Cdouble, (Ptr{Cvoid}, Cstring, Ptr{Cstring}), arg1, arg2, arg3)
end


"""
    OSRGetPrimeMeridian(OGRSpatialReferenceH hSRS,
                        char ** ppszName) -> double

Fetch prime meridian info.
"""
function getprimemeridian(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRGetPrimeMeridian, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRIsGeographic(OGRSpatialReferenceH hSRS) -> int

Check if geographic coordinate system.
"""
function isgeographic(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRIsGeographic, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    OSRIsLocal(OGRSpatialReferenceH hSRS) -> int

Check if local coordinate system.
"""
function islocal(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRIsLocal, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    OSRIsProjected(OGRSpatialReferenceH hSRS) -> int

Check if projected coordinate system.
"""
function isprojected(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRIsProjected, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    OSRIsCompound(OGRSpatialReferenceH hSRS) -> int

Check if the coordinate system is compound.
"""
function iscompound(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRIsCompound, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    OSRIsGeocentric(OGRSpatialReferenceH hSRS) -> int

Check if geocentric coordinate system.
"""
function isgeocentric(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRIsGeocentric, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    OSRIsVertical(OGRSpatialReferenceH hSRS) -> int

Check if vertical coordinate system.
"""
function isvertical(arg1::Ref{OGRSpatialReferenceH})
    ccall((:OSRIsVertical, libgdal), Cint, (Ptr{Cvoid},), arg1)
end


"""
    OSRIsSameGeogCS(OGRSpatialReferenceH hSRS1,
                    OGRSpatialReferenceH hSRS2) -> int

Do the GeogCS'es match?
"""
function issamegeogcs(arg1::Ref{OGRSpatialReferenceH}, arg2::Ref{OGRSpatialReferenceH})
    ccall((:OSRIsSameGeogCS, libgdal), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    OSRIsSameVertCS(OGRSpatialReferenceH hSRS1,
                    OGRSpatialReferenceH hSRS2) -> int

Do the VertCS'es match?
"""
function issamevertcs(arg1::Ref{OGRSpatialReferenceH}, arg2::Ref{OGRSpatialReferenceH})
    ccall((:OSRIsSameVertCS, libgdal), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    OSRIsSame(OGRSpatialReferenceH hSRS1,
              OGRSpatialReferenceH hSRS2) -> int

Do these two spatial references describe the same system ?
"""
function issame(arg1::Ref{OGRSpatialReferenceH}, arg2::Ref{OGRSpatialReferenceH})
    ccall((:OSRIsSame, libgdal), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), arg1, arg2)
end


"""
    OSRSetLocalCS(OGRSpatialReferenceH hSRS,
                  const char * pszName) -> OGRErr

Set the user visible LOCAL_CS name.
"""
function setlocalcs(hSRS::Ref{OGRSpatialReferenceH}, pszName)
    ccall((:OSRSetLocalCS, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), hSRS, pszName)
end


"""
    OSRSetProjCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function setprojcs(hSRS::Ref{OGRSpatialReferenceH}, pszName)
    ccall((:OSRSetProjCS, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), hSRS, pszName)
end


"""
    OSRSetGeocCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function setgeoccs(hSRS::Ref{OGRSpatialReferenceH}, pszName)
    ccall((:OSRSetGeocCS, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), hSRS, pszName)
end


"""
    OSRSetWellKnownGeogCS(OGRSpatialReferenceH hSRS,
                          const char * pszName) -> OGRErr

Set a GeogCS based on well known name.
"""
function setwellknowngeogcs(hSRS::Ref{OGRSpatialReferenceH}, pszName)
    ccall((:OSRSetWellKnownGeogCS, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), hSRS, pszName)
end


"""
    OSRSetFromUserInput(OGRSpatialReferenceH hSRS,
                        const char * pszDef) -> OGRErr

Set spatial reference from various text formats.
"""
function setfromuserinput(hSRS::Ref{OGRSpatialReferenceH}, arg1)
    ccall((:OSRSetFromUserInput, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), hSRS, arg1)
end


"""
    OSRCopyGeogCSFrom(OGRSpatialReferenceH hSRS,
                      const OGRSpatialReferenceH hSrcSRS) -> OGRErr

Copy GEOGCS from another OGRSpatialReference.
"""
function copygeogcsfrom(hSRS::Ref{OGRSpatialReferenceH}, hSrcSRS::Ref{OGRSpatialReferenceH})
    ccall((:OSRCopyGeogCSFrom, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cvoid}), hSRS, hSrcSRS)
end


"""
    OSRSetTOWGS84(OGRSpatialReferenceH hSRS,
                  double dfDX,
                  double dfDY,
                  double dfDZ,
                  double dfEX,
                  double dfEY,
                  double dfEZ,
                  double dfPPM) -> OGRErr

Set the Bursa-Wolf conversion to WGS84.
"""
function settowgs84(hSRS::Ref{OGRSpatialReferenceH}, arg1::Real, arg2::Real, arg3::Real, arg4::Real, arg5::Real, arg6::Real, arg7::Real)
    ccall((:OSRSetTOWGS84, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
end


"""
    OSRGetTOWGS84(OGRSpatialReferenceH hSRS,
                  double * padfCoeff,
                  int nCoeffCount) -> OGRErr

Fetch TOWGS84 parameters, if available.
"""
function gettowgs84(hSRS::Ref{OGRSpatialReferenceH}, arg1, arg2::Integer)
    ccall((:OSRGetTOWGS84, libgdal), OGRErr, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), hSRS, arg1, arg2)
end


"""
    OSRSetCompoundCS(OGRSpatialReferenceH hSRS,
                     const char * pszName,
                     OGRSpatialReferenceH hHorizSRS,
                     OGRSpatialReferenceH hVertSRS) -> OGRErr

Setup a compound coordinate system.
"""
function setcompoundcs(hSRS::Ref{OGRSpatialReferenceH}, pszName, hHorizSRS::Ref{OGRSpatialReferenceH}, hVertSRS::Ref{OGRSpatialReferenceH})
    ccall((:OSRSetCompoundCS, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Ptr{Cvoid}, Ptr{Cvoid}), hSRS, pszName, hHorizSRS, hVertSRS)
end


"""
    OSRSetGeogCS(OGRSpatialReferenceH hSRS,
                 const char * pszGeogName,
                 const char * pszDatumName,
                 const char * pszSpheroidName,
                 double dfSemiMajor,
                 double dfInvFlattening,
                 const char * pszPMName,
                 double dfPMOffset,
                 const char * pszAngularUnits,
                 double dfConvertToRadians) -> OGRErr

Set geographic coordinate system.
"""
function setgeogcs(hSRS::Ref{OGRSpatialReferenceH}, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor::Real, dfInvFlattening::Real, pszPMName, dfPMOffset::Real, pszUnits, dfConvertToRadians::Real)
    ccall((:OSRSetGeogCS, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring, Cstring, Cdouble, Cdouble, Cstring, Cdouble, Cstring, Cdouble), hSRS, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor, dfInvFlattening, pszPMName, dfPMOffset, pszUnits, dfConvertToRadians)
end


"""
    OSRSetVertCS(OGRSpatialReferenceH hSRS,
                 const char * pszVertCSName,
                 const char * pszVertDatumName,
                 int nVertDatumType) -> OGRErr

Setup the vertical coordinate system.
"""
function setvertcs(hSRS::Ref{OGRSpatialReferenceH}, pszVertCSName, pszVertDatumName, nVertDatumType::Integer)
    ccall((:OSRSetVertCS, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring, Cint), hSRS, pszVertCSName, pszVertDatumName, nVertDatumType)
end


"""
    OSRGetSemiMajor(OGRSpatialReferenceH hSRS,
                    OGRErr * pnErr) -> double

Get spheroid semi major axis.
"""
function getsemimajor(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRGetSemiMajor, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{OGRErr}), arg1, arg2)
end


"""
    OSRGetSemiMinor(OGRSpatialReferenceH hSRS,
                    OGRErr * pnErr) -> double

Get spheroid semi minor axis.
"""
function getsemiminor(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRGetSemiMinor, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{OGRErr}), arg1, arg2)
end


"""
    OSRGetInvFlattening(OGRSpatialReferenceH hSRS,
                        OGRErr * pnErr) -> double

Get spheroid inverse flattening.
"""
function getinvflattening(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRGetInvFlattening, libgdal), Cdouble, (Ptr{Cvoid}, Ptr{OGRErr}), arg1, arg2)
end


"""
    OSRSetAuthority(OGRSpatialReferenceH hSRS,
                    const char * pszTargetKey,
                    const char * pszAuthority,
                    int nCode) -> OGRErr

Set the authority for a node.
"""
function setauthority(hSRS::Ref{OGRSpatialReferenceH}, pszTargetKey, pszAuthority, nCode::Integer)
    ccall((:OSRSetAuthority, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring, Cint), hSRS, pszTargetKey, pszAuthority, nCode)
end


"""
    OSRGetAuthorityCode(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority code for a node.
"""
function getauthoritycode(hSRS::Ref{OGRSpatialReferenceH}, pszTargetKey)
    unsafe_string(ccall((:OSRGetAuthorityCode, libgdal), Cstring, (Ptr{Cvoid}, Cstring), hSRS, pszTargetKey))
end


"""
    OSRGetAuthorityName(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority name for a node.
"""
function getauthorityname(hSRS::Ref{OGRSpatialReferenceH}, pszTargetKey)
    unsafe_string(ccall((:OSRGetAuthorityName, libgdal), Cstring, (Ptr{Cvoid}, Cstring), hSRS, pszTargetKey))
end


"""
    OSRSetProjection(OGRSpatialReferenceH hSRS,
                     const char * pszProjection) -> OGRErr

Set a projection name.
"""
function setprojection(arg1::Ref{OGRSpatialReferenceH}, arg2)
    ccall((:OSRSetProjection, libgdal), OGRErr, (Ptr{Cvoid}, Cstring), arg1, arg2)
end


"""
    OSRSetProjParm(OGRSpatialReferenceH hSRS,
                   const char * pszParmName,
                   double dfValue) -> OGRErr

Set a projection parameter value.
"""
function setprojparm(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3::Real)
    ccall((:OSRSetProjParm, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRGetProjParm(OGRSpatialReferenceH hSRS,
                   const char * pszName,
                   double dfDefaultValue,
                   OGRErr * pnErr) -> double

Fetch a projection parameter value.
"""
function getprojparm(hSRS::Ref{OGRSpatialReferenceH}, pszParmName, dfDefault::Real, arg1)
    ccall((:OSRGetProjParm, libgdal), Cdouble, (Ptr{Cvoid}, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg1)
end


"""
    OSRSetNormProjParm(OGRSpatialReferenceH hSRS,
                       const char * pszParmName,
                       double dfValue) -> OGRErr

Set a projection parameter with a normalized value.
"""
function setnormprojparm(arg1::Ref{OGRSpatialReferenceH}, arg2, arg3::Real)
    ccall((:OSRSetNormProjParm, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRGetNormProjParm(OGRSpatialReferenceH hSRS,
                       const char * pszName,
                       double dfDefaultValue,
                       OGRErr * pnErr) -> double

This function is the same as OGRSpatialReference::
"""
function getnormprojparm(hSRS::Ref{OGRSpatialReferenceH}, pszParmName, dfDefault::Real, arg1)
    ccall((:OSRGetNormProjParm, libgdal), Cdouble, (Ptr{Cvoid}, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg1)
end


"""
    OSRSetUTM(OGRSpatialReferenceH hSRS,
              int nZone,
              int bNorth) -> OGRErr

Set UTM projection definition.
"""
function setutm(hSRS::Ref{OGRSpatialReferenceH}, nZone::Integer, bNorth::Integer)
    ccall((:OSRSetUTM, libgdal), OGRErr, (Ptr{Cvoid}, Cint, Cint), hSRS, nZone, bNorth)
end


"""
    OSRGetUTMZone(OGRSpatialReferenceH hSRS,
                  int * pbNorth) -> int

Get utm zone information.
"""
function getutmzone(hSRS::Ref{OGRSpatialReferenceH}, pbNorth)
    ccall((:OSRGetUTMZone, libgdal), Cint, (Ptr{Cvoid}, Ptr{Cint}), hSRS, pbNorth)
end


"""
    OSRSetStatePlane(OGRSpatialReferenceH hSRS,
                     int nZone,
                     int bNAD83) -> OGRErr

Set State Plane projection definition.
"""
function setstateplane(hSRS::Ref{OGRSpatialReferenceH}, nZone::Integer, bNAD83::Integer)
    ccall((:OSRSetStatePlane, libgdal), OGRErr, (Ptr{Cvoid}, Cint, Cint), hSRS, nZone, bNAD83)
end


"""
    OSRSetStatePlaneWithUnits(OGRSpatialReferenceH hSRS,
                              int nZone,
                              int bNAD83,
                              const char * pszOverrideUnitName,
                              double dfOverrideUnit) -> OGRErr

Set State Plane projection definition.
"""
function setstateplanewithunits(hSRS::Ref{OGRSpatialReferenceH}, nZone::Integer, bNAD83::Integer, pszOverrideUnitName, dfOverrideUnit::Real)
    ccall((:OSRSetStatePlaneWithUnits, libgdal), OGRErr, (Ptr{Cvoid}, Cint, Cint, Cstring, Cdouble), hSRS, nZone, bNAD83, pszOverrideUnitName, dfOverrideUnit)
end


"""
    OSRAutoIdentifyEPSG(OGRSpatialReferenceH hSRS) -> OGRErr

Set EPSG authority info if possible.
"""
function autoidentifyepsg(hSRS::Ref{OGRSpatialReferenceH})
    ccall((:OSRAutoIdentifyEPSG, libgdal), OGRErr, (Ptr{Cvoid},), hSRS)
end


"""
    OSREPSGTreatsAsLatLong(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this geographic coordinate system should be treated as having lat/long coordinate ordering.
"""
function epsgtreatsaslatlong(hSRS::Ref{OGRSpatialReferenceH})
    ccall((:OSREPSGTreatsAsLatLong, libgdal), Cint, (Ptr{Cvoid},), hSRS)
end


"""
    OSREPSGTreatsAsNorthingEasting(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this geographic coordinate system should be treated as having northing/easting coordinate ordering.
"""
function epsgtreatsasnorthingeasting(hSRS::Ref{OGRSpatialReferenceH})
    ccall((:OSREPSGTreatsAsNorthingEasting, libgdal), Cint, (Ptr{Cvoid},), hSRS)
end


"""
    OSRGetAxis(OGRSpatialReferenceH hSRS,
               const char * pszTargetKey,
               int iAxis,
               OGRAxisOrientation * peOrientation) -> const char *

Fetch the orientation of one axis.
"""
function getaxis(hSRS::Ref{OGRSpatialReferenceH}, pszTargetKey, iAxis::Integer, peOrientation)
    unsafe_string(ccall((:OSRGetAxis, libgdal), Cstring, (Ptr{Cvoid}, Cstring, Cint, Ptr{OGRAxisOrientation}), hSRS, pszTargetKey, iAxis, peOrientation))
end


"""
    OSRSetAxes(OGRSpatialReferenceH hSRS,
               const char * pszTargetKey,
               const char * pszXAxisName,
               OGRAxisOrientation eXAxisOrientation,
               const char * pszYAxisName,
               OGRAxisOrientation eYAxisOrientation) -> OGRErr

Set the axes for a coordinate system.
"""
function setaxes(hSRS::Ref{OGRSpatialReferenceH}, pszTargetKey, pszXAxisName, eXAxisOrientation::OGRAxisOrientation, pszYAxisName, eYAxisOrientation::OGRAxisOrientation)
    ccall((:OSRSetAxes, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cstring, OGRAxisOrientation, Cstring, OGRAxisOrientation), hSRS, pszTargetKey, pszXAxisName, eXAxisOrientation, pszYAxisName, eYAxisOrientation)
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
function setacea(hSRS::Ref{OGRSpatialReferenceH}, dfStdP1::Real, dfStdP2::Real, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetACEA, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetAE(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Azimuthal Equidistant.
"""
function setae(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetAE, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetBonne(OGRSpatialReferenceH hSRS,
                double dfStdP1,
                double dfCentralMeridian,
                double dfFalseEasting,
                double dfFalseNorthing) -> OGRErr

Bonne.
"""
function setbonne(hSRS::Ref{OGRSpatialReferenceH}, dfStandardParallel::Real, dfCentralMeridian::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetBonne, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStandardParallel, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetCEA(OGRSpatialReferenceH hSRS,
              double dfStdP1,
              double dfCentralMeridian,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Cylindrical Equal Area.
"""
function setcea(hSRS::Ref{OGRSpatialReferenceH}, dfStdP1::Real, dfCentralMeridian::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetCEA, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetCS(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Cassini-Soldner.
"""
function setcs(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetCS, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function setec(hSRS::Ref{OGRSpatialReferenceH}, dfStdP1::Real, dfStdP2::Real, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetEC, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetEckert(OGRSpatialReferenceH hSRS,
                 int nVariation,
                 double dfCentralMeridian,
                 double dfFalseEasting,
                 double dfFalseNorthing) -> OGRErr

Eckert I-VI.
"""
function seteckert(hSRS::Ref{OGRSpatialReferenceH}, nVariation::Integer, dfCentralMeridian::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetEckert, libgdal), OGRErr, (Ptr{Cvoid}, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetEckertIV(OGRSpatialReferenceH hSRS,
                   double dfCentralMeridian,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Eckert IV.
"""
function seteckertiv(hSRS::Ref{OGRSpatialReferenceH}, dfCentralMeridian::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetEckertIV, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetEckertVI(OGRSpatialReferenceH hSRS,
                   double dfCentralMeridian,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Eckert VI.
"""
function seteckertvi(hSRS::Ref{OGRSpatialReferenceH}, dfCentralMeridian::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetEckertVI, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetEquirectangular(OGRSpatialReferenceH hSRS,
                          double dfCenterLat,
                          double dfCenterLong,
                          double dfFalseEasting,
                          double dfFalseNorthing) -> OGRErr

Equirectangular.
"""
function setequirectangular(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetEquirectangular, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetEquirectangular2(OGRSpatialReferenceH hSRS,
                           double dfCenterLat,
                           double dfCenterLong,
                           double dfStdParallel1,
                           double dfFalseEasting,
                           double dfFalseNorthing) -> OGRErr

Equirectangular generalized form.
"""
function setequirectangular2(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfPseudoStdParallel1::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetEquirectangular2, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetGS(OGRSpatialReferenceH hSRS,
             double dfCentralMeridian,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Gall Stereograpic.
"""
function setgs(hSRS::Ref{OGRSpatialReferenceH}, dfCentralMeridian::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetGS, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetGH(OGRSpatialReferenceH hSRS,
             double dfCentralMeridian,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Goode Homolosine.
"""
function setgh(hSRS::Ref{OGRSpatialReferenceH}, dfCentralMeridian::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetGH, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetIGH(OGRSpatialReferenceH hSRS) -> OGRErr

Interrupted Goode Homolosine.
"""
function setigh(hSRS::Ref{OGRSpatialReferenceH})
    ccall((:OSRSetIGH, libgdal), OGRErr, (Ptr{Cvoid},), hSRS)
end


"""
    OSRSetGEOS(OGRSpatialReferenceH hSRS,
               double dfCentralMeridian,
               double dfSatelliteHeight,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

GEOS - Geostationary Satellite View.
"""
function setgeos(hSRS::Ref{OGRSpatialReferenceH}, dfCentralMeridian::Real, dfSatelliteHeight::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetGEOS, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfSatelliteHeight, dfFalseEasting, dfFalseNorthing)
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
function setgaussschreibertmercator(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetGaussSchreiberTMercator, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetGnomonic(OGRSpatialReferenceH hSRS,
                   double dfCenterLat,
                   double dfCenterLong,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Gnomonic.
"""
function setgnomonic(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetGnomonic, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function setom(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfAzimuth::Real, dfRectToSkew::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetOM, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
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

Set a Hotine Oblique Mercator projection using azimuth angle.
"""
function sethom(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfAzimuth::Real, dfRectToSkew::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetHOM, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetHOMAC(OGRSpatialReferenceH hSRS,
                double dfCenterLat,
                double dfCenterLong,
                double dfAzimuth,
                double dfRectToSkew,
                double dfScale,
                double dfFalseEasting,
                double dfFalseNorthing) -> OGRErr

Set an Oblique Mercator projection using azimuth angle.
"""
function sethomac(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfAzimuth::Real, dfRectToSkew::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetHOMAC, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
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

Set a Hotine Oblique Mercator projection using two points on projection centerline.
"""
function sethom2pno(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfLat1::Real, dfLong1::Real, dfLat2::Real, dfLong2::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetHOM2PNO, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfLat1, dfLong1, dfLat2, dfLong2, dfScale, dfFalseEasting, dfFalseNorthing)
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
function setiwmpolyconic(hSRS::Ref{OGRSpatialReferenceH}, dfLat1::Real, dfLat2::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetIWMPolyconic, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLat1, dfLat2, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetKrovak(OGRSpatialReferenceH hSRS,
                 double dfCenterLat,
                 double dfCenterLong,
                 double dfAzimuth,
                 double dfPseudoStdParallel1,
                 double dfScale,
                 double dfFalseEasting,
                 double dfFalseNorthing) -> OGRErr

Krovak Oblique Conic Conformal.
"""
function setkrovak(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfAzimuth::Real, dfPseudoStdParallelLat::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetKrovak, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfPseudoStdParallelLat, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetLAEA(OGRSpatialReferenceH hSRS,
               double dfCenterLat,
               double dfCenterLong,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

Lambert Azimuthal Equal-Area.
"""
function setlaea(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetLAEA, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function setlcc(hSRS::Ref{OGRSpatialReferenceH}, dfStdP1::Real, dfStdP2::Real, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetLCC, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function setlcc1sp(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetLCC1SP, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function setlccb(hSRS::Ref{OGRSpatialReferenceH}, dfStdP1::Real, dfStdP2::Real, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetLCCB, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetMC(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Miller Cylindrical.
"""
function setmc(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetMC, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function setmercator(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetMercator, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetMercator2SP(OGRSpatialReferenceH hSRS,
                      double dfStdP1,
                      double dfCenterLat,
                      double dfCenterLong,
                      double dfFalseEasting,
                      double dfFalseNorthing) -> OGRErr

Mercator 2SP.
"""
function setmercator2sp(hSRS::Ref{OGRSpatialReferenceH}, dfStdP1::Real, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetMercator2SP, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetMollweide(OGRSpatialReferenceH hSRS,
                    double dfCentralMeridian,
                    double dfFalseEasting,
                    double dfFalseNorthing) -> OGRErr

Mollweide.
"""
function setmollweide(hSRS::Ref{OGRSpatialReferenceH}, dfCentralMeridian::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetMollweide, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetNZMG(OGRSpatialReferenceH hSRS,
               double dfCenterLat,
               double dfCenterLong,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

New Zealand Map Grid.
"""
function setnzmg(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetNZMG, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function setos(hSRS::Ref{OGRSpatialReferenceH}, dfOriginLat::Real, dfCMeridian::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetOS, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfOriginLat, dfCMeridian, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetOrthographic(OGRSpatialReferenceH hSRS,
                       double dfCenterLat,
                       double dfCenterLong,
                       double dfFalseEasting,
                       double dfFalseNorthing) -> OGRErr

Orthographic.
"""
function setorthographic(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetOrthographic, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetPolyconic(OGRSpatialReferenceH hSRS,
                    double dfCenterLat,
                    double dfCenterLong,
                    double dfFalseEasting,
                    double dfFalseNorthing) -> OGRErr

Polyconic.
"""
function setpolyconic(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetPolyconic, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function setps(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetPS, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetRobinson(OGRSpatialReferenceH hSRS,
                   double dfCenterLong,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Robinson.
"""
function setrobinson(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetRobinson, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetSinusoidal(OGRSpatialReferenceH hSRS,
                     double dfCenterLong,
                     double dfFalseEasting,
                     double dfFalseNorthing) -> OGRErr

Sinusoidal.
"""
function setsinusoidal(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetSinusoidal, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetStereographic(OGRSpatialReferenceH hSRS,
                        double dfOriginLat,
                        double dfCMeridian,
                        double dfScale,
                        double dfFalseEasting,
                        double dfFalseNorthing) -> OGRErr

Stereographic.
"""
function setstereographic(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetStereographic, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetSOC(OGRSpatialReferenceH hSRS,
              double dfLatitudeOfOrigin,
              double dfCentralMeridian,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Swiss Oblique Cylindrical.
"""
function setsoc(hSRS::Ref{OGRSpatialReferenceH}, dfLatitudeOfOrigin::Real, dfCentralMeridian::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetSOC, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLatitudeOfOrigin, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
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
function settm(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetTM, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function settmvariant(hSRS::Ref{OGRSpatialReferenceH}, pszVariantName, dfCenterLat::Real, dfCenterLong::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetTMVariant, libgdal), OGRErr, (Ptr{Cvoid}, Cstring, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, pszVariantName, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetTMG(OGRSpatialReferenceH hSRS,
              double dfCenterLat,
              double dfCenterLong,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Tunesia Mining Grid.
"""
function settmg(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetTMG, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function settmso(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real, dfScale::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetTMSO, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetTPED(OGRSpatialReferenceH hSRS,
               double dfLat1,
               double dfLong1,
               double dfLat2,
               double dfLong2,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

TPED (Two Point Equi Distant)
"""
function settped(hSRS::Ref{OGRSpatialReferenceH}, dfLat1::Real, dfLong1::Real, dfLat2::Real, dfLong2::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetTPED, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetVDG(OGRSpatialReferenceH hSRS,
              double dfCentralMeridian,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

VanDerGrinten.
"""
function setvdg(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLong::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetVDG, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetWagner(OGRSpatialReferenceH hSRS,
                 int nVariation,
                 double dfCenterLat,
                 double dfFalseEasting,
                 double dfFalseNorthing) -> OGRErr

Wagner I  VII.
"""
function setwagner(hSRS::Ref{OGRSpatialReferenceH}, nVariation::Integer, dfCenterLat::Real, dfFalseEasting::Real, dfFalseNorthing::Real)
    ccall((:OSRSetWagner, libgdal), OGRErr, (Ptr{Cvoid}, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetQSC(OGRSpatialReferenceH hSRS,
              double dfCenterLat,
              double dfCenterLong) -> OGRErr

Quadrilateralized Spherical Cube.
"""
function setqsc(hSRS::Ref{OGRSpatialReferenceH}, dfCenterLat::Real, dfCenterLong::Real)
    ccall((:OSRSetQSC, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong)
end


"""
    OSRSetSCH(OGRSpatialReferenceH hSRS,
              double dfPegLat,
              double dfPegLong,
              double dfPegHeading,
              double dfPegHgt) -> OGRErr

Spherical, Cross-track, Height.
"""
function setsch(hSRS::Ref{OGRSpatialReferenceH}, dfPegLat::Real, dfPegLong::Real, dfPegHeading::Real, dfPegHgt::Real)
    ccall((:OSRSetSCH, libgdal), OGRErr, (Ptr{Cvoid}, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfPegLat, dfPegLong, dfPegHeading, dfPegHgt)
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
function calcinvflattening(dfSemiMajor::Real, dfSemiMinor::Real)
    ccall((:OSRCalcInvFlattening, libgdal), Cdouble, (Cdouble, Cdouble), dfSemiMajor, dfSemiMinor)
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
function calcsemiminorfrominvflattening(dfSemiMajor::Real, dfInvFlattening::Real)
    ccall((:OSRCalcSemiMinorFromInvFlattening, libgdal), Cdouble, (Cdouble, Cdouble), dfSemiMajor, dfInvFlattening)
end


"""
    OSRCleanup(void) -> void

Cleanup cached SRS related memory.
"""
function cleanup()
    ccall((:OSRCleanup, libgdal), Cvoid, ())
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
function octnewcoordinatetransformation(hSourceSRS::Ref{OGRSpatialReferenceH}, hTargetSRS::Ref{OGRSpatialReferenceH})
    failsafe(ccall((:OCTNewCoordinateTransformation, libgdal), Ptr{OGRCoordinateTransformationH}, (Ptr{Cvoid}, Ptr{Cvoid}), hSourceSRS, hTargetSRS))
end


"""
    OCTDestroyCoordinateTransformation(OGRCoordinateTransformationH hCT) -> void

OGRCoordinateTransformation destructor.

### Parameters
* **hCT**: the object to delete
"""
function octdestroycoordinatetransformation(arg1::Ref{OGRCoordinateTransformationH})
    ccall((:OCTDestroyCoordinateTransformation, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end


"""
    OCTTransform(OGRCoordinateTransformationH hTransform,
                 int nCount,
                 double * x,
                 double * y,
                 double * z) -> int

Transform an array of points.

### Parameters
* **hTransform**: Transformation object
* **nCount**: Number of points
* **x**: Array of nCount x values.
* **y**: Array of nCount y values.
* **z**: Array of nCount z values.

### Returns
TRUE or FALSE
"""
function octtransform(hCT::Ref{OGRCoordinateTransformationH}, nCount::Integer, x, y, z)
    ccall((:OCTTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), hCT, nCount, x, y, z)
end


"""
    OCTTransformEx(OGRCoordinateTransformationH hTransform,
                   int nCount,
                   double * x,
                   double * y,
                   double * z,
                   int * pabSuccess) -> int

Transform an array of points.

### Parameters
* **hTransform**: Transformation object
* **nCount**: Number of points
* **x**: Array of nCount x values.
* **y**: Array of nCount y values.
* **z**: Array of nCount z values.
* **pabSuccess**: Output array of nCount value that will be set to TRUE/FALSE

### Returns
TRUE or FALSE
"""
function octtransformex(hCT::Ref{OGRCoordinateTransformationH}, nCount::Integer, x, y, z, pabSuccess)
    ccall((:OCTTransformEx, libgdal), Cint, (Ptr{Cvoid}, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), hCT, nCount, x, y, z, pabSuccess)
end


"""
    OCTProj4Normalize(const char * pszProj4Src) -> char *
"""
function octproj4normalize(pszProj4Src)
    unsafe_string(ccall((:OCTProj4Normalize, libgdal), Cstring, (Cstring,), pszProj4Src))
end


"""
    OCTCleanupProjMutex() -> void
"""
function octcleanupprojmutex()
    ccall((:OCTCleanupProjMutex, libgdal), Cvoid, ())
end


"""
    OPTGetProjectionMethods() -> char **

Fetch list of possible projection methods.

### Returns
Returns NULL terminated list of projection methods. This should be freed with CSLDestroy() when no longer needed.
"""
function optgetprojectionmethods()
    unsafe_loadstringlist(ccall((:OPTGetProjectionMethods, libgdal), Ptr{Cstring}, ()))
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
function optgetparameterlist(pszProjectionMethod, ppszUserName)
    unsafe_loadstringlist(ccall((:OPTGetParameterList, libgdal), Ptr{Cstring}, (Cstring, Ptr{Cstring}), pszProjectionMethod, ppszUserName))
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
function optgetparameterinfo(pszProjectionMethod, pszParameterName, ppszUserName, ppszType, pdfDefaultValue)
    ccall((:OPTGetParameterInfo, libgdal), Cint, (Cstring, Cstring, Ptr{Cstring}, Ptr{Cstring}, Ptr{Cdouble}), pszProjectionMethod, pszParameterName, ppszUserName, ppszType, pdfDefaultValue)
end
