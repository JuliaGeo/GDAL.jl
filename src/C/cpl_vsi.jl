# Julia wrapper for header: cpl_vsi.h
# Automatically generated using Clang.jl

"""
    VSIFOpen(const char * pszFilename,
             const char * pszAccess) -> FILE *
"""
function VSIFOpen()
    ccall((:VSIFOpen, libgdal), Ptr{Cint}, ())
end

"""
    VSIFClose(FILE * fp) -> int
"""
function VSIFClose(arg1)
    ccall((:VSIFClose, libgdal), Cint, (Ptr{Cint},), arg1)
end

"""
    VSIFSeek(FILE * fp,
             long nOffset,
             int nWhence) -> int
"""
function VSIFSeek(arg1, arg2, arg3)
    ccall((:VSIFSeek, libgdal), Cint, (Ptr{Cint}, Clong, Cint), arg1, arg2, arg3)
end

"""
    VSIFTell(FILE * fp) -> long
"""
function VSIFTell(arg1)
    ccall((:VSIFTell, libgdal), Clong, (Ptr{Cint},), arg1)
end

"""
    VSIRewind(FILE * fp) -> void
"""
function VSIRewind(arg1)
    ccall((:VSIRewind, libgdal), Cvoid, (Ptr{Cint},), arg1)
end

"""
    VSIFFlush(FILE * fp) -> void
"""
function VSIFFlush(arg1)
    ccall((:VSIFFlush, libgdal), Cvoid, (Ptr{Cint},), arg1)
end

"""
    VSIFRead(void * pBuffer,
             size_t nSize,
             size_t nCount,
             FILE * fp) -> size_t
"""
function VSIFRead()
    ccall((:VSIFRead, libgdal), Cint, ())
end

"""
    VSIFWrite(const void * pBuffer,
              size_t nSize,
              size_t nCount,
              FILE * fp) -> size_t
"""
function VSIFWrite()
    ccall((:VSIFWrite, libgdal), Cint, ())
end

"""
    VSIFGets(char * pszBuffer,
             int nBufferSize,
             FILE * fp) -> char *
"""
function VSIFGets(arg1, arg2, arg3)
    ccall((:VSIFGets, libgdal), Cstring, (Cstring, Cint, Ptr{Cint}), arg1, arg2, arg3)
end

"""
    VSIFPuts(const char * pszString,
             FILE * fp) -> int
"""
function VSIFPuts(arg1, arg2)
    ccall((:VSIFPuts, libgdal), Cint, (Cstring, Ptr{Cint}), arg1, arg2)
end

"""
    VSIFGetc(FILE * fp) -> int
"""
function VSIFGetc(arg1)
    ccall((:VSIFGetc, libgdal), Cint, (Ptr{Cint},), arg1)
end

"""
    VSIFPutc(int nChar,
             FILE * fp) -> int
"""
function VSIFPutc(arg1, arg2)
    ccall((:VSIFPutc, libgdal), Cint, (Cint, Ptr{Cint}), arg1, arg2)
end

"""
    VSIUngetc(int c,
              FILE * fp) -> int
"""
function VSIUngetc(arg1, arg2)
    ccall((:VSIUngetc, libgdal), Cint, (Cint, Ptr{Cint}), arg1, arg2)
end

"""
    VSIFEof(FILE * fp) -> int
"""
function VSIFEof(arg1)
    ccall((:VSIFEof, libgdal), Cint, (Ptr{Cint},), arg1)
end

"""
    VSIStat(const char * pszFilename,
            VSIStatBuf * pStatBuf) -> int
"""
function VSIStat(arg1, arg2)
    ccall((:VSIStat, libgdal), Cint, (Cstring, Ptr{VSIStatBuf}), arg1, arg2)
end

"""
    VSIFOpenL(const char * pszFilename,
              const char * pszAccess) -> VSILFILE *

Open file.

### Parameters
* **pszFilename**: the file to open. UTF-8 encoded.
* **pszAccess**: access requested (i.e. "r", "r+", "w")

### Returns
NULL on failure, or the file handle.
"""
function VSIFOpenL(arg1, arg2)
    ccall((:VSIFOpenL, libgdal), Ptr{VSILFILE}, (Cstring, Cstring), arg1, arg2)
end

"""
    VSIFOpenExL(const char * pszFilename,
                const char * pszAccess,
                int bSetError) -> VSILFILE *

Open file.

### Parameters
* **pszFilename**: the file to open. UTF-8 encoded.
* **pszAccess**: access requested (i.e. "r", "r+", "w")
* **bSetError**: flag determining whether or not this open call should set VSIErrors on failure.

### Returns
NULL on failure, or the file handle.
"""
function VSIFOpenExL(arg1, arg2, arg3)
    ccall((:VSIFOpenExL, libgdal), Ptr{VSILFILE}, (Cstring, Cstring, Cint), arg1, arg2, arg3)
end

"""
    VSIFCloseL(VSILFILE * fp) -> int

Close file.

### Parameters
* **fp**: file handle opened with VSIFOpenL(). Passing a nullptr produces undefined behavior.

### Returns
0 on success or -1 on failure.
"""
function VSIFCloseL(arg1)
    ccall((:VSIFCloseL, libgdal), Cint, (Ptr{VSILFILE},), arg1)
end

