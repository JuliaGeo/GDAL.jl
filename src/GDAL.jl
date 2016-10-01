__precompile__()

module GDAL

using Compat

# this can go when all ccalls are done in the C submodule
const depfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if isfile(depfile)
  include(depfile)
else
  error("libgdal not properly installed. Please run Pkg.build(\"GDAL\")")
end

module C
    const depfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
    if isfile(depfile)
        include(depfile)
    else
        error("libgdal not properly installed. Please run Pkg.build(\"GDAL\")")
    end

    include("C/misc.jl")
    include("C/common.jl")
    include("C/cpl_error.jl")
    include("C/cpl_minixml.jl")
    include("C/cpl_progress.jl")
    include("C/gdal.jl")
    include("C/gdal_alg.jl")
    include("C/gdal_vrt.jl")
    include("C/gdal_utils.jl")
    include("C/gdalwarper.jl")
    include("C/ogr_api.jl")
    include("C/ogr_core.jl")
    include("C/ogr_srs_api.jl")
end

include("C/misc.jl")
include("types.jl")
include("common.jl")
include("gdal_h.jl")
include("gdal_alg.jl")
include("gdal_vrt.jl")
include("gdal_utils.jl")
include("ogr_api.jl")
include("ogr_srs_api.jl")

include("error.jl")

function __init__()
    # register custom error handler
    funcptr = cfunction(gdaljl_errorhandler, Ptr{Void}, (UInt32, Cint, Ptr{UInt8}))
    C.CPLSetErrorHandler(funcptr)

    # get GDAL version number
    versionstring = unsafe_string(C.GDALVersionInfo("RELEASE_NAME"))
    const GDALVERSION = convert(VersionNumber, versionstring)
    if GDALVERSION < v"2.0.0"
        warn("GDAL.jl is made for GDAL 2.0 and later")
    end
end

end
