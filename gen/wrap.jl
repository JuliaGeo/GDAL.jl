#=
Use Clang.jl to wrap the GDAL C API.

Several custom transformations are applied that should make using this package more convenient.

- docstrings are added, created from GDAL Doxygen XML output
- function names are lowercased following Julia conventions
- functions that return a Cstring are wrapped in unsafe_string to return a String
- functions that return a Ptr{Cstring} are wrapped in unsafe_loadstringlist to return a Vector{String}
- functions that return a Ptr{Cvoid} are wrapped in failsafe to catch errors
=#

using Clang
using MacroTools
using Logging
using EzXML
using CEnum  # to be able to include common.jl

const output_dir = joinpath(@__DIR__, "..", "src")
const xmlpath = joinpath(@__DIR__, "doxygen.xml")

# used to eval if a return type is Ptr{Cvoid}
include(joinpath(@__DIR__, "..", "src", "common.jl"))

# set up a global logger to log.txt to store the large amount of logging
loghandle = open(joinpath(@__DIR__, "log.txt"), "w")
logger = SimpleLogger(loghandle)
global_logger(logger)

# several functions for building docstrings
include(joinpath(@__DIR__, "doc.jl"))

includedir = normpath(joinpath(@__DIR__, "..", "deps", "usr", "include"))
headerfiles = joinpath.(includedir, [
    "cpl_conv.h",
    "cpl_error.h",
    "cpl_minixml.h",
    "cpl_port.h",
    "cpl_progress.h",
    "cpl_virtualmem.h",
    "cpl_vsi.h",
    "gdal.h",
    "gdal_alg.h",
    "gdalwarper.h",
    "gdal_vrt.h",
    "gdal_utils.h",
    "ogr_api.h",
    "ogr_core.h",
    "ogr_srs_api.h",
])

for headerfile in headerfiles
    if !isfile(headerfile)
        error("Header file missing, please run `pkg> build GDAL`($headerfile)")
    end
end

# skip these; right hand side is undefined usually because of Skipping MacroDefinition
# or because the right hand side is a function that is defined later
const skip_exprs = [
    :(const CPLAssert = expr),
    :(const EMULATED_BOOL = bool),
    :(const GINT64_MIN = GINTBIG_MIN),
    :(const GINT64_MAX = GINTBIG_MAX),
    :(const GUINT64_MAX = GUINTBIG_MAX),
    :(const VSI_L_OFFSET_MAX = GUINTBIG_MAX),
    :(const CPL_STATIC_ASSERT_IF_AVAILABLE = x),
    :(const CPL_NULLPTR = NULL),
    :(const stat = Cvoid),
    :(const tm = Cvoid),
    :(const CPLReadDir = VSIReadDir),
    :(const CPLFree = VSIFree),
    :(const VALIDATE_POINTER_ERR = CE_Failure)
]

const replace_exprs = Dict{Expr,Expr}(
    :(const VSIStatBuf = stat) => :(const VSIStatBuf = Cvoid),
    :(const VSIStatBufL = __stat64) => :(const VSIStatBufL = Cvoid),
)

"""
Custom rewriter for Clang.jl's C wrapper

Gets called with all expressions in a header file, or all expressiong in a common file.
If available, it adds docstrings before every expression, such that Clang.jl prints them
on top of the expression. The expressions themselves get sent to `rewriter(::Expr)`` for
further treatment.
"""
function rewriter(xs::Vector)
    rewritten = Any[]
    for x in xs
        # Clang.jl inserts strings like "# Skipping MacroDefinition: X"
        # keep these to get a sense of what we are missing
        if x isa String
            push!(rewritten, x)
            continue
        end
        @assert x isa Expr

        x in skip_exprs && continue
        x = get(replace_exprs, x, x)

        name = cname(x)
        node = findnode(name, doc)
        docstr = node === nothing ? "" : build_docstring(node)
        isempty(docstr) || push!(rewritten, addquotes(docstr))
        x2 = rewriter(x)
        push!(rewritten, x2)
    end
    rewritten
end

"Rewrite expressions in the ways listed at the top of this file."
function rewriter(x::Expr)
    if @capture(x,
        function f_(fargs__)
            ccall(fname_, rettype_, argtypes_, argvalues__)
        end
    )
        # it is a function wrapper around a ccall

        # lowercase the function name
        f2 = Symbol(lowercase(String(f)))

        # bind the ccall such that we can easily wrap it
        cc = :(ccall($fname, $rettype, $argtypes, $(argvalues...)))

        # eval to check if it is Ptr{Cvoid} indirectly
        # e.g. const GDALInfoOptions = Cvoid; Ptr{GDALInfoOptions}
        # it works since we include common.jl, meaning we do need to run this twice
        # in case a new run creates new const X = Cvoid
        isptrvoid = try
            eval(rettype) == Ptr{Cvoid}
        catch  # UndefVarError
            # it might still be true if common.jl is not yet complete, run twice to avoid this
            false
        end

        cc2 = if rettype == :Cstring
            :(unsafe_string($cc))
        elseif rettype == :(Ptr{Cstring})
            :(unsafe_loadstringlist($cc))
        elseif isptrvoid
            :(failsafe($cc))
        else
            cc
        end

        # stitch the modified function expression back together
        :(function $f2($(fargs...))
            $cc2
        end) |> prettify
    else
        # do not modify expressions that are no ccall function wrappers
        x
    end
end

# parse GDAL's Doxygen XML file
const doc = readxml(xmlpath)

# custom function that prevents overwriting GDAL.jl by mapping gdal.h to gdal_h.jl
function header_outputfile(h)
    stem = splitext(basename(h))[1]
    if stem == "gdal"
        joinpath(output_dir, "gdal_h.jl")
    else
        joinpath(output_dir, stem * ".jl")
    end
end

# set up the wrapping context
wc = init(;
    headers = headerfiles,
    output_dir = output_dir,
    common_file = joinpath(output_dir, "common.jl"),
    clang_includes = [includedir, CLANG_INCLUDE],
    clang_args = ["-I", includedir],
    header_wrapped = (root, current) -> root == current,
    header_library = x -> "libgdal",
    header_outputfile = header_outputfile,
    clang_diagnostics = true,
    rewriter = rewriter,
)

# run the wrapping
run(wc)

# delete empty file
rm(joinpath(@__DIR__, "..", "src", "cpl_port.jl"))
# delete Clang.jl helper files
rm(joinpath(@__DIR__, "..", "src", "LibTemplate.jl"))
rm(joinpath(@__DIR__, "..", "src", "ctypes.jl"))

close(loghandle)