"""
    VSIFSeekL(VSILFILE * fp,
              vsi_l_offset nOffset,
              int nWhence) -> int

Seek to requested offset.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
* **nOffset**: offset in bytes.
* **nWhence**: one of SEEK_SET, SEEK_CUR or SEEK_END.

### Returns
0 on success or -1 one failure.
"""
function VSIFSeekL(arg1, arg2, arg3)
    ccall((:VSIFSeekL, libgdal), Cint, (Ptr{VSILFILE}, vsi_l_offset, Cint), arg1, arg2, arg3)
end

"""
    VSIFTellL(VSILFILE * fp) -> vsi_l_offset

Tell current file offset.

### Parameters
* **fp**: file handle opened with VSIFOpenL().

### Returns
file offset in bytes.
"""
function VSIFTellL(arg1)
    ccall((:VSIFTellL, libgdal), vsi_l_offset, (Ptr{VSILFILE},), arg1)
end

"""
    VSIRewindL(VSILFILE * fp) -> void

Rewind the file pointer to the beginning of the file.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
"""
function VSIRewindL(arg1)
    ccall((:VSIRewindL, libgdal), Cvoid, (Ptr{VSILFILE},), arg1)
end

"""
    VSIFReadL(void * pBuffer,
              size_t nSize,
              size_t nCount,
              VSILFILE * fp) -> size_t

Read bytes from file.

### Parameters
* **pBuffer**: the buffer into which the data should be read (at least nCount * nSize bytes in size.
* **nSize**: size of objects to read in bytes.
* **nCount**: number of objects to read.
* **fp**: file handle opened with VSIFOpenL().

### Returns
number of objects successfully read.
"""
function VSIFReadL()
    ccall((:VSIFReadL, libgdal), Cint, ())
end

"""
    VSIFReadMultiRangeL(int nRanges,
                        void ** ppData,
                        const vsi_l_offset * panOffsets,
                        const size_t * panSizes,
                        VSILFILE * fp) -> int

Read several ranges of bytes from file.

### Parameters
* **nRanges**: number of ranges to read.
* **ppData**: array of nRanges buffer into which the data should be read (ppData[i] must be at list panSizes[i] bytes).
* **panOffsets**: array of nRanges offsets at which the data should be read.
* **panSizes**: array of nRanges sizes of objects to read (in bytes).
* **fp**: file handle opened with VSIFOpenL().

### Returns
0 in case of success, -1 otherwise.
"""
function VSIFReadMultiRangeL(nRanges, ppData, panOffsets, panSizes, arg1)
    ccall((:VSIFReadMultiRangeL, libgdal), Cint, (Cint, Ptr{Ptr{Cvoid}}, Ptr{vsi_l_offset}, Ptr{Cint}, Ptr{VSILFILE}), nRanges, ppData, panOffsets, panSizes, arg1)
end

"""
    VSIFWriteL(const void * pBuffer,
               size_t nSize,
               size_t nCount,
               VSILFILE * fp) -> size_t

Write bytes to file.

### Parameters
* **pBuffer**: the buffer from which the data should be written (at least nCount * nSize bytes in size.
* **nSize**: size of objects to read in bytes.
* **nCount**: number of objects to read.
* **fp**: file handle opened with VSIFOpenL().

### Returns
number of objects successfully written.
"""
function VSIFWriteL()
    ccall((:VSIFWriteL, libgdal), Cint, ())
end

"""
    VSIFEofL(VSILFILE * fp) -> int

Test for end of file.

### Parameters
* **fp**: file handle opened with VSIFOpenL().

### Returns
TRUE if at EOF else FALSE.
"""
function VSIFEofL(arg1)
    ccall((:VSIFEofL, libgdal), Cint, (Ptr{VSILFILE},), arg1)
end

"""
    VSIFTruncateL(VSILFILE * fp,
                  vsi_l_offset nNewSize) -> int

Truncate/expand the file to the specified size.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
* **nNewSize**: new size in bytes.

### Returns
0 on success
"""
function VSIFTruncateL(arg1, arg2)
    ccall((:VSIFTruncateL, libgdal), Cint, (Ptr{VSILFILE}, vsi_l_offset), arg1, arg2)
end

"""
    VSIFFlushL(VSILFILE * fp) -> int

Flush pending writes to disk.

### Parameters
* **fp**: file handle opened with VSIFOpenL().

### Returns
0 on success or -1 on error.
"""
function VSIFFlushL(arg1)
    ccall((:VSIFFlushL, libgdal), Cint, (Ptr{VSILFILE},), arg1)
end

"""
    VSIFPutcL(int nChar,
              VSILFILE * fp) -> int

Write a single byte to the file.

### Parameters
* **nChar**: character to write.
* **fp**: file handle opened with VSIFOpenL().

### Returns
1 in case of success, 0 on error.
"""
function VSIFPutcL(arg1, arg2)
    ccall((:VSIFPutcL, libgdal), Cint, (Cint, Ptr{VSILFILE}), arg1, arg2)
end

"""
    VSIFGetRangeStatusL(VSILFILE * fp,
                        vsi_l_offset nOffset,
                        vsi_l_offset nLength) -> VSIRangeStatus

Return if a given file range contains data or holes filled with zeroes.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
* **nOffset**: offset of the start of the extent.
* **nLength**: extent length.

### Returns
extent status: VSI_RANGE_STATUS_UNKNOWN, VSI_RANGE_STATUS_DATA or VSI_RANGE_STATUS_HOLE
"""
function VSIFGetRangeStatusL(fp, nStart, nLength)
    ccall((:VSIFGetRangeStatusL, libgdal), VSIRangeStatus, (Ptr{VSILFILE}, vsi_l_offset, vsi_l_offset), fp, nStart, nLength)
