using Clang
using LibExpat

const workdir = @__DIR__
const srcdir = joinpath(workdir, "../src")
include(joinpath(workdir, "doc.jl"))

const gdalpath = "/usr/local/include"
const includedirs = [gdalpath]

const headerfiles = [
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
]

const headerpaths = [joinpath(gdalpath, h) for h in headerfiles]

# skip these; right hand side is undefined
# usually because of Skipping MacroDefinition
const skip_expr = [
    :(const CPL_LSBPTR16 = x),
    :(const CPL_LSBPTR32 = x),
    :(const CPL_LSBPTR64 = x),
    :(const CPL_WARN_DEPRECATED_IF_GDAL_COMPILATION = x),
    :(const CPL_STATIC_ASSERT_IF_AVAILABLE = x),
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

const skip_func = [:CPLErrorV] # problem with va_list ihnorton/Clang.jl#17

"indicates if the pair should be wrapped"
function header_wrapped(headerfile, cursorname)
    # don't wrap included files
    headerfile == cursorname
end

"skip certain expressions"
function minimal_rewriter(ex::Expr)
    # comment out predefined expressions
    if in(ex, skip_expr)
        return string("# ", ex)
    end

    # if it is a function
    if ex.head == :function
        funcname = ex.args[1].args[1]
        @show funcname
        # skip predefined functions
        if funcname in skip_func
            return ""
        end
        # add docstring
        fnode_vec = functionnode(et, string(funcname))
        docstr = if isempty(fnode_vec)
            # this happens for instance when Doxygen is suppressed such as
            # for this function OGR_G_Intersect from ogr_api.h
            # /*! @cond Doxygen_Suppress */
            # /* backward compatibility (non-standard methods) */
            # int    CPL_DLL OGR_G_Intersect( OGRGeometryH, OGRGeometryH ) CPL_WARN_DEPRECATED("Non standard method. Use OGR_G_Intersects() instead");
            ""
        else
            fnode = fnode_vec[1]
            build_docstring(fnode)
        end

        # turn it into a tuple, special cased in visr/Clang.jl
        # done because a block Expr gets a begin/end block when printing
        ex = (docstr, ex)
    end
    ex
end

minimal_rewriter(s::AbstractString) = s # keep comments
minimal_rewriter(A::Vector) = [minimal_rewriter(a) for a in A]

context=wrap_c.init(headers=headerpaths,
                    output_dir=joinpath(srcdir, "C"),
                    common_file="common.jl",
                    clang_includes=includedirs,
                    header_wrapped=header_wrapped,
                    header_library=x->"libgdal",
                    rewriter=minimal_rewriter,
                    # wrap structs and make them immutable
                    options=wrap_c.InternalOptions(true, true))

run(context)

rm(joinpath(srcdir, "C/cpl_port.jl")) # delete empty file
