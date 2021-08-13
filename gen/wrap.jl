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
using Clang.Generators
using MacroTools
using Logging
using EzXML
using GDAL_jll
using JuliaFormatter

const output_dir = joinpath(@__DIR__, "..", "src")
const xmlpath = joinpath(@__DIR__, "doxygen.xml")

# set up a global logger to log.txt to store the large amount of logging
loghandle = open(joinpath(@__DIR__, "log.txt"), "w")
logger = SimpleLogger(loghandle)
global_logger(logger)

# several functions for building docstrings
include(joinpath(@__DIR__, "doc.jl"))

includedir = joinpath(GDAL_jll.artifact_dir, "include")
headerfiles =
    joinpath.(
        includedir,
        [
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
        ],
    )

for headerfile in headerfiles
    if !isfile(headerfile)
        error("Header file missing `($headerfile)")
    end
end

# skip these; right hand side is undefined usually because of Skipping MacroDefinition
# or because the right hand side is a function that is defined later
const skip_exprs = [
    :(const CPLAssert = expr),
    :(const CPL_UNSTABLE_API = CPL_DLL),
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
    :(const VALIDATE_POINTER_ERR = CE_Failure),
]

const replace_exprs = Dict{Expr,Expr}(
    :(const VSIStatBuf = stat) => :(const VSIStatBuf = Cvoid),
    :(const VSIStatBufL = __stat64) => :(const VSIStatBufL = Cvoid),
)

# functions that return a Cstring, of which we know we must free them
# because for instance the documentation says: "Free with CPLFree() or VSIFree()"
# use the renamed (lowercased) function names here
# if it is not in this list, it will not be freed, add function names to make it more complete
const string_free_me = Symbol[:gdalinfo]

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
    if @capture(x, function f_(fargs__)
        ccall(fname_, rettype_, argtypes_, argvalues__)
    end)
        # it is a function wrapper around a ccall

        # lowercase the function name
        f2 = Symbol(lowercase(String(f)))

        # bind the ccall such that we can easily wrap it
        cc = :(ccall($fname, $rettype, $argtypes, $(argvalues...)))

        cc2 = if occursin(r"^cpl.*error", String(f2))
            # We will take care of GDAL error states and memory freeing by
            # calling `aftercare`, except for `cpl*error*` functions, as these
            # will be called by `aftercare` itself, so we prevent a loop.
            if rettype == :Cstring
                :(unsafe_string($cc))
            else
                cc
            end
        elseif rettype == :Cstring
            # boolean to let aftercare know if it should call vsifree
            free = f2 in string_free_me
            :(aftercare($cc, $free))
        else
            :(aftercare($cc))
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


function rewriter(dag::Clang.ExprDAG)
    for node in get_nodes(dag)
        # Macros are not generated, so no need to skip
        map!(rewriter, node.exprs, node.exprs)
    end
end


# do not wrap, handled in prologue.jl
@add_def stat
@add_def _stat64
@add_def time_t

options = load_options(joinpath(@__DIR__, "generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()
push!(args, "-I$includedir")

# create context
ctx = create_context(headerfiles, args, options)

# run generator
build!(ctx, BUILDSTAGE_NO_PRINTING)
rewriter(ctx.dag)
build!(ctx, BUILDSTAGE_PRINTING_ONLY)

add_doc(joinpath(@__DIR__, "..", "src", "GDAL.jl"))

close(loghandle)

format(joinpath(@__DIR__, ".."))