end

"""
    VSIIngestFile(VSILFILE * fp,
                  const char * pszFilename,
                  GByte ** ppabyRet,
                  vsi_l_offset * pnSize,
                  GIntBig nMaxSize) -> int

Ingest a file into memory.

### Parameters
* **fp**: file handle opened with VSIFOpenL().
* **pszFilename**: filename.
* **ppabyRet**: pointer to the target buffer. *ppabyRet must be freed with VSIFree()
* **pnSize**: pointer to variable to store the file size. May be NULL.
* **nMaxSize**: maximum size of file allowed. If no limit, set to a negative value.

### Returns
TRUE in case of success.
"""
function VSIIngestFile(fp, pszFilename, ppabyRet, pnSize, nMaxSize)
    ccall((:VSIIngestFile, libgdal), Cint, (Ptr{VSILFILE}, Cstring, Ptr{Ptr{GByte}}, Ptr{vsi_l_offset}, GIntBig), fp, pszFilename, ppabyRet, pnSize, nMaxSize)
end

"""
    VSIStatL(const char * pszFilename,
             VSIStatBufL * psStatBuf) -> int

Get filesystem object info.

### Parameters
* **pszFilename**: the path of the filesystem object to be queried. UTF-8 encoded.
* **psStatBuf**: the structure to load with information.

### Returns
0 on success or -1 on an error.
"""
function VSIStatL(arg1, arg2)
    ccall((:VSIStatL, libgdal), Cint, (Cstring, Ptr{VSIStatBufL}), arg1, arg2)
end

"""
    VSIStatExL(const char * pszFilename,
               VSIStatBufL * psStatBuf,
               int nFlags) -> int

Get filesystem object info.

### Parameters
* **pszFilename**: the path of the filesystem object to be queried. UTF-8 encoded.
* **psStatBuf**: the structure to load with information.
* **nFlags**: 0 to get all information, or VSI_STAT_EXISTS_FLAG, VSI_STAT_NATURE_FLAG or VSI_STAT_SIZE_FLAG, or a combination of those to get partial info.

### Returns
0 on success or -1 on an error.
"""
function VSIStatExL(pszFilename, psStatBuf, nFlags)
    ccall((:VSIStatExL, libgdal), Cint, (Cstring, Ptr{VSIStatBufL}, Cint), pszFilename, psStatBuf, nFlags)
end

"""
    VSIIsCaseSensitiveFS(const char * pszFilename) -> int

Returns if the filenames of the filesystem are case sensitive.

### Parameters
* **pszFilename**: the path of the filesystem object to be tested. UTF-8 encoded.

### Returns
TRUE if the filenames of the filesystem are case sensitive.
"""
function VSIIsCaseSensitiveFS(pszFilename)
    ccall((:VSIIsCaseSensitiveFS, libgdal), Cint, (Cstring,), pszFilename)
end

"""
    VSISupportsSparseFiles(const char * pszPath) -> int

Returns if the filesystem supports sparse files.

### Parameters
* **pszPath**: the path of the filesystem object to be tested. UTF-8 encoded.

### Returns
TRUE if the file system is known to support sparse files. FALSE may be returned both in cases where it is known to not support them, or when it is unknown.
"""
function VSISupportsSparseFiles(pszPath)
    ccall((:VSISupportsSparseFiles, libgdal), Cint, (Cstring,), pszPath)
end

"""
    VSIHasOptimizedReadMultiRange(const char * pszPath) -> int

Returns if the filesystem supports efficient multi-range reading.

### Parameters
* **pszPath**: the path of the filesystem object to be tested. UTF-8 encoded.

### Returns
TRUE if the file system is known to have an efficient multi-range reading.
"""
function VSIHasOptimizedReadMultiRange(pszPath)
    ccall((:VSIHasOptimizedReadMultiRange, libgdal), Cint, (Cstring,), pszPath)
end

"""
    VSIGetActualURL(const char * pszFilename) -> const char *

Returns the actual URL of a supplied filename.

### Parameters
* **pszFilename**: the path of the filesystem object. UTF-8 encoded.

### Returns
the actual URL corresponding to the supplied filename, or NULL. Should not be freed.
"""
function VSIGetActualURL(pszFilename)
    ccall((:VSIGetActualURL, libgdal), Cstring, (Cstring,), pszFilename)
end

"""
    VSIGetSignedURL(const char * pszFilename,
                    CSLConstList papszOptions) -> char *

Returns a signed URL of a supplied filename.

### Parameters
* **pszFilename**: the path of the filesystem object. UTF-8 encoded.
* **papszOptions**: list of options, or NULL. Depend on file system handler. For /vsis3/, /vsigs/, /vsiaz/ and /vsioss/, the following options are supported: 

START_DATE=YYMMDDTHHMMSSZ: date and time in UTC following ISO 8601 standard, corresponding to the start of validity of the URL. If not specified, current date time. 


EXPIRATION_DELAY=number_of_seconds: number between 1 and 604800 (seven days) for the validity of the signed URL. Defaults to 3600 (one hour) 


VERB=GET/HEAD/DELETE/PUT/POST: HTTP VERB for which the request will be used. Default to GET.

### Returns
a signed URL, or NULL. Should be freed with CPLFree().
"""
function VSIGetSignedURL(pszFilename, papszOptions)
    ccall((:VSIGetSignedURL, libgdal), Cstring, (Cstring, CSLConstList), pszFilename, papszOptions)
