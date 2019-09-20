# Tests based on the Vector API tutorial found at http://gdal.org/ogr_apitut.html


# Reading From OGR

# TODO: provide a convenient way to construct nOpenFlags
# nOpenFlags: a combination of GDAL_OF_ flags that may be combined through logical or operator
# Driver kind: GDAL_OF_RASTER for raster drivers, GDAL_OF_VECTOR for vector drivers. If none of the value is specified, both kinds are implied.
# Access mode: GDAL_OF_READONLY (exclusive)or GDAL_OF_UPDATE.
# Shared mode: GDAL_OF_SHARED. If set, it allows the sharing of GDALDataset handles for a dataset with other callers that have set GDAL_OF_SHARED. In particular, GDALOpenEx() will first consult its list of currently open and shared GDALDataset's, and if the GetDescription() name for one exactly matches the pszFilename passed to GDALOpenEx() it will be referenced and returned, if GDALOpenEx() is called from the same thread.
# Verbose error: GDAL_OF_VERBOSE_ERROR. If set, a failed attempt to open the file will lead to an error message to be reported.

# file from GDAL SVN
dataset = GDAL.gdalopenex("data/point.geojson", GDAL.GDAL_OF_VECTOR, C_NULL, C_NULL, C_NULL)

@test GDAL.gdaldatasetgetlayercount(dataset) == 1
layer = GDAL.gdaldatasetgetlayer(dataset, 0)
# GDAL 2.2 GeoJSON driver change
layername = GDAL.GDALVERSION[] >= v"2.2.0" ? "point" : "OGRGeoJSON"
layerbyname = GDAL.gdaldatasetgetlayerbyname(dataset, layername)
@test layer == layerbyname
@test GDAL.ogr_l_getname(layer) == layername

GDAL.ogr_l_resetreading(layer)

featuredefn = GDAL.ogr_l_getlayerdefn(layer)
@test GDAL.ogr_fd_getfieldcount(featuredefn) == 2

fielddefn = GDAL.ogr_fd_getfielddefn(featuredefn, 0)
@test GDAL.ogr_fld_gettype(fielddefn) == GDAL.OFTReal
fielddefn = GDAL.ogr_fd_getfielddefn(featuredefn, 1)
@test GDAL.ogr_fld_gettype(fielddefn) == GDAL.OFTString

feature = GDAL.ogr_l_getnextfeature(layer) # first feature
@test GDAL.ogr_f_getfieldasdouble(feature, 0) == 2.0
@test GDAL.ogr_f_getfieldasstring(feature, 1) == "point-a"
feature = GDAL.ogr_l_getnextfeature(layer) # second feature
@test GDAL.ogr_f_getfieldasdouble(feature, 0) == 3.0
@test GDAL.ogr_f_getfieldasstring(feature, 1) == "point-b"

geometry = GDAL.ogr_f_getgeometryref(feature)
@test GDAL.ogr_g_getgeometryname(geometry) == "POINT"
@test GDAL.ogr_g_getgeometrytype(geometry) == GDAL.wkbPoint
@test GDAL.ogr_fd_getgeomfieldcount(featuredefn) == 1
@test GDAL.ogr_g_getx(geometry, 0) == 100.2785
@test GDAL.ogr_g_gety(geometry, 0) == 0.0893

# export to WKT
wkt_ptr = Ref(Cstring(C_NULL))
@test GDAL.ogr_g_exporttowkt(geometry, wkt_ptr) == GDAL.OGRERR_NONE
@test unsafe_string(wkt_ptr[]) == "POINT (100.2785 0.0893)"
GDAL.ogrfree(pointer(wkt_ptr[]))

GDAL.ogr_f_destroy(feature)
GDAL.gdalclose(dataset)


# Writing to OGR
pointshapefile = joinpath("tmp", "point_out")
driver = GDAL.gdalgetdriverbyname("ESRI Shapefile")
dataset = GDAL.gdalcreate(driver, "$pointshapefile.shp", 0, 0, 0, GDAL.GDT_Unknown, C_NULL)
nosrs = convert(Ptr{GDAL.OGRSpatialReferenceH}, C_NULL)
layer = GDAL.gdaldatasetcreatelayer(dataset, "point_out", nosrs, GDAL.wkbPoint, C_NULL)
fielddefn = GDAL.ogr_fld_create("Name", GDAL.OFTString)
GDAL.ogr_fld_setwidth(fielddefn, 32)
@test GDAL.ogr_l_createfield(layer, fielddefn, GDAL.TRUE) == GDAL.OGRERR_NONE
GDAL.ogr_fld_destroy(fielddefn)

# repeat to add multiple features
featuredefn = GDAL.ogr_l_getlayerdefn(layer)
feature = GDAL.ogr_f_create(featuredefn)
GDAL.ogr_f_setfieldstring(feature, GDAL.ogr_f_getfieldindex(feature, "Name"), "myname")
point = GDAL.ogr_g_creategeometry(GDAL.wkbPoint)
GDAL.ogr_g_setpoint_2d(point, 0, 100.123, 0.123)
@test GDAL.ogr_g_isvalid(point) == 1
@test GDAL.ogr_g_isring(point) == 0
@test GDAL.ogr_f_setgeometry(feature, point) == GDAL.OGRERR_NONE
GDAL.ogr_g_destroygeometry(point)
GDAL.ogr_l_createfeature(layer, feature)
@test GDAL.ogr_l_getfeaturecount(layer, 0) === Int64(1)

# test getfilelist with unsafe_loadstringlist
shp_exts = [".shp", ".shx", ".dbf"]
fileset = map(x -> pointshapefile * x, shp_exts)
@test GDAL.gdalgetfilelist(dataset) == fileset

GDAL.ogr_f_destroy(feature)
GDAL.gdalclose(dataset)

map(rm, fileset)
