# not a complete list, but these drivers are tested for availability
available_drivers = [
    # raster drivers
    "AAIGrid",
    "GPKG",
    # "JP2OpenJPEG",  # up next, see #64
    "GTiff",
    "MEM",
    "PCRaster",
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
]

for drivername in available_drivers
    @test GDAL.getdriverbyname(drivername) != C_NULL
end