end

"""
    VSIGetFileSystemOptions(const char * pszFilename) -> const char *

Return the list of options associated with a virtual file system handler as a serialized XML string.

### Parameters
* **pszFilename**: a filename, or prefix of a virtual file system handler.

### Returns
a string, which must not be freed, or NULL if no options is declared.
"""
function VSIGetFileSystemOptions(pszFilename)
    ccall((:VSIGetFileSystemOptions, libgdal), Cstring, (Cstring,), pszFilename)
end

"""
    VSIGetFileSystemsPrefixes(void) -> char **

Return the list of prefixes for virtual file system handlers currently registered.

### Returns
a NULL terminated list of prefixes. Must be freed with CSLDestroy()
"""
function VSIGetFileSystemsPrefixes()
    ccall((:VSIGetFileSystemsPrefixes, libgdal), Ptr{Cstring}, ())
end

"""
    VSIFGetNativeFileDescriptorL(VSILFILE * fp) -> void *

Returns the "native" file descriptor for the virtual handle.

### Parameters
* **fp**: file handle opened with VSIFOpenL().

### Returns
the native file descriptor, or NULL.
"""
function VSIFGetNativeFileDescriptorL(arg1)
    ccall((:VSIFGetNativeFileDescriptorL, libgdal), Ptr{Cvoid}, (Ptr{VSILFILE},), arg1)
end

"""
    VSICalloc(size_t nCount,
              size_t nSize) -> void *

Analog of calloc().
"""
function VSICalloc()
    ccall((:VSICalloc, libgdal), Ptr{Cvoid}, ())
end

"""
    VSIMalloc(size_t nSize) -> void *

Analog of malloc().
"""
function VSIMalloc()
    ccall((:VSIMalloc, libgdal), Ptr{Cvoid}, ())
end

"""
    VSIFree(void * pData) -> void

Analog of free() for data allocated with VSIMalloc(), VSICalloc(), VSIRealloc()
"""
function VSIFree(arg1)
    ccall((:VSIFree, libgdal), Cvoid, (Ptr{Cvoid},), arg1)
end

"""
    VSIRealloc(void * pData,
               size_t nNewSize) -> void *

Analog of realloc().
"""
function VSIRealloc(arg1, size_t)
    ccall((:VSIRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Cint), arg1, size_t)
end

"""
    VSIStrdup(const char * pszString) -> char *

Analog of strdup().
"""
function VSIStrdup(arg1)
    ccall((:VSIStrdup, libgdal), Cstring, (Cstring,), arg1)
end

"""
    VSIMallocAligned(size_t nAlignment,
                     size_t nSize) -> void *

Allocates a buffer with an alignment constraint.

### Parameters
* **nAlignment**: Must be a power of 2, multiple of sizeof(void*), and lesser than 256.
* **nSize**: Size of the buffer to allocate.

### Returns
a buffer aligned on nAlignment and of size nSize, or NULL
"""
function VSIMallocAligned(nAlignment, nSize)
    ccall((:VSIMallocAligned, libgdal), Ptr{Cvoid}, (Cint, Cint), nAlignment, nSize)
end

"""
    VSIMallocAlignedAuto(size_t nSize) -> void *

Allocates a buffer with an alignment constraint such that it can be used by the most demanding vector instruction set on that platform.

### Parameters
* **nSize**: Size of the buffer to allocate.

### Returns
an aligned buffer of size nSize, or NULL
"""
function VSIMallocAlignedAuto(nSize)
    ccall((:VSIMallocAlignedAuto, libgdal), Ptr{Cvoid}, (Cint,), nSize)
end

"""
    VSIFreeAligned(void * ptr) -> void

Free a buffer allocated with VSIMallocAligned().

### Parameters
* **ptr**: Buffer to free.
"""
function VSIFreeAligned(ptr)
    ccall((:VSIFreeAligned, libgdal), Cvoid, (Ptr{Cvoid},), ptr)
end

"""
    VSIMallocAlignedAutoVerbose(size_t nSize,
                                const char * pszFile,
                                int nLine) -> void *

See VSIMallocAlignedAuto()
"""
function VSIMallocAlignedAutoVerbose(nSize, pszFile, nLine)
    ccall((:VSIMallocAlignedAutoVerbose, libgdal), Ptr{Cvoid}, (Cint, Cstring, Cint), nSize, pszFile, nLine)
end

"""
    VSIMalloc2(size_t nSize1,
               size_t nSize2) -> void *

VSIMalloc2 allocates (nSize1 * nSize2) bytes.
"""
function VSIMalloc2(nSize1, nSize2)
    ccall((:VSIMalloc2, libgdal), Ptr{Cvoid}, (Cint, Cint), nSize1, nSize2)
end

"""
    VSIMalloc3(size_t nSize1,
               size_t nSize2,
               size_t nSize3) -> void *

VSIMalloc3 allocates (nSize1 * nSize2 * nSize3) bytes.
"""
function VSIMalloc3(nSize1, nSize2, nSize3)
    ccall((:VSIMalloc3, libgdal), Ptr{Cvoid}, (Cint, Cint, Cint), nSize1, nSize2, nSize3)
end

"""
    VSIMallocVerbose(size_t nSize,
                     const char * pszFile,
                     int nLine) -> void *

VSIMallocVerbose.
"""
function VSIMallocVerbose(nSize, pszFile, nLine)
    ccall((:VSIMallocVerbose, libgdal), Ptr{Cvoid}, (Cint, Cstring, Cint), nSize, pszFile, nLine)
