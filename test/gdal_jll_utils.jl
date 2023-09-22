# This is testing GDAL/OGR utility executables.
# In `gdal_utils.jl` we test the utility library functions.

@test success(run(pipeline(`$(GDAL.gdalinfo_path()) $utmsmall`, devnull)))
