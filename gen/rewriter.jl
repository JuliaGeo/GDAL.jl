using DataStructures

const workdir = @__DIR__
const srcdir = joinpath(workdir, "../src")

# Subset of headerfiles in wrap_gdal.jl which is wrapped outside of
# the C submodule. Note that the common.jl from C is fully rewritten, and
# includes the full set.
const headerfiles = [
    "gdal.jl",
    "gdal_alg.jl",
    "gdal_vrt.jl",
    "gdal_utils.jl",
    "ogr_api.jl",
    "ogr_srs_api.jl",
    "cpl_error.jl"
]

# do not use automatic function renaming for these
const custom_rename = Dict{String, String}(
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

    # prevent overwriting Base functions
    "ogr_g_isempty" => "Base.isempty",
    "ogr_g_length" => "Base.length",

    # prevent automatic renaming
    "ogrgetdrivercount" => "ogrgetdrivercount",
    "ogrgetdriver" => "ogrgetdriver"
)

const strip_prefixes = [
    r"^gdal_cg_" => "",
    r"^gdal_" => "",
    r"^gdal" => "",
    r"^ogr_g_" => "",
    r"^ogr_f_" => "",
    r"^ogr_fld_" => "",
    r"^ogr_gfld_" => "",
    r"^ogr_fd_" => "",
    r"^ogr_l_" => "",
    r"^ogr_ds_" => "",
    r"^ogr_dr_" => "",
    r"^ogr_sm_" => "",
    r"^ogr_st_" => "",
    r"^ogr_stbl_" => "",
    r"^ogr_" => "",
    r"^ogr" => "",
    r"^osr" => "",
    r"^cpl" => ""
]

parsefile(file) = Meta.parse(join(["quote", read(file, String), "end"], ";"))

"check if an expression is a line, which records line numbers"
isline(ex::Expr) = ex.head === :line

# check if opaquepointers is still in sync with the handwritten types.jl
# the set of opaquepointers must equal the set found in types.jl
# first we get the set of types found in types.jl
# plus the set of types that are used as supertypes
function typeset(path::String)
    typecode = parsefile(path)
    # filter out line comments
    abstypes = filter(!isline, typecode.args[1].args)
    # get GDALDatasetH from abstract type GDALDatasetH <: GDALMajorObjectH end
    getsym(x::Expr) = x.args[1]
    getsym(x::Symbol) = x
    typenames = Set{Symbol}()
    supertypes = Set{Symbol}()
    for abstype in abstypes
        absdef = abstype.args[1]
        typename = getsym(absdef)
        push!(typenames, typename)
        if (absdef isa Expr) && (absdef.head === :<:)
            # used as supertypes
            push!(supertypes, absdef.args[2])
        end
    end
    typenames, supertypes
end

# supertypes is derived from types.jl and used in rewriting
# typenames is derived from types.jl and used later on
# to check if types.jl is still complete
typenames, supertypes = typeset(joinpath(srcdir, "types.jl"))

"rename the function to more a julian convention"
function newfuncname(name::Symbol)
    name = lowercase(string(name))
    if name in keys(custom_rename)
        name = custom_rename[name]
    else
        for replacement in strip_prefixes
            name = replace(name, replacement)
        end
    end
    Symbol(name)
end

