using LibExpat
using DataStructures
using Compat

workdir = dirname(@__FILE__)
include(joinpath(workdir, "doc.jl"))
srcdir = joinpath(workdir, "../src")


headerfiles = [
    "gdal.jl",
    "gdal_alg.jl",
    "gdal_vrt.jl",
    "ogr_api.jl",
    "ogr_srs_api.jl"
]

# do not use automatic function renaming for these
custom_rename = Dict{ASCIIString, ASCIIString}(
    # prevent a clash after renaming both OGR/GDAL versions to getdriverbyname
    # since the OGR and GDAL driver system are combined in GDAL 2
    # give preference to the GDAL versions
    "ogrgetdriverbyname" => "ogrgetdriverbyname",

    # clashes since OGRwkbGeometryType and OGRFieldType are both typealiased to UInt32
    "ogr_fld_create" => "fld_create",
    "ogr_gfld_create" => "gfld_create",

    # these don't directly clash, but otherwise all are renamed to `create`
    # this makes it easier to disambiguate them
    "ogr_fd_create" => "fd_create",
    "ogr_f_create" => "f_create",
    "gdal_cg_create" => "cg_create",
    "ogr_sm_create" => "sm_create",
    "ogr_st_create" => "st_create",
    "ogr_stbl_create" => "stbl_create",

    "ogrgetdrivercount" => "ogrgetdrivercount",
    "ogrgetdriver" => "ogrgetdriver"
)

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

# all these are immutable without internal fields
check_nullpointer = [
    :CPLErrorHandler,
    :GDALProgressFunc,
    :GDALMajorObjectH,
    :GDALDatasetH,
    :GDALRasterBandH,
    :GDALDriverH,
    :GDALColorTableH,
    :GDALRasterAttributeTableH,
    :GDALAsyncReaderH,
    :GDALDerivedPixelFunc,
    :GDALTransformerFunc,
    :GDALContourWriter,
    :GDALContourGeneratorH,
    :OGRGeometryH,
    :OGRSpatialReferenceH,
    :OGRCoordinateTransformationH,
    :OGRFieldDefnH,
    :OGRFeatureDefnH,
    :OGRFeatureH,
    :OGRStyleTableH,
    :OGRLayerH,
    :OGRDataSourceH,
    :OGRSFDriverH,
    :OGRStyleMgrH,
    :OGRStyleToolH,
    :GDALMaskFunc,
    :GDALWarpOperationH,
    :FilterFuncType,
    :FilterFunc4ValuesType,
    :VRTAveragedSourceH,
    :VRTAverageFilteredSourceH,
    :VRTComplexSourceH,
    :VRTDatasetH,
    :VRTDerivedRasterBandH,
    :VRTDriverH,
    :VRTFilteredSourceH,
    :VRTFuncSourceH,
    :VRTImageReadFunc,
    :VRTKernelFilteredSourceH,
    :VRTRasterBandH,
    :VRTRawRasterBandH,
    :VRTSimpleSourceH,
    :VRTSourcedRasterBandH,
    :VRTSourceH,
    :VRTWarpedDatasetH,
    :VRTWarpedRasterBandH
 ]

use_type_parameter = [
    :GDALMajorObjectH,
    :GDALDatasetH,
    :GDALDriverH,
    :GDALRasterBandH,
    :OGRLayerH,
    :OGRDataSourceH
]


parsefile(file) = parse(join(["quote", readstring(file), "end"], ";"))

