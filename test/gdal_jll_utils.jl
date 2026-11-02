# This is testing GDAL/OGR utility executables.
# In `gdal_utils.jl` we test the utility library functions.

@test success(run(pipeline(`$(GDAL.gdalinfo_exe()) $utmsmall`, devnull)))

# The `gdal` command line interface.
@test startswith(readchomp(`$(GDAL.gdal_exe()) --version`), "GDAL $(GDAL.GDALVERSION[])")

raster_out = joinpath("tmp", "gdal_cli_out.asc")
run(`$(GDAL.gdal_exe()) raster convert --quiet $utmsmall $raster_out`)
@test occursin("Driver: AAIGrid", read(`$(GDAL.gdal_exe()) raster info $raster_out`, String))

vector_out = joinpath("tmp", "gdal_cli_out.fgb")
run(`$(GDAL.gdal_exe()) vector convert --quiet data/point.geojson $vector_out`)
@test occursin("FlatGeobuf", read(`$(GDAL.gdal_exe()) vector info $vector_out`, String))
