module GDAL

using CEnum
using GDAL_jll
using PROJ_jll
using NetworkOptions: ca_roots

# some manual replacements for generated code in libgdal.jl
const stat = Cvoid
const _stat64 = Cvoid
const tm = Libc.TmStruct
const time_t = Int

CPL_STATIC_CAST(type, value) = value % type
GDAL_COMPUTE_VERSION(maj, min, rev) = ((maj) * 1000000 + (min) * 10000 + (rev) * 100)

include("libgdal.jl")
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
    ca_path = ca_roots()
    if ca_path !== nothing
        cplsetconfigoption("CURL_CA_BUNDLE", ca_path)
    end

    # set PROJ_LIB location, this overrides setting the environment variable
    PROJ_LIB[] = joinpath(PROJ_jll.artifact_dir, "share", "proj")
    osrsetprojsearchpaths([PROJ_LIB[]])

    # register all known configured GDAL drivers
    gdalallregister()
end

end # module
