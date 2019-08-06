# this file is included by wrap_gdal.jl and rewriter.jl
# and provides several shared functions for building docstrings

"Build docstring for a function from a Doxygen XML node"
function build_function(node::EzXML.Node)
    io = IOBuffer()

    # code block with function definition
    print(io, "    ", text(node, "name"), "(")
    nspace = position(io)
    params = findall(node, "param")
    if isempty(params)
        print(io, ")")
    end
    for param in params
        param !== first(params) && print(io, " "^nspace) # align
        islast = param === last(params)
        print(io, text(param, "type"))
        # declname not always present (with void)
        lastchar = islast ? ")" : ",\n"
        if !isempty(findall("declname", param))
            print(io, " ", text(param, "declname"), lastchar)
        else
            print(io, lastchar)
        end
    end
    println(io, " -> ", text(node, "type"))

    # brief description, always 1 present, sometimes only whitespace
    desc = strip(nodecontent(findfirst("briefdescription", node)))
    if !isempty(desc)
        println(io, "\n", text(node, "briefdescription"))
    end

    # parameters
    params = findall("detaileddescription/para/parameterlist/parameteritem", node)
    if !isempty(params)
        println(io, "\n### Parameters")
        for param in params
            print(io, "* **", text(param, "parameternamelist"), "**: ")
            println(io, text(param, "parameterdescription"))
        end
    end

    # returns
    return_elems = findall("detaileddescription/para/simplesect[@kind='return']", node)
    if !isempty(return_elems)
        println(io, "\n### Returns")
        println(io, text(return_elems[1], "para"))
    end

    String(take!(io))
end

"Build a one line docstring consisting of only the brief description from an XML node"
function brief_description(node::EzXML.Node)
    # brief description, always 1 present, sometimes only whitespace
    strip(nodecontent(findfirst("briefdescription", node)))
end

"Compose a Markdown docstring based on a Doxygen XML element"
function build_docstring(node::EzXML.Node)
    kind = node["kind"]
    if kind == "function"
        build_function(node)
    elseif kind in ("enum", "define", "typedef")
        brief_description(node)
    else
        # "friend" and "variable" kinds remain
        # but we leave them out, not needed
        ""
    end
end

function text(node::EzXML.Node, el::AbstractString)
    s = findfirst(el, node)
    s === nothing ? "" : strip(nodecontent(s))
end
