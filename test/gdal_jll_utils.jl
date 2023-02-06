# This is testing GDAL/OGR utility executables.
# In `gdal_utils.jl` we test the utility library functions.

@test success(GDAL.gdalinfo_path() do gdinfo
    run(pipeline(`$gdinfo $utmsmall`, devnull))
end)

# preferred thread-safe wrapper syntax on Julia 1.6+
@test success(run(pipeline(`$(GDAL.gdalinfo_path()) $utmsmall`, devnull)))