end

"""
    VSIMalloc2Verbose(size_t nSize1,
                      size_t nSize2,
                      const char * pszFile,
                      int nLine) -> void *

VSIMalloc2Verbose.
"""
function VSIMalloc2Verbose(nSize1, nSize2, pszFile, nLine)
    ccall((:VSIMalloc2Verbose, libgdal), Ptr{Cvoid}, (Cint, Cint, Cstring, Cint), nSize1, nSize2, pszFile, nLine)
end

"""
    VSIMalloc3Verbose(size_t nSize1,
                      size_t nSize2,
                      size_t nSize3,
                      const char * pszFile,
                      int nLine) -> void *

VSIMalloc3Verbose.
"""
function VSIMalloc3Verbose(nSize1, nSize2, nSize3, pszFile, nLine)
    ccall((:VSIMalloc3Verbose, libgdal), Ptr{Cvoid}, (Cint, Cint, Cint, Cstring, Cint), nSize1, nSize2, nSize3, pszFile, nLine)
end

"""
    VSICallocVerbose(size_t nCount,
                     size_t nSize,
                     const char * pszFile,
                     int nLine) -> void *

VSICallocVerbose.
"""
function VSICallocVerbose(nCount, nSize, pszFile, nLine)
    ccall((:VSICallocVerbose, libgdal), Ptr{Cvoid}, (Cint, Cint, Cstring, Cint), nCount, nSize, pszFile, nLine)
end

"""
    VSIReallocVerbose(void * pOldPtr,
                      size_t nNewSize,
                      const char * pszFile,
                      int nLine) -> void *

VSIReallocVerbose.
"""
function VSIReallocVerbose(pOldPtr, nNewSize, pszFile, nLine)
    ccall((:VSIReallocVerbose, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Cint, Cstring, Cint), pOldPtr, nNewSize, pszFile, nLine)
end

"""
    VSIStrdupVerbose(const char * pszStr,
                     const char * pszFile,
                     int nLine) -> char *

VSIStrdupVerbose.
"""
function VSIStrdupVerbose(pszStr, pszFile, nLine)
    ccall((:VSIStrdupVerbose, libgdal), Cstring, (Cstring, Cstring, Cint), pszStr, pszFile, nLine)
end

"""
    CPLGetPhysicalRAM(void) -> GIntBig

Return the total physical RAM in bytes.

### Returns
the total physical RAM in bytes (or 0 in case of failure).
"""
function CPLGetPhysicalRAM()
    ccall((:CPLGetPhysicalRAM, libgdal), GIntBig, ())
end

"""
    CPLGetUsablePhysicalRAM(void) -> GIntBig

Return the total physical RAM, usable by a process, in bytes.

### Returns
the total physical RAM, usable by a process, in bytes (or 0 in case of failure).
"""
function CPLGetUsablePhysicalRAM()
    ccall((:CPLGetUsablePhysicalRAM, libgdal), GIntBig, ())
end

"""
    VSIReadDir(const char * pszPath) -> char **

Read names in a directory.

### Parameters
* **pszPath**: the relative, or absolute path of a directory to read. UTF-8 encoded.

### Returns
The list of entries in the directory, or NULL if the directory doesn't exist. Filenames are returned in UTF-8 encoding.
"""
function VSIReadDir(arg1)
    ccall((:VSIReadDir, libgdal), Ptr{Cstring}, (Cstring,), arg1)
end

"""
    VSIReadDirRecursive(const char * pszPathIn) -> char **

Read names in a directory recursively.

### Parameters
* **pszPathIn**: the relative, or absolute path of a directory to read. UTF-8 encoded.

### Returns
The list of entries in the directory and subdirectories or NULL if the directory doesn't exist. Filenames are returned in UTF-8 encoding.
"""
function VSIReadDirRecursive(pszPath)
    ccall((:VSIReadDirRecursive, libgdal), Ptr{Cstring}, (Cstring,), pszPath)
end

"""
    VSIReadDirEx(const char * pszPath,
                 int nMaxFiles) -> char **

Read names in a directory.

### Parameters
* **pszPath**: the relative, or absolute path of a directory to read. UTF-8 encoded.
* **nMaxFiles**: maximum number of files after which to stop, or 0 for no limit.

### Returns
The list of entries in the directory, or NULL if the directory doesn't exist. Filenames are returned in UTF-8 encoding.
"""
function VSIReadDirEx(pszPath, nMaxFiles)
    ccall((:VSIReadDirEx, libgdal), Ptr{Cstring}, (Cstring, Cint), pszPath, nMaxFiles)
end

"""
    VSIOpenDir(const char * pszPath,
               int nRecurseDepth,
               const char *const * papszOptions) -> VSIDIR *

Open a directory to read its entries.

### Parameters
* **pszPath**: the relative, or absolute path of a directory to read. UTF-8 encoded.
* **nRecurseDepth**: 0 means do not recurse in subdirectories, 1 means recurse only in the first level of subdirectories, etc. -1 means unlimited recursion level
* **papszOptions**: NULL terminated list of options, or NULL.

### Returns
a handle, or NULL in case of error
"""
function VSIOpenDir(pszPath, nRecurseDepth, papszOptions)
    ccall((:VSIOpenDir, libgdal), Ptr{VSIDIR}, (Cstring, Cint, Ptr{Cstring}), pszPath, nRecurseDepth, papszOptions)
end

