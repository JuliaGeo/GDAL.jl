module GDAL

using Libdl
using CEnum

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("GDAL not installed properly, run Pkg.build(\"GDAL\"), restart Julia and try again")
end
include(depsjl_path)

module C
    import GDAL: libgdal
    using CEnum

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

# formerly in "C/misc.jl", to be removed
const FILE = Nothing # not sure if this works
const time_t = Nothing # not sure if this works

include("types.jl")
include("common.jl")
include("gdal_h.jl")
include("gdal_alg.jl")
include("gdal_vrt.jl")
include("gdal_utils.jl")
include("ogr_api.jl")
include("ogr_srs_api.jl")
include("cpl_error.jl")

include("error.jl")

const GDALVERSION = Ref{VersionNumber}()
const GDAL_DATA = Ref{String}()
const PROJ_LIB = Ref{String}()

function __init__()
    # Always check your dependencies from `deps.jl`
    check_deps()

    # register custom error handler
    funcptr = @cfunction(gdaljl_errorhandler, Ptr{Cvoid}, (CPLErr, Cint, Cstring))
    C.CPLSetErrorHandler(funcptr)

    # get GDAL version number
    versionstring = unsafe_string(C.GDALVersionInfo("RELEASE_NAME"))
    GDALVERSION[] = VersionNumber(versionstring)

    # set GDAL_DATA location, this overrides setting the environment variable
    GDAL_DATA[] = abspath(@__DIR__, "..", "deps", "usr", "share", "gdal")
    C.CPLSetConfigOption("GDAL_DATA", GDAL_DATA[])

    # set PROJ_LIB location, this overrides setting the environment variable
    PROJ_LIB[] = abspath(@__DIR__, "..", "deps", "usr", "share", "proj")
    ccall((:OSRSetPROJSearchPaths, libgdal), Cvoid, (Ptr{Cstring},), [PROJ_LIB[]])
end

"""
Load a null-terminated list of strings

That is it expects a `StringList`, in the sense of the CPL functions,
as a null-terminated array of strings.
"""
function unsafe_loadstringlist(ptr::Ptr{Cstring})
    strings = Vector{String}()
    (ptr == C_NULL) && return strings
    i = 1
    cstring = unsafe_load(ptr, i)
    while cstring != C_NULL
        push!(strings, unsafe_string(cstring))
        i += 1
        cstring = unsafe_load(ptr, i)
    end
    strings
end

end # module
