
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
    cplsetconfigoption("CURL_CA_BUNDLE", cacert)

    # set PROJ_LIB location, this overrides setting the environment variable
    PROJ_LIB[] = joinpath(PROJ_jll.artifact_dir, "share", "proj")
    osrsetprojsearchpaths([PROJ_LIB[]])
end

# end of epilogue.jl
