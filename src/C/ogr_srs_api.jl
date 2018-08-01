# Julia wrapper for header: /usr/local/include/ogr_srs_api.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0



"""
    OSRAxisEnumToName(OGRAxisOrientation eOrientation) -> const char *

Return the string representation for the OGRAxisOrientation enumeration.

### Returns
an internal string
"""
function OSRAxisEnumToName(eOrientation::OGRAxisOrientation)
    ccall((:OSRAxisEnumToName, libgdal), Cstring, (OGRAxisOrientation,), eOrientation)
end


"""
    OSRNewSpatialReference(const char * pszWKT) -> OGRSpatialReferenceH

Constructor.
"""
function OSRNewSpatialReference(arg1)
    ccall((:OSRNewSpatialReference, libgdal), OGRSpatialReferenceH, (Cstring,), arg1)
end


"""
    OSRCloneGeogCS(OGRSpatialReferenceH hSource) -> OGRSpatialReferenceH

Make a duplicate of the GEOGCS node of this OGRSpatialReference object.
"""
function OSRCloneGeogCS(arg1::OGRSpatialReferenceH)
    ccall((:OSRCloneGeogCS, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRClone(OGRSpatialReferenceH hSRS) -> OGRSpatialReferenceH

Make a duplicate of this OGRSpatialReference.
"""
function OSRClone(arg1::OGRSpatialReferenceH)
    ccall((:OSRClone, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRDestroySpatialReference(OGRSpatialReferenceH hSRS) -> void

OGRSpatialReference destructor.

### Parameters
* **hSRS**: the object to delete
"""
function OSRDestroySpatialReference(arg1::OGRSpatialReferenceH)
    ccall((:OSRDestroySpatialReference, libgdal), Cvoid, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRReference(OGRSpatialReferenceH hSRS) -> int

Increments the reference count by one.
"""
function OSRReference(arg1::OGRSpatialReferenceH)
    ccall((:OSRReference, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRDereference(OGRSpatialReferenceH hSRS) -> int

Decrements the reference count by one.
"""
function OSRDereference(arg1::OGRSpatialReferenceH)
    ccall((:OSRDereference, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRRelease(OGRSpatialReferenceH hSRS) -> void

Decrements the reference count by one, and destroy if zero.
"""
function OSRRelease(arg1::OGRSpatialReferenceH)
    ccall((:OSRRelease, libgdal), Cvoid, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRValidate(OGRSpatialReferenceH) -> OGRErr

Validate SRS tokens.
"""
function OSRValidate(arg1::OGRSpatialReferenceH)
    ccall((:OSRValidate, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRFixupOrdering(OGRSpatialReferenceH hSRS) -> OGRErr

Correct parameter ordering to match CT Specification.
"""
function OSRFixupOrdering(arg1::OGRSpatialReferenceH)
    ccall((:OSRFixupOrdering, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRFixup(OGRSpatialReferenceH hSRS) -> OGRErr

Fixup as needed.
"""
function OSRFixup(arg1::OGRSpatialReferenceH)
    ccall((:OSRFixup, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRStripCTParms(OGRSpatialReferenceH hSRS) -> OGRErr

Strip OGC CT Parameters.
"""
function OSRStripCTParms(arg1::OGRSpatialReferenceH)
    ccall((:OSRStripCTParms, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRImportFromEPSG(OGRSpatialReferenceH hSRS,
                      int nCode) -> OGRErr

Initialize SRS based on EPSG GCS or PCS code.
"""
function OSRImportFromEPSG(arg1::OGRSpatialReferenceH, arg2::Cint)
    ccall((:OSRImportFromEPSG, libgdal), OGRErr, (OGRSpatialReferenceH, Cint), arg1, arg2)
end


"""
    OSRImportFromEPSGA(OGRSpatialReferenceH hSRS,
                       int nCode) -> OGRErr

Initialize SRS based on EPSG GCS or PCS code.
"""
function OSRImportFromEPSGA(arg1::OGRSpatialReferenceH, arg2::Cint)
    ccall((:OSRImportFromEPSGA, libgdal), OGRErr, (OGRSpatialReferenceH, Cint), arg1, arg2)
end


"""
    OSRImportFromWkt(OGRSpatialReferenceH hSRS,
                     char ** ppszInput) -> OGRErr

Import from WKT string.
"""
function OSRImportFromWkt(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRImportFromWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRImportFromProj4(OGRSpatialReferenceH,
                       const char *) -> OGRErr

Import PROJ.4 coordinate string.
"""
function OSRImportFromProj4(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRImportFromProj4, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
end


"""
    OSRImportFromESRI(OGRSpatialReferenceH,
                      char **) -> OGRErr

Import coordinate system from ESRI .prj format(s).
"""
function OSRImportFromESRI(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRImportFromESRI, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRImportFromPCI(OGRSpatialReferenceH hSRS,
                     const char *,
                     const char *,
                     double *) -> OGRErr

Import coordinate system from PCI projection definition.
"""
function OSRImportFromPCI(hSRS::OGRSpatialReferenceH, arg1, arg2, arg3)
    ccall((:OSRImportFromPCI, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Ptr{Cdouble}), hSRS, arg1, arg2, arg3)
end


"""
    OSRImportFromUSGS(OGRSpatialReferenceH,
                      long,
                      long,
                      double *,
                      long) -> OGRErr

Import coordinate system from USGS projection definition.
"""
function OSRImportFromUSGS(arg1::OGRSpatialReferenceH, arg2::Clong, arg3::Clong, arg4, arg5::Clong)
    ccall((:OSRImportFromUSGS, libgdal), OGRErr, (OGRSpatialReferenceH, Clong, Clong, Ptr{Cdouble}, Clong), arg1, arg2, arg3, arg4, arg5)
end


"""
    OSRImportFromXML(OGRSpatialReferenceH,
                     const char *) -> OGRErr

Import coordinate system from XML format (GML only currently).
"""
function OSRImportFromXML(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRImportFromXML, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
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
function OSRImportFromDict(arg1::OGRSpatialReferenceH, arg2, arg3)
    ccall((:OSRImportFromDict, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring), arg1, arg2, arg3)
end


"""
    OSRImportFromPanorama(OGRSpatialReferenceH,
                          long,
                          long,
                          long,
                          double *) -> OGRErr

Import coordinate system from "Panorama" GIS projection definition.
"""
function OSRImportFromPanorama(arg1::OGRSpatialReferenceH, arg2::Clong, arg3::Clong, arg4::Clong, arg5)
    ccall((:OSRImportFromPanorama, libgdal), OGRErr, (OGRSpatialReferenceH, Clong, Clong, Clong, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5)
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
function OSRImportFromOzi(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRImportFromOzi, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRImportFromMICoordSys(OGRSpatialReferenceH hSRS,
                            const char * pszCoordSys) -> OGRErr

Import Mapinfo style CoordSys definition.
"""
function OSRImportFromMICoordSys(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRImportFromMICoordSys, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
end


"""
    OSRImportFromERM(OGRSpatialReferenceH,
                     const char *,
                     const char *,
                     const char *) -> OGRErr

Create OGR WKT from ERMapper projection definitions.
"""
function OSRImportFromERM(arg1::OGRSpatialReferenceH, arg2, arg3, arg4)
    ccall((:OSRImportFromERM, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4)
end


"""
    OSRImportFromUrl(OGRSpatialReferenceH hSRS,
                     const char * pszUrl) -> OGRErr

Set spatial reference from a URL.
"""
function OSRImportFromUrl(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRImportFromUrl, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
end


"""
    OSRExportToWkt(OGRSpatialReferenceH hSRS,
                   char ** ppszReturn) -> OGRErr

Convert this SRS into WKT format.
"""
function OSRExportToWkt(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRExportToWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRExportToPrettyWkt(OGRSpatialReferenceH hSRS,
                         char ** ppszReturn,
                         int bSimplify) -> OGRErr

Convert this SRS into a nicely formatted WKT string for display to a person.
"""
function OSRExportToPrettyWkt(arg1::OGRSpatialReferenceH, arg2, arg3::Cint)
    ccall((:OSRExportToPrettyWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Cint), arg1, arg2, arg3)
end


"""
    OSRExportToProj4(OGRSpatialReferenceH,
                     char **) -> OGRErr

Export coordinate system in PROJ.4 format.
"""
function OSRExportToProj4(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRExportToProj4, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRExportToPCI(OGRSpatialReferenceH,
                   char **,
                   char **,
                   double **) -> OGRErr

Export coordinate system in PCI projection definition.
"""
function OSRExportToPCI(arg1::OGRSpatialReferenceH, arg2, arg3, arg4)
    ccall((:OSRExportToPCI, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cstring}, Ptr{Ptr{Cdouble}}), arg1, arg2, arg3, arg4)
end


"""
    OSRExportToUSGS(OGRSpatialReferenceH,
                    long *,
                    long *,
                    double **,
                    long *) -> OGRErr

Export coordinate system in USGS GCTP projection definition.
"""
function OSRExportToUSGS(arg1::OGRSpatialReferenceH, arg2, arg3, arg4, arg5)
    ccall((:OSRExportToUSGS, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Clong}, Ptr{Clong}, Ptr{Ptr{Cdouble}}, Ptr{Clong}), arg1, arg2, arg3, arg4, arg5)
end


"""
    OSRExportToXML(OGRSpatialReferenceH,
                   char **,
                   const char *) -> OGRErr

Export coordinate system in XML format.
"""
function OSRExportToXML(arg1::OGRSpatialReferenceH, arg2, arg3)
    ccall((:OSRExportToXML, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Cstring), arg1, arg2, arg3)
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
function OSRExportToPanorama(arg1::OGRSpatialReferenceH, arg2, arg3, arg4, arg5, arg6)
    ccall((:OSRExportToPanorama, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5, arg6)
end


"""
    OSRExportToMICoordSys(OGRSpatialReferenceH hSRS,
                          char ** ppszReturn) -> OGRErr

Export coordinate system in Mapinfo style CoordSys format.
"""
function OSRExportToMICoordSys(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRExportToMICoordSys, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRExportToERM(OGRSpatialReferenceH,
                   char *,
                   char *,
                   char *) -> OGRErr

Convert coordinate system to ERMapper format.
"""
function OSRExportToERM(arg1::OGRSpatialReferenceH, arg2, arg3, arg4)
    ccall((:OSRExportToERM, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4)
end


"""
    OSRMorphToESRI(OGRSpatialReferenceH) -> OGRErr

Convert in place to ESRI WKT format.
"""
function OSRMorphToESRI(arg1::OGRSpatialReferenceH)
    ccall((:OSRMorphToESRI, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRMorphFromESRI(OGRSpatialReferenceH) -> OGRErr

Convert in place from ESRI WKT format.
"""
function OSRMorphFromESRI(arg1::OGRSpatialReferenceH)
    ccall((:OSRMorphFromESRI, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRSetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszPath,
                    const char * pszValue) -> OGRErr

Set attribute value in spatial reference.
"""
function OSRSetAttrValue(hSRS::OGRSpatialReferenceH, pszNodePath, pszNewNodeValue)
    ccall((:OSRSetAttrValue, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring), hSRS, pszNodePath, pszNewNodeValue)
end


"""
    OSRGetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszKey,
                    int iChild) -> const char *

Fetch indicated attribute of named node.
"""
function OSRGetAttrValue(hSRS::OGRSpatialReferenceH, pszName, iChild::Cint)
    ccall((:OSRGetAttrValue, libgdal), Cstring, (OGRSpatialReferenceH, Cstring, Cint), hSRS, pszName, iChild)
end


"""
    OSRSetAngularUnits(OGRSpatialReferenceH hSRS,
                       const char * pszUnits,
                       double dfInRadians) -> OGRErr

Set the angular units for the geographic coordinate system.
"""
function OSRSetAngularUnits(arg1::OGRSpatialReferenceH, arg2, arg3::Cdouble)
    ccall((:OSRSetAngularUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRGetAngularUnits(OGRSpatialReferenceH hSRS,
                       char ** ppszName) -> double

Fetch angular geographic coordinate system units.
"""
function OSRGetAngularUnits(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRGetAngularUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRSetLinearUnits(OGRSpatialReferenceH hSRS,
                      const char * pszUnits,
                      double dfInMeters) -> OGRErr

Set the linear units for the projection.
"""
function OSRSetLinearUnits(arg1::OGRSpatialReferenceH, arg2, arg3::Cdouble)
    ccall((:OSRSetLinearUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRSetTargetLinearUnits(OGRSpatialReferenceH hSRS,
                            const char * pszTargetKey,
                            const char * pszUnits,
                            double dfInMeters) -> OGRErr

Set the linear units for the target node.
"""
function OSRSetTargetLinearUnits(arg1::OGRSpatialReferenceH, arg2, arg3, arg4::Cdouble)
    ccall((:OSRSetTargetLinearUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cdouble), arg1, arg2, arg3, arg4)
end


"""
    OSRSetLinearUnitsAndUpdateParameters(OGRSpatialReferenceH hSRS,
                                         const char * pszUnits,
                                         double dfInMeters) -> OGRErr

Set the linear units for the projection.
"""
function OSRSetLinearUnitsAndUpdateParameters(arg1::OGRSpatialReferenceH, arg2, arg3::Cdouble)
    ccall((:OSRSetLinearUnitsAndUpdateParameters, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRGetLinearUnits(OGRSpatialReferenceH hSRS,
                      char ** ppszName) -> double

Fetch linear projection units.
"""
function OSRGetLinearUnits(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRGetLinearUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRGetTargetLinearUnits(OGRSpatialReferenceH hSRS,
                            const char * pszTargetKey,
                            char ** ppszName) -> double

Fetch linear projection units.
"""
function OSRGetTargetLinearUnits(arg1::OGRSpatialReferenceH, arg2, arg3)
    ccall((:OSRGetTargetLinearUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Ptr{Cstring}), arg1, arg2, arg3)
end


"""
    OSRGetPrimeMeridian(OGRSpatialReferenceH hSRS,
                        char ** ppszName) -> double

Fetch prime meridian info.
"""
function OSRGetPrimeMeridian(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRGetPrimeMeridian, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end


"""
    OSRIsGeographic(OGRSpatialReferenceH hSRS) -> int

Check if geographic coordinate system.
"""
function OSRIsGeographic(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsGeographic, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRIsLocal(OGRSpatialReferenceH hSRS) -> int

Check if local coordinate system.
"""
function OSRIsLocal(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsLocal, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRIsProjected(OGRSpatialReferenceH hSRS) -> int

Check if projected coordinate system.
"""
function OSRIsProjected(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsProjected, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRIsCompound(OGRSpatialReferenceH hSRS) -> int

Check if the coordinate system is compound.
"""
function OSRIsCompound(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsCompound, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRIsGeocentric(OGRSpatialReferenceH hSRS) -> int

Check if geocentric coordinate system.
"""
function OSRIsGeocentric(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsGeocentric, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRIsVertical(OGRSpatialReferenceH hSRS) -> int

Check if vertical coordinate system.
"""
function OSRIsVertical(arg1::OGRSpatialReferenceH)
    ccall((:OSRIsVertical, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end


"""
    OSRIsSameGeogCS(OGRSpatialReferenceH hSRS1,
                    OGRSpatialReferenceH hSRS2) -> int

Do the GeogCS'es match?
"""
function OSRIsSameGeogCS(arg1::OGRSpatialReferenceH, arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSameGeogCS, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2)
end


"""
    OSRIsSameVertCS(OGRSpatialReferenceH hSRS1,
                    OGRSpatialReferenceH hSRS2) -> int

Do the VertCS'es match?
"""
function OSRIsSameVertCS(arg1::OGRSpatialReferenceH, arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSameVertCS, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2)
end


"""
    OSRIsSame(OGRSpatialReferenceH hSRS1,
              OGRSpatialReferenceH hSRS2) -> int

Do these two spatial references describe the same system ?
"""
function OSRIsSame(arg1::OGRSpatialReferenceH, arg2::OGRSpatialReferenceH)
    ccall((:OSRIsSame, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2)
end


"""
    OSRSetLocalCS(OGRSpatialReferenceH hSRS,
                  const char * pszName) -> OGRErr

Set the user visible LOCAL_CS name.
"""
function OSRSetLocalCS(hSRS::OGRSpatialReferenceH, pszName)
    ccall((:OSRSetLocalCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName)
end


"""
    OSRSetProjCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function OSRSetProjCS(hSRS::OGRSpatialReferenceH, pszName)
    ccall((:OSRSetProjCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName)
end


"""
    OSRSetGeocCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function OSRSetGeocCS(hSRS::OGRSpatialReferenceH, pszName)
    ccall((:OSRSetGeocCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName)
end


"""
    OSRSetWellKnownGeogCS(OGRSpatialReferenceH hSRS,
                          const char * pszName) -> OGRErr

Set a GeogCS based on well known name.
"""
function OSRSetWellKnownGeogCS(hSRS::OGRSpatialReferenceH, pszName)
    ccall((:OSRSetWellKnownGeogCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName)
end


"""
    OSRSetFromUserInput(OGRSpatialReferenceH hSRS,
                        const char * pszDef) -> OGRErr

Set spatial reference from various text formats.
"""
function OSRSetFromUserInput(hSRS::OGRSpatialReferenceH, arg1)
    ccall((:OSRSetFromUserInput, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, arg1)
end


"""
    OSRCopyGeogCSFrom(OGRSpatialReferenceH hSRS,
                      const OGRSpatialReferenceH hSrcSRS) -> OGRErr

Copy GEOGCS from another OGRSpatialReference.
"""
function OSRCopyGeogCSFrom(hSRS::OGRSpatialReferenceH, hSrcSRS::OGRSpatialReferenceH)
    ccall((:OSRCopyGeogCSFrom, libgdal), OGRErr, (OGRSpatialReferenceH, OGRSpatialReferenceH), hSRS, hSrcSRS)
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
function OSRSetTOWGS84(hSRS::OGRSpatialReferenceH, arg1::Cdouble, arg2::Cdouble, arg3::Cdouble, arg4::Cdouble, arg5::Cdouble, arg6::Cdouble, arg7::Cdouble)
    ccall((:OSRSetTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
end


"""
    OSRGetTOWGS84(OGRSpatialReferenceH hSRS,
                  double * padfCoeff,
                  int nCoeffCount) -> OGRErr

Fetch TOWGS84 parameters, if available.
"""
function OSRGetTOWGS84(hSRS::OGRSpatialReferenceH, arg1, arg2::Cint)
    ccall((:OSRGetTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cdouble}, Cint), hSRS, arg1, arg2)
end


"""
    OSRSetCompoundCS(OGRSpatialReferenceH hSRS,
                     const char * pszName,
                     OGRSpatialReferenceH hHorizSRS,
                     OGRSpatialReferenceH hVertSRS) -> OGRErr

Setup a compound coordinate system.
"""
function OSRSetCompoundCS(hSRS::OGRSpatialReferenceH, pszName, hHorizSRS::OGRSpatialReferenceH, hVertSRS::OGRSpatialReferenceH)
    ccall((:OSRSetCompoundCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, OGRSpatialReferenceH, OGRSpatialReferenceH), hSRS, pszName, hHorizSRS, hVertSRS)
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
function OSRSetGeogCS(hSRS::OGRSpatialReferenceH, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor::Cdouble, dfInvFlattening::Cdouble, pszPMName, dfPMOffset::Cdouble, pszUnits, dfConvertToRadians::Cdouble)
    ccall((:OSRSetGeogCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring, Cdouble, Cdouble, Cstring, Cdouble, Cstring, Cdouble), hSRS, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor, dfInvFlattening, pszPMName, dfPMOffset, pszUnits, dfConvertToRadians)
end


"""
    OSRSetVertCS(OGRSpatialReferenceH hSRS,
                 const char * pszVertCSName,
                 const char * pszVertDatumName,
                 int nVertDatumType) -> OGRErr

Setup the vertical coordinate system.
"""
function OSRSetVertCS(hSRS::OGRSpatialReferenceH, pszVertCSName, pszVertDatumName, nVertDatumType::Cint)
    ccall((:OSRSetVertCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cint), hSRS, pszVertCSName, pszVertDatumName, nVertDatumType)
end


"""
    OSRGetSemiMajor(OGRSpatialReferenceH hSRS,
                    OGRErr * pnErr) -> double

Get spheroid semi major axis.
"""
function OSRGetSemiMajor(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRGetSemiMajor, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2)
end


"""
    OSRGetSemiMinor(OGRSpatialReferenceH hSRS,
                    OGRErr * pnErr) -> double

Get spheroid semi minor axis.
"""
function OSRGetSemiMinor(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRGetSemiMinor, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2)
end


"""
    OSRGetInvFlattening(OGRSpatialReferenceH hSRS,
                        OGRErr * pnErr) -> double

Get spheroid inverse flattening.
"""
function OSRGetInvFlattening(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRGetInvFlattening, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2)
end


"""
    OSRSetAuthority(OGRSpatialReferenceH hSRS,
                    const char * pszTargetKey,
                    const char * pszAuthority,
                    int nCode) -> OGRErr

Set the authority for a node.
"""
function OSRSetAuthority(hSRS::OGRSpatialReferenceH, pszTargetKey, pszAuthority, nCode::Cint)
    ccall((:OSRSetAuthority, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cint), hSRS, pszTargetKey, pszAuthority, nCode)
end


"""
    OSRGetAuthorityCode(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority code for a node.
"""
function OSRGetAuthorityCode(hSRS::OGRSpatialReferenceH, pszTargetKey)
    ccall((:OSRGetAuthorityCode, libgdal), Cstring, (OGRSpatialReferenceH, Cstring), hSRS, pszTargetKey)
end


"""
    OSRGetAuthorityName(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority name for a node.
"""
function OSRGetAuthorityName(hSRS::OGRSpatialReferenceH, pszTargetKey)
    ccall((:OSRGetAuthorityName, libgdal), Cstring, (OGRSpatialReferenceH, Cstring), hSRS, pszTargetKey)
end


"""
    OSRSetProjection(OGRSpatialReferenceH hSRS,
                     const char * pszProjection) -> OGRErr

Set a projection name.
"""
function OSRSetProjection(arg1::OGRSpatialReferenceH, arg2)
    ccall((:OSRSetProjection, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
end


"""
    OSRSetProjParm(OGRSpatialReferenceH hSRS,
                   const char * pszParmName,
                   double dfValue) -> OGRErr

Set a projection parameter value.
"""
function OSRSetProjParm(arg1::OGRSpatialReferenceH, arg2, arg3::Cdouble)
    ccall((:OSRSetProjParm, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRGetProjParm(OGRSpatialReferenceH hSRS,
                   const char * pszName,
                   double dfDefaultValue,
                   OGRErr * pnErr) -> double

Fetch a projection parameter value.
"""
function OSRGetProjParm(hSRS::OGRSpatialReferenceH, pszParmName, dfDefault::Cdouble, arg1)
    ccall((:OSRGetProjParm, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg1)
end


"""
    OSRSetNormProjParm(OGRSpatialReferenceH hSRS,
                       const char * pszParmName,
                       double dfValue) -> OGRErr

Set a projection parameter with a normalized value.
"""
function OSRSetNormProjParm(arg1::OGRSpatialReferenceH, arg2, arg3::Cdouble)
    ccall((:OSRSetNormProjParm, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end


"""
    OSRGetNormProjParm(OGRSpatialReferenceH hSRS,
                       const char * pszName,
                       double dfDefaultValue,
                       OGRErr * pnErr) -> double

This function is the same as OGRSpatialReference::
"""
function OSRGetNormProjParm(hSRS::OGRSpatialReferenceH, pszParmName, dfDefault::Cdouble, arg1)
    ccall((:OSRGetNormProjParm, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg1)
end


"""
    OSRSetUTM(OGRSpatialReferenceH hSRS,
              int nZone,
              int bNorth) -> OGRErr

Set UTM projection definition.
"""
function OSRSetUTM(hSRS::OGRSpatialReferenceH, nZone::Cint, bNorth::Cint)
    ccall((:OSRSetUTM, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint), hSRS, nZone, bNorth)
end


"""
    OSRGetUTMZone(OGRSpatialReferenceH hSRS,
                  int * pbNorth) -> int

Get utm zone information.
"""
function OSRGetUTMZone(hSRS::OGRSpatialReferenceH, pbNorth)
    ccall((:OSRGetUTMZone, libgdal), Cint, (OGRSpatialReferenceH, Ptr{Cint}), hSRS, pbNorth)
end


"""
    OSRSetStatePlane(OGRSpatialReferenceH hSRS,
                     int nZone,
                     int bNAD83) -> OGRErr

Set State Plane projection definition.
"""
function OSRSetStatePlane(hSRS::OGRSpatialReferenceH, nZone::Cint, bNAD83::Cint)
    ccall((:OSRSetStatePlane, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint), hSRS, nZone, bNAD83)
end


"""
    OSRSetStatePlaneWithUnits(OGRSpatialReferenceH hSRS,
                              int nZone,
                              int bNAD83,
                              const char * pszOverrideUnitName,
                              double dfOverrideUnit) -> OGRErr

Set State Plane projection definition.
"""
function OSRSetStatePlaneWithUnits(hSRS::OGRSpatialReferenceH, nZone::Cint, bNAD83::Cint, pszOverrideUnitName, dfOverrideUnit::Cdouble)
    ccall((:OSRSetStatePlaneWithUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint, Cstring, Cdouble), hSRS, nZone, bNAD83, pszOverrideUnitName, dfOverrideUnit)
end


"""
    OSRAutoIdentifyEPSG(OGRSpatialReferenceH hSRS) -> OGRErr

Set EPSG authority info if possible.
"""
function OSRAutoIdentifyEPSG(hSRS::OGRSpatialReferenceH)
    ccall((:OSRAutoIdentifyEPSG, libgdal), OGRErr, (OGRSpatialReferenceH,), hSRS)
end


"""
    OSREPSGTreatsAsLatLong(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this geographic coordinate system should be treated as having lat/long coordinate ordering.
"""
function OSREPSGTreatsAsLatLong(hSRS::OGRSpatialReferenceH)
    ccall((:OSREPSGTreatsAsLatLong, libgdal), Cint, (OGRSpatialReferenceH,), hSRS)
end


"""
    OSREPSGTreatsAsNorthingEasting(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this geographic coordinate system should be treated as having northing/easting coordinate ordering.
"""
function OSREPSGTreatsAsNorthingEasting(hSRS::OGRSpatialReferenceH)
    ccall((:OSREPSGTreatsAsNorthingEasting, libgdal), Cint, (OGRSpatialReferenceH,), hSRS)
end


"""
    OSRGetAxis(OGRSpatialReferenceH hSRS,
               const char * pszTargetKey,
               int iAxis,
               OGRAxisOrientation * peOrientation) -> const char *

Fetch the orientation of one axis.
"""
function OSRGetAxis(hSRS::OGRSpatialReferenceH, pszTargetKey, iAxis::Cint, peOrientation)
    ccall((:OSRGetAxis, libgdal), Cstring, (OGRSpatialReferenceH, Cstring, Cint, Ptr{OGRAxisOrientation}), hSRS, pszTargetKey, iAxis, peOrientation)
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
function OSRSetAxes(hSRS::OGRSpatialReferenceH, pszTargetKey, pszXAxisName, eXAxisOrientation::OGRAxisOrientation, pszYAxisName, eYAxisOrientation::OGRAxisOrientation)
    ccall((:OSRSetAxes, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, OGRAxisOrientation, Cstring, OGRAxisOrientation), hSRS, pszTargetKey, pszXAxisName, eXAxisOrientation, pszYAxisName, eYAxisOrientation)
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
function OSRSetACEA(hSRS::OGRSpatialReferenceH, dfStdP1::Cdouble, dfStdP2::Cdouble, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetACEA, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetAE(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Azimuthal Equidistant.
"""
function OSRSetAE(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetAE, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetBonne(OGRSpatialReferenceH hSRS,
                double dfStdP1,
                double dfCentralMeridian,
                double dfFalseEasting,
                double dfFalseNorthing) -> OGRErr

Bonne.
"""
function OSRSetBonne(hSRS::OGRSpatialReferenceH, dfStandardParallel::Cdouble, dfCentralMeridian::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetBonne, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStandardParallel, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetCEA(OGRSpatialReferenceH hSRS,
              double dfStdP1,
              double dfCentralMeridian,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Cylindrical Equal Area.
"""
function OSRSetCEA(hSRS::OGRSpatialReferenceH, dfStdP1::Cdouble, dfCentralMeridian::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetCEA, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetCS(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Cassini-Soldner.
"""
function OSRSetCS(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetEC(hSRS::OGRSpatialReferenceH, dfStdP1::Cdouble, dfStdP2::Cdouble, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetEC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetEckert(OGRSpatialReferenceH hSRS,
                 int nVariation,
                 double dfCentralMeridian,
                 double dfFalseEasting,
                 double dfFalseNorthing) -> OGRErr

Eckert I-VI.
"""
function OSRSetEckert(hSRS::OGRSpatialReferenceH, nVariation::Cint, dfCentralMeridian::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetEckert, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetEckertIV(OGRSpatialReferenceH hSRS,
                   double dfCentralMeridian,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Eckert IV.
"""
function OSRSetEckertIV(hSRS::OGRSpatialReferenceH, dfCentralMeridian::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetEckertIV, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetEckertVI(OGRSpatialReferenceH hSRS,
                   double dfCentralMeridian,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Eckert VI.
"""
function OSRSetEckertVI(hSRS::OGRSpatialReferenceH, dfCentralMeridian::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetEckertVI, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetEquirectangular(OGRSpatialReferenceH hSRS,
                          double dfCenterLat,
                          double dfCenterLong,
                          double dfFalseEasting,
                          double dfFalseNorthing) -> OGRErr

Equirectangular.
"""
function OSRSetEquirectangular(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetEquirectangular, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetEquirectangular2(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfPseudoStdParallel1::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetEquirectangular2, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetGS(OGRSpatialReferenceH hSRS,
             double dfCentralMeridian,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Gall Stereograpic.
"""
function OSRSetGS(hSRS::OGRSpatialReferenceH, dfCentralMeridian::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetGS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetGH(OGRSpatialReferenceH hSRS,
             double dfCentralMeridian,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Goode Homolosine.
"""
function OSRSetGH(hSRS::OGRSpatialReferenceH, dfCentralMeridian::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetGH, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetIGH(OGRSpatialReferenceH hSRS) -> OGRErr

Interrupted Goode Homolosine.
"""
function OSRSetIGH(hSRS::OGRSpatialReferenceH)
    ccall((:OSRSetIGH, libgdal), OGRErr, (OGRSpatialReferenceH,), hSRS)
end


"""
    OSRSetGEOS(OGRSpatialReferenceH hSRS,
               double dfCentralMeridian,
               double dfSatelliteHeight,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

GEOS - Geostationary Satellite View.
"""
function OSRSetGEOS(hSRS::OGRSpatialReferenceH, dfCentralMeridian::Cdouble, dfSatelliteHeight::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetGEOS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfSatelliteHeight, dfFalseEasting, dfFalseNorthing)
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
function OSRSetGaussSchreiberTMercator(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetGaussSchreiberTMercator, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetGnomonic(OGRSpatialReferenceH hSRS,
                   double dfCenterLat,
                   double dfCenterLong,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Gnomonic.
"""
function OSRSetGnomonic(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetGnomonic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetOM(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfAzimuth::Cdouble, dfRectToSkew::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetOM, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
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
function OSRSetHOM(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfAzimuth::Cdouble, dfRectToSkew::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetHOM, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
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
function OSRSetHOMAC(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfAzimuth::Cdouble, dfRectToSkew::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetHOMAC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
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
function OSRSetHOM2PNO(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfLat1::Cdouble, dfLong1::Cdouble, dfLat2::Cdouble, dfLong2::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetHOM2PNO, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfLat1, dfLong1, dfLat2, dfLong2, dfScale, dfFalseEasting, dfFalseNorthing)
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
function OSRSetIWMPolyconic(hSRS::OGRSpatialReferenceH, dfLat1::Cdouble, dfLat2::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetIWMPolyconic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLat1, dfLat2, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetKrovak(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfAzimuth::Cdouble, dfPseudoStdParallelLat::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetKrovak, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfPseudoStdParallelLat, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetLAEA(OGRSpatialReferenceH hSRS,
               double dfCenterLat,
               double dfCenterLong,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

Lambert Azimuthal Equal-Area.
"""
function OSRSetLAEA(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetLAEA, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetLCC(hSRS::OGRSpatialReferenceH, dfStdP1::Cdouble, dfStdP2::Cdouble, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetLCC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetLCC1SP(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetLCC1SP, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function OSRSetLCCB(hSRS::OGRSpatialReferenceH, dfStdP1::Cdouble, dfStdP2::Cdouble, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetLCCB, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetMC(OGRSpatialReferenceH hSRS,
             double dfCenterLat,
             double dfCenterLong,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Miller Cylindrical.
"""
function OSRSetMC(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetMC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetMercator(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetMercator, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function OSRSetMercator2SP(hSRS::OGRSpatialReferenceH, dfStdP1::Cdouble, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetMercator2SP, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetMollweide(OGRSpatialReferenceH hSRS,
                    double dfCentralMeridian,
                    double dfFalseEasting,
                    double dfFalseNorthing) -> OGRErr

Mollweide.
"""
function OSRSetMollweide(hSRS::OGRSpatialReferenceH, dfCentralMeridian::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetMollweide, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetNZMG(OGRSpatialReferenceH hSRS,
               double dfCenterLat,
               double dfCenterLong,
               double dfFalseEasting,
               double dfFalseNorthing) -> OGRErr

New Zealand Map Grid.
"""
function OSRSetNZMG(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetNZMG, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetOS(hSRS::OGRSpatialReferenceH, dfOriginLat::Cdouble, dfCMeridian::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetOS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfOriginLat, dfCMeridian, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetOrthographic(OGRSpatialReferenceH hSRS,
                       double dfCenterLat,
                       double dfCenterLong,
                       double dfFalseEasting,
                       double dfFalseNorthing) -> OGRErr

Orthographic.
"""
function OSRSetOrthographic(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetOrthographic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetPolyconic(OGRSpatialReferenceH hSRS,
                    double dfCenterLat,
                    double dfCenterLong,
                    double dfFalseEasting,
                    double dfFalseNorthing) -> OGRErr

Polyconic.
"""
function OSRSetPolyconic(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetPolyconic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetPS(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetPS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetRobinson(OGRSpatialReferenceH hSRS,
                   double dfCenterLong,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Robinson.
"""
function OSRSetRobinson(hSRS::OGRSpatialReferenceH, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetRobinson, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetSinusoidal(OGRSpatialReferenceH hSRS,
                     double dfCenterLong,
                     double dfFalseEasting,
                     double dfFalseNorthing) -> OGRErr

Sinusoidal.
"""
function OSRSetSinusoidal(hSRS::OGRSpatialReferenceH, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetSinusoidal, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetStereographic(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetStereographic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetSOC(OGRSpatialReferenceH hSRS,
              double dfLatitudeOfOrigin,
              double dfCentralMeridian,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Swiss Oblique Cylindrical.
"""
function OSRSetSOC(hSRS::OGRSpatialReferenceH, dfLatitudeOfOrigin::Cdouble, dfCentralMeridian::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetSOC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLatitudeOfOrigin, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
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
function OSRSetTM(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetTM, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function OSRSetTMVariant(hSRS::OGRSpatialReferenceH, pszVariantName, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetTMVariant, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, pszVariantName, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetTMG(OGRSpatialReferenceH hSRS,
              double dfCenterLat,
              double dfCenterLong,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

Tunesia Mining Grid.
"""
function OSRSetTMG(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetTMG, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function OSRSetTMSO(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble, dfScale::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetTMSO, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function OSRSetTPED(hSRS::OGRSpatialReferenceH, dfLat1::Cdouble, dfLong1::Cdouble, dfLat2::Cdouble, dfLong2::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetTPED, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetVDG(OGRSpatialReferenceH hSRS,
              double dfCentralMeridian,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

VanDerGrinten.
"""
function OSRSetVDG(hSRS::OGRSpatialReferenceH, dfCenterLong::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetVDG, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetWagner(OGRSpatialReferenceH hSRS,
                 int nVariation,
                 double dfCenterLat,
                 double dfFalseEasting,
                 double dfFalseNorthing) -> OGRErr

Wagner I  VII.
"""
function OSRSetWagner(hSRS::OGRSpatialReferenceH, nVariation::Cint, dfCenterLat::Cdouble, dfFalseEasting::Cdouble, dfFalseNorthing::Cdouble)
    ccall((:OSRSetWagner, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing)
end


"""
    OSRSetQSC(OGRSpatialReferenceH hSRS,
              double dfCenterLat,
              double dfCenterLong) -> OGRErr

Quadrilateralized Spherical Cube.
"""
function OSRSetQSC(hSRS::OGRSpatialReferenceH, dfCenterLat::Cdouble, dfCenterLong::Cdouble)
    ccall((:OSRSetQSC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong)
end


"""
    OSRSetSCH(OGRSpatialReferenceH hSRS,
              double dfPegLat,
              double dfPegLong,
              double dfPegHeading,
              double dfPegHgt) -> OGRErr

Spherical, Cross-track, Height.
"""
function OSRSetSCH(hSRS::OGRSpatialReferenceH, dfPegLat::Cdouble, dfPegLong::Cdouble, dfPegHeading::Cdouble, dfPegHgt::Cdouble)
    ccall((:OSRSetSCH, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfPegLat, dfPegLong, dfPegHeading, dfPegHgt)
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
function OSRCalcInvFlattening(dfSemiMajor::Cdouble, dfSemiMinor::Cdouble)
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
function OSRCalcSemiMinorFromInvFlattening(dfSemiMajor::Cdouble, dfInvFlattening::Cdouble)
    ccall((:OSRCalcSemiMinorFromInvFlattening, libgdal), Cdouble, (Cdouble, Cdouble), dfSemiMajor, dfInvFlattening)
end


"""
    OSRCleanup(void) -> void

Cleanup cached SRS related memory.
"""
function OSRCleanup()
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
function OCTNewCoordinateTransformation(hSourceSRS::OGRSpatialReferenceH, hTargetSRS::OGRSpatialReferenceH)
    ccall((:OCTNewCoordinateTransformation, libgdal), OGRCoordinateTransformationH, (OGRSpatialReferenceH, OGRSpatialReferenceH), hSourceSRS, hTargetSRS)
end


"""
    OCTDestroyCoordinateTransformation(OGRCoordinateTransformationH hCT) -> void

OGRCoordinateTransformation destructor.

### Parameters
* **hCT**: the object to delete
"""
function OCTDestroyCoordinateTransformation(arg1::OGRCoordinateTransformationH)
    ccall((:OCTDestroyCoordinateTransformation, libgdal), Cvoid, (OGRCoordinateTransformationH,), arg1)
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
function OCTTransform(hCT::OGRCoordinateTransformationH, nCount::Cint, x, y, z)
    ccall((:OCTTransform, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), hCT, nCount, x, y, z)
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
function OCTTransformEx(hCT::OGRCoordinateTransformationH, nCount::Cint, x, y, z, pabSuccess)
    ccall((:OCTTransformEx, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), hCT, nCount, x, y, z, pabSuccess)
end


"""
    OCTProj4Normalize(const char * pszProj4Src) -> char *
"""
function OCTProj4Normalize(pszProj4Src)
    ccall((:OCTProj4Normalize, libgdal), Cstring, (Cstring,), pszProj4Src)
end


"""
    OCTCleanupProjMutex() -> void
"""
function OCTCleanupProjMutex()
    ccall((:OCTCleanupProjMutex, libgdal), Cvoid, ())
end


"""
    OPTGetProjectionMethods() -> char **

Fetch list of possible projection methods.

### Returns
Returns NULL terminated list of projection methods. This should be freed with CSLDestroy() when no longer needed.
"""
function OPTGetProjectionMethods()
    ccall((:OPTGetProjectionMethods, libgdal), Ptr{Cstring}, ())
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
function OPTGetParameterList(pszProjectionMethod, ppszUserName)
    ccall((:OPTGetParameterList, libgdal), Ptr{Cstring}, (Cstring, Ptr{Cstring}), pszProjectionMethod, ppszUserName)
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
function OPTGetParameterInfo(pszProjectionMethod, pszParameterName, ppszUserName, ppszType, pdfDefaultValue)
    ccall((:OPTGetParameterInfo, libgdal), Cint, (Cstring, Cstring, Ptr{Cstring}, Ptr{Cstring}, Ptr{Cdouble}), pszProjectionMethod, pszParameterName, ppszUserName, ppszType, pdfDefaultValue)
end
