using GDAL
using Base.Test
using JSON

info(unsafe_string(GDAL.C.GDALVersionInfo("--version")))

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

srs = GDAL.newspatialreference(C_NULL)
GDAL.importfromepsg(srs, 4326) # fails if GDAL_DATA is not set correctly

xmlnode_pointer = GDAL.C.CPLParseXMLString("<a><b>hi</b></a>")
@test unsafe_string(GDAL.C.CPLGetXMLValue(xmlnode_pointer, "b", "")) == "hi"
# load into Julia struct, mutate, and put back as Ref into GDAL
xmlnode = unsafe_load(xmlnode_pointer)
xmlnode.pszValue = Base.unsafe_convert(Cstring, "c")  # rename "a" to "c"
@test unsafe_string(GDAL.C.CPLSerializeXMLTree(Ref(xmlnode))) == "<c>\n  <b>hi</b>\n</c>\n"
GDAL.C.CPLDestroyXMLNode(xmlnode_pointer)

cd(dirname(@__FILE__)) do
    isdir("tmp") || mkpath("tmp") # ensure it exists

    include("tutorial_raster.jl")
    include("tutorial_vector.jl")
    include("tutorial_vrt.jl")
    include("gdal_utils.jl")
end

GDAL.destroydrivermanager()
