using GDAL
using Test

@testset "GDAL" begin

    # drivers
    # before being able to use any drivers, they must be registered first
    GDAL.gdalallregister()

    version = GDAL.gdalversioninfo("--version")
    n_gdal_driver = GDAL.gdalgetdrivercount()
    n_ogr_driver = GDAL.ogrgetdrivercount()
    @info """$version
    $n_gdal_driver GDAL drivers found
    $n_ogr_driver OGR drivers found
    """

    @test n_gdal_driver > 0
    @test n_ogr_driver > 0

    srs = GDAL.osrnewspatialreference(C_NULL)
    GDAL.osrimportfromepsg(srs, 4326) # fails if GDAL_DATA is not set correctly

    xmlnode_pointer = GDAL.cplparsexmlstring("<a><b>hi</b></a>")
    @test GDAL.cplgetxmlvalue(xmlnode_pointer, "b", "") == "hi"
    # load into Julia struct, mutate, and put back as Ref into GDAL
    xmlnode = unsafe_load(xmlnode_pointer)
    @test GDAL.cplserializexmltree(Ref(xmlnode)) == "<a>\n  <b>hi</b>\n</a>\n"
    GDAL.cpldestroyxmlnode(xmlnode_pointer)

    # ref https://github.com/JuliaGeo/GDAL.jl/pull/41#discussion_r143345433
    gfld = GDAL.ogr_gfld_create("name-a", GDAL.wkbPoint)
    @test gfld isa GDAL.OGRGeomFieldDefnH
    @test GDAL.ogr_gfld_getnameref(gfld) == "name-a"
    @test GDAL.ogr_gfld_gettype(gfld) == GDAL.wkbPoint
    # same as above but for the lower level C API
    gfld = GDAL.ogr_gfld_create("name-b", GDAL.wkbPolygon)
    @test gfld isa Ptr{Cvoid}
    @test GDAL.ogr_gfld_getnameref(gfld) == "name-b"
    @test GDAL.ogr_gfld_gettype(gfld) == GDAL.wkbPolygon

    cd(dirname(@__FILE__)) do
        rm("tmp", recursive=true, force=true)
        mkpath("tmp") # ensure it exists
        include("tutorial_raster.jl")
        include("tutorial_vector.jl")
        include("tutorial_vrt.jl")
        include("gdal_utils.jl")
        include("drivers.jl")
        include("error.jl")
    end

    GDAL.gdaldestroydrivermanager()

end