"rename the function to more a julian convention"
function newfuncname(name::Symbol)
    name = lowercase(string(name))
    if name in keys(custom_rename)
        name = custom_rename[name]
    else
        for (pat, r) in strip_prefixes
            name = replace(name, pat, r)
        end
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

    # dict to map parameter types to type parameters, e.g. :GDALDriverH => :T
    # used for adding the parametric type signatures: {T <: GDALDriverH}(hDriver::Ptr{T},
    partypes = OrderedDict{Symbol, Symbol}()
    # choice of names for parametric type, T for first, S for second etc.
    letters = 'T':-1:'A'
    # track which letters are already used
    letter_index = 0

    # manual override to fix ambiguity warning with OGR_Dr_Open
    if old_funcname == :OGROpen
        assert(ex.args[1].args[end] == :arg3)
        ex.args[1].args[end] = :(arg3::Ptr{OGRSFDriverH})
    end

    # function signature
    for arg in ex.args[1].args[2:end]
        isa(arg, Symbol) && continue # no type constraints
        # loosen type constraints; ccall will convert the arguments
        if arg.args[2] in [:Cint, :UInt32]
            arg.args[2] = :Integer
        elseif arg.args[2] == :Cdouble
            arg.args[2] = :Real
        elseif arg.args[2] == :GIntBig
            arg.args[2] = :Integer
        elseif arg.args[2] == :GDALProgressFunc
            arg.args[2] = :Any
        elseif arg.args[2] in check_nullpointer
            if arg.args[2] in use_type_parameter
                subtype = arg.args[2]
                if subtype in keys(partypes)
                    letter = partypes[subtype]
                else
                    letter_index += 1
                    letter = symbol(letters[letter_index])
                end
                partypes[subtype] = letter
                arg.args[2] = Expr(:curly, :Ptr, letter)
            else
                arg.args[2] = Expr(:curly, :Ptr, arg.args[2])
            end
        end
    end

    if !isempty(partypes)
        # add type parameters
        exprarray = Expr[]
        for (subtype, letter) in partypes
            push!(exprarray, Expr(:<:, letter, subtype))

        end
        ex.args[1].args[1] = Expr(:curly, new_funcname, exprarray...)
    end

    assert(ex.args[2].args[1].head == :ccall)
    # ccall input types
    assert(ex.args[2].args[1].args[3].head == :tuple)
    intypes = ex.args[2].args[1].args[3].args
    for i = 1:length(intypes)
        if intypes[i] in check_nullpointer
            # wrap input type in Ptr{} since memory is managed by GDAL
            intypes[i] = Expr(:curly, :Ptr, intypes[i])
        elseif intypes[i] == :(Ptr{Cstring})
            intypes[i] = :StringList
        end
    end
    # ccall return type
    rettype = ex.args[2].args[1].args[2]
    if rettype == :(Cstring)
        ex.args[2].args[1] = Expr(:call, :unsafe_string, ex.args[2].args[1])
    elseif rettype == :(Ptr{Cstring})
        # TODO: this only unpacks the first of a list of strings
        ex.args[2].args[1] = Expr(:call, :unsafe_load, ex.args[2].args[1])
        ex.args[2].args[1] = Expr(:call, :unsafe_string, ex.args[2].args[1])
    elseif rettype in check_nullpointer
        # wrap output type in Ptr{} since memory is managed by GDAL
        ex.args[2].args[1].args[2] = Expr(:curly, :Ptr, ex.args[2].args[1].args[2])
        # wrap ccall in checknull()
        ex.args[2].args[1] = Expr(:call, :checknull, ex.args[2].args[1])
    end
    (docstr, ex)
end


"rewrite typealias Ptr{Void} to immutable"
function commonrewriter(io::IOStream, ex::Expr)
    if ex.head == :typealias
        if ex.args[2] == :(Ptr{Void})
            # write them to a separate file, list is recorded in check_nullpointer
            return
        elseif startswith(string(ex.args[1]), "ANONYMOUS_")
            # filter out the ANONYMOUS_* typealiases (they are not used)
            return
        end
    end

    # these need surrounding whitespace
    if length(ex.args) == 3 && isa(ex.args[3], Expr) && ex.args[3].head == :block
        provide_space = true
    else
        provide_space = false
    end
    provide_space && print(io, "\n")
    println(io, "$ex")
    provide_space && print(io, "\n")
end


# edit the common_file
common_file = "common.jl"
expr = parsefile(joinpath(srcdir, "C", common_file))
open(joinpath(srcdir, common_file), "w") do io
    for el in expr.args[1].args
        # second part keeps out LineNumberNode
        # which would print as a comment
        if isa(el, Expr) && (el.head != :line)
                commonrewriter(io, el)
        end
    end
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
