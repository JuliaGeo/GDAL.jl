@testset "GDAL errors" begin
    # throw errors on non existing files
    @test_throws GDAL.GDALError GDAL.gdalopen("NonExistent", GDAL.GA_ReadOnly)
    # if a driver is not found it doesn't throw a GDALError
    @test GDAL.gdalgetdriverbyname("NotADriver") === C_NULL

    @testset "error reset" begin
        # everything ok, no errors
        @test GDAL.gdalgetdriverbyname("NoSuchDriver") == C_NULL
        @test GDAL.cplgetlasterrorno() === Int32(0)
        @test GDAL.cplgetlasterrortype() === GDAL.CE_None
        @test GDAL.cplgetlasterrormsg() === ""
        @test GDAL.cplgeterrorcounter() === UInt32(0)
        # Throws a GDALError, but since we call cplerrorreset in our error handler
        # we cannot get the error information via the API after the throw.
        @test_throws GDAL.GDALError GDAL.gdalgetdrivershortname(C_NULL)
        @test GDAL.cplgetlasterrorno() === Int32(0)
        @test GDAL.cplgetlasterrortype() === GDAL.CE_None
        @test GDAL.cplgetlasterrormsg() === ""
        @test GDAL.cplgeterrorcounter() === UInt32(0)
        # however all this information is in the GDALError struct
        try
            GDAL.gdalgetdrivershortname(C_NULL)
        catch err
            @test err.class === GDAL.CE_Failure
            @test err.code === Int32(10)
            @test err.msg === "Pointer 'hDriver' is NULL in 'GDALGetDriverShortName'.\n"
        end
    end

    # infooptionsnew checks if the options are valid
    @test_throws GDAL.GDALError GDAL.gdalinfooptionsnew(["-novalidoption"], C_NULL)
    # check not only that a GDALError is thrown, but also its contents
    try
        GDAL.gdalinfooptionsnew(["-novalidoption"], C_NULL)
    catch err
        @test err.class === GDAL.CE_Failure
        @test err.code === Cint(6)
        @test err.msg === "Unknown option name '-novalidoption'"
    end

    @testset "Cstring handling" begin
        # string_or_nothing should return nothing here
        srs = GDAL.osrnewspatialreference(C_NULL)
        @test GDAL.osrgetattrvalue(srs, "NoSuchAttr", 0) === nothing
    end

    # Quoting cpl_error.cpp regarding CE_Fatal:
    # > The default behaviour of CPLError() is to report errors to stderr,
    # > and to abort() after reporting a CE_Fatal error.  It is expected that
    # > some applications will want to suppress error reporting, and will want to
    # > install a C++ exception, or longjmp() approach to no local fatal error
    # > recovery.
    # The abort means we cannot catch CE_Fatal GDALErrors.
    # Interestingly, the following works once:
    # @test_throws GDAL.GDALError GDAL.cplemergencyerror("things are bad")
    # But if you run that line a second time, it quits julia with:
    # FATAL: things are bad
    # signal (22): SIGABRT
    # So let's not even test it once to be safe

end # testset "GDAL errors"
