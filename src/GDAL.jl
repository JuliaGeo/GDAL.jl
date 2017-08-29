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
    include("C/cpl_conv.jl")
    include("C/cpl_error.jl")
    include("C/cpl_minixml.jl")
    include("C/cpl_progress.jl")
    include("C/cpl_virtualmem.jl")
    include("C/cpl_vsi.jl")
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

"find a path for the GDAL_DATA environment variable based on gdal-config or some heuristics"
function find_gdal_data(libgdal::String)
    # libgdal is the absolute path to the shared library defined in deps.jl
    gdaldir = dirname(libgdal)

    # try gdal-config --datadir
    @static if is_unix()
        # assume gdal-config is in the same directory as libgdal
        gdalconfig = joinpath(gdaldir, "gdal-config")
        if isfile(gdalconfig)
            datadir = chomp(readstring(`$gdalconfig --datadir`))
            isfile(joinpath(datadir, "gcs.csv")) && return datadir
        else
            # if gdal-config is in path, use that as a second choice
            try
                datadir = chomp(readstring(`gdal-config --datadir`))
                isfile(joinpath(datadir, "gcs.csv")) && return datadir
            end
        end
    end

    RPMbindir = Pkg.dir("WinRPM","deps","usr","$(Sys.ARCH)-w64-mingw32","sys-root","mingw","bin")
    if gdaldir == RPMbindir
        datadir = abspath(joinpath(gdaldir, "../share"))
    else
        # this is the relative path to GDAL_DATA for at least OSGeo4w and conda installations
        datadir = abspath(joinpath(gdaldir, "../share/gdal"))
    end
    isfile(joinpath(datadir, "gcs.csv")) && return datadir
    return "" # return an empty string if we failed to find it
end

function __init__()
    # register custom error handler
    funcptr = cfunction(gdaljl_errorhandler, Ptr{Void}, (UInt32, Cint, Ptr{UInt8}))
    C.CPLSetErrorHandler(funcptr)

    # get GDAL version number
    versionstring = unsafe_string(C.GDALVersionInfo("RELEASE_NAME"))
    global const GDALVERSION = convert(VersionNumber, versionstring)
    if GDALVERSION < v"2.0.0"
        warn("GDAL.jl is made for GDAL 2.0 and later")
    end

    # ensure GDAL_DATA environment variable is set
    if haskey(ENV, "GDAL_DATA")
        # gcs.csv can always be expected in the GDAL_DATA folder
        if !isfile(joinpath(ENV["GDAL_DATA"], "gcs.csv"))
            warn("""GDAL_DATA environment variable is not set correctly.
            GDAL_DATA=$(ENV["GDAL_DATA"])""")
        end
        GDAL_DATA = ENV["GDAL_DATA"]
    else
        # try to find and set GDAL_DATA
        datadir = find_gdal_data(libgdal)
        if datadir == ""
            warn("""GDAL_DATA environment variable cannot be found, please set it manually.
            See https://trac.osgeo.org/gdal/wiki/FAQInstallationAndBuilding#WhatisGDAL_DATAenvironmentvariable""")
        end
        GDAL_DATA = datadir
    end
    # set the GDAL_DATA variable
    C.CPLSetConfigOption("GDAL_DATA", GDAL_DATA)
end

end
