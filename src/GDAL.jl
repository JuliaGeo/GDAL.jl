module GDAL

using Libdl
using CEnum

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("GDAL not installed properly, run Pkg.build(\"GDAL\"), restart Julia and try again")
end
include(depsjl_path)

const Ctm = Base.Libc.TmStruct

include("common.jl")

include("gdal_h.jl")
include("gdal_alg.jl")
include("gdal_vrt.jl")
include("gdal_utils.jl")
include("gdalwarper.jl")

include("ogr_api.jl")
include("ogr_srs_api.jl")
include("ogr_core.jl")

include("cpl_error.jl")
include("cpl_conv.jl")
include("cpl_error.jl")
include("cpl_minixml.jl")
include("cpl_progress.jl")
include("cpl_virtualmem.jl")
include("cpl_vsi.jl")

include("error.jl")

const GDALVERSION = Ref{VersionNumber}()
const GDAL_DATA = Ref{String}()
const PROJ_LIB = Ref{String}()

function __init__()
    # Always check your dependencies from `deps.jl`
    check_deps()

    # register custom error handler
    funcptr = @cfunction(gdaljl_errorhandler, Ptr{Cvoid}, (CPLErr, Cint, Cstring))
    cplseterrorhandler(funcptr)

    # get GDAL version number
    versionstring = gdalversioninfo("RELEASE_NAME")
    GDALVERSION[] = VersionNumber(versionstring)

    # set GDAL_DATA location, this overrides setting the environment variable
    GDAL_DATA[] = abspath(@__DIR__, "..", "deps", "usr", "share", "gdal")
    cplsetconfigoption("GDAL_DATA", GDAL_DATA[])

    # set PROJ_LIB location, this overrides setting the environment variable
    PROJ_LIB[] = abspath(@__DIR__, "..", "deps", "usr", "share", "proj")
    osrsetprojsearchpaths([PROJ_LIB[]])
end

end # module
