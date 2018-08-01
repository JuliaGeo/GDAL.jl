# Julia wrapper for header: /usr/local/include/cpl_vsi.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0



"""
    VSIFOpen(const char * pszFilename,
             const char * pszAccess) -> FILE *
"""
function VSIFOpen(arg1, arg2)
    ccall((:VSIFOpen, libgdal), Ptr{FILE}, (Cstring, Cstring), arg1, arg2)
end


"""
    VSIFClose(FILE * fp) -> int
"""
function VSIFClose(arg1)
    ccall((:VSIFClose, libgdal), Cint, (Ptr{FILE},), arg1)
end


"""
    VSIFSeek(FILE * fp,
             long nOffset,
             int nWhence) -> int
"""
function VSIFSeek(arg1, arg2::Clong, arg3::Cint)
    ccall((:VSIFSeek, libgdal), Cint, (Ptr{FILE}, Clong, Cint), arg1, arg2, arg3)
end


"""
    VSIFTell(FILE * fp) -> long
"""
function VSIFTell(arg1)
    ccall((:VSIFTell, libgdal), Clong, (Ptr{FILE},), arg1)
end


"""
    VSIRewind(FILE * fp) -> void
"""
function VSIRewind(arg1)
    ccall((:VSIRewind, libgdal), Cvoid, (Ptr{FILE},), arg1)
end


"""
    VSIFFlush(FILE * fp) -> void
"""
function VSIFFlush(arg1)
    ccall((:VSIFFlush, libgdal), Cvoid, (Ptr{FILE},), arg1)
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
function VSIFGets(arg1, arg2::Cint, arg3)
    ccall((:VSIFGets, libgdal), Cstring, (Cstring, Cint, Ptr{FILE}), arg1, arg2, arg3)
end


"""
    VSIFPuts(const char * pszString,
             FILE * fp) -> int
"""
function VSIFPuts(arg1, arg2)
    ccall((:VSIFPuts, libgdal), Cint, (Cstring, Ptr{FILE}), arg1, arg2)
end


"""
    VSIFGetc(FILE * fp) -> int
"""
function VSIFGetc(arg1)
    ccall((:VSIFGetc, libgdal), Cint, (Ptr{FILE},), arg1)
end


"""
    VSIFPutc(int nChar,
             FILE * fp) -> int
"""
function VSIFPutc(arg1::Cint, arg2)
    ccall((:VSIFPutc, libgdal), Cint, (Cint, Ptr{FILE}), arg1, arg2)
end


"""
    VSIUngetc(int c,
              FILE * fp) -> int
"""
function VSIUngetc(arg1::Cint, arg2)
    ccall((:VSIUngetc, libgdal), Cint, (Cint, Ptr{FILE}), arg1, arg2)
end


"""
    VSIFEof(FILE * fp) -> int
"""
function VSIFEof(arg1)
    ccall((:VSIFEof, libgdal), Cint, (Ptr{FILE},), arg1)
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
function VSIFOpenExL(arg1, arg2, arg3::Cint)
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
function VSIFSeekL(arg1, arg2::vsi_l_offset, arg3::Cint)
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
function VSIFReadMultiRangeL(nRanges::Cint, ppData, panOffsets, panSizes, arg1)
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
function VSIFTruncateL(arg1, arg2::vsi_l_offset)
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
function VSIFPutcL(arg1::Cint, arg2)
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
function VSIFGetRangeStatusL(fp, nStart::vsi_l_offset, nLength::vsi_l_offset)
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
function VSIIngestFile(fp, pszFilename, ppabyRet, pnSize, nMaxSize::GIntBig)
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
function VSIStatExL(pszFilename, psStatBuf, nFlags::Cint)
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
function VSIRealloc(arg1, size_t::Cint)
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
function VSIMallocAligned(nAlignment::Cint, nSize::Cint)
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
function VSIMallocAlignedAuto(nSize::Cint)
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
function VSIMallocAlignedAutoVerbose(nSize::Cint, pszFile, nLine::Cint)
    ccall((:VSIMallocAlignedAutoVerbose, libgdal), Ptr{Cvoid}, (Cint, Cstring, Cint), nSize, pszFile, nLine)
end


"""
    VSIMalloc2(size_t nSize1,
               size_t nSize2) -> void *

VSIMalloc2 allocates (nSize1 * nSize2) bytes.
"""
function VSIMalloc2(nSize1::Cint, nSize2::Cint)
    ccall((:VSIMalloc2, libgdal), Ptr{Cvoid}, (Cint, Cint), nSize1, nSize2)
end


"""
    VSIMalloc3(size_t nSize1,
               size_t nSize2,
               size_t nSize3) -> void *

VSIMalloc3 allocates (nSize1 * nSize2 * nSize3) bytes.
"""
function VSIMalloc3(nSize1::Cint, nSize2::Cint, nSize3::Cint)
    ccall((:VSIMalloc3, libgdal), Ptr{Cvoid}, (Cint, Cint, Cint), nSize1, nSize2, nSize3)
end


