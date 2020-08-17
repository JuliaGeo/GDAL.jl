# Test the availability of drivers.
# See https://github.com/JuliaGeo/GDAL.jl/issues/65 for an overview.

# not a complete list, but these drivers are tested for availability
available_drivers = [
    # raster drivers
    "AAIGrid",
    "GPKG",
    "GTiff",
    "JP2OpenJPEG",
    "MEM",
    "PCRaster",
    # libcurl raster drivers
    "EEDAI",
    "PLMosaic",
    "RDA",
    "WCS",
    "WMS",
    "WMTS",
    # vector drivers
    "ARCGEN",
    "GeoJSON",
    "GML",
    "GPKG",
    "KML",
    "OpenFileGDB",
    "ESRI Shapefile",
    "TopoJSON",
    "VRT",
    "SQLite",
    # libcurl vector drivers
    "AmigoCloud",
    "Carto",
    "Cloudant",
    "CouchDB",
    "CSW",
    "EEDA",
    "ElasticSearch",
    "GFT",
    "NGW",
    "PLScenes",
    "WFS",
    "WFS3",
]

for drivername in available_drivers
    @test GDAL.gdalgetdriverbyname(drivername) != C_NULL
end

# errors with BADCERT_NOT_TRUSTED if the CA certificate paths is not properly configured
landsat = "https://landsat-pds.s3.amazonaws.com/L8/139/045/LC81390452014295LGN00/LC81390452014295LGN00_B1.TIF"
ds_landsat = GDAL.gdalopen(string("/vsicurl/", landsat), GDAL.GA_ReadOnly)
GDAL.gdalclose(ds_landsat)
# actually also works without the /vsicurl/ prefix, but takes 50s versus 1s, so let's
# not waste CI time. (it's probably downloading the whole file)
