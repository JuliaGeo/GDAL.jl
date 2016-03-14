# Tests based on the Vector API tutorial found at http://gdal.org/ogr_apitut.html


# Reading From OGR

# TODO: provide a convenient way to construct nOpenFlags
# nOpenFlags: a combination of GDAL_OF_ flags that may be combined through logical or operator
# Driver kind: GDAL_OF_RASTER for raster drivers, GDAL_OF_VECTOR for vector drivers. If none of the value is specified, both kinds are implied.
# Access mode: GDAL_OF_READONLY (exclusive)or GDAL_OF_UPDATE.
# Shared mode: GDAL_OF_SHARED. If set, it allows the sharing of GDALDataset handles for a dataset with other callers that have set GDAL_OF_SHARED. In particular, GDALOpenEx() will first consult its list of currently open and shared GDALDataset's, and if the GetDescription() name for one exactly matches the pszFilename passed to GDALOpenEx() it will be referenced and returned, if GDALOpenEx() is called from the same thread.
# Verbose error: GDAL_OF_VERBOSE_ERROR. If set, a failed attempt to open the file will lead to an error message to be reported.

# file from GDAL SVN
dataset = GDAL.openex("data/point.geojson", GDAL.GDAL_OF_VECTOR, C_NULL, C_NULL, C_NULL)

@test GDAL.datasetgetlayercount(dataset) == 1
layer = GDAL.datasetgetlayer(dataset, 0)
layerbyname = GDAL.datasetgetlayerbyname(dataset, "OGRGeoJSON")
@test layer == layerbyname
@test GDAL.getname(layer) == "OGRGeoJSON"

GDAL.resetreading(layer)

featuredefn = GDAL.getlayerdefn(layer)
@test GDAL.getfieldcount(featuredefn) == 2

fielddefn = GDAL.getfielddefn(featuredefn, 0)
@test GDAL.gettype(fielddefn) == GDAL.OFTReal
fielddefn = GDAL.getfielddefn(featuredefn, 1)
@test GDAL.gettype(fielddefn) == GDAL.OFTString

feature = GDAL.getnextfeature(layer) # first feature
@test GDAL.getfieldasdouble(feature, 0) == 2.0
@test GDAL.getfieldasstring(feature, 1) == "point-a"
feature = GDAL.getnextfeature(layer) # second feature
@test GDAL.getfieldasdouble(feature, 0) == 3.0
@test GDAL.getfieldasstring(feature, 1) == "point-b"

geometry = GDAL.getgeometryref(feature)
@test GDAL.getgeometryname(geometry) == "POINT"
@test GDAL.getgeometrytype(geometry) == GDAL.wkbPoint
@test GDAL.getgeomfieldcount(featuredefn) == 1
@test GDAL.getx(geometry, 0) == 100.2785
@test GDAL.gety(geometry, 0) == 0.0893

GDAL.destroy(feature)
GDAL.close(dataset)


# Writing to OGR
pointshapefile = "tmp/point_out"
driver = GDAL.getdriverbyname("ESRI Shapefile")
dataset = GDAL.create(driver, "$pointshapefile.shp", 0, 0, 0, GDAL.GDT_Unknown, C_NULL)
nosrs = convert(Ptr{GDAL.OGRSpatialReferenceH}, C_NULL)
layer = GDAL.datasetcreatelayer(dataset, "point_out", nosrs, GDAL.wkbPoint, C_NULL)
# the GDAL.create function is overwritten, needs to be fixed, probably by better renaming
# use the C submodule instead of now
# fielddefn = GDAL.create("Name", GDAL.OFTString)
fielddefn = convert(Ptr{GDAL.OGRFieldDefnH}, GDAL.C.OGR_Fld_Create("Name", GDAL.OFTString))
GDAL.setwidth(fielddefn, 32)
@test GDAL.createfield(layer, fielddefn, GDAL.TRUE) == GDAL.OGRERR_NONE
GDAL.destroy(fielddefn)

# repeat to add multiple features
featuredefn = GDAL.getlayerdefn(layer)
feature = GDAL.create(featuredefn)
GDAL.setfieldstring(feature, GDAL.getfieldindex(feature, "Name"), "myname")
point = GDAL.creategeometry(GDAL.wkbPoint)
GDAL.setpoint_2d(point, 0, 100.123, 0.123)
@test GDAL.setgeometry(feature, point) == GDAL.OGRERR_NONE
GDAL.destroygeometry(point)
GDAL.close(dataset)

rm("$pointshapefile.dbf")
rm("$pointshapefile.shp")
rm("$pointshapefile.shx")
