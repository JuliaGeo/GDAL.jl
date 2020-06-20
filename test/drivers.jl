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
