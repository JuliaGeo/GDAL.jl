
# begin of epilogue.jl

include("error.jl")

const GDALVERSION = Ref{VersionNumber}()
const GDAL_DATA = Ref{String}()
const PROJ_LIB = Ref{String}()

function __init__()
    # register custom error handler
    funcptr = @cfunction(gdaljl_errorhandler, Ptr{Cvoid}, (CPLErr, Cint, Cstring))
    cplseterrorhandler(funcptr)

    # get GDAL version number
    versionstring = gdalversioninfo("RELEASE_NAME")
    GDALVERSION[] = VersionNumber(versionstring)

    # set GDAL_DATA location, this overrides setting the environment variable
    GDAL_DATA[] = joinpath(GDAL_jll.artifact_dir, "share", "gdal")
    cplsetconfigoption("GDAL_DATA", GDAL_DATA[])

    # set path to CA certificates
    ca_path = @static if VERSION >= v"1.6"
        ca_roots()
    else
        ca_roots_path()
    end
    if ca_path !== nothing
        cplsetconfigoption("CURL_CA_BUNDLE", ca_path)
    end

    # set PROJ_LIB location, this overrides setting the environment variable
    PROJ_LIB[] = joinpath(PROJ_jll.artifact_dir, "share", "proj")
    osrsetprojsearchpaths([PROJ_LIB[]])
end

# end of epilogue.jl
