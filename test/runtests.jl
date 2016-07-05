using GDAL
using Base.Test

info(bytestring(GDAL.C.GDALVersionInfo("--version")))

# drivers
# before being able to use any drivers, they must be registered first
GDAL.allregister()
info(GDAL.getdrivercount(), " GDAL drivers found")
info(GDAL.ogrgetdrivercount(), " OGR drivers found")
@test GDAL.getdrivercount() > 0
@test GDAL.ogrgetdrivercount() > 0

# throw errors on non existing files
@test_throws GDAL.GDALError GDAL.open("NonExistent", GDAL.GA_ReadOnly)
# if a driver is not found, the C API returns a null
@test GDAL.C.GDALGetDriverByName("NonExistent") == C_NULL
# whilst the rewritten API throws a GDALError
@test_throws GDAL.GDALError GDAL.getdriverbyname("NonExistent")

cd(dirname(@__FILE__)) do
    isdir("tmp") || mkpath("tmp") # ensure it exists

    include("tutorial_raster.jl")
    include("tutorial_vector.jl")
    include("tutorial_vrt.jl")
end

GDAL.destroydrivermanager()
