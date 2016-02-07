using GDAL
using Base.Test

info(bytestring(GDAL.C.GDALVersionInfo(pointer("--version"))))

# drivers
info(GDAL.C.GDALGetDriverCount(), " GDAL drivers found")
info(GDAL.C.OGRGetDriverCount(), " OGR drivers found")
@test GDAL.C.GDALGetDriverCount() > 0
@test GDAL.C.OGRGetDriverCount() > 0

# throw errors on non existing files
@test_throws GDAL.GDALError GDAL.C.GDALOpen(pointer("NonExistent"), GDAL.C.GA_ReadOnly)
# if a driver is not found, the C API returns a null
@test GDAL.C.GDALGetDriverByName(pointer("NonExistent")) == C_NULL

cd(dirname(@__FILE__)) do
    isdir("tmp") || mkpath("tmp") # ensure it exists

    include("tutorial_raster.jl")
    include("tutorial_vector.jl")
end
