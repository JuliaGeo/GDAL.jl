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
        @test err.code === Cint(1)
        @test err.msg === "Unknown argument: -novalidoption"
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

    @testset "opting out of error checks" begin
        @test GDAL.check_errors[] === true
        # The reference call: checked by default, so it throws.
        @test_throws GDAL.GDALError GDAL.gdalgetdrivershortname(C_NULL)

        GDAL.check_errors[] = false
        try
            # Same call, unchecked: aftercare returns the NULL Cstring as nothing
            # and leaves GDAL's error state for the caller to inspect.
            @test GDAL.gdalgetdrivershortname(C_NULL) === nothing
            @test GDAL.cplgetlasterrortype() === GDAL.CE_Failure
            @test GDAL.cplgetlasterrorno() === Int32(10)
        finally
            GDAL.check_errors[] = true
            GDAL.cplerrorreset()
        end
        # Checking is restored, and the discarded error state does not leak out.
        @test GDAL.cplgetlasterrortype() === GDAL.CE_None
        @test_throws GDAL.GDALError GDAL.gdalgetdrivershortname(C_NULL)

        @testset "without_error_checks" begin
            # Returns f()'s value, and checks are off for its duration.
            result = GDAL.without_error_checks() do
                @test GDAL.check_errors[] === false
                42
            end
            @test result == 42
            @test GDAL.check_errors[] === true

            # Restores the flag when f throws.
            @test_throws ErrorException GDAL.without_error_checks() do
                error("boom")
            end
            @test GDAL.check_errors[] === true

            # Restores the previous value rather than forcing `true`.
            GDAL.check_errors[] = false
            GDAL.without_error_checks() do
                nothing
            end
            @test GDAL.check_errors[] === false
            GDAL.check_errors[] = true

            # A failure inside the block is not thrown; it surfaces on the next
            # checked call, which resets the state as usual.
            GDAL.without_error_checks() do
                @test GDAL.gdalgetdrivershortname(C_NULL) === nothing
            end
            @test_throws GDAL.GDALError GDAL.gdalgetdriverbyname("NotADriver")
            @test GDAL.cplgetlasterrortype() === GDAL.CE_None
        end
    end

end # testset "GDAL errors"
