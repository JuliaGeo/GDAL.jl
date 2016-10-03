using Clang
using LibExpat

workdir = dirname(@__FILE__)
srcdir = joinpath(workdir, "../src")
include(joinpath(workdir, "doc.jl"))

gdalpath = "/home/martijn/bin/gdal/include"
includedirs = [gdalpath]

headerfiles = ["cpl_error.h",
               "cpl_minixml.h",
               "cpl_port.h",
               "cpl_progress.h",
               "gdal.h",
               "gdal_alg.h",
               "gdalwarper.h",
               "gdal_vrt.h",
               "gdal_utils.h",
               "ogr_api.h",
               "ogr_core.h",
               "ogr_srs_api.h"]

headerpaths = [joinpath(gdalpath, h) for h in headerfiles]

skip_expr = [:(const CPL_LSBPTR16 = x),
             :(const CPL_LSBPTR32 = x),
             :(const CPL_LSBPTR64 = x),
             :(const CPL_WARN_DEPRECATED_IF_GDAL_COMPILATION = x),
             :(const CPL_STATIC_ASSERT_IF_AVAILABLE = x),
             :(const CPLAssert = expr),
             :(const EMULATED_BOOL = bool)]

skip_func = [:CPLErrorV] # problem with va_list ihnorton/Clang.jl#17

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
        fnode = functionnode(et, string(funcname))
        docstr = build_docstring(fnode)
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
                    rewriter=minimal_rewriter)

run(context)

rm(joinpath(srcdir, "C/cpl_port.jl")) # delete empty file
