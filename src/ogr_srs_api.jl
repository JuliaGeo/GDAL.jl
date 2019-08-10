# Julia wrapper for header: ogr_srs_api.h
# Automatically generated using Clang.jl


"""
    OSRAxisEnumToName(OGRAxisOrientation eOrientation) -> const char *

Return the string representation for the OGRAxisOrientation enumeration.

### Returns
an internal string
"""
function osraxisenumtoname(eOrientation)
    unsafe_string(ccall((:OSRAxisEnumToName, libgdal), Cstring, (OGRAxisOrientation,), eOrientation))
end

"""
    OSRSetPROJSearchPaths(const char *const * papszPaths) -> void

Set the search path(s) for PROJ resource files.

### Parameters
* **papszPaths**: NULL terminated list of directory paths.
"""
function osrsetprojsearchpaths(papszPaths)
    ccall((:OSRSetPROJSearchPaths, libgdal), Cvoid, (Ptr{Cstring},), papszPaths)
end

"""
    OSRNewSpatialReference(const char * pszWKT) -> OGRSpatialReferenceH

Constructor.
"""
function osrnewspatialreference(arg1)
    failsafe(ccall((:OSRNewSpatialReference, libgdal), OGRSpatialReferenceH, (Cstring,), arg1))
end

"""
    OSRCloneGeogCS(OGRSpatialReferenceH hSource) -> OGRSpatialReferenceH

Make a duplicate of the GEOGCS node of this OGRSpatialReference object.
"""
function osrclonegeogcs(arg1)
    failsafe(ccall((:OSRCloneGeogCS, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRClone(OGRSpatialReferenceH hSRS) -> OGRSpatialReferenceH

Make a duplicate of this OGRSpatialReference.
"""
function osrclone(arg1)
    failsafe(ccall((:OSRClone, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH,), arg1))
end

"""
    OSRDestroySpatialReference(OGRSpatialReferenceH hSRS) -> void

OGRSpatialReference destructor.

### Parameters
* **hSRS**: the object to delete
"""
function osrdestroyspatialreference(arg1)
    ccall((:OSRDestroySpatialReference, libgdal), Cvoid, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRReference(OGRSpatialReferenceH hSRS) -> int

Increments the reference count by one.
"""
function osrreference(arg1)
    ccall((:OSRReference, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRDereference(OGRSpatialReferenceH hSRS) -> int

Decrements the reference count by one.
"""
function osrdereference(arg1)
    ccall((:OSRDereference, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRRelease(OGRSpatialReferenceH hSRS) -> void

Decrements the reference count by one, and destroy if zero.
"""
function osrrelease(arg1)
    ccall((:OSRRelease, libgdal), Cvoid, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRValidate(OGRSpatialReferenceH hSRS) -> OGRErr

Validate SRS tokens.
"""
function osrvalidate(arg1)
    ccall((:OSRValidate, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRImportFromEPSG(OGRSpatialReferenceH hSRS,
                      int nCode) -> OGRErr

Initialize SRS based on EPSG GCS or PCS code.
"""
function osrimportfromepsg(arg1, arg2)
    ccall((:OSRImportFromEPSG, libgdal), OGRErr, (OGRSpatialReferenceH, Cint), arg1, arg2)
end

"""
    OSRImportFromEPSGA(OGRSpatialReferenceH hSRS,
                       int nCode) -> OGRErr

Initialize SRS based on EPSG CRS code.
"""
function osrimportfromepsga(arg1, arg2)
    ccall((:OSRImportFromEPSGA, libgdal), OGRErr, (OGRSpatialReferenceH, Cint), arg1, arg2)
end

"""
    OSRImportFromWkt(OGRSpatialReferenceH hSRS,
                     char ** ppszInput) -> OGRErr

Import from WKT string.
"""
function osrimportfromwkt(arg1, arg2)
    ccall((:OSRImportFromWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end

"""
    OSRImportFromProj4(OGRSpatialReferenceH hSRS,
                       const char * pszProj4) -> OGRErr

Import PROJ coordinate string.
"""
function osrimportfromproj4(arg1, arg2)
    ccall((:OSRImportFromProj4, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
end

"""
    OSRImportFromESRI(OGRSpatialReferenceH hSRS,
                      char ** papszPrj) -> OGRErr

Import coordinate system from ESRI .prj format(s).
"""
function osrimportfromesri(arg1, arg2)
    ccall((:OSRImportFromESRI, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end

"""
    OSRImportFromPCI(OGRSpatialReferenceH hSRS,
                     const char * pszProj,
                     const char * pszUnits,
                     double * padfPrjParams) -> OGRErr

Import coordinate system from PCI projection definition.
"""
function osrimportfrompci(hSRS, arg1, arg2, arg3)
    ccall((:OSRImportFromPCI, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Ptr{Cdouble}), hSRS, arg1, arg2, arg3)
end

"""
    OSRImportFromUSGS(OGRSpatialReferenceH hSRS,
                      long iProjsys,
                      long iZone,
                      double * padfPrjParams,
                      long iDatum) -> OGRErr

Import coordinate system from USGS projection definition.
"""
function osrimportfromusgs(arg1, arg2, arg3, arg4, arg5)
    ccall((:OSRImportFromUSGS, libgdal), OGRErr, (OGRSpatialReferenceH, Clong, Clong, Ptr{Cdouble}, Clong), arg1, arg2, arg3, arg4, arg5)
end

"""
    OSRImportFromXML(OGRSpatialReferenceH hSRS,
                     const char * pszXML) -> OGRErr

Import coordinate system from XML format (GML only currently).
"""
function osrimportfromxml(arg1, arg2)
    ccall((:OSRImportFromXML, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
end

"""
    OSRImportFromDict(OGRSpatialReferenceH hSRS,
                      const char * pszDictFile,
                      const char * pszCode) -> OGRErr

Read SRS from WKT dictionary.

### Parameters
* **hSRS**: spatial reference system handle.
* **pszDictFile**: the name of the dictionary file to load.
* **pszCode**: the code to lookup in the dictionary.

### Returns
OGRERR_NONE on success, or OGRERR_SRS_UNSUPPORTED if the code isn't found, and OGRERR_SRS_FAILURE if something more dramatic goes wrong.
"""
function osrimportfromdict(arg1, arg2, arg3)
    ccall((:OSRImportFromDict, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring), arg1, arg2, arg3)
end

"""
    OSRImportFromPanorama(OGRSpatialReferenceH hSRS,
                          long iProjSys,
                          long iDatum,
                          long iEllips,
                          double * padfPrjParams) -> OGRErr

Import coordinate system from "Panorama" GIS projection definition.
"""
function osrimportfrompanorama(arg1, arg2, arg3, arg4, arg5)
    ccall((:OSRImportFromPanorama, libgdal), OGRErr, (OGRSpatialReferenceH, Clong, Clong, Clong, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5)
end

"""
    OSRImportFromOzi(OGRSpatialReferenceH hSRS,
                     const char *const * papszLines) -> OGRErr

Import coordinate system from OziExplorer projection definition.

### Parameters
* **hSRS**: spatial reference object.
* **papszLines**: Map file lines. This is an array of strings containing the whole OziExplorer .MAP file. The array is terminated by a NULL pointer.

### Returns
OGRERR_NONE on success or an error code in case of failure.
"""
function osrimportfromozi(arg1, arg2)
    ccall((:OSRImportFromOzi, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end

"""
    OSRImportFromMICoordSys(OGRSpatialReferenceH hSRS,
                            const char * pszCoordSys) -> OGRErr

Import Mapinfo style CoordSys definition.
"""
function osrimportfrommicoordsys(arg1, arg2)
    ccall((:OSRImportFromMICoordSys, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
end

"""
    OSRImportFromERM(OGRSpatialReferenceH hSRS,
                     const char * pszProj,
                     const char * pszDatum,
                     const char * pszUnits) -> OGRErr

Create OGR WKT from ERMapper projection definitions.
"""
function osrimportfromerm(arg1, arg2, arg3, arg4)
    ccall((:OSRImportFromERM, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4)
end

"""
    OSRImportFromUrl(OGRSpatialReferenceH hSRS,
                     const char * pszUrl) -> OGRErr

Set spatial reference from a URL.
"""
function osrimportfromurl(arg1, arg2)
    ccall((:OSRImportFromUrl, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
end

"""
    OSRExportToWkt(OGRSpatialReferenceH hSRS,
                   char ** ppszReturn) -> OGRErr

Convert this SRS into WKT 1 format.
"""
function osrexporttowkt(arg1, arg2)
    ccall((:OSRExportToWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end

"""
    OSRExportToWktEx(OGRSpatialReferenceH hSRS,
                     char ** ppszReturn,
                     const char *const * papszOptions) -> OGRErr

Convert this SRS into WKT format.
"""
function osrexporttowktex(arg1, ppszResult, papszOptions)
    ccall((:OSRExportToWktEx, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cstring}), arg1, ppszResult, papszOptions)
end

"""
    OSRExportToPrettyWkt(OGRSpatialReferenceH hSRS,
                         char ** ppszReturn,
                         int bSimplify) -> OGRErr

Convert this SRS into a nicely formatted WKT 1 string for display to a person.
"""
function osrexporttoprettywkt(arg1, arg2, arg3)
    ccall((:OSRExportToPrettyWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Cint), arg1, arg2, arg3)
end

"""
    OSRExportToProj4(OGRSpatialReferenceH hSRS,
                     char ** ppszReturn) -> OGRErr

Export coordinate system in PROJ format.
"""
function osrexporttoproj4(arg1, arg2)
    ccall((:OSRExportToProj4, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end

"""
    OSRExportToPCI(OGRSpatialReferenceH hSRS,
                   char ** ppszProj,
                   char ** ppszUnits,
                   double ** ppadfPrjParams) -> OGRErr

Export coordinate system in PCI projection definition.
"""
function osrexporttopci(arg1, arg2, arg3, arg4)
    ccall((:OSRExportToPCI, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cstring}, Ptr{Ptr{Cdouble}}), arg1, arg2, arg3, arg4)
end

"""
    OSRExportToUSGS(OGRSpatialReferenceH hSRS,
                    long * piProjSys,
                    long * piZone,
                    double ** ppadfPrjParams,
                    long * piDatum) -> OGRErr

Export coordinate system in USGS GCTP projection definition.
"""
function osrexporttousgs(arg1, arg2, arg3, arg4, arg5)
    ccall((:OSRExportToUSGS, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Clong}, Ptr{Clong}, Ptr{Ptr{Cdouble}}, Ptr{Clong}), arg1, arg2, arg3, arg4, arg5)
end

"""
    OSRExportToXML(OGRSpatialReferenceH hSRS,
                   char ** ppszRawXML,
                   const char * pszDialect) -> OGRErr

Export coordinate system in XML format.
"""
function osrexporttoxml(arg1, arg2, arg3)
    ccall((:OSRExportToXML, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Cstring), arg1, arg2, arg3)
end

"""
    OSRExportToPanorama(OGRSpatialReferenceH hSRS,
                        long * piProjSys,
                        long * piDatum,
                        long * piEllips,
                        long * piZone,
                        double * padfPrjParams) -> OGRErr

Export coordinate system in "Panorama" GIS projection definition.
"""
function osrexporttopanorama(arg1, arg2, arg3, arg4, arg5, arg6)
    ccall((:OSRExportToPanorama, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5, arg6)
end

"""
    OSRExportToMICoordSys(OGRSpatialReferenceH hSRS,
                          char ** ppszReturn) -> OGRErr

Export coordinate system in Mapinfo style CoordSys format.
"""
function osrexporttomicoordsys(arg1, arg2)
    ccall((:OSRExportToMICoordSys, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end

"""
    OSRExportToERM(OGRSpatialReferenceH hSRS,
                   char * pszProj,
                   char * pszDatum,
                   char * pszUnits) -> OGRErr

Convert coordinate system to ERMapper format.
"""
function osrexporttoerm(arg1, arg2, arg3, arg4)
    ccall((:OSRExportToERM, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4)
end

"""
    OSRMorphToESRI(OGRSpatialReferenceH hSRS) -> OGRErr

Convert in place to ESRI WKT format.
"""
function osrmorphtoesri(arg1)
    ccall((:OSRMorphToESRI, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRMorphFromESRI(OGRSpatialReferenceH hSRS) -> OGRErr

Convert in place from ESRI WKT format.
"""
function osrmorphfromesri(arg1)
    ccall((:OSRMorphFromESRI, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRConvertToOtherProjection(OGRSpatialReferenceH hSRS,
                                const char * pszTargetProjection,
                                const char *const * papszOptions) -> OGRSpatialReferenceH

Convert to another equivalent projection.

### Parameters
* **hSRS**: source SRS
* **pszTargetProjection**: target projection.
* **papszOptions**: lists of options. None supported currently.

### Returns
a new SRS, or NULL in case of error.
"""
function osrconverttootherprojection(hSRS, pszTargetProjection, papszOptions)
    failsafe(ccall((:OSRConvertToOtherProjection, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH, Cstring, Ptr{Cstring}), hSRS, pszTargetProjection, papszOptions))
end

"""
    OSRGetName(OGRSpatialReferenceH hSRS) -> const char *

Return the CRS name.
"""
function osrgetname(hSRS)
    unsafe_string(ccall((:OSRGetName, libgdal), Cstring, (OGRSpatialReferenceH,), hSRS))
end

"""
    OSRSetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszPath,
                    const char * pszValue) -> OGRErr

Set attribute value in spatial reference.
"""
function osrsetattrvalue(hSRS, pszNodePath, pszNewNodeValue)
    ccall((:OSRSetAttrValue, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring), hSRS, pszNodePath, pszNewNodeValue)
end

"""
    OSRGetAttrValue(OGRSpatialReferenceH hSRS,
                    const char * pszKey,
                    int iChild) -> const char *

Fetch indicated attribute of named node.
"""
function osrgetattrvalue(hSRS, pszName, iChild)
    unsafe_string(ccall((:OSRGetAttrValue, libgdal), Cstring, (OGRSpatialReferenceH, Cstring, Cint), hSRS, pszName, iChild))
end

"""
    OSRSetAngularUnits(OGRSpatialReferenceH hSRS,
                       const char * pszUnits,
                       double dfInRadians) -> OGRErr

Set the angular units for the geographic coordinate system.
"""
function osrsetangularunits(arg1, arg2, arg3)
    ccall((:OSRSetAngularUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end

"""
    OSRGetAngularUnits(OGRSpatialReferenceH hSRS,
                       char ** ppszName) -> double

Fetch angular geographic coordinate system units.
"""
function osrgetangularunits(arg1, arg2)
    ccall((:OSRGetAngularUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end

"""
    OSRSetLinearUnits(OGRSpatialReferenceH hSRS,
                      const char * pszUnits,
                      double dfInMeters) -> OGRErr

Set the linear units for the projection.
"""
function osrsetlinearunits(arg1, arg2, arg3)
    ccall((:OSRSetLinearUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end

"""
    OSRSetTargetLinearUnits(OGRSpatialReferenceH hSRS,
                            const char * pszTargetKey,
                            const char * pszUnits,
                            double dfInMeters) -> OGRErr

Set the linear units for the target node.
"""
function osrsettargetlinearunits(arg1, arg2, arg3, arg4)
    ccall((:OSRSetTargetLinearUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cdouble), arg1, arg2, arg3, arg4)
end

"""
    OSRSetLinearUnitsAndUpdateParameters(OGRSpatialReferenceH hSRS,
                                         const char * pszUnits,
                                         double dfInMeters) -> OGRErr

Set the linear units for the projection.
"""
function osrsetlinearunitsandupdateparameters(arg1, arg2, arg3)
    ccall((:OSRSetLinearUnitsAndUpdateParameters, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end

"""
    OSRGetLinearUnits(OGRSpatialReferenceH hSRS,
                      char ** ppszName) -> double

Fetch linear projection units.
"""
function osrgetlinearunits(arg1, arg2)
    ccall((:OSRGetLinearUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end

"""
    OSRGetTargetLinearUnits(OGRSpatialReferenceH hSRS,
                            const char * pszTargetKey,
                            char ** ppszName) -> double

Fetch linear projection units.
"""
function osrgettargetlinearunits(arg1, arg2, arg3)
    ccall((:OSRGetTargetLinearUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Ptr{Cstring}), arg1, arg2, arg3)
end

"""
    OSRGetPrimeMeridian(OGRSpatialReferenceH hSRS,
                        char ** ppszName) -> double

Fetch prime meridian info.
"""
function osrgetprimemeridian(arg1, arg2)
    ccall((:OSRGetPrimeMeridian, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2)
end

"""
    OSRIsGeographic(OGRSpatialReferenceH hSRS) -> int

Check if geographic coordinate system.
"""
function osrisgeographic(arg1)
    ccall((:OSRIsGeographic, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRIsLocal(OGRSpatialReferenceH hSRS) -> int

Check if local coordinate system.
"""
function osrislocal(arg1)
    ccall((:OSRIsLocal, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRIsProjected(OGRSpatialReferenceH hSRS) -> int

Check if projected coordinate system.
"""
function osrisprojected(arg1)
    ccall((:OSRIsProjected, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRIsCompound(OGRSpatialReferenceH hSRS) -> int

Check if the coordinate system is compound.
"""
function osriscompound(arg1)
    ccall((:OSRIsCompound, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRIsGeocentric(OGRSpatialReferenceH hSRS) -> int

Check if geocentric coordinate system.
"""
function osrisgeocentric(arg1)
    ccall((:OSRIsGeocentric, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRIsVertical(OGRSpatialReferenceH hSRS) -> int

Check if vertical coordinate system.
"""
function osrisvertical(arg1)
    ccall((:OSRIsVertical, libgdal), Cint, (OGRSpatialReferenceH,), arg1)
end

"""
    OSRIsSameGeogCS(OGRSpatialReferenceH hSRS1,
                    OGRSpatialReferenceH hSRS2) -> int

Do the GeogCS'es match?
"""
function osrissamegeogcs(arg1, arg2)
    ccall((:OSRIsSameGeogCS, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2)
end

"""
    OSRIsSameVertCS(OGRSpatialReferenceH hSRS1,
                    OGRSpatialReferenceH hSRS2) -> int

Do the VertCS'es match?
"""
function osrissamevertcs(arg1, arg2)
    ccall((:OSRIsSameVertCS, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2)
end

"""
    OSRIsSame(OGRSpatialReferenceH hSRS1,
              OGRSpatialReferenceH hSRS2) -> int

Do these two spatial references describe the same system ?
"""
function osrissame(arg1, arg2)
    ccall((:OSRIsSame, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2)
end

"""
    OSRIsSameEx(OGRSpatialReferenceH hSRS1,
                OGRSpatialReferenceH hSRS2,
                const char *const * papszOptions) -> int

Do these two spatial references describe the same system ?
"""
function osrissameex(arg1, arg2, papszOptions)
    ccall((:OSRIsSameEx, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2, papszOptions)
end

"""
    OSRSetLocalCS(OGRSpatialReferenceH hSRS,
                  const char * pszName) -> OGRErr

Set the user visible LOCAL_CS name.
"""
function osrsetlocalcs(hSRS, pszName)
    ccall((:OSRSetLocalCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName)
end

"""
    OSRSetProjCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function osrsetprojcs(hSRS, pszName)
    ccall((:OSRSetProjCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName)
end

"""
    OSRSetGeocCS(OGRSpatialReferenceH hSRS,
                 const char * pszName) -> OGRErr

Set the user visible PROJCS name.
"""
function osrsetgeoccs(hSRS, pszName)
    ccall((:OSRSetGeocCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName)
end

"""
    OSRSetWellKnownGeogCS(OGRSpatialReferenceH hSRS,
                          const char * pszName) -> OGRErr

Set a GeogCS based on well known name.
"""
function osrsetwellknowngeogcs(hSRS, pszName)
    ccall((:OSRSetWellKnownGeogCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName)
end

"""
    OSRSetFromUserInput(OGRSpatialReferenceH hSRS,
                        const char * pszDef) -> OGRErr

Set spatial reference from various text formats.
"""
function osrsetfromuserinput(hSRS, arg1)
    ccall((:OSRSetFromUserInput, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, arg1)
end

"""
    OSRCopyGeogCSFrom(OGRSpatialReferenceH hSRS,
                      const OGRSpatialReferenceH hSrcSRS) -> OGRErr

Copy GEOGCS from another OGRSpatialReference.
"""
function osrcopygeogcsfrom(hSRS, hSrcSRS)
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
function osrsettowgs84(hSRS, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    ccall((:OSRSetTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
end

"""
    OSRGetTOWGS84(OGRSpatialReferenceH hSRS,
                  double * padfCoeff,
                  int nCoeffCount) -> OGRErr

Fetch TOWGS84 parameters, if available.
"""
function osrgettowgs84(hSRS, arg1, arg2)
    ccall((:OSRGetTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cdouble}, Cint), hSRS, arg1, arg2)
end

"""
    OSRSetCompoundCS(OGRSpatialReferenceH hSRS,
                     const char * pszName,
                     OGRSpatialReferenceH hHorizSRS,
                     OGRSpatialReferenceH hVertSRS) -> OGRErr

Setup a compound coordinate system.
"""
function osrsetcompoundcs(hSRS, pszName, hHorizSRS, hVertSRS)
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
function osrsetgeogcs(hSRS, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor, dfInvFlattening, pszPMName, dfPMOffset, pszUnits, dfConvertToRadians)
    ccall((:OSRSetGeogCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring, Cdouble, Cdouble, Cstring, Cdouble, Cstring, Cdouble), hSRS, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor, dfInvFlattening, pszPMName, dfPMOffset, pszUnits, dfConvertToRadians)
end

"""
    OSRSetVertCS(OGRSpatialReferenceH hSRS,
                 const char * pszVertCSName,
                 const char * pszVertDatumName,
                 int nVertDatumType) -> OGRErr

Setup the vertical coordinate system.
"""
function osrsetvertcs(hSRS, pszVertCSName, pszVertDatumName, nVertDatumType)
    ccall((:OSRSetVertCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cint), hSRS, pszVertCSName, pszVertDatumName, nVertDatumType)
end

"""
    OSRGetSemiMajor(OGRSpatialReferenceH hSRS,
                    OGRErr * pnErr) -> double

Get spheroid semi major axis.
"""
function osrgetsemimajor(arg1, arg2)
    ccall((:OSRGetSemiMajor, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2)
end

"""
    OSRGetSemiMinor(OGRSpatialReferenceH hSRS,
                    OGRErr * pnErr) -> double

Get spheroid semi minor axis.
"""
function osrgetsemiminor(arg1, arg2)
    ccall((:OSRGetSemiMinor, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2)
end

"""
    OSRGetInvFlattening(OGRSpatialReferenceH hSRS,
                        OGRErr * pnErr) -> double

Get spheroid inverse flattening.
"""
function osrgetinvflattening(arg1, arg2)
    ccall((:OSRGetInvFlattening, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2)
end

"""
    OSRSetAuthority(OGRSpatialReferenceH hSRS,
                    const char * pszTargetKey,
                    const char * pszAuthority,
                    int nCode) -> OGRErr

Set the authority for a node.
"""
function osrsetauthority(hSRS, pszTargetKey, pszAuthority, nCode)
    ccall((:OSRSetAuthority, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cint), hSRS, pszTargetKey, pszAuthority, nCode)
end

"""
    OSRGetAuthorityCode(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority code for a node.
"""
function osrgetauthoritycode(hSRS, pszTargetKey)
    unsafe_string(ccall((:OSRGetAuthorityCode, libgdal), Cstring, (OGRSpatialReferenceH, Cstring), hSRS, pszTargetKey))
end

"""
    OSRGetAuthorityName(OGRSpatialReferenceH hSRS,
                        const char * pszTargetKey) -> const char *

Get the authority name for a node.
"""
function osrgetauthorityname(hSRS, pszTargetKey)
    unsafe_string(ccall((:OSRGetAuthorityName, libgdal), Cstring, (OGRSpatialReferenceH, Cstring), hSRS, pszTargetKey))
end

"""
    OSRGetAreaOfUse(OGRSpatialReferenceH hSRS,
                    double * pdfWestLongitudeDeg,
                    double * pdfSouthLatitudeDeg,
                    double * pdfEastLongitudeDeg,
                    double * pdfNorthLatitudeDeg,
                    const char ** ppszAreaName) -> int

Return the area of use of the CRS.
"""
function osrgetareaofuse(hSRS, pdfWestLongitudeDeg, pdfSouthLatitudeDeg, pdfEastLongitudeDeg, pdfNorthLatitudeDeg, ppszAreaName)
    ccall((:OSRGetAreaOfUse, libgdal), Cint, (OGRSpatialReferenceH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cstring}), hSRS, pdfWestLongitudeDeg, pdfSouthLatitudeDeg, pdfEastLongitudeDeg, pdfNorthLatitudeDeg, ppszAreaName)
end

"""
    OSRSetProjection(OGRSpatialReferenceH hSRS,
                     const char * pszProjection) -> OGRErr

Set a projection name.
"""
function osrsetprojection(arg1, arg2)
    ccall((:OSRSetProjection, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2)
end

"""
    OSRSetProjParm(OGRSpatialReferenceH hSRS,
                   const char * pszParmName,
                   double dfValue) -> OGRErr

Set a projection parameter value.
"""
function osrsetprojparm(arg1, arg2, arg3)
    ccall((:OSRSetProjParm, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end

"""
    OSRGetProjParm(OGRSpatialReferenceH hSRS,
                   const char * pszName,
                   double dfDefaultValue,
                   OGRErr * pnErr) -> double

Fetch a projection parameter value.
"""
function osrgetprojparm(hSRS, pszParmName, dfDefault, arg1)
    ccall((:OSRGetProjParm, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg1)
end

"""
    OSRSetNormProjParm(OGRSpatialReferenceH hSRS,
                       const char * pszParmName,
                       double dfValue) -> OGRErr

Set a projection parameter with a normalized value.
"""
function osrsetnormprojparm(arg1, arg2, arg3)
    ccall((:OSRSetNormProjParm, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3)
end

"""
    OSRGetNormProjParm(OGRSpatialReferenceH hSRS,
                       const char * pszName,
                       double dfDefaultValue,
                       OGRErr * pnErr) -> double

This function is the same as OGRSpatialReference::
"""
function osrgetnormprojparm(hSRS, pszParmName, dfDefault, arg1)
    ccall((:OSRGetNormProjParm, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg1)
end

"""
    OSRSetUTM(OGRSpatialReferenceH hSRS,
              int nZone,
              int bNorth) -> OGRErr

Set UTM projection definition.
"""
function osrsetutm(hSRS, nZone, bNorth)
    ccall((:OSRSetUTM, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint), hSRS, nZone, bNorth)
end

"""
    OSRGetUTMZone(OGRSpatialReferenceH hSRS,
                  int * pbNorth) -> int

Get utm zone information.
"""
function osrgetutmzone(hSRS, pbNorth)
    ccall((:OSRGetUTMZone, libgdal), Cint, (OGRSpatialReferenceH, Ptr{Cint}), hSRS, pbNorth)
end

"""
    OSRSetStatePlane(OGRSpatialReferenceH hSRS,
                     int nZone,
                     int bNAD83) -> OGRErr

Set State Plane projection definition.
"""
function osrsetstateplane(hSRS, nZone, bNAD83)
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
function osrsetstateplanewithunits(hSRS, nZone, bNAD83, pszOverrideUnitName, dfOverrideUnit)
    ccall((:OSRSetStatePlaneWithUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint, Cstring, Cdouble), hSRS, nZone, bNAD83, pszOverrideUnitName, dfOverrideUnit)
end

"""
    OSRAutoIdentifyEPSG(OGRSpatialReferenceH hSRS) -> OGRErr

Set EPSG authority info if possible.
"""
function osrautoidentifyepsg(hSRS)
    ccall((:OSRAutoIdentifyEPSG, libgdal), OGRErr, (OGRSpatialReferenceH,), hSRS)
end

"""
    OSRFindMatches(OGRSpatialReferenceH hSRS,
                   char ** papszOptions,
                   int * pnEntries,
                   int ** ppanMatchConfidence) -> OGRSpatialReferenceH *

Try to identify a match between the passed SRS and a related SRS in a catalog (currently EPSG only)

### Parameters
* **hSRS**: SRS to match
* **papszOptions**: NULL terminated list of options or NULL
* **pnEntries**: Output parameter. Number of values in the returned array.
* **ppanMatchConfidence**: Output parameter (or NULL). *ppanMatchConfidence will be allocated to an array of *pnEntries whose values between 0 and 100 indicate the confidence in the match. 100 is the highest confidence level. The array must be freed with CPLFree().

### Returns
an array of SRS that match the passed SRS, or NULL. Must be freed with OSRFreeSRSArray()
"""
function osrfindmatches(hSRS, papszOptions, pnEntries, ppanMatchConfidence)
    ccall((:OSRFindMatches, libgdal), Ptr{OGRSpatialReferenceH}, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{Cint}}), hSRS, papszOptions, pnEntries, ppanMatchConfidence)
end

"""
    OSRFreeSRSArray(OGRSpatialReferenceH * pahSRS) -> void

Free return of OSRIdentifyMatches()

### Parameters
* **pahSRS**: array of SRS (must be NULL terminated)
"""
function osrfreesrsarray(pahSRS)
    ccall((:OSRFreeSRSArray, libgdal), Cvoid, (Ptr{OGRSpatialReferenceH},), pahSRS)
end

"""
    OSREPSGTreatsAsLatLong(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this geographic coordinate system should be treated as having lat/long coordinate ordering.
"""
function osrepsgtreatsaslatlong(hSRS)
    ccall((:OSREPSGTreatsAsLatLong, libgdal), Cint, (OGRSpatialReferenceH,), hSRS)
end

"""
    OSREPSGTreatsAsNorthingEasting(OGRSpatialReferenceH hSRS) -> int

This function returns TRUE if EPSG feels this geographic coordinate system should be treated as having northing/easting coordinate ordering.
"""
function osrepsgtreatsasnorthingeasting(hSRS)
    ccall((:OSREPSGTreatsAsNorthingEasting, libgdal), Cint, (OGRSpatialReferenceH,), hSRS)
end

"""
    OSRGetAxis(OGRSpatialReferenceH hSRS,
               const char * pszTargetKey,
               int iAxis,
               OGRAxisOrientation * peOrientation) -> const char *

Fetch the orientation of one axis.
"""
function osrgetaxis(hSRS, pszTargetKey, iAxis, peOrientation)
    unsafe_string(ccall((:OSRGetAxis, libgdal), Cstring, (OGRSpatialReferenceH, Cstring, Cint, Ptr{OGRAxisOrientation}), hSRS, pszTargetKey, iAxis, peOrientation))
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
function osrsetaxes(hSRS, pszTargetKey, pszXAxisName, eXAxisOrientation, pszYAxisName, eYAxisOrientation)
    ccall((:OSRSetAxes, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, OGRAxisOrientation, Cstring, OGRAxisOrientation), hSRS, pszTargetKey, pszXAxisName, eXAxisOrientation, pszYAxisName, eYAxisOrientation)
end

"""
    OSRGetAxisMappingStrategy(OGRSpatialReferenceH hSRS) -> OSRAxisMappingStrategy

Retun the data axis to CRS axis mapping strategy.
"""
function osrgetaxismappingstrategy(hSRS)
    ccall((:OSRGetAxisMappingStrategy, libgdal), OSRAxisMappingStrategy, (OGRSpatialReferenceH,), hSRS)
end

"""
    OSRSetAxisMappingStrategy(OGRSpatialReferenceH hSRS,
                              OSRAxisMappingStrategy strategy) -> void

Set the data axis to CRS axis mapping strategy.
"""
function osrsetaxismappingstrategy(hSRS, strategy)
    ccall((:OSRSetAxisMappingStrategy, libgdal), Cvoid, (OGRSpatialReferenceH, OSRAxisMappingStrategy), hSRS, strategy)
end

"""
    OSRGetDataAxisToSRSAxisMapping(OGRSpatialReferenceH hSRS,
                                   int * pnCount) -> const int *

Return the data axis to SRS axis mapping.
"""
function osrgetdataaxistosrsaxismapping(hSRS, pnCount)
    ccall((:OSRGetDataAxisToSRSAxisMapping, libgdal), Ptr{Cint}, (OGRSpatialReferenceH, Ptr{Cint}), hSRS, pnCount)
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
function osrsetacea(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetae(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetbonne(hSRS, dfStandardParallel, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
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
function osrsetcea(hSRS, dfStdP1, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
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
function osrsetcs(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetec(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrseteckert(hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetEckert, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetEckertIV(OGRSpatialReferenceH hSRS,
                   double dfCentralMeridian,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Eckert IV.
"""
function osrseteckertiv(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetEckertIV, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetEckertVI(OGRSpatialReferenceH hSRS,
                   double dfCentralMeridian,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Eckert VI.
"""
function osrseteckertvi(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
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
function osrsetequirectangular(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetequirectangular2(hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetEquirectangular2, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetGS(OGRSpatialReferenceH hSRS,
             double dfCentralMeridian,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Gall Stereograpic.
"""
function osrsetgs(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetGS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetGH(OGRSpatialReferenceH hSRS,
             double dfCentralMeridian,
             double dfFalseEasting,
             double dfFalseNorthing) -> OGRErr

Goode Homolosine.
"""
function osrsetgh(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetGH, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetIGH(OGRSpatialReferenceH hSRS) -> OGRErr

Interrupted Goode Homolosine.
"""
function osrsetigh(hSRS)
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
function osrsetgeos(hSRS, dfCentralMeridian, dfSatelliteHeight, dfFalseEasting, dfFalseNorthing)
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
function osrsetgaussschreibertmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsetgnomonic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetGnomonic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsethom(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsethomac(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsethom2pno(hSRS, dfCenterLat, dfLat1, dfLong1, dfLat2, dfLong2, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsetiwmpolyconic(hSRS, dfLat1, dfLat2, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetkrovak(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfPseudoStdParallelLat, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsetlaea(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetlcc(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetlcc1sp(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsetlccb(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetmc(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsetmercator2sp(hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetMercator2SP, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetMollweide(OGRSpatialReferenceH hSRS,
                    double dfCentralMeridian,
                    double dfFalseEasting,
                    double dfFalseNorthing) -> OGRErr

Mollweide.
"""
function osrsetmollweide(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
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
function osrsetnzmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetos(hSRS, dfOriginLat, dfCMeridian, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsetorthographic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetpolyconic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetps(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetPS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetRobinson(OGRSpatialReferenceH hSRS,
                   double dfCenterLong,
                   double dfFalseEasting,
                   double dfFalseNorthing) -> OGRErr

Robinson.
"""
function osrsetrobinson(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetRobinson, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetSinusoidal(OGRSpatialReferenceH hSRS,
                     double dfCenterLong,
                     double dfFalseEasting,
                     double dfFalseNorthing) -> OGRErr

Sinusoidal.
"""
function osrsetsinusoidal(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetstereographic(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsetsoc(hSRS, dfLatitudeOfOrigin, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
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
function osrsettm(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsettmvariant(hSRS, pszVariantName, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsettmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsettmso(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
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
function osrsettped(hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetTPED, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetVDG(OGRSpatialReferenceH hSRS,
              double dfCentralMeridian,
              double dfFalseEasting,
              double dfFalseNorthing) -> OGRErr

VanDerGrinten.
"""
function osrsetvdg(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
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
function osrsetwagner(hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing)
    ccall((:OSRSetWagner, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing)
end

"""
    OSRSetQSC(OGRSpatialReferenceH hSRS,
              double dfCenterLat,
              double dfCenterLong) -> OGRErr

Quadrilateralized Spherical Cube.
"""
function osrsetqsc(hSRS, dfCenterLat, dfCenterLong)
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
function osrsetsch(hSRS, dfPegLat, dfPegLong, dfPegHeading, dfPegHgt)
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
function osrcalcinvflattening(dfSemiMajor, dfSemiMinor)
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
function osrcalcsemiminorfrominvflattening(dfSemiMajor, dfInvFlattening)
    ccall((:OSRCalcSemiMinorFromInvFlattening, libgdal), Cdouble, (Cdouble, Cdouble), dfSemiMajor, dfInvFlattening)
end

"""
    OSRCleanup(void) -> void

Cleanup cached SRS related memory.
"""
function osrcleanup()
    ccall((:OSRCleanup, libgdal), Cvoid, ())
end

"""
    OSRGetCRSInfoListFromDatabase(const char * pszAuthName,
                                  const OSRCRSListParameters * params,
                                  int * pnOutResultCount) -> OSRCRSInfo **

Enumerate CRS objects from the database.

### Parameters
* **pszAuthName**: Authority name, used to restrict the search. Or NULL for all authorities.
* **params**: Additional criteria. Must be set to NULL for now.
* **pnOutResultCount**: Output parameter pointing to an integer to receive the size of the result list. Might be NULL

### Returns
an array of OSRCRSInfo* pointers to be freed with OSRDestroyCRSInfoList(), or NULL in case of error.
"""
function osrgetcrsinfolistfromdatabase(pszAuthName, params, pnOutResultCount)
    ccall((:OSRGetCRSInfoListFromDatabase, libgdal), Ptr{Ptr{OSRCRSInfo}}, (Cstring, Ptr{OSRCRSListParameters}, Ptr{Cint}), pszAuthName, params, pnOutResultCount)
end

"""
    OSRDestroyCRSInfoList(OSRCRSInfo ** list) -> void

Destroy the result returned by OSRGetCRSInfoListFromDatabase().
"""
function osrdestroycrsinfolist(list)
    ccall((:OSRDestroyCRSInfoList, libgdal), Cvoid, (Ptr{Ptr{OSRCRSInfo}},), list)
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
function octnewcoordinatetransformation(hSourceSRS, hTargetSRS)
    failsafe(ccall((:OCTNewCoordinateTransformation, libgdal), OGRCoordinateTransformationH, (OGRSpatialReferenceH, OGRSpatialReferenceH), hSourceSRS, hTargetSRS))
end

"""
    OCTNewCoordinateTransformationOptions(void) -> OGRCoordinateTransformationOptionsH

Create coordinate transformation options.
"""
function octnewcoordinatetransformationoptions()
    failsafe(ccall((:OCTNewCoordinateTransformationOptions, libgdal), OGRCoordinateTransformationOptionsH, ()))
end

"""
    OCTCoordinateTransformationOptionsSetOperation(OGRCoordinateTransformationOptionsH hOptions,
                                                   const char * pszCO,
                                                   int bReverseCO) -> int

Sets a coordinate operation.
"""
function octcoordinatetransformationoptionssetoperation(hOptions, pszCO, bReverseCO)
    ccall((:OCTCoordinateTransformationOptionsSetOperation, libgdal), Cint, (OGRCoordinateTransformationOptionsH, Cstring, Cint), hOptions, pszCO, bReverseCO)
end

"""
    OCTCoordinateTransformationOptionsSetAreaOfInterest(OGRCoordinateTransformationOptionsH hOptions,
                                                        double dfWestLongitudeDeg,
                                                        double dfSouthLatitudeDeg,
                                                        double dfEastLongitudeDeg,
                                                        double dfNorthLatitudeDeg) -> int

Sets an area of interest.
"""
function octcoordinatetransformationoptionssetareaofinterest(hOptions, dfWestLongitudeDeg, dfSouthLatitudeDeg, dfEastLongitudeDeg, dfNorthLatitudeDeg)
    ccall((:OCTCoordinateTransformationOptionsSetAreaOfInterest, libgdal), Cint, (OGRCoordinateTransformationOptionsH, Cdouble, Cdouble, Cdouble, Cdouble), hOptions, dfWestLongitudeDeg, dfSouthLatitudeDeg, dfEastLongitudeDeg, dfNorthLatitudeDeg)
end

"""
    OCTDestroyCoordinateTransformationOptions(OGRCoordinateTransformationOptionsH hOptions) -> void

Destroy coordinate transformation options.
"""
function octdestroycoordinatetransformationoptions(arg1)
    ccall((:OCTDestroyCoordinateTransformationOptions, libgdal), Cvoid, (OGRCoordinateTransformationOptionsH,), arg1)
end

"""
    OCTNewCoordinateTransformationEx(OGRSpatialReferenceH hSourceSRS,
                                     OGRSpatialReferenceH hTargetSRS,
                                     OGRCoordinateTransformationOptionsH hOptions) -> OGRCoordinateTransformationH

Create transformation object.

### Parameters
* **hSourceSRS**: source spatial reference system.
* **hTargetSRS**: target spatial reference system.
* **hOptions**: Coordinate transformation options.

### Returns
NULL on failure or a ready to use transformation object.
"""
function octnewcoordinatetransformationex(hSourceSRS, hTargetSRS, hOptions)
    failsafe(ccall((:OCTNewCoordinateTransformationEx, libgdal), OGRCoordinateTransformationH, (OGRSpatialReferenceH, OGRSpatialReferenceH, OGRCoordinateTransformationOptionsH), hSourceSRS, hTargetSRS, hOptions))
end

"""
    OCTDestroyCoordinateTransformation(OGRCoordinateTransformationH hCT) -> void

OGRCoordinateTransformation destructor.

### Parameters
* **hCT**: the object to delete
"""
function octdestroycoordinatetransformation(arg1)
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
function octtransform(hCT, nCount, x, y, z)
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
function octtransformex(hCT, nCount, x, y, z, pabSuccess)
    ccall((:OCTTransformEx, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), hCT, nCount, x, y, z, pabSuccess)
end

"""
    OCTTransform4D(OGRCoordinateTransformationH hTransform,
                   int nCount,
                   double * x,
                   double * y,
                   double * z,
                   double * t,
                   int * pabSuccess) -> int

Transform an array of points.

### Parameters
* **hTransform**: Transformation object
* **nCount**: Number of points
* **x**: Array of nCount x values. Should not be NULL
* **y**: Array of nCount y values. Should not be NULL
* **z**: Array of nCount z values. Might be NULL
* **t**: Array of nCount time values. Might be NULL
* **pabSuccess**: Output array of nCount value that will be set to TRUE/FALSE. Might be NULL.

### Returns
TRUE or FALSE
"""
function octtransform4d(hCT, nCount, x, y, z, t, pabSuccess)
    ccall((:OCTTransform4D, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), hCT, nCount, x, y, z, t, pabSuccess)
end
