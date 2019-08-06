#=
Run this file to regenerate C submodule of GDAL.jl.

This creates a 1:1 binding of most of GDAL, and directly adds documentation
from GDAL's Doxygen XML file. This overwrites the files in src/C, so beware.
The completely unaltered Clang.jl files are placed in gen/C.

It expects a GDAL install in the deps folder, run `build GDAL` in Pkg mode
if these are not in place.

The wrapped GDAL version and provided GDAL version should be kept in sync.
So when updating the GDALBuilder provided version, also rerun this wrapper.
This way we ensure that the provided library has the same functions available
as the wrapped one. Furthermore this makes sure constants in `gdal_common.jl`
like `GDAL_VERSION`, which are just strings, are correct.
=#

using Clang
using MacroTools
using Base.Meta
using Logging
using EzXML

xmlpath = "doxygen.xml"

loghandle = open("log.txt", "w")
logger = SimpleLogger(loghandle)
global_logger(logger)

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
    "ogr_srs_api.h"
])

# skip these; right hand side is undefined
# usually because of Skipping MacroDefinition
const skip_exprs = [
    :(const CPLAssert = expr),
    :(const EMULATED_BOOL = bool),
    :(const GINT64_MIN = GINTBIG_MIN),
    :(const GINT64_MAX = GINTBIG_MAX),
    :(const GUINT64_MAX = GUINTBIG_MAX),
    :(const VSI_L_OFFSET_MAX = GUINTBIG_MAX),
    # function aliases give bootstrapping problems
    # since common.jl is loaded before the functions
    :(const CPLReadDir = VSIReadDir),
    :(const CPLFree = VSIFree),
    # common.jl internal bootstrapping problems
    :(const VALIDATE_POINTER_ERR = CE_Failure)
]


wc = init(; headers = headerfiles,
            output_dir = joinpath(@__DIR__, "C"),
            common_file = joinpath(@__DIR__, "C", "common.jl"),
            clang_includes = [includedir, CLANG_INCLUDE],
            clang_args = ["-I", includedir],
            header_wrapped = (root, current) -> root == current,
            header_library = x -> "libgdal",
            clang_diagnostics = true,
            )

# generate wrapper functions without docstrings
# docstrings will be added after this step
run(wc)
rm(joinpath(@__DIR__, "C", "cpl_port.jl"))  # delete empty file

"Get the C name out of a expression"
function cname(ex)
    if MacroTools.isdef(ex)
        @capture(ex, function f_(args__) ccall((a_, b_), xs__) end)
        String(eval(a))
    else
        # TODO make MacroTools.namify work for structs and macros
        if MacroTools.isexpr(ex) && ex.head === :struct
            String(ex.args[2])
        elseif MacroTools.isexpr(ex) && ex.head === :macrocall
            # if the enum has a type specified
            String(ex.args[3].args[1])
        else
            String(namify(ex))
        end
    end
end

"Add docstrings to all expressions and writes to a new file"
function add_docstrings_to_file(inpath::String, outpath::String, doc::EzXML.Document)
    # wrap string in quote such that it forms one expresion that we can parse
    header1, header2 = open(inpath) do io
        header1 = readline(io)
        header2 = readline(io, keep=true)
        header1, header2
    end

    s = join(["quote", read(inpath, String), "end"], ";")

    file_expr = prettify(Meta.parse(s))
    # get a list of function expressions
    exprs = file_expr.args[1].args
    open(outpath, "w") do io
        println(io, header1)
        println(io, header2)

        for expr in exprs
            name = cname(expr)

            expr in skip_exprs  && continue

            # names are not unique, also for functions like GDALScaledProgress
            # we currently just stick with the first one since for one example
            # that was the best docstring (one had argnames, the other not)
            # would be good to explore further, e.g. can we only look at C API?
            node = findfirst("/doxygen/compounddef/sectiondef/memberdef[name=\"$name\"]", doc)
            docstr = node === nothing ? "" : build_docstring(node)
            if !isempty(docstr)
                if '\n' in docstr
                    println(io, "\"\"\"")
                    print(io, docstr)
                    println(io, "\"\"\"")
                else
                    # one line docstring
                    println(io, '"', rstrip(docstr, '.'), '"')
                end
            end
            println(io, prettify(expr))
            # we want a blank line between functions, and not two at the end
            expr === last(exprs) || println(io)
        end
    end
end

function add_docstrings_to_all_files(xmlpath::String)
    # parse Doxygen XML file
    doc = readxml(xmlpath)

    for headerfile in headerfiles
        name = replace(basename(headerfile), ".h"=>".jl")
        name == "cpl_port.jl"  && continue
        inpath = joinpath(@__DIR__, "C", name)
        outpath = joinpath(@__DIR__, "../src/C", name)
        add_docstrings_to_file(inpath, outpath, doc)
    end

    # we can also add docstrings to common.jl!
    add_docstrings_to_file(joinpath(@__DIR__, "C/common.jl"), joinpath(@__DIR__, "../src/C/common.jl"), doc)
end

add_docstrings_to_all_files(xmlpath)
close(loghandle)
