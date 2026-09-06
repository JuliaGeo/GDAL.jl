module GDAL

using CEnum
using GDAL_jll
using PROJ_jll
using NetworkOptions: ca_roots_path

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

const _GDAL_CA_CONFIG_OPTIONS = (
    "GDAL_CURL_CA_BUNDLE",
    "CURL_CA_BUNDLE",
    "SSL_CERT_FILE",
    "GDAL_HTTP_CAPATH",
)

function _set_ca_roots!()
    any(option -> cplgetconfigoption(option, C_NULL) !== nothing,
        _GDAL_CA_CONFIG_OPTIONS) && return

    # On Windows, GDAL's C runtime may not see changes made through Julia's ENV.
    for option in _GDAL_CA_CONFIG_OPTIONS
        haskey(ENV, option) || continue
        cplsetconfigoption(option, ENV[option])
        return
    end

    ca_path = ca_roots_path()
    is_ca_directory =
        isdir(ca_path) || get(ENV, "SSL_CERT_DIR", nothing) == ca_path
    option = is_ca_directory ? "GDAL_HTTP_CAPATH" : "CURL_CA_BUNDLE"
    cplsetconfigoption(option, ca_path)
    return
end

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
    _set_ca_roots!()

    # set PROJ_LIB location, this overrides setting the environment variable
    PROJ_LIB[] = joinpath(PROJ_jll.artifact_dir, "share", "proj")
    osrsetprojsearchpaths([PROJ_LIB[]])

    # register all known configured GDAL drivers
    gdalallregister()
end

end # module
