using Clang
using LibExpat
using MacroTools

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
    elseif ex.head == :type
        # detect singletons: "mutable struct A end"
        # and rewrite them to "const A = Ptr{Void}"
        # without this rewrite they are not usable:
        # ERROR: ccall: the type of argument 1 doesn't correspond to a C type
        # see https://github.com/JuliaGeo/GDAL.jl/pull/41#discussion_r143345433
        # these singletons are meant to be opaque types, but in C are not of
        # type `typedef void *` but instead something like
        # `typedef struct OGRGeomFieldDefnHS *` (for OGRGeomFieldDefnH)

        # detect singletons by checking if any of the block args
        # are of type Symbol, which is the type of fieldnames
        # has_fields = any(el isa Symbol for el in ex.args[3].args)
        # if !has_fields
        #     typename = ex.args[2]::Symbol
        #     ex = :(const $typename = Ptr{Void})
        # end
        @capture(ex, mutable struct T_ fields__ end)
        if isempty(fields)
            ex = :(const $T = Ptr{Cvoid})
        end
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
                    rewriter=minimal_rewriter)

run(context)

rm(joinpath(srcdir, "C/cpl_port.jl")) # delete empty file
