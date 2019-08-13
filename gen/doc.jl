# this file is included by wrap.jl and provides several functions for building docstrings

"Build docstring for a function from a Doxygen XML node"
function build_function(node::EzXML.Node)
    io = IOBuffer()

    # code block with function definition
    print(io, "    ", text(node, "name"), "(")
    nspace = position(io)
    params = findall("param", node)
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

"Return the text of a subelement `el` of `node`"
function text(node::EzXML.Node, el::AbstractString)
    s = findfirst(el, node)
    s === nothing ? "" : strip(nodecontent(s))
end

"Wrap the single- or multi-line docstring in appropriate quotes"
function addquotes(docstr::AbstractString)
    if '\n' in docstr
        string("\"\"\"\n", docstr, "\"\"\"")
    else
        # single line docstring
        repr(rstrip(docstr, '.'))
    end
end

"Get the C name out of a expression"
function cname(ex)
    if @capture(ex, function f_(args__) ccall((a_, b_), xs__) end)
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

"Based on a name, find the best XML node to generate docs from"
function findnode(name::String, doc::EzXML.Document)
    # Names are not unique. We know that kind='friend' (not sure what it is)
    # does not give good docs and is never the only one, so we skip those.
    # First we use XPath to find all nodes with this name and not kind='friend'.
    memberdef = "/doxygen/compounddef/sectiondef/memberdef"
    nofriend = "not(@kind='friend')"  # :-(
    nodes = findall("$memberdef[name='$name' and $nofriend]", doc)

    if length(nodes) == 0
        return nothing
    elseif length(nodes) == 1
        return first(nodes)
    else
        # If we get multiple nodes back, we have to select the best one.
        # Looking at the documentation, sometimes there are two similar docstrings,
        # but one comes from a .cpp file, as seen in location's file attribute,
        # and the other comes from a .h file (.c is the third option).
        # Even though this is a C binding, the .cpp node includes the argument names
        # which makes for an easier to read docstring, since they can be referenced
        # to the argument names in the parameters list.
        # Therefore if .cpp is one of the options, go for that.

        # ExXML uses libxml2 which only supports XPath 1.0, meaning
        # ends-with(@file,'.cpp') is not available, but according to
        # https://stackoverflow.com/a/11857166/2875964 we can rewrite this as
        cpp = "'.cpp' = substring(@file, string-length(@file) - string-length('.cpp') +1)"

        for node in nodes
            cppnode = findfirst("location[$cpp]/..", node)
            if cppnode !== nothing
                return cppnode
            end
        end
        # .cpp not present, just pick the first
        return first(nodes)
    end
end
