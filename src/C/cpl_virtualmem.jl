# Julia wrapper for header: /usr/local/include/cpl_virtualmem.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0



"""
    CPLGetPageSize(void) -> size_t

Return the size of a page of virtual memory.

### Returns
the page size.
"""
function CPLGetPageSize()
    ccall((:CPLGetPageSize, libgdal), Cint, ())
end


"""
    CPLVirtualMemNew(size_t nSize,
                     size_t nCacheSize,
                     size_t nPageSizeHint,
                     int bSingleThreadUsage,
                     CPLVirtualMemAccessMode eAccessMode,
                     CPLVirtualMemCachePageCbk pfnCachePage,
                     CPLVirtualMemUnCachePageCbk pfnUnCachePage,
                     CPLVirtualMemFreeUserData pfnFreeUserData,
                     void * pCbkUserData) -> CPLVirtualMem *

Create a new virtual memory mapping.

### Parameters
* **nSize**: size in bytes of the virtual memory mapping.
* **nCacheSize**: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM).
* **nPageSizeHint**: hint for the page size. Must be a multiple of the system page size, returned by CPLGetPageSize(). Minimum value is generally 4096. Might be set to 0 to let the function determine a default page size.
* **bSingleThreadUsage**: set to TRUE if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit.
* **eAccessMode**: permission to use for the virtual memory mapping.
* **pfnCachePage**: callback triggered when a still unmapped page of virtual memory is accessed. The callback has the responsibility of filling the page with relevant values.
* **pfnUnCachePage**: callback triggered when a dirty mapped page is going to be freed (saturation of cache, or termination of the virtual memory mapping). Might be NULL.
* **pfnFreeUserData**: callback that can be used to free pCbkUserData. Might be NULL
* **pCbkUserData**: user data passed to pfnCachePage and pfnUnCachePage.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function CPLVirtualMemNew(nSize::Csize_t, nCacheSize::Csize_t, nPageSizeHint::Csize_t, bSingleThreadUsage::Cint, eAccessMode::CPLVirtualMemAccessMode, pfnCachePage::CPLVirtualMemCachePageCbk, pfnUnCachePage::CPLVirtualMemUnCachePageCbk, pfnFreeUserData::CPLVirtualMemFreeUserData, pCbkUserData)
    ccall((:CPLVirtualMemNew, libgdal), Ptr{CPLVirtualMem}, (Csize_t, Csize_t, Csize_t, Cint, CPLVirtualMemAccessMode, CPLVirtualMemCachePageCbk, CPLVirtualMemUnCachePageCbk, CPLVirtualMemFreeUserData, Ptr{Void}), nSize, nCacheSize, nPageSizeHint, bSingleThreadUsage, eAccessMode, pfnCachePage, pfnUnCachePage, pfnFreeUserData, pCbkUserData)
end


"""
    CPLIsVirtualMemFileMapAvailable(void) -> int

Return if virtual memory mapping of a file is available.

### Returns
TRUE if virtual memory mapping of a file is available.
"""
function CPLIsVirtualMemFileMapAvailable()
    ccall((:CPLIsVirtualMemFileMapAvailable, libgdal), Cint, ())
end


"""
    CPLVirtualMemFileMapNew(VSILFILE * fp,
                            vsi_l_offset nOffset,
                            vsi_l_offset nLength,
                            CPLVirtualMemAccessMode eAccessMode,
                            CPLVirtualMemFreeUserData pfnFreeUserData,
                            void * pCbkUserData) -> CPLVirtualMem *

Create a new virtual memory mapping from a file.

### Parameters
* **fp**: Virtual file handle.
* **nOffset**: Offset in the file to start the mapping from.
* **nLength**: Length of the portion of the file to map into memory.
* **eAccessMode**: Permission to use for the virtual memory mapping. This must be consistent with how the file has been opened.
* **pfnFreeUserData**: callback that is called when the object is destroyed.
* **pCbkUserData**: user data passed to pfnFreeUserData.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function CPLVirtualMemFileMapNew(fp, nOffset::vsi_l_offset, nLength::vsi_l_offset, eAccessMode::CPLVirtualMemAccessMode, pfnFreeUserData::CPLVirtualMemFreeUserData, pCbkUserData)
    ccall((:CPLVirtualMemFileMapNew, libgdal), Ptr{CPLVirtualMem}, (Ptr{VSILFILE}, vsi_l_offset, vsi_l_offset, CPLVirtualMemAccessMode, CPLVirtualMemFreeUserData, Ptr{Void}), fp, nOffset, nLength, eAccessMode, pfnFreeUserData, pCbkUserData)
end


"""
    CPLVirtualMemDerivedNew(CPLVirtualMem * pVMemBase,
                            vsi_l_offset nOffset,
                            vsi_l_offset nSize,
                            CPLVirtualMemFreeUserData pfnFreeUserData,
                            void * pCbkUserData) -> CPLVirtualMem *

Create a new virtual memory mapping derived from an other virtual memory mapping.

### Parameters
* **pVMemBase**: Base virtual memory mapping
* **nOffset**: Offset in the base virtual memory mapping from which to start the new mapping.
* **nSize**: Size of the base virtual memory mapping to expose in the the new mapping.
* **pfnFreeUserData**: callback that is called when the object is destroyed.
* **pCbkUserData**: user data passed to pfnFreeUserData.

### Returns
a virtual memory object that must be freed by CPLVirtualMemFree(), or NULL in case of failure.
"""
function CPLVirtualMemDerivedNew(pVMemBase, nOffset::vsi_l_offset, nSize::vsi_l_offset, pfnFreeUserData::CPLVirtualMemFreeUserData, pCbkUserData)
    ccall((:CPLVirtualMemDerivedNew, libgdal), Ptr{CPLVirtualMem}, (Ptr{CPLVirtualMem}, vsi_l_offset, vsi_l_offset, CPLVirtualMemFreeUserData, Ptr{Void}), pVMemBase, nOffset, nSize, pfnFreeUserData, pCbkUserData)
