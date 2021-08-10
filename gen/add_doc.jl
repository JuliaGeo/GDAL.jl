using MacroTools


function add_doc(lib_path)
    code = Meta.parse(read(lib_path, String))
    code = MacroTools.prewalk(rmlines, code)

    @assert Meta.isexpr(code, :module) && Meta.isexpr(code.args[3], :block)
    body = code.args[3].args
    rewritten = []
    for ex in body
        if Meta.isexpr(ex, :macrocall) && ex.args[1] == GlobalRef(Core, Symbol("@doc"))
            push!(rewritten, addquotes(ex.args[3]), ex.args[4])
        else
            name = cname(ex)
            node = findnode(name, doc)
            docstr = node === nothing ? "" : build_docstring(node)
            isempty(docstr) || push!(rewritten, addquotes(docstr))
            push!(rewritten, ex)
        end
    end

    # println(code)

    open(lib_path, "w") do io
        println(io, "module ", code.args[2])
        for ex in rewritten
            if ex isa String
                println(io, replace(ex, r"([\\\$])"=>s"\\\1"))
            else
                println(io, ex, '\n')
            end
        end
        println(io, "end")
    end
end