"""
    VSIGetNextDirEntry(VSIDIR * dir) -> const VSIDIREntry *

Return the next entry of the directory.

### Parameters
* **dir**: Directory handled returned by VSIOpenDir(). Must not be NULL.

### Returns
a entry, or NULL if there is no more entry in the directory. This return value must not be freed.
"""
function VSIGetNextDirEntry(dir)
    ccall((:VSIGetNextDirEntry, libgdal), Ptr{VSIDIREntry}, (Ptr{VSIDIR},), dir)
end

"""
    VSICloseDir(VSIDIR * dir) -> void

Close a directory.

### Parameters
* **dir**: Directory handled returned by VSIOpenDir().
"""
function VSICloseDir(dir)
    ccall((:VSICloseDir, libgdal), Cvoid, (Ptr{VSIDIR},), dir)
end

"""
    VSIMkdir(const char * pszPathname,
             long mode) -> int

Create a directory.

### Parameters
* **pszPathname**: the path to the directory to create. UTF-8 encoded.
* **mode**: the permissions mode.

### Returns
0 on success or -1 on an error.
"""
function VSIMkdir(pszPathname, mode)
    ccall((:VSIMkdir, libgdal), Cint, (Cstring, Clong), pszPathname, mode)
end

"""
    VSIMkdirRecursive(const char * pszPathname,
                      long mode) -> int

Create a directory and all its ancestors.

### Parameters
* **pszPathname**: the path to the directory to create. UTF-8 encoded.
* **mode**: the permissions mode.

### Returns
0 on success or -1 on an error.
"""
function VSIMkdirRecursive(pszPathname, mode)
    ccall((:VSIMkdirRecursive, libgdal), Cint, (Cstring, Clong), pszPathname, mode)
end

"""
    VSIRmdir(const char * pszDirname) -> int

Delete a directory.

### Parameters
* **pszDirname**: the path of the directory to be deleted. UTF-8 encoded.

### Returns
0 on success or -1 on an error.
"""
function VSIRmdir(pszDirname)
    ccall((:VSIRmdir, libgdal), Cint, (Cstring,), pszDirname)
end

"""
    VSIRmdirRecursive(const char * pszDirname) -> int

Delete a directory recursively.

### Returns
0 on success or -1 on an error.
"""
function VSIRmdirRecursive(pszDirname)
    ccall((:VSIRmdirRecursive, libgdal), Cint, (Cstring,), pszDirname)
end

"""
    VSIUnlink(const char * pszFilename) -> int

Delete a file.

### Parameters
* **pszFilename**: the path of the file to be deleted. UTF-8 encoded.

### Returns
0 on success or -1 on an error.
"""
function VSIUnlink(pszFilename)
    ccall((:VSIUnlink, libgdal), Cint, (Cstring,), pszFilename)
end

"""
    VSIRename(const char * oldpath,
              const char * newpath) -> int

Rename a file.

### Parameters
* **oldpath**: the name of the file to be renamed. UTF-8 encoded.
* **newpath**: the name the file should be given. UTF-8 encoded.

### Returns
0 on success or -1 on an error.
"""
function VSIRename(oldpath, newpath)
    ccall((:VSIRename, libgdal), Cint, (Cstring, Cstring), oldpath, newpath)
end

"""
    VSISync(const char * pszSource,
            const char * pszTarget,
            const char *const * papszOptions,
            GDALProgressFunc pProgressFunc,
            void * pProgressData,
            char *** ppapszOutputs) -> int

Synchronize a source file/directory with a target file/directory.

### Parameters
* **pszSource**: Source file or directory. UTF-8 encoded.
* **pszTarget**: Target file or direcotry. UTF-8 encoded.
* **papszOptions**: Null terminated list of options, or NULL. Currently accepted options are: 

RECURSIVE=NO (the default is YES) 


SYNC_STRATEGY=TIMESTAMP/ETAG. Determines which criterion is used to determine if a target file must be replaced when it already exists and has the same file size as the source. Only applies for a source or target being a network filesystem.
The default is TIMESTAMP (similarly to how 'aws s3 sync' works), that is to say that for an upload operation, a remote file is replaced if it has a different size or if it is older than the source. For a download operation, a local file is replaced if it has a different size or if it is newer than the remote file.
The ETAG strategy assumes that the ETag metadata of the remote file is the MD5Sum of the file content, which is only true in the case of /vsis3/ for files not using KMS server side encryption and uploaded in a single PUT operation (so smaller than 50 MB given the default used by GDAL). Only to be used for /vsis3/, /vsigs/ or other filesystems using a MD5Sum as ETAG.
* **pProgressFunc**: Progress callback, or NULL.
* **pProgressData**: User data of progress callback, or NULL.
* **ppapszOutputs**: Unused. Should be set to NULL for now.

### Returns
TRUE on success or FALSE on an error.
"""
function VSISync(pszSource, pszTarget, papszOptions, pProgressFunc, pProgressData, ppapszOutputs)
    ccall((:VSISync, libgdal), Cint, (Cstring, Cstring, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}, Ptr{Ptr{Cstring}}), pszSource, pszTarget, papszOptions, pProgressFunc, pProgressData, ppapszOutputs)
end

"""
    VSIStrerror(int nErrno) -> char *

Return the error string corresponding to the error number.
"""
function VSIStrerror(arg1)
    ccall((:VSIStrerror, libgdal), Cstring, (Cint,), arg1)
end

