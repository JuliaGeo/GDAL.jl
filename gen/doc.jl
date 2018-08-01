"compose a markdown docstring based on a Doxygen XML element"
function build_docstring(fnode)
    io = IOBuffer()

    # code block with function definition
    print(io, "    ", text(fnode, "name"), "(")
    nspace = position(io)
    params = LibExpat.find(fnode, "param")
    if isempty(params)
        print(io, ")")
    end
    for param in params
        param !== first(params) && print(io, " "^nspace) # align
        islast = param === last(params)
        print(io, text(param, "{type}"))
        # declname not always present (with void)
        lastchar = islast ? ")" : ",\n"
        if !isempty(LibExpat.find(param, "{declname}"))
            print(io, " ", text(param, "{declname}"), lastchar)
        else
            print(io, lastchar)
        end
    end
    println(io, " -> ", text(fnode, "type"))

    # brief description
    if !isempty(LibExpat.find(fnode, "briefdescription")) &&
        !isempty(strip(LibExpat.find(fnode, "briefdescription#string")))
        println(io, "\n", text(fnode, "briefdescription"))
    end

    # parameters
    params = LibExpat.find(fnode, "detaileddescription/para/parameterlist/parameteritem")
    if !isempty(params)
        println(io, "\n### Parameters")
        for param in params
            print(io, "* **", text(param, "parameternamelist"), "**: ")
            println(io, text(param, "parameterdescription"))
        end
    end

    # returns
    return_elems = xpath(fnode, "detaileddescription/para/simplesect[@kind='return']")
    if !isempty(return_elems)
        println(io, "\n### Returns")
        println(io, text(return_elems[1], "para"))
    end

    String(take!(io))
end

# Change GENERATE_XML to YES in the Doxyfile from the GDAL SVN
# then run combine.xslt to create this XML file.
xmlfile = joinpath(workdir, "doxygen.xml")

xmlstring = read(xmlfile, String)
et = xp_parse(xmlstring)
functionnode(et, fname) = et["/doxygen/compounddef/sectiondef/memberdef[name='$fname']"]
text(node::LibExpat.ETree, el::AbstractString) = strip(LibExpat.find(node, "$el#string"))
