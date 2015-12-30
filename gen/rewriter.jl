using LibExpat

workdir = dirname(@__FILE__)
include(joinpath(workdir, "doc.jl"))
srcdir = joinpath(workdir, "../src")

headerfiles = [
    "gdal.jl",
    "gdal_alg.jl",
    "ogr_api.jl",
    "ogr_srs_api.jl"
]

strip_prefixes = [
    (r"^gdal_cg_", ""),
    (r"^gdal_", ""),
    (r"^gdal", ""),
    (r"^ogr_g_", ""),
    (r"^ogr_f_", ""),
    (r"^ogr_fld_", ""),
    (r"^ogr_gfld_", ""),
    (r"^ogr_fd_", ""),
    (r"^ogr_l_", ""),
    (r"^ogr_ds_", ""),
    (r"^ogr_dr_", ""),
    (r"^ogr_sm_", ""),
    (r"^ogr_st_", ""),
    (r"^ogr_stbl_", ""),
    (r"^ogr_", ""),
    (r"^ogr", ""),
    (r"^osr", "")
]

# all these are typealias of Ptr{Void} and are returned by a wrapped function
check_nullpointer = [
    :FilterFunc4ValuesType,
    :FilterFuncType,
    :GDALAsyncReaderH,
    :GDALColorTableH,
    :GDALContourGeneratorH,
    :GDALDatasetH,
    :GDALDriverH,
    :GDALRasterAttributeTableH,
    :GDALRasterBandH,
    :GDALWarpOperationH,
    :OGRCoordinateTransformationH,
    :OGRDataSourceH,
    :OGRFeatureDefnH,
    :OGRFeatureH,
    :OGRFieldDefnH,
    :OGRGeometryH,
    :OGRGeomFieldDefnH,
    :OGRLayerH,
    :OGRSFDriverH,
    :OGRSpatialReferenceH,
    :OGRStyleMgrH,
    :OGRStyleTableH,
    :OGRStyleToolH
]

parsefile(file) = parse(join(["quote", readall(file), "end"], ";"))

"rename the function to more a julian convention"
function newfuncname(name::Symbol)
    name = lowercase(string(name))
    for (pat, r) in strip_prefixes
        name = replace(name, pat, r)
    end
    symbol(name)
end

"rewrite certain expressions"
function rewriter(ex::Expr)
    orig_ex = copy(ex)

    # rename function name
    old_funcname = ex.args[1].args[1]
    new_funcname = newfuncname(old_funcname)
    ex.args[1].args[1] = new_funcname
    shift!(ex.args[2].args) # removes LineNumberNode

    # add docstring
    fnode = functionnode(et, string(old_funcname))
    docstr = build_docstring(fnode)
    # turn it into a tuple, special cased in visr/Clang.jl
    # done because a block Expr gets a begin/end block when printing

    # function signature
    for arg in ex.args[1].args[2:end]
        # loosen type constraints; ccall will convert the arguments
        if arg.args[2] == :Cint
            arg.args[2] = :Integer
        elseif arg.args[2] == :Cdouble
            arg.args[2] = :Real
        elseif arg.args[2] == :(Ptr{Cdouble})
            arg.args[2] = :(Vector{Float64})
        elseif arg.args[2] == :(Ptr{Cint})
            arg.args[2] = :(Vector{Cint})
        elseif arg.args[2] == :(Ptr{GDALRasterIOExtraArg})
            arg.args[2] = :GDALRasterIOExtraArg
        elseif arg.args[2] == :(Ptr{UInt8})
            arg.args[2] = :AbstractString
        elseif arg.args[2] == :(Ptr{Ptr{UInt8}})
            arg.args[2] = :(Vector{UTF8String})
        end
    end
    assert(ex.args[2].args[1].head == :ccall)
    # ccall input types
    assert(ex.args[2].args[1].args[3].head == :tuple)
    intypes = ex.args[2].args[1].args[3].args
    for i = 1:length(intypes)
        # memory owned by julia
        if intypes[i] == :(Ptr{GDALRasterIOExtraArg})
            intypes[i] = :(Ref{GDALRasterIOExtraArg})
        end
    end
    # ccall return type
    rettype = ex.args[2].args[1].args[2]
    if rettype == :(Ptr{UInt8})
        ex.args[2].args[1] = Expr(:call, :bytestring, ex.args[2].args[1])
    elseif rettype == :(Ptr{Ptr{UInt8}})
        ex.args[2].args[1] = Expr(:call, :unsafe_load, ex.args[2].args[1])
        ex.args[2].args[1] = Expr(:call, :bytestring, ex.args[2].args[1])
    elseif rettype in check_nullpointer
        ex.args[2].args[1] = Expr(:call, :checknull, ex.args[2].args[1])
    end
    (docstr, ex)
end

for headerfile in headerfiles
    expr = parsefile(joinpath(srcdir, "C", headerfile))
    # rename gdal.jl to prevent name clash
    headerfile = headerfile == "gdal.jl" ? "gdal_h.jl" : headerfile
    open(joinpath(srcdir, headerfile), "w") do io
        for el in expr.args[1].args
            if isa(el, Expr)
                if el.head == :function
                    docstr, el = rewriter(el)
                    println(io, "\n\n\"\"\"\n", docstr, "\"\"\"")
                    println(io, "$el")
                end
            end
        end
    end
end