"""
    VSIGetDiskFreeSpace(const char * pszDirname) -> GIntBig

Return free disk space available on the filesystem.

### Parameters
* **pszDirname**: a directory of the filesystem to query.

### Returns
The free space in bytes. Or -1 in case of error.
"""
function VSIGetDiskFreeSpace(pszDirname)
    ccall((:VSIGetDiskFreeSpace, libgdal), GIntBig, (Cstring,), pszDirname)
end

"""
    VSIInstallMemFileHandler() -> void

Install "memory" file system handler.
"""
function VSIInstallMemFileHandler()
    ccall((:VSIInstallMemFileHandler, libgdal), Cvoid, ())
end

function VSIInstallLargeFileHandler()
    ccall((:VSIInstallLargeFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallSubFileHandler() -> void

Install /vsisubfile/ virtual file handler.
"""
function VSIInstallSubFileHandler()
    ccall((:VSIInstallSubFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallCurlFileHandler(void) -> void

Install /vsicurl/ HTTP/FTP file system handler (requires libcurl)
"""
function VSIInstallCurlFileHandler()
    ccall((:VSIInstallCurlFileHandler, libgdal), Cvoid, ())
end

"""
    VSICurlClearCache(void) -> void

Clean local cache associated with /vsicurl/ (and related file systems)
"""
function VSICurlClearCache()
    ccall((:VSICurlClearCache, libgdal), Cvoid, ())
end

"""
    VSICurlPartialClearCache(const char * pszFilenamePrefix) -> void

Clean local cache associated with /vsicurl/ (and related file systems) for a given filename (and its subfiles and subdirectories if it is a directory)

### Parameters
* **pszFilenamePrefix**: Filename prefix
"""
function VSICurlPartialClearCache(pszFilenamePrefix)
    ccall((:VSICurlPartialClearCache, libgdal), Cvoid, (Cstring,), pszFilenamePrefix)
end

"""
    VSIInstallCurlStreamingFileHandler(void) -> void
"""
function VSIInstallCurlStreamingFileHandler()
    ccall((:VSIInstallCurlStreamingFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallS3FileHandler(void) -> void

Install /vsis3/ Amazon S3 file system handler (requires libcurl)
"""
function VSIInstallS3FileHandler()
    ccall((:VSIInstallS3FileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallS3StreamingFileHandler(void) -> void
"""
function VSIInstallS3StreamingFileHandler()
    ccall((:VSIInstallS3StreamingFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallGSFileHandler(void) -> void

Install /vsigs/ Google Cloud Storage file system handler (requires libcurl)
"""
function VSIInstallGSFileHandler()
    ccall((:VSIInstallGSFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallGSStreamingFileHandler(void) -> void
"""
function VSIInstallGSStreamingFileHandler()
    ccall((:VSIInstallGSStreamingFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallAzureFileHandler(void) -> void

Install /vsiaz/ Microsoft Azure Blob file system handler (requires libcurl)
"""
function VSIInstallAzureFileHandler()
    ccall((:VSIInstallAzureFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallAzureStreamingFileHandler(void) -> void
"""
function VSIInstallAzureStreamingFileHandler()
    ccall((:VSIInstallAzureStreamingFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallOSSFileHandler(void) -> void

Install /vsioss/ Alibaba Cloud Object Storage Service (OSS) file system handler (requires libcurl)
"""
function VSIInstallOSSFileHandler()
    ccall((:VSIInstallOSSFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallOSSStreamingFileHandler(void) -> void
"""
function VSIInstallOSSStreamingFileHandler()
    ccall((:VSIInstallOSSStreamingFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallSwiftFileHandler(void) -> void

Install /vsiswift/ OpenStack Swif Object Storage (Swift) file system handler (requires libcurl)
"""
function VSIInstallSwiftFileHandler()
    ccall((:VSIInstallSwiftFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallSwiftStreamingFileHandler(void) -> void
"""
function VSIInstallSwiftStreamingFileHandler()
    ccall((:VSIInstallSwiftStreamingFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallGZipFileHandler() -> void

Install GZip file system handler.
"""
function VSIInstallGZipFileHandler()
    ccall((:VSIInstallGZipFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallZipFileHandler() -> void

Install ZIP file system handler.
"""
function VSIInstallZipFileHandler()
    ccall((:VSIInstallZipFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallStdinHandler() -> void

Install /vsistdin/ file system handler.
"""
function VSIInstallStdinHandler()
    ccall((:VSIInstallStdinHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallHdfsHandler() -> void

Install /vsihdfs/ file system handler (requires JVM and HDFS support)
"""
function VSIInstallHdfsHandler()
    ccall((:VSIInstallHdfsHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallWebHdfsHandler(void) -> void

Install /vsiwebhdfs/ WebHDFS (Hadoop File System) REST API file system handler (requires libcurl)
"""
function VSIInstallWebHdfsHandler()
    ccall((:VSIInstallWebHdfsHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallStdoutHandler() -> void

Install /vsistdout/ file system handler.
"""
function VSIInstallStdoutHandler()
    ccall((:VSIInstallStdoutHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallSparseFileHandler() -> void

Install /vsisparse/ virtual file handler.
"""
function VSIInstallSparseFileHandler()
    ccall((:VSIInstallSparseFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallTarFileHandler(void) -> void

Install /vsitar/ file system handler.
"""
function VSIInstallTarFileHandler()
    ccall((:VSIInstallTarFileHandler, libgdal), Cvoid, ())
end

"""
    VSIInstallCryptFileHandler() -> void

Install /vsicrypt/ encrypted file system handler (requires libcrypto++)
"""
function VSIInstallCryptFileHandler()
    ccall((:VSIInstallCryptFileHandler, libgdal), Cvoid, ())
end

"""
    VSISetCryptKey(const GByte * pabyKey,
                   int nKeySize) -> void

Installs the encryption/decryption key.

### Parameters
* **pabyKey**: key. Might be NULL to clear previously set key.
* **nKeySize**: length of the key in bytes. Might be 0 to clear previously set key.
"""
function VSISetCryptKey(pabyKey, nKeySize)
    ccall((:VSISetCryptKey, libgdal), Cvoid, (Ptr{GByte}, Cint), pabyKey, nKeySize)
end

function VSICleanupFileManager()
    ccall((:VSICleanupFileManager, libgdal), Cvoid, ())
end

"""
    VSIFileFromMemBuffer(const char * pszFilename,
                         GByte * pabyData,
                         vsi_l_offset nDataLength,
                         int bTakeOwnership) -> VSILFILE *

Create memory "file" from a buffer.

### Parameters
* **pszFilename**: the filename to be created.
* **pabyData**: the data buffer for the file.
* **nDataLength**: the length of buffer in bytes.
* **bTakeOwnership**: TRUE to transfer "ownership" of buffer or FALSE.

### Returns
open file handle on created file (see VSIFOpenL()).
"""
function VSIFileFromMemBuffer(pszFilename, pabyData, nDataLength, bTakeOwnership)
    ccall((:VSIFileFromMemBuffer, libgdal), Ptr{VSILFILE}, (Cstring, Ptr{GByte}, vsi_l_offset, Cint), pszFilename, pabyData, nDataLength, bTakeOwnership)
end

"""
    VSIGetMemFileBuffer(const char * pszFilename,
                        vsi_l_offset * pnDataLength,
                        int bUnlinkAndSeize) -> GByte *

Fetch buffer underlying memory file.

### Parameters
* **pszFilename**: the name of the file to grab the buffer of.
* **pnDataLength**: (file) length returned in this variable.
* **bUnlinkAndSeize**: TRUE to remove the file, or FALSE to leave unaltered.

### Returns
pointer to memory buffer or NULL on failure.
"""
function VSIGetMemFileBuffer(pszFilename, pnDataLength, bUnlinkAndSeize)
    ccall((:VSIGetMemFileBuffer, libgdal), Ptr{GByte}, (Cstring, Ptr{vsi_l_offset}, Cint), pszFilename, pnDataLength, bUnlinkAndSeize)
end

"""
    VSIStdoutSetRedirection(VSIWriteFunction pFct,
                            FILE * stream) -> void

Set an alternative write function and output file handle instead of fwrite() / stdout.

### Parameters
* **pFct**: Function with same signature as fwrite()
* **stream**: File handle on which to output. Passed to pFct.
"""
function VSIStdoutSetRedirection(pFct, stream)
    ccall((:VSIStdoutSetRedirection, libgdal), Cvoid, (Cint, Ptr{Cint}), pFct, stream)
end

"""
    VSIAllocFilesystemPluginCallbacksStruct(void) -> VSIFilesystemPluginCallbacksStruct *

return a VSIFilesystemPluginCallbacksStruct to be populated at runtime with handler callbacks
"""
function VSIAllocFilesystemPluginCallbacksStruct()
    ccall((:VSIAllocFilesystemPluginCallbacksStruct, libgdal), Ptr{VSIFilesystemPluginCallbacksStruct}, ())
end

"""
    VSIFreeFilesystemPluginCallbacksStruct(VSIFilesystemPluginCallbacksStruct * poCb) -> void

free resources allocated by VSIAllocFilesystemPluginCallbacksStruct
"""
function VSIFreeFilesystemPluginCallbacksStruct(poCb)
    ccall((:VSIFreeFilesystemPluginCallbacksStruct, libgdal), Cvoid, (Ptr{VSIFilesystemPluginCallbacksStruct},), poCb)
end

"""
    VSIInstallPluginHandler(const char * pszPrefix,
                            const VSIFilesystemPluginCallbacksStruct * poCb) -> int

register a handler on the given prefix.
"""
function VSIInstallPluginHandler(pszPrefix, poCb)
    ccall((:VSIInstallPluginHandler, libgdal), Cint, (Cstring, Ptr{VSIFilesystemPluginCallbacksStruct}), pszPrefix, poCb)
end

"""
    VSITime(unsigned long * pnTimeToSet) -> unsigned long
"""
function VSITime(arg1)
    ccall((:VSITime, libgdal), Culong, (Ptr{Culong},), arg1)
end

"""
    VSICTime(unsigned long nTime) -> const char *
"""
function VSICTime(arg1)
    ccall((:VSICTime, libgdal), Cstring, (Culong,), arg1)
end

"""
    VSIGMTime(const time_t * pnTime,
              struct tm * poBrokenTime) -> struct tm *
"""
function VSIGMTime(pnTime, poBrokenTime)
    ccall((:VSIGMTime, libgdal), Ptr{Ctm}, (Ptr{Cint}, Ptr{Ctm}), pnTime, poBrokenTime)
end

"""
    VSILocalTime(const time_t * pnTime,
                 struct tm * poBrokenTime) -> struct tm *
"""
function VSILocalTime(pnTime, poBrokenTime)
    ccall((:VSILocalTime, libgdal), Ptr{Ctm}, (Ptr{Cint}, Ptr{Ctm}), pnTime, poBrokenTime)
end
