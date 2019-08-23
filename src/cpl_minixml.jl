# Julia wrapper for header: cpl_minixml.h
# Automatically generated using Clang.jl


"""
    CPLParseXMLString(const char * pszString) -> CPLXMLNode *

Parse an XML string into tree form.

### Parameters
* **pszString**: the document to parse.

### Returns
parsed tree or NULL on error.
"""
function cplparsexmlstring(arg1)
    aftercare(ccall((:CPLParseXMLString, libgdal), Ptr{CPLXMLNode}, (Cstring,), arg1))
end

"""
    CPLDestroyXMLNode(CPLXMLNode * psNode) -> void

Destroy a tree.

### Parameters
* **psNode**: the tree to free.
"""
function cpldestroyxmlnode(arg1)
    aftercare(ccall((:CPLDestroyXMLNode, libgdal), Cvoid, (Ptr{CPLXMLNode},), arg1))
end

"""
    CPLGetXMLNode(CPLXMLNode * psRoot,
                  const char * pszPath) -> CPLXMLNode *

Find node by path.

### Parameters
* **psRoot**: the subtree in which to search. This should be a node of type CXT_Element. NULL is safe.
* **pszPath**: the list of element names in the path (dot separated).

### Returns
the requested element node, or NULL if not found.
"""
function cplgetxmlnode(poRoot, pszPath)
    aftercare(ccall((:CPLGetXMLNode, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, Cstring), poRoot, pszPath))
end

"""
    CPLSearchXMLNode(CPLXMLNode * psRoot,
                     const char * pszElement) -> CPLXMLNode *

Search for a node in document.

### Parameters
* **psRoot**: the subtree to search. This should be a node of type CXT_Element. NULL is safe.
* **pszElement**: the name of the element or attribute to search for.

### Returns
The matching node or NULL on failure.
"""
function cplsearchxmlnode(poRoot, pszTarget)
    aftercare(ccall((:CPLSearchXMLNode, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, Cstring), poRoot, pszTarget))
end

"""
    CPLGetXMLValue(const CPLXMLNode * psRoot,
                   const char * pszPath,
                   const char * pszDefault) -> const char *

Fetch element/attribute value.

### Parameters
* **psRoot**: the subtree in which to search. This should be a node of type CXT_Element. NULL is safe.
* **pszPath**: the list of element names in the path (dot separated). An empty path means get the value of the psRoot node.
* **pszDefault**: the value to return if a corresponding value is not found, may be NULL.

### Returns
the requested value or pszDefault if not found.
"""
function cplgetxmlvalue(poRoot, pszPath, pszDefault)
    aftercare(ccall((:CPLGetXMLValue, libgdal), Cstring, (Ptr{CPLXMLNode}, Cstring, Cstring), poRoot, pszPath, pszDefault), false)
end

"""
    CPLCreateXMLNode(CPLXMLNode * poParent,
                     CPLXMLNodeType eType,
                     const char * pszText) -> CPLXMLNode *

Create an document tree item.

### Parameters
* **poParent**: the parent to which this node should be attached as a child. May be NULL to keep as free standing.
* **eType**: the type of the newly created node
* **pszText**: the value of the newly created node

### Returns
the newly created node, now owned by the caller (or parent node).
"""
function cplcreatexmlnode(poParent, eType, pszText)
    aftercare(ccall((:CPLCreateXMLNode, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, CPLXMLNodeType, Cstring), poParent, eType, pszText))
end

"""
    CPLSerializeXMLTree(const CPLXMLNode * psNode) -> char *

Convert tree into string document.

### Parameters
* **psNode**: the node to serialize.

### Returns
the document on success or NULL on failure.
"""
function cplserializexmltree(psNode)
    aftercare(ccall((:CPLSerializeXMLTree, libgdal), Cstring, (Ptr{CPLXMLNode},), psNode), false)
end

"""
    CPLAddXMLChild(CPLXMLNode * psParent,
                   CPLXMLNode * psChild) -> void

Add child node to parent.

### Parameters
* **psParent**: the node to attach the child to. May not be NULL.
* **psChild**: the child to add to the parent. May not be NULL. Should not be a child of any other parent.
"""
function cpladdxmlchild(psParent, psChild)
    aftercare(ccall((:CPLAddXMLChild, libgdal), Cvoid, (Ptr{CPLXMLNode}, Ptr{CPLXMLNode}), psParent, psChild))
end

"""
    CPLRemoveXMLChild(CPLXMLNode * psParent,
                      CPLXMLNode * psChild) -> int

Remove child node from parent.

### Parameters
* **psParent**: the node to the child is attached to.
* **psChild**: the child to remove.

### Returns
TRUE on success or FALSE if the child was not found.
"""
function cplremovexmlchild(psParent, psChild)
    aftercare(ccall((:CPLRemoveXMLChild, libgdal), Cint, (Ptr{CPLXMLNode}, Ptr{CPLXMLNode}), psParent, psChild))
