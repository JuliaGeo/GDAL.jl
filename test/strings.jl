@testset "Returned strings" begin
    @testset "Strings that GDAL allocates are copied and freed" begin
        geom = GDAL.ogr_g_creategeometry(GDAL.wkbPoint)
        GDAL.ogr_g_setpoint_2d(geom, 0, 1.0, 2.0)
        @test GDAL.ogr_g_exporttojson(geom) == "{ \"type\": \"Point\", \"coordinates\": [ 1.0, 2.0 ] }"
        @test GDAL.ogr_g_exporttokml(geom, C_NULL) == "<Point><coordinates>1,2</coordinates></Point>"
        @test GDAL.ogr_g_exporttogml(geom) == "<gml:Point><gml:coordinates>1,2</gml:coordinates></gml:Point>"
        GDAL.ogr_g_destroygeometry(geom)

        ds = GDAL.gdalopen("data/utmsmall.tif", GDAL.GA_ReadOnly)
        @test GDAL.gdalgetfilelist(ds) == ["data/utmsmall.tif"]
        @test "IMAGE_STRUCTURE" in GDAL.gdalgetmetadatadomainlist(ds)
        GDAL.gdalclose(ds)

        GDAL.cplsetconfigoption("GDALJL_TEST_OPTION", "value")
        @test "GDALJL_TEST_OPTION=value" in GDAL.cplgetconfigoptions()
        GDAL.cplsetconfigoption("GDALJL_TEST_OPTION", C_NULL)

        @test "utmsmall.tif" in GDAL.vsireaddir("data")
    end

    @testset "Lists that GDAL owns are only copied" begin
        fd = GDAL.ogr_fd_create("layer")
        GDAL.ogr_fd_addfielddefn(fd, GDAL.ogr_fld_create("names", GDAL.OFTStringList))
        feature = GDAL.ogr_f_create(fd)
        GDAL.ogr_f_setfieldstringlist(feature, 0, ["a", "b"])
        @test GDAL.ogr_f_getfieldasstringlist(feature, 0) == ["a", "b"]
        @test GDAL.ogr_f_getfieldasstringlist(feature, 0) == ["a", "b"]
        GDAL.ogr_f_destroy(feature)
    end
end