"rewrite certain expressions"
function rewriter(ex::Expr)
    # rename function name
    old_funcname = ex.args[1].args[1]::Symbol
    new_funcname = newfuncname(old_funcname)
    ex.args[1].args[1] = new_funcname

    # filter out line number comments on function name
    filter!(!isline, ex.args[2].args)

    # manual override to fix ambiguity warning with OGR_Dr_Open
    if old_funcname == :OGROpen
        assert(ex.args[1].args[end] == :arg3)
        ex.args[1].args[end] = :(arg3::Ptr{OGRSFDriverH})
    end

    # function signature
    for arg in ex.args[1].args[2:end]
        isa(arg, Symbol) && continue # no type constraints
        # loosen type constraints; ccall will convert the arguments
        sigtype = arg.args[2]
        if sigtype in [:Cint, :UInt32]
            arg.args[2] = :Integer
        elseif sigtype == :Cdouble
            arg.args[2] = :Real
        elseif sigtype == :GIntBig
            arg.args[2] = :Integer
        elseif sigtype == :GDALProgressFunc  # is also in opaquepointers
            arg.args[2] = :Any
        elseif sigtype in opaquepointers
            if sigtype in supertypes
                # allow subtypes as well
                # example: getmetadataitem(x::Ref{<:GDALMajorObjectH})
                # is expected to work for Ptr{GDALDriverH} as well
                arg.args[2] = :(Ref{<:$sigtype})
            else
                arg.args[2] = :(Ref{$sigtype})
            end
        end
    end

    assert(ex.args[2].args[1].args[1] == :ccall)
    ccall_call = ex.args[2].args[1]
    # ccall input types
    assert(ccall_call.args[4].head == :tuple)
    intypes = ccall_call.args[4].args
    for (i, intype) in enumerate(intypes)
        if intype in opaquepointers
            # in C the opaque pointers are all typedef void *, i.e. Ptr{Void}
            intypes[i] = :(Ptr{Cvoid})
        end
    end
    # modify ccall return type or wrap entire ccall based on return type
    rettype = ccall_call.args[3]::Union{Symbol, Expr} # Expr for Ptr{T}
    if rettype == :(Cstring)
        ex.args[2].args[1] = :(unsafe_string($ccall_call))
    elseif rettype == :(Ptr{Cstring})
        ex.args[2].args[1] = :(unsafe_loadstringlist($ccall_call))
    elseif rettype in opaquepointers
        # wrap output type in Ptr{} since memory is managed by GDAL
        ccall_call.args[3] = :(Ptr{$rettype})
        # wrap ccall in failsafe()
        ex.args[2].args[1] = :(failsafe($ccall_call))
    end
    ex
end

function commonrewriter!(io::IOStream, ex::Expr, opaquepointers::Set{Symbol})
    if ex.head == :const
        lhs, rhs = ex.args[1].args
        if rhs == :(Ptr{Cvoid})
            # these go in a list to be dealt with below
            # they are manually defined in types.jl
            push!(opaquepointers, lhs)
            return
        elseif startswith(string(lhs), "ANONYMOUS_")
            println(ex)
            error("ANONYMOUS_* variable name found, stopping")
        end
    end

    if ex.head === :type
        # filter out line number comments inside types
        filter!(!isline, ex.args[3].args)
    end
    # types need surrounding whitespace
    provide_space = ex.head === :type
    provide_space && print(io, "\n")
    println(io, "$ex")
    provide_space && print(io, "\n")
end


# rewrite the common_file
common_file = "common.jl"
expr = parsefile(joinpath(srcdir, "C", common_file))
# record which opaque pointers to transform to julia types
opaquepointers = Set{Symbol}()
open(joinpath(srcdir, common_file), "w") do io
    for el in expr.args[1].args
        # second part keeps out line number comments
        if isa(el, Expr) && !isline(el)
            commonrewriter!(io, el, opaquepointers)
        end
    end
end

if opaquepointers != typenames
    @warn("Missing in types.jl:")
    warn(setdiff(opaquepointers, typenames))
    @warn("Not needed in types.jl:")
    warn(setdiff(typenames, opaquepointers))
    error("types.jl out of sync with the opaquepointers found")
end

for headerfile in headerfiles
    expr = parsefile(joinpath(srcdir, "C", headerfile))
    # rename gdal.jl to prevent name clash
    headerfile = headerfile == "gdal.jl" ? "gdal_h.jl" : headerfile
    open(joinpath(srcdir, headerfile), "w") do io
        for el in expr.args[1].args
            assert(el isa Expr)
            if el.head == :macrocall
                # el = @doc docstr func
                docstr = el.args[2]
                func = el.args[3]
                func = rewriter(func)
                print(io, "\n\n")
                if !isempty(docstr)
                    println(io, "\"\"\"\n", docstr, "\"\"\"")
                end
                println(io, func)
            elseif isline(el)
                # leave out line number comments
            else
                dump(el)
                error("expression not handled")
            end
        end
    end
end
