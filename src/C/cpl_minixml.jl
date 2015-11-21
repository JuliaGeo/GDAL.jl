# Julia wrapper for header: /usr/local/include/cpl_minixml.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function CPLParseXMLString(arg1::Ptr{UInt8})
    ccall((:CPLParseXMLString,libgdal),Ptr{CPLXMLNode},(Ptr{UInt8},),arg1)
end

function CPLDestroyXMLNode(arg1::Ptr{CPLXMLNode})
    ccall((:CPLDestroyXMLNode,libgdal),Void,(Ptr{CPLXMLNode},),arg1)
end

function CPLGetXMLNode(poRoot::Ptr{CPLXMLNode},pszPath::Ptr{UInt8})
    ccall((:CPLGetXMLNode,libgdal),Ptr{CPLXMLNode},(Ptr{CPLXMLNode},Ptr{UInt8}),poRoot,pszPath)
end

function CPLSearchXMLNode(poRoot::Ptr{CPLXMLNode},pszTarget::Ptr{UInt8})
    ccall((:CPLSearchXMLNode,libgdal),Ptr{CPLXMLNode},(Ptr{CPLXMLNode},Ptr{UInt8}),poRoot,pszTarget)
end

function CPLGetXMLValue(poRoot::Ptr{CPLXMLNode},pszPath::Ptr{UInt8},pszDefault::Ptr{UInt8})
    ccall((:CPLGetXMLValue,libgdal),Ptr{UInt8},(Ptr{CPLXMLNode},Ptr{UInt8},Ptr{UInt8}),poRoot,pszPath,pszDefault)
end

function CPLCreateXMLNode(poParent::Ptr{CPLXMLNode},eType::CPLXMLNodeType,pszText::Ptr{UInt8})
    ccall((:CPLCreateXMLNode,libgdal),Ptr{CPLXMLNode},(Ptr{CPLXMLNode},CPLXMLNodeType,Ptr{UInt8}),poParent,eType,pszText)
end

function CPLSerializeXMLTree(psNode::Ptr{CPLXMLNode})
    ccall((:CPLSerializeXMLTree,libgdal),Ptr{UInt8},(Ptr{CPLXMLNode},),psNode)
end

function CPLAddXMLChild(psParent::Ptr{CPLXMLNode},psChild::Ptr{CPLXMLNode})
    ccall((:CPLAddXMLChild,libgdal),Void,(Ptr{CPLXMLNode},Ptr{CPLXMLNode}),psParent,psChild)
end

function CPLRemoveXMLChild(psParent::Ptr{CPLXMLNode},psChild::Ptr{CPLXMLNode})
    ccall((:CPLRemoveXMLChild,libgdal),Cint,(Ptr{CPLXMLNode},Ptr{CPLXMLNode}),psParent,psChild)
end

function CPLAddXMLSibling(psOlderSibling::Ptr{CPLXMLNode},psNewSibling::Ptr{CPLXMLNode})
    ccall((:CPLAddXMLSibling,libgdal),Void,(Ptr{CPLXMLNode},Ptr{CPLXMLNode}),psOlderSibling,psNewSibling)
end

function CPLCreateXMLElementAndValue(psParent::Ptr{CPLXMLNode},pszName::Ptr{UInt8},pszValue::Ptr{UInt8})
    ccall((:CPLCreateXMLElementAndValue,libgdal),Ptr{CPLXMLNode},(Ptr{CPLXMLNode},Ptr{UInt8},Ptr{UInt8}),psParent,pszName,pszValue)
end

function CPLAddXMLAttributeAndValue(psParent::Ptr{CPLXMLNode},pszName::Ptr{UInt8},pszValue::Ptr{UInt8})
    ccall((:CPLAddXMLAttributeAndValue,libgdal),Void,(Ptr{CPLXMLNode},Ptr{UInt8},Ptr{UInt8}),psParent,pszName,pszValue)
end

function CPLCloneXMLTree(psTree::Ptr{CPLXMLNode})
    ccall((:CPLCloneXMLTree,libgdal),Ptr{CPLXMLNode},(Ptr{CPLXMLNode},),psTree)
end

function CPLSetXMLValue(psRoot::Ptr{CPLXMLNode},pszPath::Ptr{UInt8},pszValue::Ptr{UInt8})
    ccall((:CPLSetXMLValue,libgdal),Cint,(Ptr{CPLXMLNode},Ptr{UInt8},Ptr{UInt8}),psRoot,pszPath,pszValue)
end

function CPLStripXMLNamespace(psRoot::Ptr{CPLXMLNode},pszNameSpace::Ptr{UInt8},bRecurse::Cint)
    ccall((:CPLStripXMLNamespace,libgdal),Void,(Ptr{CPLXMLNode},Ptr{UInt8},Cint),psRoot,pszNameSpace,bRecurse)
end

function CPLCleanXMLElementName(arg1::Ptr{UInt8})
    ccall((:CPLCleanXMLElementName,libgdal),Void,(Ptr{UInt8},),arg1)
end

function CPLParseXMLFile(pszFilename::Ptr{UInt8})
    ccall((:CPLParseXMLFile,libgdal),Ptr{CPLXMLNode},(Ptr{UInt8},),pszFilename)
end

function CPLSerializeXMLTreeToFile(psTree::Ptr{CPLXMLNode},pszFilename::Ptr{UInt8})
    ccall((:CPLSerializeXMLTreeToFile,libgdal),Cint,(Ptr{CPLXMLNode},Ptr{UInt8}),psTree,pszFilename)
end
