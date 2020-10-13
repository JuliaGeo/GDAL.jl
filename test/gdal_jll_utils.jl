# This is testing GDAL/OGR utility executables.
# In `gdal_utils.jl` we test the utility library functions.

@test success(GDAL.gdalinfo_path() do gdinfo
    run(pipeline(`$gdinfo $utmsmall`, devnull))
end)
