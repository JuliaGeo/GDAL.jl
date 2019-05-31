using GDAL
using Test

@testset "GDAL" begin

    # drivers
    # before being able to use any drivers, they must be registered first
    GDAL.allregister()

    version = unsafe_string(GDAL.C.GDALVersionInfo("--version"))
    n_gdal_driver = GDAL.getdrivercount()
    n_ogr_driver = GDAL.ogrgetdrivercount()
    @info """$version
    $n_gdal_driver GDAL drivers found
    $n_ogr_driver OGR drivers found
    """

    @test n_gdal_driver > 0
    @test n_ogr_driver > 0

    # test if the registered error handler also handles CE_Fatal
    @test_throws GDAL.GDALError GDAL.emergencyerror("we've got a problem")
    GDAL.errorreset()

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

    # ref https://github.com/JuliaGeo/GDAL.jl/pull/41#discussion_r143345433
    gfld = GDAL.gfld_create("name-a", GDAL.wkbPoint)
    @test gfld isa Ptr{GDAL.OGRGeomFieldDefnH}
    @test GDAL.getnameref(gfld) == "name-a"
    @test GDAL.gettype(gfld) == GDAL.wkbPoint
    # same as above but for the lower level C API
    gfld = GDAL.C.OGR_GFld_Create("name-b", GDAL.C.wkbPolygon)
    @test gfld isa Ptr{Cvoid}
    @test unsafe_string(GDAL.C.OGR_GFld_GetNameRef(gfld)) == "name-b"
    @test GDAL.C.OGR_GFld_GetType(gfld) == GDAL.C.wkbPolygon

    cd(dirname(@__FILE__)) do
        @info 1
        rm("tmp", recursive=true, force=true)
        mkpath("tmp") # ensure it exists
        include("tutorial_raster.jl")
        @info 2
        include("tutorial_vector.jl")
        @info 3
        include("tutorial_vrt.jl")
        @info 4
        include("gdal_utils.jl")
        @info 5
        include("drivers.jl")
        @info 6
    end

    GDAL.destroydrivermanager()
    @info 7

end
