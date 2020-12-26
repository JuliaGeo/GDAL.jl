# Test the availability of drivers.
# See https://github.com/JuliaGeo/GDAL.jl/issues/65 for an overview.

# not a complete list, but these drivers are tested for availability
available_drivers = [
    # raster drivers
    "AAIGrid",
    "COG",
    "GPKG",
    "GTiff",
    "JP2OpenJPEG",
    "MEM",
    "OGCAPI",
    "PCRaster",
    # libcurl raster drivers
    "EEDAI",
    "PLMosaic",
    "RDA",
    "WCS",
    "WMS",
    "WMTS",
    # webp raster drivers
    # "WEBP",
    # vector drivers
    "ARCGEN",
    "FlatGeoBuf",
    "GeoJSON",
    "GML",
    "GPKG",
    "KML",
    "LVBAG",
    "OpenFileGDB",
    "ESRI Shapefile",
    "TopoJSON",
    "VRT",
    "SQLite",
    # libexpat vector drivers
    "JML",
    "GML",
    "GPX",
    "GeoRSS",
    "ODS",
    "OSM",
    # libcurl vector drivers
    "AmigoCloud",
    "Carto",
    "Cloudant",
    "CouchDB",
    "CSW",
    "EEDA",
    "ElasticSearch",
    "NGW",
    "OAPIF",
    "PLScenes",
    "WFS",
]

@testset "Drivers" begin
    for drivername in available_drivers
        @testset "$drivername" begin
            @test GDAL.gdalgetdriverbyname(drivername) != C_NULL
        end
    end
end

# errors with BADCERT_NOT_TRUSTED if the CA certificate paths is not properly configured
landsat = "https://landsat-pds.s3.amazonaws.com/L8/139/045/LC81390452014295LGN00/LC81390452014295LGN00_B1.TIF"
ds_landsat = GDAL.gdalopen(string("/vsicurl/", landsat), GDAL.GA_ReadOnly)
GDAL.gdalclose(ds_landsat)
# actually also works without the /vsicurl/ prefix, but takes 50s versus 1s, so let's
# not waste CI time. (it's probably downloading the whole file)