end


"""
    CPLVirtualMemFree(CPLVirtualMem * ctxt) -> void

Free a virtual memory mapping.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().
"""
function CPLVirtualMemFree(ctxt)
    ccall((:CPLVirtualMemFree, libgdal), Void, (Ptr{CPLVirtualMem},), ctxt)
end


"""
    CPLVirtualMemGetAddr(CPLVirtualMem * ctxt) -> void *

Return the pointer to the start of a virtual memory mapping.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().

### Returns
the pointer to the start of a virtual memory mapping.
"""
function CPLVirtualMemGetAddr(ctxt)
    ccall((:CPLVirtualMemGetAddr, libgdal), Ptr{Void}, (Ptr{CPLVirtualMem},), ctxt)
end


"""
    CPLVirtualMemGetSize(CPLVirtualMem * ctxt) -> size_t

Return the size of the virtual memory mapping.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().

### Returns
the size of the virtual memory mapping.
"""
function CPLVirtualMemGetSize()
    ccall((:CPLVirtualMemGetSize, libgdal), Cint, ())
end


"""
    CPLVirtualMemIsFileMapping(CPLVirtualMem * ctxt) -> int

Return if the virtual memory mapping is a direct file mapping.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().

### Returns
TRUE if the virtual memory mapping is a direct file mapping.
"""
function CPLVirtualMemIsFileMapping(ctxt)
    ccall((:CPLVirtualMemIsFileMapping, libgdal), Cint, (Ptr{CPLVirtualMem},), ctxt)
end


"""
    CPLVirtualMemGetAccessMode(CPLVirtualMem * ctxt) -> CPLVirtualMemAccessMode

Return the access mode of the virtual memory mapping.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().

### Returns
the access mode of the virtual memory mapping.
"""
function CPLVirtualMemGetAccessMode(ctxt)
    ccall((:CPLVirtualMemGetAccessMode, libgdal), CPLVirtualMemAccessMode, (Ptr{CPLVirtualMem},), ctxt)
end


"""
    CPLVirtualMemGetPageSize(CPLVirtualMem * ctxt) -> size_t

Return the page size associated to a virtual memory mapping.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().

### Returns
the page size
"""
function CPLVirtualMemGetPageSize()
    ccall((:CPLVirtualMemGetPageSize, libgdal), Cint, ())
end


"""
    CPLVirtualMemIsAccessThreadSafe(CPLVirtualMem * ctxt) -> int

Return TRUE if this memory mapping can be accessed safely from concurrent threads.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().

### Returns
TRUE if this memory mapping can be accessed safely from concurrent threads.
"""
function CPLVirtualMemIsAccessThreadSafe(ctxt)
    ccall((:CPLVirtualMemIsAccessThreadSafe, libgdal), Cint, (Ptr{CPLVirtualMem},), ctxt)
end


"""
    CPLVirtualMemDeclareThread(CPLVirtualMem * ctxt) -> void

Declare that a thread will access a virtual memory mapping.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().
"""
function CPLVirtualMemDeclareThread(ctxt)
    ccall((:CPLVirtualMemDeclareThread, libgdal), Void, (Ptr{CPLVirtualMem},), ctxt)
end


"""
    CPLVirtualMemUnDeclareThread(CPLVirtualMem * ctxt) -> void

Declare that a thread will stop accessing a virtual memory mapping.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().
"""
function CPLVirtualMemUnDeclareThread(ctxt)
    ccall((:CPLVirtualMemUnDeclareThread, libgdal), Void, (Ptr{CPLVirtualMem},), ctxt)
end


"""
    CPLVirtualMemPin(CPLVirtualMem * ctxt,
                     void * pAddr,
                     size_t nSize,
                     int bWriteOp) -> void

Make sure that a region of virtual memory will be realized.

### Parameters
* **ctxt**: context returned by CPLVirtualMemNew().
* **pAddr**: the memory region to pin.
* **nSize**: the size of the memory region.
* **bWriteOp**: set to TRUE if the memory are will be accessed in write mode.
"""
function CPLVirtualMemPin(ctxt, pAddr, nSize::Csize_t, bWriteOp::Cint)
    ccall((:CPLVirtualMemPin, libgdal), Void, (Ptr{CPLVirtualMem}, Ptr{Void}, Csize_t, Cint), ctxt, pAddr, nSize, bWriteOp)
end


"""
    CPLVirtualMemManagerTerminate(void) -> void

Cleanup any resource and handlers related to virtual memory.
"""
function CPLVirtualMemManagerTerminate()
    ccall((:CPLVirtualMemManagerTerminate, libgdal), Void, ())
end
