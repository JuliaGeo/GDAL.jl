using GDAL
using Test
import Aqua

@testset "GDAL" begin

    version = GDAL.gdalversioninfo("--version")
    n_gdal_driver = GDAL.gdalgetdrivercount()
    n_ogr_driver = GDAL.ogrgetdrivercount()
    @info """$version
    $n_gdal_driver GDAL drivers found
    $n_ogr_driver OGR drivers found
    """

    @test n_gdal_driver > 0
    @test n_ogr_driver > 0

    @testset "CA certificate configuration" begin
        ca_options = GDAL._GDAL_CA_CONFIG_OPTIONS
        original_options =
            Dict(option => GDAL.cplgetglobalconfigoption(option, C_NULL)
                 for option in ca_options)
        withenv((option => nothing for option in ca_options)...) do
            try
                foreach(option -> GDAL.cplsetconfigoption(option, C_NULL), ca_options)
                withenv("JULIA_SSL_CA_ROOTS_PATH" => "",
                        "SSL_CERT_FILE" => nothing,
                        "SSL_CERT_DIR" => nothing) do
                    GDAL._set_ca_roots!()
                    ca_path = GDAL.ca_roots_path()
                    option = isdir(ca_path) ? "GDAL_HTTP_CAPATH" : "CURL_CA_BUNDLE"
                    @test GDAL.cplgetconfigoption(option, C_NULL) == ca_path
                end

                foreach(option -> GDAL.cplsetconfigoption(option, C_NULL), ca_options)
                mktempdir() do ca_directory
                    withenv("JULIA_SSL_CA_ROOTS_PATH" => nothing,
                            "SSL_CERT_FILE" => nothing,
                            "SSL_CERT_DIR" => ca_directory) do
                        GDAL._set_ca_roots!()
                        @test GDAL.cplgetconfigoption("GDAL_HTTP_CAPATH", C_NULL) ==
                              ca_directory
                        @test GDAL.cplgetconfigoption("CURL_CA_BUNDLE", C_NULL) ===
                              nothing
                    end
                end

                for preserved_option in ca_options
                    foreach(option -> GDAL.cplsetconfigoption(option, C_NULL), ca_options)
                    GDAL.cplsetconfigoption(preserved_option, "custom-ca-setting")
                    GDAL._set_ca_roots!()
                    @test GDAL.cplgetconfigoption(preserved_option, C_NULL) ==
                          "custom-ca-setting"
                    @test count(option ->
                                    GDAL.cplgetconfigoption(option, C_NULL) !== nothing,
                                ca_options) == 1
                end

                foreach(option -> GDAL.cplsetconfigoption(option, C_NULL), ca_options)
                withenv("GDAL_CURL_CA_BUNDLE" => "custom-ca-from-env") do
                    GDAL._set_ca_roots!()
                    @test GDAL.cplgetconfigoption("GDAL_CURL_CA_BUNDLE", C_NULL) ==
                          "custom-ca-from-env"
                    @test GDAL.cplgetconfigoption("CURL_CA_BUNDLE", C_NULL) === nothing
                end
            finally
                for (option, value) in original_options
                    GDAL.cplsetconfigoption(option, something(value, C_NULL))
                end
            end
        end
    end

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
    @test gfld isa Ptr{GDAL.OGRGeomFieldDefnHS}
    @test GDAL.ogr_gfld_getnameref(gfld) == "name-b"
    @test GDAL.ogr_gfld_gettype(gfld) == GDAL.wkbPolygon

    cd(dirname(@__FILE__)) do
        rm("tmp", recursive = true, force = true)
        mkpath("tmp") # ensure it exists
        include("tutorial_raster.jl")
        include("tutorial_vector.jl")
        include("tutorial_vrt.jl")
        include("gdal_utils.jl")
        include("gdal_jll_utils.jl")
        include("drivers.jl")
        include("error.jl")
    end

    GDAL.gdaldestroydrivermanager()

    Aqua.test_all(GDAL)
end