end

"""
    CPLAddXMLSibling(CPLXMLNode * psOlderSibling,
                     CPLXMLNode * psNewSibling) -> void

Add new sibling.

### Parameters
* **psOlderSibling**: the node to attach the sibling after.
* **psNewSibling**: the node to add at the end of psOlderSiblings psNext chain.
"""
function cpladdxmlsibling(psOlderSibling, psNewSibling)
    aftercare(ccall((:CPLAddXMLSibling, libgdal), Cvoid, (Ptr{CPLXMLNode}, Ptr{CPLXMLNode}), psOlderSibling, psNewSibling))
end

"""
    CPLCreateXMLElementAndValue(CPLXMLNode * psParent,
                                const char * pszName,
                                const char * pszValue) -> CPLXMLNode *

Create an element and text value.

### Parameters
* **psParent**: the parent node to which the resulting node should be attached. May be NULL to keep as freestanding.
* **pszName**: the element name to create.
* **pszValue**: the text to attach to the element. Must not be NULL.

### Returns
the pointer to the new element node.
"""
function cplcreatexmlelementandvalue(psParent, pszName, pszValue)
    aftercare(ccall((:CPLCreateXMLElementAndValue, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, Cstring, Cstring), psParent, pszName, pszValue))
end

"""
    CPLAddXMLAttributeAndValue(CPLXMLNode * psParent,
                               const char * pszName,
                               const char * pszValue) -> void

Create an attribute and text value.

### Parameters
* **psParent**: the parent node to which the resulting node should be attached. Must not be NULL.
* **pszName**: the attribute name to create.
* **pszValue**: the text to attach to the attribute. Must not be NULL.
"""
function cpladdxmlattributeandvalue(psParent, pszName, pszValue)
    aftercare(ccall((:CPLAddXMLAttributeAndValue, libgdal), Cvoid, (Ptr{CPLXMLNode}, Cstring, Cstring), psParent, pszName, pszValue))
end

"""
    CPLCloneXMLTree(const CPLXMLNode * psTree) -> CPLXMLNode *

Copy tree.

### Parameters
* **psTree**: the tree to duplicate.

### Returns
a copy of the whole tree.
"""
function cplclonexmltree(psTree)
    aftercare(ccall((:CPLCloneXMLTree, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode},), psTree))
end

"""
    CPLSetXMLValue(CPLXMLNode * psRoot,
                   const char * pszPath,
                   const char * pszValue) -> int

Set element value by path.

### Parameters
* **psRoot**: the subdocument to be updated.
* **pszPath**: the dot separated path to the target element/attribute.
* **pszValue**: the text value to assign.

### Returns
TRUE on success.
"""
function cplsetxmlvalue(psRoot, pszPath, pszValue)
    aftercare(ccall((:CPLSetXMLValue, libgdal), Cint, (Ptr{CPLXMLNode}, Cstring, Cstring), psRoot, pszPath, pszValue))
end

"""
    CPLStripXMLNamespace(CPLXMLNode * psRoot,
                         const char * pszNamespace,
                         int bRecurse) -> void

Strip indicated namespaces.

### Parameters
* **psRoot**: the document to operate on.
* **pszNamespace**: the name space prefix (not including colon), or NULL.
* **bRecurse**: TRUE to recurse over whole document, or FALSE to only operate on the passed node.
"""
function cplstripxmlnamespace(psRoot, pszNameSpace, bRecurse)
    aftercare(ccall((:CPLStripXMLNamespace, libgdal), Cvoid, (Ptr{CPLXMLNode}, Cstring, Cint), psRoot, pszNameSpace, bRecurse))
end

"""
    CPLCleanXMLElementName(char * pszTarget) -> void

Make string into safe XML token.

### Parameters
* **pszTarget**: the string to be adjusted. It is altered in place.
"""
function cplcleanxmlelementname(arg1)
    aftercare(ccall((:CPLCleanXMLElementName, libgdal), Cvoid, (Cstring,), arg1))
end

"""
    CPLParseXMLFile(const char * pszFilename) -> CPLXMLNode *

Parse XML file into tree.

### Parameters
* **pszFilename**: the file to open.

### Returns
NULL on failure, or the document tree on success.
"""
function cplparsexmlfile(pszFilename)
    aftercare(ccall((:CPLParseXMLFile, libgdal), Ptr{CPLXMLNode}, (Cstring,), pszFilename))
end

"""
    CPLSerializeXMLTreeToFile(const CPLXMLNode * psTree,
                              const char * pszFilename) -> int

Write document tree to a file.

### Parameters
* **psTree**: the document tree to write.
* **pszFilename**: the name of the file to write to.

### Returns
TRUE on success, FALSE otherwise.
"""
function cplserializexmltreetofile(psTree, pszFilename)
    aftercare(ccall((:CPLSerializeXMLTreeToFile, libgdal), Cint, (Ptr{CPLXMLNode}, Cstring), psTree, pszFilename))
end
