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
    "HDF5",
    "netCDF",
    # libcurl raster drivers
    "EEDAI",
    "PLMosaic",
    "WCS",
    "WMS",
    "WMTS",
    # webp raster drivers
    # "WEBP",
    # vector drivers
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
    "PostgreSQL",
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
sentinel = "https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/30/U/WA/2020/7/S2B_30UWA_20200730_0_L2A/L2A_PVI.tif"
ds_sentinel = GDAL.gdalopen(string("/vsicurl/", sentinel), GDAL.GA_ReadOnly)
GDAL.gdalclose(ds_sentinel)
# actually also works without the /vsicurl/ prefix, but takes 50s versus 1s, so let's
# not waste CI time. (it's probably downloading the whole file)