"""
    VSIMallocVerbose(size_t nSize,
                     const char * pszFile,
                     int nLine) -> void *

VSIMallocVerbose.
"""
function VSIMallocVerbose(nSize::Cint, pszFile, nLine::Cint)
    ccall((:VSIMallocVerbose, libgdal), Ptr{Cvoid}, (Cint, Cstring, Cint), nSize, pszFile, nLine)
end


"""
    VSIMalloc2Verbose(size_t nSize1,
                      size_t nSize2,
                      const char * pszFile,
                      int nLine) -> void *

VSIMalloc2Verbose.
"""
function VSIMalloc2Verbose(nSize1::Cint, nSize2::Cint, pszFile, nLine::Cint)
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
function VSIMalloc3Verbose(nSize1::Cint, nSize2::Cint, nSize3::Cint, pszFile, nLine::Cint)
    ccall((:VSIMalloc3Verbose, libgdal), Ptr{Cvoid}, (Cint, Cint, Cint, Cstring, Cint), nSize1, nSize2, nSize3, pszFile, nLine)
end


"""
    VSICallocVerbose(size_t nCount,
                     size_t nSize,
                     const char * pszFile,
                     int nLine) -> void *

VSICallocVerbose.
"""
function VSICallocVerbose(nCount::Cint, nSize::Cint, pszFile, nLine::Cint)
    ccall((:VSICallocVerbose, libgdal), Ptr{Cvoid}, (Cint, Cint, Cstring, Cint), nCount, nSize, pszFile, nLine)
end


"""
    VSIReallocVerbose(void * pOldPtr,
                      size_t nNewSize,
                      const char * pszFile,
                      int nLine) -> void *

VSIReallocVerbose.
"""
function VSIReallocVerbose(pOldPtr, nNewSize::Cint, pszFile, nLine::Cint)
    ccall((:VSIReallocVerbose, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Cint, Cstring, Cint), pOldPtr, nNewSize, pszFile, nLine)
end


"""
    VSIStrdupVerbose(const char * pszStr,
                     const char * pszFile,
                     int nLine) -> char *

VSIStrdupVerbose.
"""
function VSIStrdupVerbose(pszStr, pszFile, nLine::Cint)
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
function VSIReadDirEx(pszPath, nMaxFiles::Cint)
    ccall((:VSIReadDirEx, libgdal), Ptr{Cstring}, (Cstring, Cint), pszPath, nMaxFiles)
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
function VSIMkdir(pathname, mode::Clong)
    ccall((:VSIMkdir, libgdal), Cint, (Cstring, Clong), pathname, mode)
end


"""
    VSIRmdir(const char * pszDirname) -> int

Delete a directory.

### Parameters
* **pszDirname**: the path of the directory to be deleted. UTF-8 encoded.

### Returns
0 on success or -1 on an error.
"""
function VSIRmdir(pathname)
    ccall((:VSIRmdir, libgdal), Cint, (Cstring,), pathname)
end


"""
    VSIUnlink(const char * pszFilename) -> int

Delete a file.

### Parameters
* **pszFilename**: the path of the file to be deleted. UTF-8 encoded.

### Returns
0 on success or -1 on an error.
"""
function VSIUnlink(pathname)
    ccall((:VSIUnlink, libgdal), Cint, (Cstring,), pathname)
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
    VSIStrerror(int nErrno) -> char *

Return the error string corresponding to the error number.
"""
function VSIStrerror(arg1::Cint)
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
    VSIInstallMemFileHandler(void) -> void

Install "memory" file system handler.
"""
function VSIInstallMemFileHandler()
    ccall((:VSIInstallMemFileHandler, libgdal), Cvoid, ())
end


"""
"""
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
function VSISetCryptKey(pabyKey, nKeySize::Cint)
    ccall((:VSISetCryptKey, libgdal), Cvoid, (Ptr{GByte}, Cint), pabyKey, nKeySize)
end


"""
"""
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
function VSIFileFromMemBuffer(pszFilename, pabyData, nDataLength::vsi_l_offset, bTakeOwnership::Cint)
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
function VSIGetMemFileBuffer(pszFilename, pnDataLength, bUnlinkAndSeize::Cint)
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
function VSIStdoutSetRedirection(pFct::Cint, stream)
    ccall((:VSIStdoutSetRedirection, libgdal), Cvoid, (Cint, Ptr{FILE}), pFct, stream)
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
function VSICTime(arg1::Culong)
    ccall((:VSICTime, libgdal), Cstring, (Culong,), arg1)
end


"""
    VSIGMTime(const time_t * pnTime,
              struct tm * poBrokenTime) -> struct tm *
"""
function VSIGMTime(pnTime, poBrokenTime)
    ccall((:VSIGMTime, libgdal), Ptr{Cvoid}, (Ptr{time_t}, Ptr{Cvoid}), pnTime, poBrokenTime)
end


"""
    VSILocalTime(const time_t * pnTime,
                 struct tm * poBrokenTime) -> struct tm *
"""
function VSILocalTime(pnTime, poBrokenTime)
    ccall((:VSILocalTime, libgdal), Ptr{Cvoid}, (Ptr{time_t}, Ptr{Cvoid}), pnTime, poBrokenTime)
end
