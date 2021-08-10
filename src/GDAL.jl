module GDAL

using GDAL_jll
export GDAL_jll

using CEnum
using NetworkOptions

# begin of prologue.jl

using PROJ_jll
using MozillaCACerts_jll: cacert

const stat = Cvoid

const _stat64 = Cvoid

const tm = Libc.TmStruct

const time_t = Int

CPL_STATIC_CAST(type, value) = value % type

GDAL_COMPUTE_VERSION(maj,min,rev) = ((maj)*1000000+(min)*10000+(rev)*100)

# end of prologue.jl


"""
    cplverifyconfiguration()

Doxygen\\_Suppress 
"""
function cplverifyconfiguration()
    aftercare(ccall((:CPLVerifyConfiguration, libgdal), Cvoid, ()))
end

function cplgetconfigoption(arg1, arg2)
    aftercare(ccall((:CPLGetConfigOption, libgdal), Cstring, (Cstring, Cstring), arg1, arg2), false)
end

function cplgetthreadlocalconfigoption(arg1, arg2)
    aftercare(ccall((:CPLGetThreadLocalConfigOption, libgdal), Cstring, (Cstring, Cstring), arg1, arg2), false)
end

function cplsetconfigoption(arg1, arg2)
    aftercare(ccall((:CPLSetConfigOption, libgdal), Cvoid, (Cstring, Cstring), arg1, arg2))
end

function cplsetthreadlocalconfigoption(pszKey, pszValue)
    aftercare(ccall((:CPLSetThreadLocalConfigOption, libgdal), Cvoid, (Cstring, Cstring), pszKey, pszValue))
end

"""
    cplfreeconfig()

Doxygen\\_Suppress 
"""
function cplfreeconfig()
    aftercare(ccall((:CPLFreeConfig, libgdal), Cvoid, ()))
end

function cplgetconfigoptions()
    aftercare(ccall((:CPLGetConfigOptions, libgdal), Ptr{Cstring}, ()))
end

function cplsetconfigoptions(papszConfigOptions)
    aftercare(ccall((:CPLSetConfigOptions, libgdal), Cvoid, (Ptr{Cstring},), papszConfigOptions))
end

function cplgetthreadlocalconfigoptions()
    aftercare(ccall((:CPLGetThreadLocalConfigOptions, libgdal), Ptr{Cstring}, ()))
end

function cplsetthreadlocalconfigoptions(papszConfigOptions)
    aftercare(ccall((:CPLSetThreadLocalConfigOptions, libgdal), Cvoid, (Ptr{Cstring},), papszConfigOptions))
end

function cplmalloc(arg1)
    aftercare(ccall((:CPLMalloc, libgdal), Ptr{Cvoid}, (Csize_t,), arg1))
end

function cplcalloc(arg1, arg2)
    aftercare(ccall((:CPLCalloc, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), arg1, arg2))
end

function cplrealloc(arg1, arg2)
    aftercare(ccall((:CPLRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t), arg1, arg2))
end

function cplstrdup(arg1)
    aftercare(ccall((:CPLStrdup, libgdal), Cstring, (Cstring,), arg1), false)
end

function cplstrlwr(arg1)
    aftercare(ccall((:CPLStrlwr, libgdal), Cstring, (Cstring,), arg1), false)
end

function cplfgets(arg1, arg2, arg3)
    aftercare(ccall((:CPLFGets, libgdal), Cstring, (Cstring, Cint, Ptr{Libc.FILE}), arg1, arg2, arg3), false)
end

function cplreadline(arg1)
    aftercare(ccall((:CPLReadLine, libgdal), Cstring, (Ptr{Libc.FILE},), arg1), false)
end

"""Opaque type for a FILE that implements the VSIVirtualHandle API """
const VSILFILE = Libc.FILE

function cplreadlinel(arg1)
    aftercare(ccall((:CPLReadLineL, libgdal), Cstring, (Ptr{VSILFILE},), arg1), false)
end

"""Type of a constant null-terminated list of nul terminated strings. Seen as char** from C and const char* const* from C++ """
const CSLConstList = Ptr{Cstring}

function cplreadline2l(arg1, arg2, arg3)
    aftercare(ccall((:CPLReadLine2L, libgdal), Cstring, (Ptr{VSILFILE}, Cint, CSLConstList), arg1, arg2, arg3), false)
end

function cplreadline3l(arg1, arg2, arg3, arg4)
    aftercare(ccall((:CPLReadLine3L, libgdal), Cstring, (Ptr{VSILFILE}, Cint, Ptr{Cint}, CSLConstList), arg1, arg2, arg3, arg4), false)
end

function cplatof(arg1)
    aftercare(ccall((:CPLAtof, libgdal), Cdouble, (Cstring,), arg1))
end

function cplatofdelim(arg1, arg2)
    aftercare(ccall((:CPLAtofDelim, libgdal), Cdouble, (Cstring, Cchar), arg1, arg2))
end

function cplstrtod(arg1, arg2)
    aftercare(ccall((:CPLStrtod, libgdal), Cdouble, (Cstring, Ptr{Cstring}), arg1, arg2))
end

function cplstrtoddelim(arg1, arg2, arg3)
    aftercare(ccall((:CPLStrtodDelim, libgdal), Cdouble, (Cstring, Ptr{Cstring}, Cchar), arg1, arg2, arg3))
end

function cplstrtof(arg1, arg2)
    aftercare(ccall((:CPLStrtof, libgdal), Cfloat, (Cstring, Ptr{Cstring}), arg1, arg2))
end

function cplstrtofdelim(arg1, arg2, arg3)
    aftercare(ccall((:CPLStrtofDelim, libgdal), Cfloat, (Cstring, Ptr{Cstring}, Cchar), arg1, arg2, arg3))
end

function cplatofm(arg1)
    aftercare(ccall((:CPLAtofM, libgdal), Cdouble, (Cstring,), arg1))
end

function cplscanstring(arg1, arg2, arg3, arg4)
    aftercare(ccall((:CPLScanString, libgdal), Cstring, (Cstring, Cint, Cint, Cint), arg1, arg2, arg3, arg4), false)
end

function cplscandouble(arg1, arg2)
    aftercare(ccall((:CPLScanDouble, libgdal), Cdouble, (Cstring, Cint), arg1, arg2))
end

function cplscanlong(arg1, arg2)
    aftercare(ccall((:CPLScanLong, libgdal), Clong, (Cstring, Cint), arg1, arg2))
end

function cplscanulong(arg1, arg2)
    aftercare(ccall((:CPLScanULong, libgdal), Culong, (Cstring, Cint), arg1, arg2))
end

"""Large unsigned integer type (generally 64-bit unsigned integer type). Use [`GUInt64`](@ref) when exactly 64 bit is needed """
const GUIntBig = Culonglong

function cplscanuintbig(arg1, arg2)
    aftercare(ccall((:CPLScanUIntBig, libgdal), GUIntBig, (Cstring, Cint), arg1, arg2))
end

"""Large signed integer type (generally 64-bit integer type). Use [`GInt64`](@ref) when exactly 64 bit is needed """
const GIntBig = Clonglong

function cplatogintbig(pszString)
    aftercare(ccall((:CPLAtoGIntBig, libgdal), GIntBig, (Cstring,), pszString))
end

function cplatogintbigex(pszString, bWarn, pbOverflow)
    aftercare(ccall((:CPLAtoGIntBigEx, libgdal), GIntBig, (Cstring, Cint, Ptr{Cint}), pszString, bWarn, pbOverflow))
end

function cplscanpointer(arg1, arg2)
    aftercare(ccall((:CPLScanPointer, libgdal), Ptr{Cvoid}, (Cstring, Cint), arg1, arg2))
end

function cplprintstring(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintString, libgdal), Cint, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

function cplprintstringfill(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintStringFill, libgdal), Cint, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

"""Int32 type """
const GInt32 = Cint

function cplprintint32(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintInt32, libgdal), Cint, (Cstring, GInt32, Cint), arg1, arg2, arg3))
end

function cplprintuintbig(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintUIntBig, libgdal), Cint, (Cstring, GUIntBig, Cint), arg1, arg2, arg3))
end

function cplprintdouble(arg1, arg2, arg3, arg4)
    aftercare(ccall((:CPLPrintDouble, libgdal), Cint, (Cstring, Cstring, Cdouble, Cstring), arg1, arg2, arg3, arg4))
end

function cplprinttime(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:CPLPrintTime, libgdal), Cint, (Cstring, Cint, Cstring, Ptr{tm}, Cstring), arg1, arg2, arg3, arg4, arg5))
end

function cplprintpointer(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintPointer, libgdal), Cint, (Cstring, Ptr{Cvoid}, Cint), arg1, arg2, arg3))
end

function cplgetsymbol(arg1, arg2)
    aftercare(ccall((:CPLGetSymbol, libgdal), Ptr{Cvoid}, (Cstring, Cstring), arg1, arg2))
end

function cplgetexecpath(pszPathBuf, nMaxLength)
    aftercare(ccall((:CPLGetExecPath, libgdal), Cint, (Cstring, Cint), pszPathBuf, nMaxLength))
end

function cplgetpath(arg1)
    aftercare(ccall((:CPLGetPath, libgdal), Cstring, (Cstring,), arg1), false)
end

function cplgetdirname(arg1)
    aftercare(ccall((:CPLGetDirname, libgdal), Cstring, (Cstring,), arg1), false)
end

function cplgetfilename(arg1)
    aftercare(ccall((:CPLGetFilename, libgdal), Cstring, (Cstring,), arg1), false)
end

function cplgetbasename(arg1)
    aftercare(ccall((:CPLGetBasename, libgdal), Cstring, (Cstring,), arg1), false)
end

function cplgetextension(arg1)
    aftercare(ccall((:CPLGetExtension, libgdal), Cstring, (Cstring,), arg1), false)
end

function cplgetcurrentdir()
    aftercare(ccall((:CPLGetCurrentDir, libgdal), Cstring, ()), false)
end

function cplformfilename(pszPath, pszBasename, pszExtension)
    aftercare(ccall((:CPLFormFilename, libgdal), Cstring, (Cstring, Cstring, Cstring), pszPath, pszBasename, pszExtension), false)
end

function cplformcifilename(pszPath, pszBasename, pszExtension)
    aftercare(ccall((:CPLFormCIFilename, libgdal), Cstring, (Cstring, Cstring, Cstring), pszPath, pszBasename, pszExtension), false)
end

function cplresetextension(arg1, arg2)
    aftercare(ccall((:CPLResetExtension, libgdal), Cstring, (Cstring, Cstring), arg1, arg2), false)
end

function cplprojectrelativefilename(pszProjectDir, pszSecondaryFilename)
    aftercare(ccall((:CPLProjectRelativeFilename, libgdal), Cstring, (Cstring, Cstring), pszProjectDir, pszSecondaryFilename), false)
end

function cplisfilenamerelative(pszFilename)
    aftercare(ccall((:CPLIsFilenameRelative, libgdal), Cint, (Cstring,), pszFilename))
end

function cplextractrelativepath(arg1, arg2, arg3)
    aftercare(ccall((:CPLExtractRelativePath, libgdal), Cstring, (Cstring, Cstring, Ptr{Cint}), arg1, arg2, arg3), false)
end

function cplcleantrailingslash(arg1)
    aftercare(ccall((:CPLCleanTrailingSlash, libgdal), Cstring, (Cstring,), arg1), false)
end

function cplcorrespondingpaths(pszOldFilename, pszNewFilename, papszFileList)
    aftercare(ccall((:CPLCorrespondingPaths, libgdal), Ptr{Cstring}, (Cstring, Cstring, Ptr{Cstring}), pszOldFilename, pszNewFilename, papszFileList))
end

function cplcheckforfile(pszFilename, papszSiblingList)
    aftercare(ccall((:CPLCheckForFile, libgdal), Cint, (Cstring, Ptr{Cstring}), pszFilename, papszSiblingList))
end

function cplgeneratetempfilename(pszStem)
    aftercare(ccall((:CPLGenerateTempFilename, libgdal), Cstring, (Cstring,), pszStem), false)
end

function cplexpandtilde(pszFilename)
    aftercare(ccall((:CPLExpandTilde, libgdal), Cstring, (Cstring,), pszFilename), false)
end

function cplgethomedir()
    aftercare(ccall((:CPLGetHomeDir, libgdal), Cstring, ()), false)
end

function cpllaunderforfilename(pszName, pszOutputPath)
    aftercare(ccall((:CPLLaunderForFilename, libgdal), Cstring, (Cstring, Cstring), pszName, pszOutputPath), false)
end

# typedef char const * ( * CPLFileFinder ) ( const char * , const char * )
"""Callback for [`CPLPushFileFinder`](@ref) """
const CPLFileFinder = Ptr{Cvoid}

function cplfindfile(pszClass, pszBasename)
    aftercare(ccall((:CPLFindFile, libgdal), Cstring, (Cstring, Cstring), pszClass, pszBasename), false)
end

function cpldefaultfindfile(pszClass, pszBasename)
    aftercare(ccall((:CPLDefaultFindFile, libgdal), Cstring, (Cstring, Cstring), pszClass, pszBasename), false)
end

function cplpushfilefinder(pfnFinder)
    aftercare(ccall((:CPLPushFileFinder, libgdal), Cvoid, (CPLFileFinder,), pfnFinder))
end

function cplpopfilefinder()
    aftercare(ccall((:CPLPopFileFinder, libgdal), CPLFileFinder, ()))
end

function cplpushfinderlocation(arg1)
    aftercare(ccall((:CPLPushFinderLocation, libgdal), Cvoid, (Cstring,), arg1))
end

function cplpopfinderlocation()
    aftercare(ccall((:CPLPopFinderLocation, libgdal), Cvoid, ()))
end

function cplfinderclean()
    aftercare(ccall((:CPLFinderClean, libgdal), Cvoid, ()))
end

"""Doxygen\\_Suppress """
const VSIStatBuf = stat

function cplstat(arg1, arg2)
    aftercare(ccall((:CPLStat, libgdal), Cint, (Cstring, Ptr{VSIStatBuf}), arg1, arg2))
end

"""
    CPLSharedFileInfo

Information on a shared file 

| Field       | Note                                         |
| :---------- | :------------------------------------------- |
| fp          | File pointer                                 |
| nRefCount   | Reference counter                            |
| bLarge      | Whether fp must be interpreted as VSIFILE*   |
| pszFilename | Filename                                     |
| pszAccess   | Access mode                                  |
"""
struct CPLSharedFileInfo
    fp::Ptr{Libc.FILE}
    nRefCount::Cint
    bLarge::Cint
    pszFilename::Cstring
    pszAccess::Cstring
end

function cplopenshared(arg1, arg2, arg3)
    aftercare(ccall((:CPLOpenShared, libgdal), Ptr{Libc.FILE}, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

function cplcloseshared(arg1)
    aftercare(ccall((:CPLCloseShared, libgdal), Cvoid, (Ptr{Libc.FILE},), arg1))
end

function cplgetsharedlist(arg1)
    aftercare(ccall((:CPLGetSharedList, libgdal), Ptr{CPLSharedFileInfo}, (Ptr{Cint},), arg1))
end

function cpldumpsharedlist(arg1)
    aftercare(ccall((:CPLDumpSharedList, libgdal), Cvoid, (Ptr{Libc.FILE},), arg1))
end

"""
    cplcleanupsharedfilemutex()

Doxygen\\_Suppress 
"""
function cplcleanupsharedfilemutex()
    aftercare(ccall((:CPLCleanupSharedFileMutex, libgdal), Cvoid, ()))
end

function cpldmstodec(is)
    aftercare(ccall((:CPLDMSToDec, libgdal), Cdouble, (Cstring,), is))
end

function cpldectodms(dfAngle, pszAxis, nPrecision)
    aftercare(ccall((:CPLDecToDMS, libgdal), Cstring, (Cdouble, Cstring, Cint), dfAngle, pszAxis, nPrecision), false)
end

function cplpackeddmstodec(arg1)
    aftercare(ccall((:CPLPackedDMSToDec, libgdal), Cdouble, (Cdouble,), arg1))
end

function cpldectopackeddms(dfDec)
    aftercare(ccall((:CPLDecToPackedDMS, libgdal), Cdouble, (Cdouble,), dfDec))
end

function cplstringtocomplex(pszString, pdfReal, pdfImag)
    aftercare(ccall((:CPLStringToComplex, libgdal), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}), pszString, pdfReal, pdfImag))
end

function cplunlinktree(arg1)
    aftercare(ccall((:CPLUnlinkTree, libgdal), Cint, (Cstring,), arg1))
end

function cplcopyfile(pszNewPath, pszOldPath)
    aftercare(ccall((:CPLCopyFile, libgdal), Cint, (Cstring, Cstring), pszNewPath, pszOldPath))
end

function cplcopytree(pszNewPath, pszOldPath)
    aftercare(ccall((:CPLCopyTree, libgdal), Cint, (Cstring, Cstring), pszNewPath, pszOldPath))
end

function cplmovefile(pszNewPath, pszOldPath)
    aftercare(ccall((:CPLMoveFile, libgdal), Cint, (Cstring, Cstring), pszNewPath, pszOldPath))
end

function cplsymlink(pszOldPath, pszNewPath, papszOptions)
    aftercare(ccall((:CPLSymlink, libgdal), Cint, (Cstring, Cstring, CSLConstList), pszOldPath, pszNewPath, papszOptions))
end

function cplcreatezip(pszZipFilename, papszOptions)
    aftercare(ccall((:CPLCreateZip, libgdal), Ptr{Cvoid}, (Cstring, Ptr{Cstring}), pszZipFilename, papszOptions))
end

"""
    CPLErr

Error category 
"""
@cenum CPLErr::UInt32 begin
    CE_None = 0
    CE_Debug = 1
    CE_Warning = 2
    CE_Failure = 3
    CE_Fatal = 4
end

function cplcreatefileinzip(hZip, pszFilename, papszOptions)
    aftercare(ccall((:CPLCreateFileInZip, libgdal), CPLErr, (Ptr{Cvoid}, Cstring, Ptr{Cstring}), hZip, pszFilename, papszOptions))
end

function cplwritefileinzip(hZip, pBuffer, nBufferSize)
    aftercare(ccall((:CPLWriteFileInZip, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}, Cint), hZip, pBuffer, nBufferSize))
end

function cplclosefileinzip(hZip)
    aftercare(ccall((:CPLCloseFileInZip, libgdal), CPLErr, (Ptr{Cvoid},), hZip))
end

function cplclosezip(hZip)
    aftercare(ccall((:CPLCloseZip, libgdal), CPLErr, (Ptr{Cvoid},), hZip))
end

function cplzlibdeflate(ptr, nBytes, nLevel, outptr, nOutAvailableBytes, pnOutBytes)
    aftercare(ccall((:CPLZLibDeflate, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Cint, Ptr{Cvoid}, Csize_t, Ptr{Csize_t}), ptr, nBytes, nLevel, outptr, nOutAvailableBytes, pnOutBytes))
end

function cplzlibinflate(ptr, nBytes, outptr, nOutAvailableBytes, pnOutBytes)
    aftercare(ccall((:CPLZLibInflate, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Ptr{Cvoid}, Csize_t, Ptr{Csize_t}), ptr, nBytes, outptr, nOutAvailableBytes, pnOutBytes))
end

function cplvalidatexml(pszXMLFilename, pszXSDFilename, papszOptions)
    aftercare(ccall((:CPLValidateXML, libgdal), Cint, (Cstring, Cstring, CSLConstList), pszXMLFilename, pszXSDFilename, papszOptions))
end

function cplsetlocale(category, locale)
    aftercare(ccall((:CPLsetlocale, libgdal), Cstring, (Cint, Cstring), category, locale), false)
end

"""
    cplcleanupsetlocalemutex()

Doxygen\\_Suppress 
"""
function cplcleanupsetlocalemutex()
    aftercare(ccall((:CPLCleanupSetlocaleMutex, libgdal), Cvoid, ()))
end

"""
    cplispoweroftwo(i)

[`CPLIsPowerOfTwo`](@ref)() 

### Parameters
* `i`: - tested number 

### Returns
[`TRUE`](@ref) if i is power of two otherwise return [`FALSE`](@ref)
"""
function cplispoweroftwo(i)
    aftercare(ccall((:CPLIsPowerOfTwo, libgdal), Cint, (Cuint,), i))
end

"""Error number """
const CPLErrorNum = Cint

function cplemergencyerror(arg1)
    ccall((:CPLEmergencyError, libgdal), Cvoid, (Cstring,), arg1)
end

function cplerrorreset()
    ccall((:CPLErrorReset, libgdal), Cvoid, ())
end

function cplgetlasterrorno()
    ccall((:CPLGetLastErrorNo, libgdal), CPLErrorNum, ())
end

function cplgetlasterrortype()
    ccall((:CPLGetLastErrorType, libgdal), CPLErr, ())
end

function cplgetlasterrormsg()
    unsafe_string(ccall((:CPLGetLastErrorMsg, libgdal), Cstring, ()))
end

"""Unsigned int32 type """
const GUInt32 = Cuint

function cplgeterrorcounter()
    ccall((:CPLGetErrorCounter, libgdal), GUInt32, ())
end

function cplgeterrorhandleruserdata()
    ccall((:CPLGetErrorHandlerUserData, libgdal), Ptr{Cvoid}, ())
end

function cplerrorsetstate(eErrClass, err_no, pszMsg)
    ccall((:CPLErrorSetState, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), eErrClass, err_no, pszMsg)
end

"""
    cplcleanuperrormutex()

Doxygen\\_Suppress 
"""
function cplcleanuperrormutex()
    ccall((:CPLCleanupErrorMutex, libgdal), Cvoid, ())
end

# typedef void ( CPL_STDCALL * CPLErrorHandler ) ( CPLErr , CPLErrorNum , const char * )
"""Callback for a custom error handler """
const CPLErrorHandler = Ptr{Cvoid}

function cplloggingerrorhandler(arg1, arg2, arg3)
    ccall((:CPLLoggingErrorHandler, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), arg1, arg2, arg3)
end

function cpldefaulterrorhandler(arg1, arg2, arg3)
    ccall((:CPLDefaultErrorHandler, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), arg1, arg2, arg3)
end

function cplquieterrorhandler(arg1, arg2, arg3)
    ccall((:CPLQuietErrorHandler, libgdal), Cvoid, (CPLErr, CPLErrorNum, Cstring), arg1, arg2, arg3)
end

function cplturnfailureintowarning(bOn)
    aftercare(ccall((:CPLTurnFailureIntoWarning, libgdal), Cvoid, (Cint,), bOn))
end

function cplseterrorhandler(arg1)
    ccall((:CPLSetErrorHandler, libgdal), CPLErrorHandler, (CPLErrorHandler,), arg1)
end

function cplseterrorhandlerex(arg1, arg2)
    ccall((:CPLSetErrorHandlerEx, libgdal), CPLErrorHandler, (CPLErrorHandler, Ptr{Cvoid}), arg1, arg2)
end

function cplpusherrorhandler(arg1)
    ccall((:CPLPushErrorHandler, libgdal), Cvoid, (CPLErrorHandler,), arg1)
end

function cplpusherrorhandlerex(arg1, arg2)
    ccall((:CPLPushErrorHandlerEx, libgdal), Cvoid, (CPLErrorHandler, Ptr{Cvoid}), arg1, arg2)
end

function cplsetcurrenterrorhandlercatchdebug(bCatchDebug)
    ccall((:CPLSetCurrentErrorHandlerCatchDebug, libgdal), Cvoid, (Cint,), bCatchDebug)
end

function cplpoperrorhandler()
    ccall((:CPLPopErrorHandler, libgdal), Cvoid, ())
end

function _cplassert(arg1, arg2, arg3)
    aftercare(ccall((:_CPLAssert, libgdal), Cvoid, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

"""
    CPLXMLNodeType

XML node type 

| Enumerator      | Note                        |
| :-------------- | :-------------------------- |
| CXT\\_Element   | Node is an element          |
| CXT\\_Text      | Node is a raw text value    |
| CXT\\_Attribute | Node is attribute           |
| CXT\\_Comment   | Node is an XML comment.     |
| CXT\\_Literal   | Node is a special literal   |
"""
@cenum CPLXMLNodeType::UInt32 begin
    CXT_Element = 0
    CXT_Text = 1
    CXT_Attribute = 2
    CXT_Comment = 3
    CXT_Literal = 4
end

"""
    CPLXMLNode

Document node structure.

This C structure is used to hold a single text fragment representing a component of the document when parsed. It should be allocated with the appropriate CPL function, and freed with [`CPLDestroyXMLNode`](@ref)(). The structure contents should not normally be altered by application code, but may be freely examined by application code.

Using the psChild and psNext pointers, a hierarchical tree structure for a document can be represented as a tree of [`CPLXMLNode`](@ref) structures.

| Field    | Note                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| :------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| eType    | Node type  One of CXT\\_Element, CXT\\_Text, CXT\\_Attribute, CXT\\_Comment, or CXT\\_Literal.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| pszValue | Node value  For CXT\\_Element this is the name of the element, without the angle brackets. Note there is a single CXT\\_Element even when the document contains a start and end element tag. The node represents the pair. All text or other elements between the start and end tag will appear as children nodes of this CXT\\_Element node.  For CXT\\_Attribute the pszValue is the attribute name. The value of the attribute will be a CXT\\_Text child.  For CXT\\_Text this is the text itself (value of an attribute, or a text fragment between an element start and end tags.  For CXT\\_Literal it is all the literal text. Currently this is just used for !DOCTYPE lines, and the value would be the entire line.  For CXT\\_Comment the value is all the literal text within the comment, but not including the comment start/end indicators ("<--" and "-->").  |
| psNext   | Next sibling.  Pointer to next sibling, that is the next node appearing after this one that has the same parent as this node. NULL if this node is the last child of the parent element.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| psChild  | Child node.  Pointer to first child node, if any. Only CXT\\_Element and CXT\\_Attribute nodes should have children. For CXT\\_Attribute it should be a single CXT\\_Text value node, while CXT\\_Element can have any kind of child. The full list of children for a node are identified by walking the psNext's starting with the psChild node.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
"""
struct CPLXMLNode
    eType::CPLXMLNodeType
    pszValue::Cstring
    psNext::Ptr{CPLXMLNode}
    psChild::Ptr{CPLXMLNode}
end

function cplparsexmlstring(arg1)
    aftercare(ccall((:CPLParseXMLString, libgdal), Ptr{CPLXMLNode}, (Cstring,), arg1))
end

function cpldestroyxmlnode(arg1)
    aftercare(ccall((:CPLDestroyXMLNode, libgdal), Cvoid, (Ptr{CPLXMLNode},), arg1))
end

function cplgetxmlnode(poRoot, pszPath)
    aftercare(ccall((:CPLGetXMLNode, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, Cstring), poRoot, pszPath))
end

function cplsearchxmlnode(poRoot, pszTarget)
    aftercare(ccall((:CPLSearchXMLNode, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, Cstring), poRoot, pszTarget))
end

function cplgetxmlvalue(poRoot, pszPath, pszDefault)
    aftercare(ccall((:CPLGetXMLValue, libgdal), Cstring, (Ptr{CPLXMLNode}, Cstring, Cstring), poRoot, pszPath, pszDefault), false)
end

function cplcreatexmlnode(poParent, eType, pszText)
    aftercare(ccall((:CPLCreateXMLNode, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, CPLXMLNodeType, Cstring), poParent, eType, pszText))
end

function cplserializexmltree(psNode)
    aftercare(ccall((:CPLSerializeXMLTree, libgdal), Cstring, (Ptr{CPLXMLNode},), psNode), false)
end

function cpladdxmlchild(psParent, psChild)
    aftercare(ccall((:CPLAddXMLChild, libgdal), Cvoid, (Ptr{CPLXMLNode}, Ptr{CPLXMLNode}), psParent, psChild))
end

function cplremovexmlchild(psParent, psChild)
    aftercare(ccall((:CPLRemoveXMLChild, libgdal), Cint, (Ptr{CPLXMLNode}, Ptr{CPLXMLNode}), psParent, psChild))
end

function cpladdxmlsibling(psOlderSibling, psNewSibling)
    aftercare(ccall((:CPLAddXMLSibling, libgdal), Cvoid, (Ptr{CPLXMLNode}, Ptr{CPLXMLNode}), psOlderSibling, psNewSibling))
end

function cplcreatexmlelementandvalue(psParent, pszName, pszValue)
    aftercare(ccall((:CPLCreateXMLElementAndValue, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode}, Cstring, Cstring), psParent, pszName, pszValue))
end

function cpladdxmlattributeandvalue(psParent, pszName, pszValue)
    aftercare(ccall((:CPLAddXMLAttributeAndValue, libgdal), Cvoid, (Ptr{CPLXMLNode}, Cstring, Cstring), psParent, pszName, pszValue))
end

function cplclonexmltree(psTree)
    aftercare(ccall((:CPLCloneXMLTree, libgdal), Ptr{CPLXMLNode}, (Ptr{CPLXMLNode},), psTree))
end

function cplsetxmlvalue(psRoot, pszPath, pszValue)
    aftercare(ccall((:CPLSetXMLValue, libgdal), Cint, (Ptr{CPLXMLNode}, Cstring, Cstring), psRoot, pszPath, pszValue))
end

function cplstripxmlnamespace(psRoot, pszNameSpace, bRecurse)
    aftercare(ccall((:CPLStripXMLNamespace, libgdal), Cvoid, (Ptr{CPLXMLNode}, Cstring, Cint), psRoot, pszNameSpace, bRecurse))
end

function cplcleanxmlelementname(arg1)
    aftercare(ccall((:CPLCleanXMLElementName, libgdal), Cvoid, (Cstring,), arg1))
end

function cplparsexmlfile(pszFilename)
    aftercare(ccall((:CPLParseXMLFile, libgdal), Ptr{CPLXMLNode}, (Cstring,), pszFilename))
end

function cplserializexmltreetofile(psTree, pszFilename)
    aftercare(ccall((:CPLSerializeXMLTreeToFile, libgdal), Cint, (Ptr{CPLXMLNode}, Cstring), psTree, pszFilename))
end

"""Int16 type """
const GInt16 = Cshort

"""Unsigned int16 type """
const GUInt16 = Cushort

"""Unsigned byte type """
const GByte = Cuchar

"""


Type for boolean values (alias to int) 
"""
const GBool = Cint

"""Signed 64 bit integer type """
const GInt64 = GIntBig

"""Unsigned 64 bit integer type """
const GUInt64 = GUIntBig

"""Integer type large enough to hold the difference between 2 addresses """
const GPtrDiff_t = GIntBig

# typedef int ( CPL_STDCALL * GDALProgressFunc ) ( double dfComplete , const char * pszMessage , void * pProgressArg )
const GDALProgressFunc = Ptr{Cvoid}

function gdaldummyprogress(arg1, arg2, arg3)
    aftercare(ccall((:GDALDummyProgress, libgdal), Cint, (Cdouble, Cstring, Ptr{Cvoid}), arg1, arg2, arg3))
end

function gdaltermprogress(arg1, arg2, arg3)
    aftercare(ccall((:GDALTermProgress, libgdal), Cint, (Cdouble, Cstring, Ptr{Cvoid}), arg1, arg2, arg3))
end

function gdalscaledprogress(arg1, arg2, arg3)
    aftercare(ccall((:GDALScaledProgress, libgdal), Cint, (Cdouble, Cstring, Ptr{Cvoid}), arg1, arg2, arg3))
end

function gdalcreatescaledprogress(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALCreateScaledProgress, libgdal), Ptr{Cvoid}, (Cdouble, Cdouble, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

function gdaldestroyscaledprogress(arg1)
    aftercare(ccall((:GDALDestroyScaledProgress, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

const CPLVirtualMem = Cvoid

# typedef void ( * CPLVirtualMemCachePageCbk ) ( CPLVirtualMem * ctxt , size_t nOffset , void * pPageToFill , size_t nToFill , void * pUserData )
"""
Callback triggered when a still unmapped page of virtual memory is accessed. The callback has the responsibility of filling the page with relevant values

### Parameters
* `ctxt`: virtual memory handle. 

* `nOffset`: offset of the page in the memory mapping. 

* `pPageToFill`: address of the page to fill. Note that the address might be a temporary location, and not at [`CPLVirtualMemGetAddr`](@ref)() + nOffset. 

* `nToFill`: number of bytes of the page. 

* `pUserData`: user data that was passed to [`CPLVirtualMemNew`](@ref)().
"""
const CPLVirtualMemCachePageCbk = Ptr{Cvoid}

# typedef void ( * CPLVirtualMemUnCachePageCbk ) ( CPLVirtualMem * ctxt , size_t nOffset , const void * pPageToBeEvicted , size_t nToBeEvicted , void * pUserData )
"""
Callback triggered when a dirty mapped page is going to be freed. (saturation of cache, or termination of the virtual memory mapping).

### Parameters
* `ctxt`: virtual memory handle. 

* `nOffset`: offset of the page in the memory mapping. 

* `pPageToBeEvicted`: address of the page that will be flushed. Note that the address might be a temporary location, and not at [`CPLVirtualMemGetAddr`](@ref)() + nOffset. 

* `nToBeEvicted`: number of bytes of the page. 

* `pUserData`: user data that was passed to [`CPLVirtualMemNew`](@ref)().
"""
const CPLVirtualMemUnCachePageCbk = Ptr{Cvoid}

# typedef void ( * CPLVirtualMemFreeUserData ) ( void * pUserData )
"""
Callback triggered when a virtual memory mapping is destroyed. 

### Parameters
* `pUserData`: user data that was passed to [`CPLVirtualMemNew`](@ref)().
"""
const CPLVirtualMemFreeUserData = Ptr{Cvoid}

"""
    CPLVirtualMemAccessMode

Access mode of a virtual memory mapping. 

| Enumerator                       | Note                                                                                                                         |
| :------------------------------- | :--------------------------------------------------------------------------------------------------------------------------- |
| VIRTUALMEM\\_READONLY            | The mapping is meant at being read-only, but writes will not be prevented. Note that any content written will be lost.       |
| VIRTUALMEM\\_READONLY\\_ENFORCED | The mapping is meant at being read-only, and this will be enforced through the operating system page protection mechanism.   |
| VIRTUALMEM\\_READWRITE           | The mapping is meant at being read-write, and modified pages can be saved thanks to the pfnUnCachePage callback              |
"""
@cenum CPLVirtualMemAccessMode::UInt32 begin
    VIRTUALMEM_READONLY = 0
    VIRTUALMEM_READONLY_ENFORCED = 1
    VIRTUALMEM_READWRITE = 2
end

"""
    cplgetpagesize()

Return the size of a page of virtual memory.

\\since GDAL 1.11

### Returns
the page size.
"""
function cplgetpagesize()
    aftercare(ccall((:CPLGetPageSize, libgdal), Csize_t, ()))
end

"""
    cplvirtualmemnew(nSize, nCacheSize, nPageSizeHint, bSingleThreadUsage, eAccessMode, pfnCachePage, pfnUnCachePage, pfnFreeUserData, pCbkUserData)

Create a new virtual memory mapping.

This will reserve an area of virtual memory of size nSize, whose size might be potentially much larger than the physical memory available. Initially, no physical memory will be allocated. As soon as memory pages will be accessed, they will be allocated transparently and filled with the pfnCachePage callback. When the allowed cache size is reached, the least recently used pages will be unallocated.

On Linux AMD64 platforms, the maximum value for nSize is 128 TB. On Linux x86 platforms, the maximum value for nSize is 2 GB.

Only supported on Linux for now.

Note that on Linux, this function will install a SIGSEGV handler. The original handler will be restored by [`CPLVirtualMemManagerTerminate`](@ref)().

\\since GDAL 1.11

### Parameters
* `nSize`: size in bytes of the virtual memory mapping. 

* `nCacheSize`: size in bytes of the maximum memory that will be really allocated (must ideally fit into RAM). 

* `nPageSizeHint`: hint for the page size. Must be a multiple of the system page size, returned by [`CPLGetPageSize`](@ref)(). Minimum value is generally 4096. Might be set to 0 to let the function determine a default page size. 

* `bSingleThreadUsage`: set to [`TRUE`](@ref) if there will be no concurrent threads that will access the virtual memory mapping. This can optimize performance a bit. 

* `eAccessMode`: permission to use for the virtual memory mapping. 

* `pfnCachePage`: callback triggered when a still unmapped page of virtual memory is accessed. The callback has the responsibility of filling the page with relevant values. 

* `pfnUnCachePage`: callback triggered when a dirty mapped page is going to be freed (saturation of cache, or termination of the virtual memory mapping). Might be NULL. 

* `pfnFreeUserData`: callback that can be used to free pCbkUserData. Might be NULL 

* `pCbkUserData`: user data passed to pfnCachePage and pfnUnCachePage.

### Returns
a virtual memory object that must be freed by [`CPLVirtualMemFree`](@ref)(), or NULL in case of failure.
"""
function cplvirtualmemnew(nSize, nCacheSize, nPageSizeHint, bSingleThreadUsage, eAccessMode, pfnCachePage, pfnUnCachePage, pfnFreeUserData, pCbkUserData)
    aftercare(ccall((:CPLVirtualMemNew, libgdal), Ptr{CPLVirtualMem}, (Csize_t, Csize_t, Csize_t, Cint, CPLVirtualMemAccessMode, CPLVirtualMemCachePageCbk, CPLVirtualMemUnCachePageCbk, CPLVirtualMemFreeUserData, Ptr{Cvoid}), nSize, nCacheSize, nPageSizeHint, bSingleThreadUsage, eAccessMode, pfnCachePage, pfnUnCachePage, pfnFreeUserData, pCbkUserData))
end

"""
    cplisvirtualmemfilemapavailable()

Return if virtual memory mapping of a file is available.

\\since GDAL 1.11

### Returns
[`TRUE`](@ref) if virtual memory mapping of a file is available. 
"""
function cplisvirtualmemfilemapavailable()
    aftercare(ccall((:CPLIsVirtualMemFileMapAvailable, libgdal), Cint, ()))
end

"""Type for a file offset """
const vsi_l_offset = GUIntBig

"""
    cplvirtualmemfilemapnew(fp, nOffset, nLength, eAccessMode, pfnFreeUserData, pCbkUserData)

Create a new virtual memory mapping from a file.

The file must be a "real" file recognized by the operating system, and not a VSI extended virtual file.

In VIRTUALMEM\\_READWRITE mode, updates to the memory mapping will be written in the file.

On Linux AMD64 platforms, the maximum value for nLength is 128 TB. On Linux x86 platforms, the maximum value for nLength is 2 GB.

Supported on Linux only in GDAL <= 2.0, and all POSIX systems supporting mmap() in GDAL >= 2.1

\\since GDAL 1.11

### Parameters
* `fp`: Virtual file handle. 

* `nOffset`: Offset in the file to start the mapping from. 

* `nLength`: Length of the portion of the file to map into memory. 

* `eAccessMode`: Permission to use for the virtual memory mapping. This must be consistent with how the file has been opened. 

* `pfnFreeUserData`: callback that is called when the object is destroyed. 

* `pCbkUserData`: user data passed to pfnFreeUserData. 

### Returns
a virtual memory object that must be freed by [`CPLVirtualMemFree`](@ref)(), or NULL in case of failure.
"""
function cplvirtualmemfilemapnew(fp, nOffset, nLength, eAccessMode, pfnFreeUserData, pCbkUserData)
    aftercare(ccall((:CPLVirtualMemFileMapNew, libgdal), Ptr{CPLVirtualMem}, (Ptr{VSILFILE}, vsi_l_offset, vsi_l_offset, CPLVirtualMemAccessMode, CPLVirtualMemFreeUserData, Ptr{Cvoid}), fp, nOffset, nLength, eAccessMode, pfnFreeUserData, pCbkUserData))
end

"""
    cplvirtualmemderivednew(pVMemBase, nOffset, nSize, pfnFreeUserData, pCbkUserData)

Create a new virtual memory mapping derived from an other virtual memory mapping.

This may be useful in case of creating mapping for pixel interleaved data.

The new mapping takes a reference on the base mapping.

\\since GDAL 1.11

### Parameters
* `pVMemBase`: Base virtual memory mapping 

* `nOffset`: Offset in the base virtual memory mapping from which to start the new mapping. 

* `nSize`: Size of the base virtual memory mapping to expose in the the new mapping. 

* `pfnFreeUserData`: callback that is called when the object is destroyed. 

* `pCbkUserData`: user data passed to pfnFreeUserData. 

### Returns
a virtual memory object that must be freed by [`CPLVirtualMemFree`](@ref)(), or NULL in case of failure.
"""
function cplvirtualmemderivednew(pVMemBase, nOffset, nSize, pfnFreeUserData, pCbkUserData)
    aftercare(ccall((:CPLVirtualMemDerivedNew, libgdal), Ptr{CPLVirtualMem}, (Ptr{CPLVirtualMem}, vsi_l_offset, vsi_l_offset, CPLVirtualMemFreeUserData, Ptr{Cvoid}), pVMemBase, nOffset, nSize, pfnFreeUserData, pCbkUserData))
end

"""
    cplvirtualmemfree(ctxt)

Free a virtual memory mapping.

The pointer returned by [`CPLVirtualMemGetAddr`](@ref)() will no longer be valid. If the virtual memory mapping was created with read/write permissions and that they are dirty (i.e. modified) pages, they will be flushed through the pfnUnCachePage callback before being freed.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)().
"""
function cplvirtualmemfree(ctxt)
    aftercare(ccall((:CPLVirtualMemFree, libgdal), Cvoid, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemgetaddr(ctxt)

Return the pointer to the start of a virtual memory mapping.

The bytes in the range [p:p+[`CPLVirtualMemGetSize`](@ref)()-1] where p is the pointer returned by this function will be valid, until [`CPLVirtualMemFree`](@ref)() is called.

Note that if a range of bytes used as an argument of a system call (such as read() or write()) contains pages that have not been "realized", the system call will fail with EFAULT. [`CPLVirtualMemPin`](@ref)() can be used to work around this issue.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
the pointer to the start of a virtual memory mapping.
"""
function cplvirtualmemgetaddr(ctxt)
    aftercare(ccall((:CPLVirtualMemGetAddr, libgdal), Ptr{Cvoid}, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemgetsize(ctxt)

Return the size of the virtual memory mapping.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
the size of the virtual memory mapping.
"""
function cplvirtualmemgetsize(ctxt)
    aftercare(ccall((:CPLVirtualMemGetSize, libgdal), Csize_t, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemisfilemapping(ctxt)

Return if the virtual memory mapping is a direct file mapping.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
[`TRUE`](@ref) if the virtual memory mapping is a direct file mapping.
"""
function cplvirtualmemisfilemapping(ctxt)
    aftercare(ccall((:CPLVirtualMemIsFileMapping, libgdal), Cint, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemgetaccessmode(ctxt)

Return the access mode of the virtual memory mapping.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
the access mode of the virtual memory mapping.
"""
function cplvirtualmemgetaccessmode(ctxt)
    aftercare(ccall((:CPLVirtualMemGetAccessMode, libgdal), CPLVirtualMemAccessMode, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemgetpagesize(ctxt)

Return the page size associated to a virtual memory mapping.

The value returned will be at least [`CPLGetPageSize`](@ref)(), but potentially larger.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
the page size
"""
function cplvirtualmemgetpagesize(ctxt)
    aftercare(ccall((:CPLVirtualMemGetPageSize, libgdal), Csize_t, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemisaccessthreadsafe(ctxt)

Return [`TRUE`](@ref) if this memory mapping can be accessed safely from concurrent threads.

The situation that can cause problems is when several threads try to access a page of the mapping that is not yet mapped.

The return value of this function depends on whether bSingleThreadUsage has been set of not in [`CPLVirtualMemNew`](@ref)() and/or the implementation.

On Linux, this will always return [`TRUE`](@ref) if bSingleThreadUsage = [`FALSE`](@ref).

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

### Returns
[`TRUE`](@ref) if this memory mapping can be accessed safely from concurrent threads.
"""
function cplvirtualmemisaccessthreadsafe(ctxt)
    aftercare(ccall((:CPLVirtualMemIsAccessThreadSafe, libgdal), Cint, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemdeclarethread(ctxt)

Declare that a thread will access a virtual memory mapping.

This function must be called by a thread that wants to access the content of a virtual memory mapping, except if the virtual memory mapping has been created with bSingleThreadUsage = [`TRUE`](@ref).

This function must be paired with [`CPLVirtualMemUnDeclareThread`](@ref)().

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)().
"""
function cplvirtualmemdeclarethread(ctxt)
    aftercare(ccall((:CPLVirtualMemDeclareThread, libgdal), Cvoid, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmemundeclarethread(ctxt)

Declare that a thread will stop accessing a virtual memory mapping.

This function must be called by a thread that will no longer access the content of a virtual memory mapping, except if the virtual memory mapping has been created with bSingleThreadUsage = [`TRUE`](@ref).

This function must be paired with [`CPLVirtualMemDeclareThread`](@ref)().

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)().
"""
function cplvirtualmemundeclarethread(ctxt)
    aftercare(ccall((:CPLVirtualMemUnDeclareThread, libgdal), Cvoid, (Ptr{CPLVirtualMem},), ctxt))
end

"""
    cplvirtualmempin(ctxt, pAddr, nSize, bWriteOp)

Make sure that a region of virtual memory will be realized.

Calling this function is not required, but might be useful when debugging a process with tools like gdb or valgrind that do not naturally like segmentation fault signals.

It is also needed when wanting to provide part of virtual memory mapping to a system call such as read() or write(). If read() or write() is called on a memory region not yet realized, the call will fail with EFAULT.

\\since GDAL 1.11

### Parameters
* `ctxt`: context returned by [`CPLVirtualMemNew`](@ref)(). 

* `pAddr`: the memory region to pin. 

* `nSize`: the size of the memory region. 

* `bWriteOp`: set to [`TRUE`](@ref) if the memory are will be accessed in write mode.
"""
function cplvirtualmempin(ctxt, pAddr, nSize, bWriteOp)
    aftercare(ccall((:CPLVirtualMemPin, libgdal), Cvoid, (Ptr{CPLVirtualMem}, Ptr{Cvoid}, Csize_t, Cint), ctxt, pAddr, nSize, bWriteOp))
end

"""
    cplvirtualmemmanagerterminate()

Cleanup any resource and handlers related to virtual memory.

This function must be called after the last [`CPLVirtualMem`](@ref) object has been freed.

\\since GDAL 2.0
"""
function cplvirtualmemmanagerterminate()
    aftercare(ccall((:CPLVirtualMemManagerTerminate, libgdal), Cvoid, ()))
end

"""
    vsifopen(arg1, arg2)

Doxygen\\_Suppress 
"""
function vsifopen(arg1, arg2)
    aftercare(ccall((:VSIFOpen, libgdal), Ptr{Libc.FILE}, (Cstring, Cstring), arg1, arg2))
end

function vsifclose(arg1)
    aftercare(ccall((:VSIFClose, libgdal), Cint, (Ptr{Libc.FILE},), arg1))
end

function vsifseek(arg1, arg2, arg3)
    aftercare(ccall((:VSIFSeek, libgdal), Cint, (Ptr{Libc.FILE}, Clong, Cint), arg1, arg2, arg3))
end

function vsiftell(arg1)
    aftercare(ccall((:VSIFTell, libgdal), Clong, (Ptr{Libc.FILE},), arg1))
end

function vsirewind(arg1)
    aftercare(ccall((:VSIRewind, libgdal), Cvoid, (Ptr{Libc.FILE},), arg1))
end

function vsifflush(arg1)
    aftercare(ccall((:VSIFFlush, libgdal), Cvoid, (Ptr{Libc.FILE},), arg1))
end

function vsifread(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VSIFRead, libgdal), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Libc.FILE}), arg1, arg2, arg3, arg4))
end

function vsifwrite(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VSIFWrite, libgdal), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{Libc.FILE}), arg1, arg2, arg3, arg4))
end

function vsifgets(arg1, arg2, arg3)
    aftercare(ccall((:VSIFGets, libgdal), Cstring, (Cstring, Cint, Ptr{Libc.FILE}), arg1, arg2, arg3), false)
end

function vsifputs(arg1, arg2)
    aftercare(ccall((:VSIFPuts, libgdal), Cint, (Cstring, Ptr{Libc.FILE}), arg1, arg2))
end

function vsifgetc(arg1)
    aftercare(ccall((:VSIFGetc, libgdal), Cint, (Ptr{Libc.FILE},), arg1))
end

function vsifputc(arg1, arg2)
    aftercare(ccall((:VSIFPutc, libgdal), Cint, (Cint, Ptr{Libc.FILE}), arg1, arg2))
end

function vsiungetc(arg1, arg2)
    aftercare(ccall((:VSIUngetc, libgdal), Cint, (Cint, Ptr{Libc.FILE}), arg1, arg2))
end

function vsifeof(arg1)
    aftercare(ccall((:VSIFEof, libgdal), Cint, (Ptr{Libc.FILE},), arg1))
end

function vsistat(arg1, arg2)
    aftercare(ccall((:VSIStat, libgdal), Cint, (Cstring, Ptr{VSIStatBuf}), arg1, arg2))
end

function vsifopenl(arg1, arg2)
    aftercare(ccall((:VSIFOpenL, libgdal), Ptr{VSILFILE}, (Cstring, Cstring), arg1, arg2))
end

function vsifopenexl(arg1, arg2, arg3)
    aftercare(ccall((:VSIFOpenExL, libgdal), Ptr{VSILFILE}, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

function vsifclosel(arg1)
    aftercare(ccall((:VSIFCloseL, libgdal), Cint, (Ptr{VSILFILE},), arg1))
end

function vsifseekl(arg1, arg2, arg3)
    aftercare(ccall((:VSIFSeekL, libgdal), Cint, (Ptr{VSILFILE}, vsi_l_offset, Cint), arg1, arg2, arg3))
end

function vsiftelll(arg1)
    aftercare(ccall((:VSIFTellL, libgdal), vsi_l_offset, (Ptr{VSILFILE},), arg1))
end

function vsirewindl(arg1)
    aftercare(ccall((:VSIRewindL, libgdal), Cvoid, (Ptr{VSILFILE},), arg1))
end

function vsifreadl(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VSIFReadL, libgdal), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{VSILFILE}), arg1, arg2, arg3, arg4))
end

function vsifreadmultirangel(nRanges, ppData, panOffsets, panSizes, arg5)
    aftercare(ccall((:VSIFReadMultiRangeL, libgdal), Cint, (Cint, Ptr{Ptr{Cvoid}}, Ptr{vsi_l_offset}, Ptr{Csize_t}, Ptr{VSILFILE}), nRanges, ppData, panOffsets, panSizes, arg5))
end

function vsifwritel(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VSIFWriteL, libgdal), Csize_t, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{VSILFILE}), arg1, arg2, arg3, arg4))
end

function vsifeofl(arg1)
    aftercare(ccall((:VSIFEofL, libgdal), Cint, (Ptr{VSILFILE},), arg1))
end

function vsiftruncatel(arg1, arg2)
    aftercare(ccall((:VSIFTruncateL, libgdal), Cint, (Ptr{VSILFILE}, vsi_l_offset), arg1, arg2))
end

function vsifflushl(arg1)
    aftercare(ccall((:VSIFFlushL, libgdal), Cint, (Ptr{VSILFILE},), arg1))
end

function vsifputcl(arg1, arg2)
    aftercare(ccall((:VSIFPutcL, libgdal), Cint, (Cint, Ptr{VSILFILE}), arg1, arg2))
end

"""
    VSIRangeStatus

Range status 

| Enumerator                     | Note           |
| :----------------------------- | :------------- |
| VSI\\_RANGE\\_STATUS\\_UNKNOWN | Unknown        |
| VSI\\_RANGE\\_STATUS\\_DATA    | Data present   |
| VSI\\_RANGE\\_STATUS\\_HOLE    | Hole           |
"""
@cenum VSIRangeStatus::UInt32 begin
    VSI_RANGE_STATUS_UNKNOWN = 0
    VSI_RANGE_STATUS_DATA = 1
    VSI_RANGE_STATUS_HOLE = 2
end

function vsifgetrangestatusl(fp, nStart, nLength)
    aftercare(ccall((:VSIFGetRangeStatusL, libgdal), VSIRangeStatus, (Ptr{VSILFILE}, vsi_l_offset, vsi_l_offset), fp, nStart, nLength))
end

function vsiingestfile(fp, pszFilename, ppabyRet, pnSize, nMaxSize)
    aftercare(ccall((:VSIIngestFile, libgdal), Cint, (Ptr{VSILFILE}, Cstring, Ptr{Ptr{GByte}}, Ptr{vsi_l_offset}, GIntBig), fp, pszFilename, ppabyRet, pnSize, nMaxSize))
end

function vsioverwritefile(fpTarget, pszSourceFilename)
    aftercare(ccall((:VSIOverwriteFile, libgdal), Cint, (Ptr{VSILFILE}, Cstring), fpTarget, pszSourceFilename))
end

"""Type for [`VSIStatL`](@ref)() """
const VSIStatBufL = _stat64

function vsistatl(arg1, arg2)
    aftercare(ccall((:VSIStatL, libgdal), Cint, (Cstring, Ptr{VSIStatBufL}), arg1, arg2))
end

function vsistatexl(pszFilename, psStatBuf, nFlags)
    aftercare(ccall((:VSIStatExL, libgdal), Cint, (Cstring, Ptr{VSIStatBufL}, Cint), pszFilename, psStatBuf, nFlags))
end

function vsiiscasesensitivefs(pszFilename)
    aftercare(ccall((:VSIIsCaseSensitiveFS, libgdal), Cint, (Cstring,), pszFilename))
end

function vsisupportssparsefiles(pszPath)
    aftercare(ccall((:VSISupportsSparseFiles, libgdal), Cint, (Cstring,), pszPath))
end

function vsihasoptimizedreadmultirange(pszPath)
    aftercare(ccall((:VSIHasOptimizedReadMultiRange, libgdal), Cint, (Cstring,), pszPath))
end

function vsigetactualurl(pszFilename)
    aftercare(ccall((:VSIGetActualURL, libgdal), Cstring, (Cstring,), pszFilename), false)
end

function vsigetsignedurl(pszFilename, papszOptions)
    aftercare(ccall((:VSIGetSignedURL, libgdal), Cstring, (Cstring, CSLConstList), pszFilename, papszOptions), false)
end

function vsigetfilesystemoptions(pszFilename)
    aftercare(ccall((:VSIGetFileSystemOptions, libgdal), Cstring, (Cstring,), pszFilename), false)
end

function vsigetfilesystemsprefixes()
    aftercare(ccall((:VSIGetFileSystemsPrefixes, libgdal), Ptr{Cstring}, ()))
end

function vsifgetnativefiledescriptorl(arg1)
    aftercare(ccall((:VSIFGetNativeFileDescriptorL, libgdal), Ptr{Cvoid}, (Ptr{VSILFILE},), arg1))
end

function vsigetfilemetadata(pszFilename, pszDomain, papszOptions)
    aftercare(ccall((:VSIGetFileMetadata, libgdal), Ptr{Cstring}, (Cstring, Cstring, CSLConstList), pszFilename, pszDomain, papszOptions))
end

function vsisetfilemetadata(pszFilename, papszMetadata, pszDomain, papszOptions)
    aftercare(ccall((:VSISetFileMetadata, libgdal), Cint, (Cstring, CSLConstList, Cstring, CSLConstList), pszFilename, papszMetadata, pszDomain, papszOptions))
end

function vsicalloc(arg1, arg2)
    aftercare(ccall((:VSICalloc, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), arg1, arg2))
end

function vsimalloc(arg1)
    aftercare(ccall((:VSIMalloc, libgdal), Ptr{Cvoid}, (Csize_t,), arg1))
end

function vsifree(arg1)
    aftercare(ccall((:VSIFree, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

function vsirealloc(arg1, arg2)
    aftercare(ccall((:VSIRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t), arg1, arg2))
end

function vsistrdup(arg1)
    aftercare(ccall((:VSIStrdup, libgdal), Cstring, (Cstring,), arg1), false)
end

function vsimallocaligned(nAlignment, nSize)
    aftercare(ccall((:VSIMallocAligned, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), nAlignment, nSize))
end

function vsimallocalignedauto(nSize)
    aftercare(ccall((:VSIMallocAlignedAuto, libgdal), Ptr{Cvoid}, (Csize_t,), nSize))
end

function vsifreealigned(ptr)
    aftercare(ccall((:VSIFreeAligned, libgdal), Cvoid, (Ptr{Cvoid},), ptr))
end

function vsimallocalignedautoverbose(nSize, pszFile, nLine)
    aftercare(ccall((:VSIMallocAlignedAutoVerbose, libgdal), Ptr{Cvoid}, (Csize_t, Cstring, Cint), nSize, pszFile, nLine))
end

"""
    vsimalloc2(nSize1, nSize2)

[`VSIMalloc2`](@ref) allocates (nSize1 * nSize2) bytes. In case of overflow of the multiplication, or if memory allocation fails, a NULL pointer is returned and a CE\\_Failure error is raised with [`CPLError`](@ref)(). If nSize1 == 0 || nSize2 == 0, a NULL pointer will also be returned. [`CPLFree`](@ref)() or [`VSIFree`](@ref)() can be used to free memory allocated by this function.
"""
function vsimalloc2(nSize1, nSize2)
    aftercare(ccall((:VSIMalloc2, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), nSize1, nSize2))
end

"""
    vsimalloc3(nSize1, nSize2, nSize3)

[`VSIMalloc3`](@ref) allocates (nSize1 * nSize2 * nSize3) bytes. In case of overflow of the multiplication, or if memory allocation fails, a NULL pointer is returned and a CE\\_Failure error is raised with [`CPLError`](@ref)(). If nSize1 == 0 || nSize2 == 0 || nSize3 == 0, a NULL pointer will also be returned. [`CPLFree`](@ref)() or [`VSIFree`](@ref)() can be used to free memory allocated by this function.
"""
function vsimalloc3(nSize1, nSize2, nSize3)
    aftercare(ccall((:VSIMalloc3, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t, Csize_t), nSize1, nSize2, nSize3))
end

"""
    vsimallocverbose(nSize, pszFile, nLine)

[`VSIMallocVerbose`](@ref) 
"""
function vsimallocverbose(nSize, pszFile, nLine)
    aftercare(ccall((:VSIMallocVerbose, libgdal), Ptr{Cvoid}, (Csize_t, Cstring, Cint), nSize, pszFile, nLine))
end

"""
    vsimalloc2verbose(nSize1, nSize2, pszFile, nLine)

[`VSIMalloc2Verbose`](@ref) 
"""
function vsimalloc2verbose(nSize1, nSize2, pszFile, nLine)
    aftercare(ccall((:VSIMalloc2Verbose, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t, Cstring, Cint), nSize1, nSize2, pszFile, nLine))
end

"""
    vsimalloc3verbose(nSize1, nSize2, nSize3, pszFile, nLine)

[`VSIMalloc3Verbose`](@ref) 
"""
function vsimalloc3verbose(nSize1, nSize2, nSize3, pszFile, nLine)
    aftercare(ccall((:VSIMalloc3Verbose, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t, Csize_t, Cstring, Cint), nSize1, nSize2, nSize3, pszFile, nLine))
end

"""
    vsicallocverbose(nCount, nSize, pszFile, nLine)

[`VSICallocVerbose`](@ref) 
"""
function vsicallocverbose(nCount, nSize, pszFile, nLine)
    aftercare(ccall((:VSICallocVerbose, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t, Cstring, Cint), nCount, nSize, pszFile, nLine))
end

"""
    vsireallocverbose(pOldPtr, nNewSize, pszFile, nLine)

[`VSIReallocVerbose`](@ref) 
"""
function vsireallocverbose(pOldPtr, nNewSize, pszFile, nLine)
    aftercare(ccall((:VSIReallocVerbose, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Cstring, Cint), pOldPtr, nNewSize, pszFile, nLine))
end

"""
    vsistrdupverbose(pszStr, pszFile, nLine)

[`VSIStrdupVerbose`](@ref) 
"""
function vsistrdupverbose(pszStr, pszFile, nLine)
    aftercare(ccall((:VSIStrdupVerbose, libgdal), Cstring, (Cstring, Cstring, Cint), pszStr, pszFile, nLine), false)
end

function cplgetphysicalram()
    aftercare(ccall((:CPLGetPhysicalRAM, libgdal), GIntBig, ()))
end

function cplgetusablephysicalram()
    aftercare(ccall((:CPLGetUsablePhysicalRAM, libgdal), GIntBig, ()))
end

function vsireaddir(arg1)
    aftercare(ccall((:VSIReadDir, libgdal), Ptr{Cstring}, (Cstring,), arg1))
end

function vsireaddirrecursive(pszPath)
    aftercare(ccall((:VSIReadDirRecursive, libgdal), Ptr{Cstring}, (Cstring,), pszPath))
end

function vsireaddirex(pszPath, nMaxFiles)
    aftercare(ccall((:VSIReadDirEx, libgdal), Ptr{Cstring}, (Cstring, Cint), pszPath, nMaxFiles))
end

function vsisiblingfiles(pszPath)
    aftercare(ccall((:VSISiblingFiles, libgdal), Ptr{Cstring}, (Cstring,), pszPath))
end

const VSIDIR = Cvoid

function vsiopendir(pszPath, nRecurseDepth, papszOptions)
    aftercare(ccall((:VSIOpenDir, libgdal), Ptr{VSIDIR}, (Cstring, Cint, Ptr{Cstring}), pszPath, nRecurseDepth, papszOptions))
end

"""
    VSIDIREntry

Directory entry. 

| Field       | Note                                                           |
| :---------- | :------------------------------------------------------------- |
| pszName     | Filename                                                       |
| nMode       | File mode. See [`VSI_ISREG`](@ref)() / [`VSI_ISDIR`](@ref)()   |
| nSize       | File size                                                      |
| nMTime      | Last modification time (seconds since 1970/01/01)              |
| bModeKnown  | Whether nMode is known: 0 = unknown, 1 = known.                |
| bSizeKnown  | Whether nSize is known: 0 = unknown, 1 = known.                |
| bMTimeKnown | Whether nMTime is known: 0 = unknown, 1 = known.               |
| papszExtra  | NULL-terminated list of extra properties.                      |
"""
struct VSIDIREntry
    pszName::Cstring
    nMode::Cint
    nSize::vsi_l_offset
    nMTime::GIntBig
    bModeKnown::Cchar
    bSizeKnown::Cchar
    bMTimeKnown::Cchar
    papszExtra::Ptr{Cstring}
end

function vsigetnextdirentry(dir)
    aftercare(ccall((:VSIGetNextDirEntry, libgdal), Ptr{VSIDIREntry}, (Ptr{VSIDIR},), dir))
end

function vsiclosedir(dir)
    aftercare(ccall((:VSICloseDir, libgdal), Cvoid, (Ptr{VSIDIR},), dir))
end

function vsimkdir(pszPathname, mode)
    aftercare(ccall((:VSIMkdir, libgdal), Cint, (Cstring, Clong), pszPathname, mode))
end

function vsimkdirrecursive(pszPathname, mode)
    aftercare(ccall((:VSIMkdirRecursive, libgdal), Cint, (Cstring, Clong), pszPathname, mode))
end

function vsirmdir(pszDirname)
    aftercare(ccall((:VSIRmdir, libgdal), Cint, (Cstring,), pszDirname))
end

function vsirmdirrecursive(pszDirname)
    aftercare(ccall((:VSIRmdirRecursive, libgdal), Cint, (Cstring,), pszDirname))
end

function vsiunlink(pszFilename)
    aftercare(ccall((:VSIUnlink, libgdal), Cint, (Cstring,), pszFilename))
end

function vsiunlinkbatch(papszFiles)
    aftercare(ccall((:VSIUnlinkBatch, libgdal), Ptr{Cint}, (CSLConstList,), papszFiles))
end

function vsirename(oldpath, newpath)
    aftercare(ccall((:VSIRename, libgdal), Cint, (Cstring, Cstring), oldpath, newpath))
end

function vsisync(pszSource, pszTarget, papszOptions, pProgressFunc, pProgressData, ppapszOutputs)
    aftercare(ccall((:VSISync, libgdal), Cint, (Cstring, Cstring, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}, Ptr{Ptr{Cstring}}), pszSource, pszTarget, papszOptions, pProgressFunc, pProgressData, ppapszOutputs))
end

function vsistrerror(arg1)
    aftercare(ccall((:VSIStrerror, libgdal), Cstring, (Cint,), arg1), false)
end

function vsigetdiskfreespace(pszDirname)
    aftercare(ccall((:VSIGetDiskFreeSpace, libgdal), GIntBig, (Cstring,), pszDirname))
end

function vsinetworkstatsreset()
    aftercare(ccall((:VSINetworkStatsReset, libgdal), Cvoid, ()))
end

function vsinetworkstatsgetasserializedjson(papszOptions)
    aftercare(ccall((:VSINetworkStatsGetAsSerializedJSON, libgdal), Cstring, (Ptr{Cstring},), papszOptions), false)
end

function vsiinstallmemfilehandler()
    aftercare(ccall((:VSIInstallMemFileHandler, libgdal), Cvoid, ()))
end

"""
    vsiinstalllargefilehandler()

Doxygen\\_Suppress 
"""
function vsiinstalllargefilehandler()
    aftercare(ccall((:VSIInstallLargeFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallsubfilehandler()
    aftercare(ccall((:VSIInstallSubFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallcurlfilehandler()
    aftercare(ccall((:VSIInstallCurlFileHandler, libgdal), Cvoid, ()))
end

function vsicurlclearcache()
    aftercare(ccall((:VSICurlClearCache, libgdal), Cvoid, ()))
end

function vsicurlpartialclearcache(pszFilenamePrefix)
    aftercare(ccall((:VSICurlPartialClearCache, libgdal), Cvoid, (Cstring,), pszFilenamePrefix))
end

function vsiinstallcurlstreamingfilehandler()
    aftercare(ccall((:VSIInstallCurlStreamingFileHandler, libgdal), Cvoid, ()))
end

function vsiinstalls3filehandler()
    aftercare(ccall((:VSIInstallS3FileHandler, libgdal), Cvoid, ()))
end

function vsiinstalls3streamingfilehandler()
    aftercare(ccall((:VSIInstallS3StreamingFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallgsfilehandler()
    aftercare(ccall((:VSIInstallGSFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallgsstreamingfilehandler()
    aftercare(ccall((:VSIInstallGSStreamingFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallazurefilehandler()
    aftercare(ccall((:VSIInstallAzureFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallazurestreamingfilehandler()
    aftercare(ccall((:VSIInstallAzureStreamingFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallossfilehandler()
    aftercare(ccall((:VSIInstallOSSFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallossstreamingfilehandler()
    aftercare(ccall((:VSIInstallOSSStreamingFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallswiftfilehandler()
    aftercare(ccall((:VSIInstallSwiftFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallswiftstreamingfilehandler()
    aftercare(ccall((:VSIInstallSwiftStreamingFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallgzipfilehandler()
    aftercare(ccall((:VSIInstallGZipFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallzipfilehandler()
    aftercare(ccall((:VSIInstallZipFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallstdinhandler()
    aftercare(ccall((:VSIInstallStdinHandler, libgdal), Cvoid, ()))
end

function vsiinstallhdfshandler()
    aftercare(ccall((:VSIInstallHdfsHandler, libgdal), Cvoid, ()))
end

function vsiinstallwebhdfshandler()
    aftercare(ccall((:VSIInstallWebHdfsHandler, libgdal), Cvoid, ()))
end

function vsiinstallstdouthandler()
    aftercare(ccall((:VSIInstallStdoutHandler, libgdal), Cvoid, ()))
end

function vsiinstallsparsefilehandler()
    aftercare(ccall((:VSIInstallSparseFileHandler, libgdal), Cvoid, ()))
end

function vsiinstalltarfilehandler()
    aftercare(ccall((:VSIInstallTarFileHandler, libgdal), Cvoid, ()))
end

function vsiinstallcryptfilehandler()
    aftercare(ccall((:VSIInstallCryptFileHandler, libgdal), Cvoid, ()))
end

function vsisetcryptkey(pabyKey, nKeySize)
    aftercare(ccall((:VSISetCryptKey, libgdal), Cvoid, (Ptr{GByte}, Cint), pabyKey, nKeySize))
end

"""
    vsicleanupfilemanager()

Doxygen\\_Suppress 
"""
function vsicleanupfilemanager()
    aftercare(ccall((:VSICleanupFileManager, libgdal), Cvoid, ()))
end

function vsifilefrommembuffer(pszFilename, pabyData, nDataLength, bTakeOwnership)
    aftercare(ccall((:VSIFileFromMemBuffer, libgdal), Ptr{VSILFILE}, (Cstring, Ptr{GByte}, vsi_l_offset, Cint), pszFilename, pabyData, nDataLength, bTakeOwnership))
end

function vsigetmemfilebuffer(pszFilename, pnDataLength, bUnlinkAndSeize)
    aftercare(ccall((:VSIGetMemFileBuffer, libgdal), Ptr{GByte}, (Cstring, Ptr{vsi_l_offset}, Cint), pszFilename, pnDataLength, bUnlinkAndSeize))
end

# typedef size_t ( * VSIWriteFunction ) ( const void * ptr , size_t size , size_t nmemb , FILE * stream )
"""Callback used by [`VSIStdoutSetRedirection`](@ref)() """
const VSIWriteFunction = Ptr{Cvoid}

function vsistdoutsetredirection(pFct, stream)
    aftercare(ccall((:VSIStdoutSetRedirection, libgdal), Cvoid, (VSIWriteFunction, Ptr{Libc.FILE}), pFct, stream))
end

# typedef int ( * VSIFilesystemPluginStatCallback ) ( void * pUserData , const char * pszFilename , VSIStatBufL * pStatBuf , int nFlags )
"""
Return information about a handle. Optional (driver dependent)  

\\since GDAL 3.0
"""
const VSIFilesystemPluginStatCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginUnlinkCallback ) ( void * pUserData , const char * pszFilename )
"""
Remove handle by name. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginUnlinkCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginRenameCallback ) ( void * pUserData , const char * oldpath , const char * newpath )
"""
Rename handle. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginRenameCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginMkdirCallback ) ( void * pUserData , const char * pszDirname , long nMode )
"""
Create Directory. Optional 

\\since GDAL 3.0
"""
const VSIFilesystemPluginMkdirCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginRmdirCallback ) ( void * pUserData , const char * pszDirname )
"""
Delete Directory. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginRmdirCallback = Ptr{Cvoid}

# typedef char * * ( * VSIFilesystemPluginReadDirCallback ) ( void * pUserData , const char * pszDirname , int nMaxFiles )
"""
List directory content. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginReadDirCallback = Ptr{Cvoid}

# typedef char * * ( * VSIFilesystemPluginSiblingFilesCallback ) ( void * pUserData , const char * pszDirname )
"""
List related files. Must return NULL if unknown, or a list of relative filenames that can be opened along the main file. If no other file than pszFilename needs to be opened, return static\\_cast<char**> ([`CPLCalloc`](@ref)(1,sizeof(char*)));

Optional 

\\since GDAL 3.2
"""
const VSIFilesystemPluginSiblingFilesCallback = Ptr{Cvoid}

# typedef void * ( * VSIFilesystemPluginOpenCallback ) ( void * pUserData , const char * pszFilename , const char * pszAccess )
"""
Open a handle. Mandatory. Returns an opaque pointer that will be used in subsequent file I/O calls. Should return null and/or set errno if the handle does not exist or the access mode is incorrect. 

\\since GDAL 3.0
"""
const VSIFilesystemPluginOpenCallback = Ptr{Cvoid}

# typedef vsi_l_offset ( * VSIFilesystemPluginTellCallback ) ( void * pFile )
"""
Return current position in handle. Mandatory  

\\since GDAL 3.0
"""
const VSIFilesystemPluginTellCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginSeekCallback ) ( void * pFile , vsi_l_offset nOffset , int nWhence )
"""
Seek to position in handle. Mandatory except for write only handles  

\\since GDAL 3.0
"""
const VSIFilesystemPluginSeekCallback = Ptr{Cvoid}

# typedef size_t ( * VSIFilesystemPluginReadCallback ) ( void * pFile , void * pBuffer , size_t nSize , size_t nCount )
"""
Read data from current position, returns the number of blocks correctly read. Mandatory except for write only handles 

\\since GDAL 3.0
"""
const VSIFilesystemPluginReadCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginReadMultiRangeCallback ) ( void * pFile , int nRanges , void * * ppData , const vsi_l_offset * panOffsets , const size_t * panSizes )
"""
Read from multiple offsets. Optional, will be replaced by multiple calls to Read() if not provided  

\\since GDAL 3.0
"""
const VSIFilesystemPluginReadMultiRangeCallback = Ptr{Cvoid}

# typedef VSIRangeStatus ( * VSIFilesystemPluginGetRangeStatusCallback ) ( void * pFile , vsi_l_offset nOffset , vsi_l_offset nLength )
"""
Get empty ranges. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginGetRangeStatusCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginEofCallback ) ( void * pFile )
"""
Has end of file been reached. Mandatory? for read handles.  

\\since GDAL 3.0
"""
const VSIFilesystemPluginEofCallback = Ptr{Cvoid}

# typedef size_t ( * VSIFilesystemPluginWriteCallback ) ( void * pFile , const void * pBuffer , size_t nSize , size_t nCount )
"""
Write bytes at current offset. Mandatory for writable handles  

\\since GDAL 3.0
"""
const VSIFilesystemPluginWriteCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginFlushCallback ) ( void * pFile )
"""
Sync written bytes. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginFlushCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginTruncateCallback ) ( void * pFile , vsi_l_offset nNewSize )
"""Truncate handle. Mandatory (driver dependent?) for write handles """
const VSIFilesystemPluginTruncateCallback = Ptr{Cvoid}

# typedef int ( * VSIFilesystemPluginCloseCallback ) ( void * pFile )
"""
Close file handle. Optional  

\\since GDAL 3.0
"""
const VSIFilesystemPluginCloseCallback = Ptr{Cvoid}

"""
    VSIFilesystemPluginCallbacksStruct

struct containing callbacks to used by the handler. (rw), (r), (w) or () at the end indicate whether the given callback is mandatory for reading and or writing handlers. A (?) indicates that the callback might be mandatory for certain drivers only. 

\\since GDAL 3.0

| Field                | Note                                                                                   |
| :------------------- | :------------------------------------------------------------------------------------- |
| pUserData            | Optional opaque pointer passed back to filemanager callbacks (e.g. open, stat, rmdir)  |
| stat                 | stat handle by name (rw)                                                               |
| unlink               | unlink handle by name ()                                                               |
| rename               | rename handle ()                                                                       |
| mkdir                | make directory ()                                                                      |
| rmdir                | remove directory ()                                                                    |
| read\\_dir           | list directory content (r?)                                                            |
| open                 | open handle by name (rw)                                                               |
| tell                 | get current position of handle (rw)                                                    |
| seek                 | set current position of handle (rw)                                                    |
| read                 | read from current position (r)                                                         |
| read\\_multi\\_range | read multiple blocks ()                                                                |
| get\\_range\\_status | get range status ()                                                                    |
| eof                  | has end of file been reached (r?)                                                      |
| write                | write bytes to current position (w)                                                    |
| flush                | sync bytes (w)                                                                         |
| truncate             | truncate handle (w?)                                                                   |
| close                | close handle (rw)                                                                      |
| nBufferSize          | buffer small reads (makes handler read only)                                           |
| nCacheSize           | max mem to use per file when buffering                                                 |
| sibling\\_files      | list related files                                                                     |
"""
struct VSIFilesystemPluginCallbacksStruct
    pUserData::Ptr{Cvoid}
    stat::VSIFilesystemPluginStatCallback
    unlink::VSIFilesystemPluginUnlinkCallback
    rename::VSIFilesystemPluginRenameCallback
    mkdir::VSIFilesystemPluginMkdirCallback
    rmdir::VSIFilesystemPluginRmdirCallback
    read_dir::VSIFilesystemPluginReadDirCallback
    open::VSIFilesystemPluginOpenCallback
    tell::VSIFilesystemPluginTellCallback
    seek::VSIFilesystemPluginSeekCallback
    read::VSIFilesystemPluginReadCallback
    read_multi_range::VSIFilesystemPluginReadMultiRangeCallback
    get_range_status::VSIFilesystemPluginGetRangeStatusCallback
    eof::VSIFilesystemPluginEofCallback
    write::VSIFilesystemPluginWriteCallback
    flush::VSIFilesystemPluginFlushCallback
    truncate::VSIFilesystemPluginTruncateCallback
    close::VSIFilesystemPluginCloseCallback
    nBufferSize::Csize_t
    nCacheSize::Csize_t
    sibling_files::VSIFilesystemPluginSiblingFilesCallback
end

"""
    vsiallocfilesystemplugincallbacksstruct()

return a [`VSIFilesystemPluginCallbacksStruct`](@ref) to be populated at runtime with handler callbacks  

\\since GDAL 3.0
"""
function vsiallocfilesystemplugincallbacksstruct()
    aftercare(ccall((:VSIAllocFilesystemPluginCallbacksStruct, libgdal), Ptr{VSIFilesystemPluginCallbacksStruct}, ()))
end

"""
    vsifreefilesystemplugincallbacksstruct(poCb)

free resources allocated by [`VSIAllocFilesystemPluginCallbacksStruct`](@ref) 

\\since GDAL 3.0
"""
function vsifreefilesystemplugincallbacksstruct(poCb)
    aftercare(ccall((:VSIFreeFilesystemPluginCallbacksStruct, libgdal), Cvoid, (Ptr{VSIFilesystemPluginCallbacksStruct},), poCb))
end

"""
    vsiinstallpluginhandler(pszPrefix, poCb)

register a handler on the given prefix. All IO on datasets opened with the filename /prefix/xxxxxx will go through these callbacks. pszPrefix must begin and end with a '/' 

\\since GDAL 3.0
"""
function vsiinstallpluginhandler(pszPrefix, poCb)
    aftercare(ccall((:VSIInstallPluginHandler, libgdal), Cint, (Cstring, Ptr{VSIFilesystemPluginCallbacksStruct}), pszPrefix, poCb))
end

"""
    vsitime(arg1)

Doxygen\\_Suppress 
"""
function vsitime(arg1)
    aftercare(ccall((:VSITime, libgdal), Culong, (Ptr{Culong},), arg1))
end

function vsictime(arg1)
    aftercare(ccall((:VSICTime, libgdal), Cstring, (Culong,), arg1), false)
end

function vsigmtime(pnTime, poBrokenTime)
    aftercare(ccall((:VSIGMTime, libgdal), Ptr{tm}, (Ptr{time_t}, Ptr{tm}), pnTime, poBrokenTime))
end

function vsilocaltime(pnTime, poBrokenTime)
    aftercare(ccall((:VSILocalTime, libgdal), Ptr{tm}, (Ptr{time_t}, Ptr{tm}), pnTime, poBrokenTime))
end

"""
    GDALDataType

Pixel data types 

| Enumerator      | Note                              |
| :-------------- | :-------------------------------- |
| GDT\\_Unknown   | Unknown or unspecified type       |
| GDT\\_Byte      | Eight bit unsigned integer        |
| GDT\\_UInt16    | Sixteen bit unsigned integer      |
| GDT\\_Int16     | Sixteen bit signed integer        |
| GDT\\_UInt32    | Thirty two bit unsigned integer   |
| GDT\\_Int32     | Thirty two bit signed integer     |
| GDT\\_Float32   | Thirty two bit floating point     |
| GDT\\_Float64   | Sixty four bit floating point     |
| GDT\\_CInt16    | Complex Int16                     |
| GDT\\_CInt32    | Complex Int32                     |
| GDT\\_CFloat32  | Complex Float32                   |
| GDT\\_CFloat64  | Complex Float64                   |
| GDT\\_TypeCount |                                   |
"""
@cenum GDALDataType::UInt32 begin
    GDT_Unknown = 0
    GDT_Byte = 1
    GDT_UInt16 = 2
    GDT_Int16 = 3
    GDT_UInt32 = 4
    GDT_Int32 = 5
    GDT_Float32 = 6
    GDT_Float64 = 7
    GDT_CInt16 = 8
    GDT_CInt32 = 9
    GDT_CFloat32 = 10
    GDT_CFloat64 = 11
    GDT_TypeCount = 12
end

function gdalgetdatatypesize(arg1)
    aftercare(ccall((:GDALGetDataTypeSize, libgdal), Cint, (GDALDataType,), arg1))
end

function gdalgetdatatypesizebits(eDataType)
    aftercare(ccall((:GDALGetDataTypeSizeBits, libgdal), Cint, (GDALDataType,), eDataType))
end

function gdalgetdatatypesizebytes(arg1)
    aftercare(ccall((:GDALGetDataTypeSizeBytes, libgdal), Cint, (GDALDataType,), arg1))
end

function gdaldatatypeiscomplex(arg1)
    aftercare(ccall((:GDALDataTypeIsComplex, libgdal), Cint, (GDALDataType,), arg1))
end

function gdaldatatypeisinteger(arg1)
    aftercare(ccall((:GDALDataTypeIsInteger, libgdal), Cint, (GDALDataType,), arg1))
end

function gdaldatatypeisfloating(arg1)
    aftercare(ccall((:GDALDataTypeIsFloating, libgdal), Cint, (GDALDataType,), arg1))
end

function gdaldatatypeissigned(arg1)
    aftercare(ccall((:GDALDataTypeIsSigned, libgdal), Cint, (GDALDataType,), arg1))
end

function gdalgetdatatypename(arg1)
    aftercare(ccall((:GDALGetDataTypeName, libgdal), Cstring, (GDALDataType,), arg1), false)
end

function gdalgetdatatypebyname(arg1)
    aftercare(ccall((:GDALGetDataTypeByName, libgdal), GDALDataType, (Cstring,), arg1))
end

function gdaldatatypeunion(arg1, arg2)
    aftercare(ccall((:GDALDataTypeUnion, libgdal), GDALDataType, (GDALDataType, GDALDataType), arg1, arg2))
end

function gdaldatatypeunionwithvalue(eDT, dValue, bComplex)
    aftercare(ccall((:GDALDataTypeUnionWithValue, libgdal), GDALDataType, (GDALDataType, Cdouble, Cint), eDT, dValue, bComplex))
end

function gdalfinddatatype(nBits, bSigned, bFloating, bComplex)
    aftercare(ccall((:GDALFindDataType, libgdal), GDALDataType, (Cint, Cint, Cint, Cint), nBits, bSigned, bFloating, bComplex))
end

function gdalfinddatatypeforvalue(dValue, bComplex)
    aftercare(ccall((:GDALFindDataTypeForValue, libgdal), GDALDataType, (Cdouble, Cint), dValue, bComplex))
end

function gdaladjustvaluetodatatype(eDT, dfValue, pbClamped, pbRounded)
    aftercare(ccall((:GDALAdjustValueToDataType, libgdal), Cdouble, (GDALDataType, Cdouble, Ptr{Cint}, Ptr{Cint}), eDT, dfValue, pbClamped, pbRounded))
end

function gdalgetnoncomplexdatatype(arg1)
    aftercare(ccall((:GDALGetNonComplexDataType, libgdal), GDALDataType, (GDALDataType,), arg1))
end

function gdaldatatypeisconversionlossy(eTypeFrom, eTypeTo)
    aftercare(ccall((:GDALDataTypeIsConversionLossy, libgdal), Cint, (GDALDataType, GDALDataType), eTypeFrom, eTypeTo))
end

"""
    GDALAsyncStatusType

status of the asynchronous stream
"""
@cenum GDALAsyncStatusType::UInt32 begin
    GARIO_PENDING = 0
    GARIO_UPDATE = 1
    GARIO_ERROR = 2
    GARIO_COMPLETE = 3
    GARIO_TypeCount = 4
end

function gdalgetasyncstatustypename(arg1)
    aftercare(ccall((:GDALGetAsyncStatusTypeName, libgdal), Cstring, (GDALAsyncStatusType,), arg1), false)
end

function gdalgetasyncstatustypebyname(arg1)
    aftercare(ccall((:GDALGetAsyncStatusTypeByName, libgdal), GDALAsyncStatusType, (Cstring,), arg1))
end

"""
    GDALAccess

Flag indicating read/write, or read-only access to data. 

| Enumerator    | Note                           |
| :------------ | :----------------------------- |
| GA\\_ReadOnly | Read only (no update) access   |
| GA\\_Update   | Read/write access.             |
"""
@cenum GDALAccess::UInt32 begin
    GA_ReadOnly = 0
    GA_Update = 1
end

"""
    GDALRWFlag

Read/Write flag for RasterIO() method 

| Enumerator | Note         |
| :--------- | :----------- |
| GF\\_Read  | Read data    |
| GF\\_Write | Write data   |
"""
@cenum GDALRWFlag::UInt32 begin
    GF_Read = 0
    GF_Write = 1
end

"""
    GDALRIOResampleAlg

RasterIO() resampling method. 

\\since GDAL 2.0

| Enumerator                | Note                                                                          |
| :------------------------ | :---------------------------------------------------------------------------- |
| GRIORA\\_NearestNeighbour | Nearest neighbour                                                             |
| GRIORA\\_Bilinear         | Bilinear (2x2 kernel)                                                         |
| GRIORA\\_Cubic            | Cubic Convolution Approximation (4x4 kernel)                                  |
| GRIORA\\_CubicSpline      | Cubic B-Spline Approximation (4x4 kernel)                                     |
| GRIORA\\_Lanczos          | Lanczos windowed sinc interpolation (6x6 kernel)                              |
| GRIORA\\_Average          | Average                                                                       |
| GRIORA\\_Mode             | Mode (selects the value which appears most often of all the sampled points)   |
| GRIORA\\_Gauss            | Gauss blurring                                                                |
| GRIORA\\_LAST             | Doxygen\\_Suppress                                                            |
"""
@cenum GDALRIOResampleAlg::UInt32 begin
    GRIORA_NearestNeighbour = 0
    GRIORA_Bilinear = 1
    GRIORA_Cubic = 2
    GRIORA_CubicSpline = 3
    GRIORA_Lanczos = 4
    GRIORA_Average = 5
    GRIORA_Mode = 6
    GRIORA_Gauss = 7
    GRIORA_LAST = 7
end

"""
    GDALRasterIOExtraArg

Structure to pass extra arguments to RasterIO() method 

\\since GDAL 2.0

| Field                        | Note                                                                                                                                                                                                                                                              |
| :--------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| nVersion                     | Version of structure (to allow future extensions of the structure)                                                                                                                                                                                                |
| eResampleAlg                 | Resampling algorithm                                                                                                                                                                                                                                              |
| pfnProgress                  | Progress callback                                                                                                                                                                                                                                                 |
| pProgressData                | Progress callback user data                                                                                                                                                                                                                                       |
| bFloatingPointWindowValidity | Indicate if dfXOff, dfYOff, dfXSize and dfYSize are set. Mostly reserved from the VRT driver to communicate a more precise source window. Must be such that dfXOff - nXOff < 1.0 and dfYOff - nYOff < 1.0 and nXSize - dfXSize < 1.0 and nYSize - dfYSize < 1.0   |
| dfXOff                       | Pixel offset to the top left corner. Only valid if bFloatingPointWindowValidity = [`TRUE`](@ref)                                                                                                                                                                  |
| dfYOff                       | Line offset to the top left corner. Only valid if bFloatingPointWindowValidity = [`TRUE`](@ref)                                                                                                                                                                   |
| dfXSize                      | Width in pixels of the area of interest. Only valid if bFloatingPointWindowValidity = [`TRUE`](@ref)                                                                                                                                                              |
| dfYSize                      | Height in pixels of the area of interest. Only valid if bFloatingPointWindowValidity = [`TRUE`](@ref)                                                                                                                                                             |
"""
struct GDALRasterIOExtraArg
    nVersion::Cint
    eResampleAlg::GDALRIOResampleAlg
    pfnProgress::GDALProgressFunc
    pProgressData::Ptr{Cvoid}
    bFloatingPointWindowValidity::Cint
    dfXOff::Cdouble
    dfYOff::Cdouble
    dfXSize::Cdouble
    dfYSize::Cdouble
end

"""
    GDALColorInterp

Types of color interpretation for raster bands. 

| Enumerator           | Note                                                           |
| :------------------- | :------------------------------------------------------------- |
| GCI\\_Undefined      | Undefined                                                      |
| GCI\\_GrayIndex      | Greyscale                                                      |
| GCI\\_PaletteIndex   | Paletted (see associated color table)                          |
| GCI\\_RedBand        | Red band of RGBA image                                         |
| GCI\\_GreenBand      | Green band of RGBA image                                       |
| GCI\\_BlueBand       | Blue band of RGBA image                                        |
| GCI\\_AlphaBand      | Alpha (0=transparent, 255=opaque)                              |
| GCI\\_HueBand        | Hue band of HLS image                                          |
| GCI\\_SaturationBand | Saturation band of HLS image                                   |
| GCI\\_LightnessBand  | Lightness band of HLS image                                    |
| GCI\\_CyanBand       | Cyan band of CMYK image                                        |
| GCI\\_MagentaBand    | Magenta band of CMYK image                                     |
| GCI\\_YellowBand     | Yellow band of CMYK image                                      |
| GCI\\_BlackBand      | Black band of CMYK image                                       |
| GCI\\_YCbCr\\_YBand  | Y Luminance                                                    |
| GCI\\_YCbCr\\_CbBand | Cb Chroma                                                      |
| GCI\\_YCbCr\\_CrBand | Cr Chroma                                                      |
| GCI\\_Max            | Max current value (equals to GCI\\_YCbCr\\_CrBand currently)   |
"""
@cenum GDALColorInterp::UInt32 begin
    GCI_Undefined = 0
    GCI_GrayIndex = 1
    GCI_PaletteIndex = 2
    GCI_RedBand = 3
    GCI_GreenBand = 4
    GCI_BlueBand = 5
    GCI_AlphaBand = 6
    GCI_HueBand = 7
    GCI_SaturationBand = 8
    GCI_LightnessBand = 9
    GCI_CyanBand = 10
    GCI_MagentaBand = 11
    GCI_YellowBand = 12
    GCI_BlackBand = 13
    GCI_YCbCr_YBand = 14
    GCI_YCbCr_CbBand = 15
    GCI_YCbCr_CrBand = 16
    GCI_Max = 16
end

function gdalgetcolorinterpretationname(arg1)
    aftercare(ccall((:GDALGetColorInterpretationName, libgdal), Cstring, (GDALColorInterp,), arg1), false)
end

function gdalgetcolorinterpretationbyname(pszName)
    aftercare(ccall((:GDALGetColorInterpretationByName, libgdal), GDALColorInterp, (Cstring,), pszName))
end

"""
    GDALPaletteInterp

Types of color interpretations for a GDALColorTable. 

| Enumerator | Note                                                    |
| :--------- | :------------------------------------------------------ |
| GPI\\_Gray | Grayscale (in [`GDALColorEntry`](@ref).c1)              |
| GPI\\_RGB  | Red, Green, Blue and Alpha in (in c1, c2, c3 and c4)    |
| GPI\\_CMYK | Cyan, Magenta, Yellow and Black (in c1, c2, c3 and c4)  |
| GPI\\_HLS  | Hue, Lightness and Saturation (in c1, c2, and c3)       |
"""
@cenum GDALPaletteInterp::UInt32 begin
    GPI_Gray = 0
    GPI_RGB = 1
    GPI_CMYK = 2
    GPI_HLS = 3
end

function gdalgetpaletteinterpretationname(arg1)
    aftercare(ccall((:GDALGetPaletteInterpretationName, libgdal), Cstring, (GDALPaletteInterp,), arg1), false)
end

"""Opaque type used for the C bindings of the C++ GDALMajorObject class """
const GDALMajorObjectH = Ptr{Cvoid}

"""Opaque type used for the C bindings of the C++ GDALDataset class """
const GDALDatasetH = Ptr{Cvoid}

"""Opaque type used for the C bindings of the C++ GDALRasterBand class """
const GDALRasterBandH = Ptr{Cvoid}

"""Opaque type used for the C bindings of the C++ GDALDriver class """
const GDALDriverH = Ptr{Cvoid}

"""Opaque type used for the C bindings of the C++ GDALColorTable class """
const GDALColorTableH = Ptr{Cvoid}

"""Opaque type used for the C bindings of the C++ GDALRasterAttributeTable class """
const GDALRasterAttributeTableH = Ptr{Cvoid}

"""Opaque type used for the C bindings of the C++ GDALAsyncReader class """
const GDALAsyncReaderH = Ptr{Cvoid}

"""Type to express pixel, line or band spacing. Signed 64 bit integer. """
const GSpacing = GIntBig

"""
    GDALExtendedDataTypeClass

Enumeration giving the class of a GDALExtendedDataType. 

\\since GDAL 3.1

| Enumerator       | Note                                                         |
| :--------------- | :----------------------------------------------------------- |
| GEDTC\\_NUMERIC  | Numeric value. Based on [`GDALDataType`](@ref) enumeration   |
| GEDTC\\_STRING   | String value.                                                |
| GEDTC\\_COMPOUND | Compound data type.                                          |
"""
@cenum GDALExtendedDataTypeClass::UInt32 begin
    GEDTC_NUMERIC = 0
    GEDTC_STRING = 1
    GEDTC_COMPOUND = 2
end

const GDALExtendedDataTypeHS = Cvoid

"""Opaque type for C++ GDALExtendedDataType """
const GDALExtendedDataTypeH = Ptr{GDALExtendedDataTypeHS}

const GDALEDTComponentHS = Cvoid

"""Opaque type for C++ GDALEDTComponent """
const GDALEDTComponentH = Ptr{GDALEDTComponentHS}

const GDALGroupHS = Cvoid

"""Opaque type for C++ GDALGroup """
const GDALGroupH = Ptr{GDALGroupHS}

const GDALMDArrayHS = Cvoid

"""Opaque type for C++ GDALMDArray """
const GDALMDArrayH = Ptr{GDALMDArrayHS}

const GDALAttributeHS = Cvoid

"""Opaque type for C++ GDALAttribute """
const GDALAttributeH = Ptr{GDALAttributeHS}

const GDALDimensionHS = Cvoid

"""Opaque type for C++ GDALDimension """
const GDALDimensionH = Ptr{GDALDimensionHS}

function gdalallregister()
    aftercare(ccall((:GDALAllRegister, libgdal), Cvoid, ()))
end

function gdalcreate(hDriver, arg2, arg3, arg4, arg5, arg6, arg7)
    aftercare(ccall((:GDALCreate, libgdal), GDALDatasetH, (GDALDriverH, Cstring, Cint, Cint, Cint, GDALDataType, CSLConstList), hDriver, arg2, arg3, arg4, arg5, arg6, arg7))
end

function gdalcreatecopy(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    aftercare(ccall((:GDALCreateCopy, libgdal), GDALDatasetH, (GDALDriverH, Cstring, GDALDatasetH, Cint, CSLConstList, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7))
end

function gdalidentifydriver(pszFilename, papszFileList)
    aftercare(ccall((:GDALIdentifyDriver, libgdal), GDALDriverH, (Cstring, CSLConstList), pszFilename, papszFileList))
end

function gdalidentifydriverex(pszFilename, nIdentifyFlags, papszAllowedDrivers, papszFileList)
    aftercare(ccall((:GDALIdentifyDriverEx, libgdal), GDALDriverH, (Cstring, Cuint, Ptr{Cstring}, Ptr{Cstring}), pszFilename, nIdentifyFlags, papszAllowedDrivers, papszFileList))
end

function gdalopen(pszFilename, eAccess)
    aftercare(ccall((:GDALOpen, libgdal), GDALDatasetH, (Cstring, GDALAccess), pszFilename, eAccess))
end

function gdalopenshared(arg1, arg2)
    aftercare(ccall((:GDALOpenShared, libgdal), GDALDatasetH, (Cstring, GDALAccess), arg1, arg2))
end

function gdalopenex(pszFilename, nOpenFlags, papszAllowedDrivers, papszOpenOptions, papszSiblingFiles)
    aftercare(ccall((:GDALOpenEx, libgdal), GDALDatasetH, (Cstring, Cuint, Ptr{Cstring}, Ptr{Cstring}, Ptr{Cstring}), pszFilename, nOpenFlags, papszAllowedDrivers, papszOpenOptions, papszSiblingFiles))
end

function gdaldumpopendatasets(arg1)
    aftercare(ccall((:GDALDumpOpenDatasets, libgdal), Cint, (Ptr{Libc.FILE},), arg1))
end

function gdalgetdriverbyname(arg1)
    aftercare(ccall((:GDALGetDriverByName, libgdal), GDALDriverH, (Cstring,), arg1))
end

function gdalgetdrivercount()
    aftercare(ccall((:GDALGetDriverCount, libgdal), Cint, ()))
end

function gdalgetdriver(arg1)
    aftercare(ccall((:GDALGetDriver, libgdal), GDALDriverH, (Cint,), arg1))
end

function gdalcreatedriver()
    aftercare(ccall((:GDALCreateDriver, libgdal), GDALDriverH, ()))
end

function gdaldestroydriver(arg1)
    aftercare(ccall((:GDALDestroyDriver, libgdal), Cvoid, (GDALDriverH,), arg1))
end

function gdalregisterdriver(arg1)
    aftercare(ccall((:GDALRegisterDriver, libgdal), Cint, (GDALDriverH,), arg1))
end

function gdalderegisterdriver(arg1)
    aftercare(ccall((:GDALDeregisterDriver, libgdal), Cvoid, (GDALDriverH,), arg1))
end

function gdaldestroydrivermanager()
    aftercare(ccall((:GDALDestroyDriverManager, libgdal), Cvoid, ()))
end

function gdaldestroy()
    aftercare(ccall((:GDALDestroy, libgdal), Cvoid, ()))
end

function gdaldeletedataset(arg1, arg2)
    aftercare(ccall((:GDALDeleteDataset, libgdal), CPLErr, (GDALDriverH, Cstring), arg1, arg2))
end

function gdalrenamedataset(arg1, pszNewName, pszOldName)
    aftercare(ccall((:GDALRenameDataset, libgdal), CPLErr, (GDALDriverH, Cstring, Cstring), arg1, pszNewName, pszOldName))
end

function gdalcopydatasetfiles(arg1, pszNewName, pszOldName)
    aftercare(ccall((:GDALCopyDatasetFiles, libgdal), CPLErr, (GDALDriverH, Cstring, Cstring), arg1, pszNewName, pszOldName))
end

function gdalvalidatecreationoptions(arg1, papszCreationOptions)
    aftercare(ccall((:GDALValidateCreationOptions, libgdal), Cint, (GDALDriverH, CSLConstList), arg1, papszCreationOptions))
end

function gdalgetdrivershortname(arg1)
    aftercare(ccall((:GDALGetDriverShortName, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

function gdalgetdriverlongname(arg1)
    aftercare(ccall((:GDALGetDriverLongName, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

function gdalgetdriverhelptopic(arg1)
    aftercare(ccall((:GDALGetDriverHelpTopic, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

function gdalgetdrivercreationoptionlist(arg1)
    aftercare(ccall((:GDALGetDriverCreationOptionList, libgdal), Cstring, (GDALDriverH,), arg1), false)
end

"""
    GDAL_GCP

Ground Control Point 

| Field      | Note                                       |
| :--------- | :----------------------------------------- |
| pszId      | Unique identifier, often numeric           |
| pszInfo    | Informational message or ""                |
| dfGCPPixel | Pixel (x) location of GCP on raster        |
| dfGCPLine  | Line (y) location of GCP on raster         |
| dfGCPX     | X position of GCP in georeferenced space   |
| dfGCPY     | Y position of GCP in georeferenced space   |
| dfGCPZ     | Elevation of GCP, or zero if not known     |
"""
struct GDAL_GCP
    pszId::Cstring
    pszInfo::Cstring
    dfGCPPixel::Cdouble
    dfGCPLine::Cdouble
    dfGCPX::Cdouble
    dfGCPY::Cdouble
    dfGCPZ::Cdouble
end

function gdalinitgcps(arg1, arg2)
    aftercare(ccall((:GDALInitGCPs, libgdal), Cvoid, (Cint, Ptr{GDAL_GCP}), arg1, arg2))
end

function gdaldeinitgcps(arg1, arg2)
    aftercare(ccall((:GDALDeinitGCPs, libgdal), Cvoid, (Cint, Ptr{GDAL_GCP}), arg1, arg2))
end

function gdalduplicategcps(arg1, arg2)
    aftercare(ccall((:GDALDuplicateGCPs, libgdal), Ptr{GDAL_GCP}, (Cint, Ptr{GDAL_GCP}), arg1, arg2))
end

function gdalgcpstogeotransform(nGCPCount, pasGCPs, padfGeoTransform, bApproxOK)
    aftercare(ccall((:GDALGCPsToGeoTransform, libgdal), Cint, (Cint, Ptr{GDAL_GCP}, Ptr{Cdouble}, Cint), nGCPCount, pasGCPs, padfGeoTransform, bApproxOK))
end

function gdalinvgeotransform(padfGeoTransformIn, padfInvGeoTransformOut)
    aftercare(ccall((:GDALInvGeoTransform, libgdal), Cint, (Ptr{Cdouble}, Ptr{Cdouble}), padfGeoTransformIn, padfInvGeoTransformOut))
end

function gdalapplygeotransform(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALApplyGeoTransform, libgdal), Cvoid, (Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5))
end

function gdalcomposegeotransforms(padfGeoTransform1, padfGeoTransform2, padfGeoTransformOut)
    aftercare(ccall((:GDALComposeGeoTransforms, libgdal), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), padfGeoTransform1, padfGeoTransform2, padfGeoTransformOut))
end

function gdalgetmetadatadomainlist(hObject)
    aftercare(ccall((:GDALGetMetadataDomainList, libgdal), Ptr{Cstring}, (GDALMajorObjectH,), hObject))
end

function gdalgetmetadata(arg1, arg2)
    aftercare(ccall((:GDALGetMetadata, libgdal), Ptr{Cstring}, (GDALMajorObjectH, Cstring), arg1, arg2))
end

function gdalsetmetadata(arg1, arg2, arg3)
    aftercare(ccall((:GDALSetMetadata, libgdal), CPLErr, (GDALMajorObjectH, CSLConstList, Cstring), arg1, arg2, arg3))
end

function gdalgetmetadataitem(arg1, arg2, arg3)
    aftercare(ccall((:GDALGetMetadataItem, libgdal), Cstring, (GDALMajorObjectH, Cstring, Cstring), arg1, arg2, arg3), false)
end

function gdalsetmetadataitem(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALSetMetadataItem, libgdal), CPLErr, (GDALMajorObjectH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4))
end

function gdalgetdescription(arg1)
    aftercare(ccall((:GDALGetDescription, libgdal), Cstring, (GDALMajorObjectH,), arg1), false)
end

function gdalsetdescription(arg1, arg2)
    aftercare(ccall((:GDALSetDescription, libgdal), Cvoid, (GDALMajorObjectH, Cstring), arg1, arg2))
end

function gdalgetdatasetdriver(arg1)
    aftercare(ccall((:GDALGetDatasetDriver, libgdal), GDALDriverH, (GDALDatasetH,), arg1))
end

function gdalgetfilelist(arg1)
    aftercare(ccall((:GDALGetFileList, libgdal), Ptr{Cstring}, (GDALDatasetH,), arg1))
end

function gdalclose(arg1)
    aftercare(ccall((:GDALClose, libgdal), Cvoid, (GDALDatasetH,), arg1))
end

function gdalgetrasterxsize(arg1)
    aftercare(ccall((:GDALGetRasterXSize, libgdal), Cint, (GDALDatasetH,), arg1))
end

function gdalgetrasterysize(arg1)
    aftercare(ccall((:GDALGetRasterYSize, libgdal), Cint, (GDALDatasetH,), arg1))
end

function gdalgetrastercount(arg1)
    aftercare(ccall((:GDALGetRasterCount, libgdal), Cint, (GDALDatasetH,), arg1))
end

function gdalgetrasterband(arg1, arg2)
    aftercare(ccall((:GDALGetRasterBand, libgdal), GDALRasterBandH, (GDALDatasetH, Cint), arg1, arg2))
end

function gdaladdband(hDS, eType, papszOptions)
    aftercare(ccall((:GDALAddBand, libgdal), CPLErr, (GDALDatasetH, GDALDataType, CSLConstList), hDS, eType, papszOptions))
end

function gdalbeginasyncreader(hDS, nXOff, nYOff, nXSize, nYSize, pBuf, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, papszOptions)
    aftercare(ccall((:GDALBeginAsyncReader, libgdal), GDALAsyncReaderH, (GDALDatasetH, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint, CSLConstList), hDS, nXOff, nYOff, nXSize, nYSize, pBuf, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, papszOptions))
end

function gdalendasyncreader(hDS, hAsynchReaderH)
    aftercare(ccall((:GDALEndAsyncReader, libgdal), Cvoid, (GDALDatasetH, GDALAsyncReaderH), hDS, hAsynchReaderH))
end

function gdaldatasetrasterio(hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace)
    aftercare(ccall((:GDALDatasetRasterIO, libgdal), CPLErr, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint), hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace))
end

function gdaldatasetrasterioex(hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace, psExtraArg)
    aftercare(ccall((:GDALDatasetRasterIOEx, libgdal), CPLErr, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, GSpacing, GSpacing, GSpacing, Ptr{GDALRasterIOExtraArg}), hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, nPixelSpace, nLineSpace, nBandSpace, psExtraArg))
end

function gdaldatasetadviseread(hDS, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, papszOptions)
    aftercare(ccall((:GDALDatasetAdviseRead, libgdal), CPLErr, (GDALDatasetH, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, CSLConstList), hDS, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, nBandCount, panBandCount, papszOptions))
end

function gdalgetprojectionref(arg1)
    aftercare(ccall((:GDALGetProjectionRef, libgdal), Cstring, (GDALDatasetH,), arg1), false)
end

"""Opaque type for a spatial reference system """
const OGRSpatialReferenceH = Ptr{Cvoid}

function gdalgetspatialref(arg1)
    aftercare(ccall((:GDALGetSpatialRef, libgdal), OGRSpatialReferenceH, (GDALDatasetH,), arg1))
end

function gdalsetprojection(arg1, arg2)
    aftercare(ccall((:GDALSetProjection, libgdal), CPLErr, (GDALDatasetH, Cstring), arg1, arg2))
end

function gdalsetspatialref(arg1, arg2)
    aftercare(ccall((:GDALSetSpatialRef, libgdal), CPLErr, (GDALDatasetH, OGRSpatialReferenceH), arg1, arg2))
end

function gdalgetgeotransform(arg1, arg2)
    aftercare(ccall((:GDALGetGeoTransform, libgdal), CPLErr, (GDALDatasetH, Ptr{Cdouble}), arg1, arg2))
end

function gdalsetgeotransform(arg1, arg2)
    aftercare(ccall((:GDALSetGeoTransform, libgdal), CPLErr, (GDALDatasetH, Ptr{Cdouble}), arg1, arg2))
end

function gdalgetgcpcount(arg1)
    aftercare(ccall((:GDALGetGCPCount, libgdal), Cint, (GDALDatasetH,), arg1))
end

function gdalgetgcpprojection(arg1)
    aftercare(ccall((:GDALGetGCPProjection, libgdal), Cstring, (GDALDatasetH,), arg1), false)
end

function gdalgetgcpspatialref(arg1)
    aftercare(ccall((:GDALGetGCPSpatialRef, libgdal), OGRSpatialReferenceH, (GDALDatasetH,), arg1))
end

function gdalgetgcps(arg1)
    aftercare(ccall((:GDALGetGCPs, libgdal), Ptr{GDAL_GCP}, (GDALDatasetH,), arg1))
end

function gdalsetgcps(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALSetGCPs, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{GDAL_GCP}, Cstring), arg1, arg2, arg3, arg4))
end

function gdalsetgcps2(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALSetGCPs2, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{GDAL_GCP}, OGRSpatialReferenceH), arg1, arg2, arg3, arg4))
end

function gdalgetinternalhandle(arg1, arg2)
    aftercare(ccall((:GDALGetInternalHandle, libgdal), Ptr{Cvoid}, (GDALDatasetH, Cstring), arg1, arg2))
end

function gdalreferencedataset(arg1)
    aftercare(ccall((:GDALReferenceDataset, libgdal), Cint, (GDALDatasetH,), arg1))
end

function gdaldereferencedataset(arg1)
    aftercare(ccall((:GDALDereferenceDataset, libgdal), Cint, (GDALDatasetH,), arg1))
end

function gdalreleasedataset(arg1)
    aftercare(ccall((:GDALReleaseDataset, libgdal), Cint, (GDALDatasetH,), arg1))
end

function gdalbuildoverviews(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    aftercare(ccall((:GDALBuildOverviews, libgdal), CPLErr, (GDALDatasetH, Cstring, Cint, Ptr{Cint}, Cint, Ptr{Cint}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8))
end

function gdalgetopendatasets(hDS, pnCount)
    aftercare(ccall((:GDALGetOpenDatasets, libgdal), Cvoid, (Ptr{Ptr{GDALDatasetH}}, Ptr{Cint}), hDS, pnCount))
end

function gdalgetaccess(hDS)
    aftercare(ccall((:GDALGetAccess, libgdal), Cint, (GDALDatasetH,), hDS))
end

function gdalflushcache(hDS)
    aftercare(ccall((:GDALFlushCache, libgdal), Cvoid, (GDALDatasetH,), hDS))
end

function gdalcreatedatasetmaskband(hDS, nFlags)
    aftercare(ccall((:GDALCreateDatasetMaskBand, libgdal), CPLErr, (GDALDatasetH, Cint), hDS, nFlags))
end

function gdaldatasetcopywholeraster(hSrcDS, hDstDS, papszOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALDatasetCopyWholeRaster, libgdal), CPLErr, (GDALDatasetH, GDALDatasetH, CSLConstList, GDALProgressFunc, Ptr{Cvoid}), hSrcDS, hDstDS, papszOptions, pfnProgress, pProgressData))
end

function gdalrasterbandcopywholeraster(hSrcBand, hDstBand, constpapszOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALRasterBandCopyWholeRaster, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hDstBand, constpapszOptions, pfnProgress, pProgressData))
end

function gdalregenerateoverviews(hSrcBand, nOverviewCount, pahOverviewBands, pszResampling, pfnProgress, pProgressData)
    aftercare(ccall((:GDALRegenerateOverviews, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{GDALRasterBandH}, Cstring, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, nOverviewCount, pahOverviewBands, pszResampling, pfnProgress, pProgressData))
end

function gdaldatasetgetlayercount(arg1)
    aftercare(ccall((:GDALDatasetGetLayerCount, libgdal), Cint, (GDALDatasetH,), arg1))
end

"""Opaque type for a layer (OGRLayer) """
const OGRLayerH = Ptr{Cvoid}

function gdaldatasetgetlayer(arg1, arg2)
    aftercare(ccall((:GDALDatasetGetLayer, libgdal), OGRLayerH, (GDALDatasetH, Cint), arg1, arg2))
end

function gdaldatasetgetlayerbyname(arg1, arg2)
    aftercare(ccall((:GDALDatasetGetLayerByName, libgdal), OGRLayerH, (GDALDatasetH, Cstring), arg1, arg2))
end

"""Type for a OGR error """
const OGRErr = Cint

function gdaldatasetdeletelayer(arg1, arg2)
    aftercare(ccall((:GDALDatasetDeleteLayer, libgdal), OGRErr, (GDALDatasetH, Cint), arg1, arg2))
end

"""
    OGRwkbGeometryType

List of well known binary geometry types. These are used within the BLOBs but are also returned from OGRGeometry::getGeometryType() to identify the type of a geometry object.

| Enumerator               | Note                                                                                                                                            |
| :----------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------- |
| wkbUnknown               | unknown type, non-standard                                                                                                                      |
| wkbPoint                 | 0-dimensional geometric object, standard WKB                                                                                                    |
| wkbLineString            | 1-dimensional geometric object with linear interpolation between Points, standard WKB                                                           |
| wkbPolygon               | planar 2-dimensional geometric object defined by 1 exterior boundary and 0 or more interior boundaries, standard WKB                            |
| wkbMultiPoint            | GeometryCollection of Points, standard WKB                                                                                                      |
| wkbMultiLineString       | GeometryCollection of LineStrings, standard WKB                                                                                                 |
| wkbMultiPolygon          | GeometryCollection of Polygons, standard WKB                                                                                                    |
| wkbGeometryCollection    | geometric object that is a collection of 1 or more geometric objects, standard WKB                                                              |
| wkbCircularString        | one or more circular arc segments connected end to end, ISO SQL/MM Part 3. GDAL >= 2.0                                                          |
| wkbCompoundCurve         | sequence of contiguous curves, ISO SQL/MM Part 3. GDAL >= 2.0                                                                                   |
| wkbCurvePolygon          | planar surface, defined by 1 exterior boundary and zero or more interior boundaries, that are curves. ISO SQL/MM Part 3. GDAL >= 2.0            |
| wkbMultiCurve            | GeometryCollection of Curves, ISO SQL/MM Part 3. GDAL >= 2.0                                                                                    |
| wkbMultiSurface          | GeometryCollection of Surfaces, ISO SQL/MM Part 3. GDAL >= 2.0                                                                                  |
| wkbCurve                 | Curve (abstract type). ISO SQL/MM Part 3. GDAL >= 2.1                                                                                           |
| wkbSurface               | Surface (abstract type). ISO SQL/MM Part 3. GDAL >= 2.1                                                                                         |
| wkbPolyhedralSurface     | a contiguous collection of polygons, which share common boundary segments, ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented   |
| wkbTIN                   | a PolyhedralSurface consisting only of Triangle patches ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                      |
| wkbTriangle              | a Triangle. ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                                                                  |
| wkbNone                  | non-standard, for pure attribute records                                                                                                        |
| wkbLinearRing            | non-standard, just for createGeometry()                                                                                                         |
| wkbCircularStringZ       | wkbCircularString with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                              |
| wkbCompoundCurveZ        | wkbCompoundCurve with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                               |
| wkbCurvePolygonZ         | wkbCurvePolygon with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                                |
| wkbMultiCurveZ           | wkbMultiCurve with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                                  |
| wkbMultiSurfaceZ         | wkbMultiSurface with Z component. ISO SQL/MM Part 3. GDAL >= 2.0                                                                                |
| wkbCurveZ                | wkbCurve with Z component. ISO SQL/MM Part 3. GDAL >= 2.1                                                                                       |
| wkbSurfaceZ              | wkbSurface with Z component. ISO SQL/MM Part 3. GDAL >= 2.1                                                                                     |
| wkbPolyhedralSurfaceZ    | ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                                                                              |
| wkbTINZ                  |                                                                                                                                                 |
| wkbTriangleZ             |                                                                                                                                                 |
| wkbPointM                | ISO SQL/MM Part 3. GDAL >= 2.1                                                                                                                  |
| wkbLineStringM           |                                                                                                                                                 |
| wkbPolygonM              |                                                                                                                                                 |
| wkbMultiPointM           |                                                                                                                                                 |
| wkbMultiLineStringM      |                                                                                                                                                 |
| wkbMultiPolygonM         |                                                                                                                                                 |
| wkbGeometryCollectionM   |                                                                                                                                                 |
| wkbCircularStringM       |                                                                                                                                                 |
| wkbCompoundCurveM        |                                                                                                                                                 |
| wkbCurvePolygonM         |                                                                                                                                                 |
| wkbMultiCurveM           |                                                                                                                                                 |
| wkbMultiSurfaceM         |                                                                                                                                                 |
| wkbCurveM                |                                                                                                                                                 |
| wkbSurfaceM              |                                                                                                                                                 |
| wkbPolyhedralSurfaceM    | ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                                                                              |
| wkbTINM                  |                                                                                                                                                 |
| wkbTriangleM             |                                                                                                                                                 |
| wkbPointZM               | ISO SQL/MM Part 3. GDAL >= 2.1                                                                                                                  |
| wkbLineStringZM          |                                                                                                                                                 |
| wkbPolygonZM             |                                                                                                                                                 |
| wkbMultiPointZM          |                                                                                                                                                 |
| wkbMultiLineStringZM     |                                                                                                                                                 |
| wkbMultiPolygonZM        |                                                                                                                                                 |
| wkbGeometryCollectionZM  |                                                                                                                                                 |
| wkbCircularStringZM      |                                                                                                                                                 |
| wkbCompoundCurveZM       |                                                                                                                                                 |
| wkbCurvePolygonZM        |                                                                                                                                                 |
| wkbMultiCurveZM          |                                                                                                                                                 |
| wkbMultiSurfaceZM        |                                                                                                                                                 |
| wkbCurveZM               |                                                                                                                                                 |
| wkbSurfaceZM             |                                                                                                                                                 |
| wkbPolyhedralSurfaceZM   | ISO SQL/MM Part 3. Reserved in GDAL >= 2.1 but not yet implemented                                                                              |
| wkbTINZM                 |                                                                                                                                                 |
| wkbTriangleZM            |                                                                                                                                                 |
| wkbPoint25D              | 2.5D extension as per 99-402                                                                                                                    |
| wkbLineString25D         |                                                                                                                                                 |
| wkbPolygon25D            |                                                                                                                                                 |
| wkbMultiPoint25D         |                                                                                                                                                 |
| wkbMultiLineString25D    |                                                                                                                                                 |
| wkbMultiPolygon25D       |                                                                                                                                                 |
| wkbGeometryCollection25D |                                                                                                                                                 |
"""
@cenum OGRwkbGeometryType::UInt32 begin
    wkbUnknown = 0
    wkbPoint = 1
    wkbLineString = 2
    wkbPolygon = 3
    wkbMultiPoint = 4
    wkbMultiLineString = 5
    wkbMultiPolygon = 6
    wkbGeometryCollection = 7
    wkbCircularString = 8
    wkbCompoundCurve = 9
    wkbCurvePolygon = 10
    wkbMultiCurve = 11
    wkbMultiSurface = 12
    wkbCurve = 13
    wkbSurface = 14
    wkbPolyhedralSurface = 15
    wkbTIN = 16
    wkbTriangle = 17
    wkbNone = 100
    wkbLinearRing = 101
    wkbCircularStringZ = 1008
    wkbCompoundCurveZ = 1009
    wkbCurvePolygonZ = 1010
    wkbMultiCurveZ = 1011
    wkbMultiSurfaceZ = 1012
    wkbCurveZ = 1013
    wkbSurfaceZ = 1014
    wkbPolyhedralSurfaceZ = 1015
    wkbTINZ = 1016
    wkbTriangleZ = 1017
    wkbPointM = 2001
    wkbLineStringM = 2002
    wkbPolygonM = 2003
    wkbMultiPointM = 2004
    wkbMultiLineStringM = 2005
    wkbMultiPolygonM = 2006
    wkbGeometryCollectionM = 2007
    wkbCircularStringM = 2008
    wkbCompoundCurveM = 2009
    wkbCurvePolygonM = 2010
    wkbMultiCurveM = 2011
    wkbMultiSurfaceM = 2012
    wkbCurveM = 2013
    wkbSurfaceM = 2014
    wkbPolyhedralSurfaceM = 2015
    wkbTINM = 2016
    wkbTriangleM = 2017
    wkbPointZM = 3001
    wkbLineStringZM = 3002
    wkbPolygonZM = 3003
    wkbMultiPointZM = 3004
    wkbMultiLineStringZM = 3005
    wkbMultiPolygonZM = 3006
    wkbGeometryCollectionZM = 3007
    wkbCircularStringZM = 3008
    wkbCompoundCurveZM = 3009
    wkbCurvePolygonZM = 3010
    wkbMultiCurveZM = 3011
    wkbMultiSurfaceZM = 3012
    wkbCurveZM = 3013
    wkbSurfaceZM = 3014
    wkbPolyhedralSurfaceZM = 3015
    wkbTINZM = 3016
    wkbTriangleZM = 3017
    wkbPoint25D = 0x0000000080000001
    wkbLineString25D = 0x0000000080000002
    wkbPolygon25D = 0x0000000080000003
    wkbMultiPoint25D = 0x0000000080000004
    wkbMultiLineString25D = 0x0000000080000005
    wkbMultiPolygon25D = 0x0000000080000006
    wkbGeometryCollection25D = 0x0000000080000007
end

function gdaldatasetcreatelayer(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALDatasetCreateLayer, libgdal), OGRLayerH, (GDALDatasetH, Cstring, OGRSpatialReferenceH, OGRwkbGeometryType, CSLConstList), arg1, arg2, arg3, arg4, arg5))
end

function gdaldatasetcopylayer(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALDatasetCopyLayer, libgdal), OGRLayerH, (GDALDatasetH, OGRLayerH, Cstring, CSLConstList), arg1, arg2, arg3, arg4))
end

function gdaldatasetresetreading(arg1)
    aftercare(ccall((:GDALDatasetResetReading, libgdal), Cvoid, (GDALDatasetH,), arg1))
end

"""Opaque type for a feature (OGRFeature) """
const OGRFeatureH = Ptr{Cvoid}

function gdaldatasetgetnextfeature(hDS, phBelongingLayer, pdfProgressPct, pfnProgress, pProgressData)
    aftercare(ccall((:GDALDatasetGetNextFeature, libgdal), OGRFeatureH, (GDALDatasetH, Ptr{OGRLayerH}, Ptr{Cdouble}, GDALProgressFunc, Ptr{Cvoid}), hDS, phBelongingLayer, pdfProgressPct, pfnProgress, pProgressData))
end

function gdaldatasettestcapability(arg1, arg2)
    aftercare(ccall((:GDALDatasetTestCapability, libgdal), Cint, (GDALDatasetH, Cstring), arg1, arg2))
end

"""Opaque type for a geometry """
const OGRGeometryH = Ptr{Cvoid}

function gdaldatasetexecutesql(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALDatasetExecuteSQL, libgdal), OGRLayerH, (GDALDatasetH, Cstring, OGRGeometryH, Cstring), arg1, arg2, arg3, arg4))
end

function gdaldatasetabortsql(arg1)
    aftercare(ccall((:GDALDatasetAbortSQL, libgdal), OGRErr, (GDALDatasetH,), arg1))
end

function gdaldatasetreleaseresultset(arg1, arg2)
    aftercare(ccall((:GDALDatasetReleaseResultSet, libgdal), Cvoid, (GDALDatasetH, OGRLayerH), arg1, arg2))
end

"""Opaque type for a style table (OGRStyleTable) """
const OGRStyleTableH = Ptr{Cvoid}

function gdaldatasetgetstyletable(arg1)
    aftercare(ccall((:GDALDatasetGetStyleTable, libgdal), OGRStyleTableH, (GDALDatasetH,), arg1))
end

function gdaldatasetsetstyletabledirectly(arg1, arg2)
    aftercare(ccall((:GDALDatasetSetStyleTableDirectly, libgdal), Cvoid, (GDALDatasetH, OGRStyleTableH), arg1, arg2))
end

function gdaldatasetsetstyletable(arg1, arg2)
    aftercare(ccall((:GDALDatasetSetStyleTable, libgdal), Cvoid, (GDALDatasetH, OGRStyleTableH), arg1, arg2))
end

function gdaldatasetstarttransaction(hDS, bForce)
    aftercare(ccall((:GDALDatasetStartTransaction, libgdal), OGRErr, (GDALDatasetH, Cint), hDS, bForce))
end

function gdaldatasetcommittransaction(hDS)
    aftercare(ccall((:GDALDatasetCommitTransaction, libgdal), OGRErr, (GDALDatasetH,), hDS))
end

function gdaldatasetrollbacktransaction(hDS)
    aftercare(ccall((:GDALDatasetRollbackTransaction, libgdal), OGRErr, (GDALDatasetH,), hDS))
end

function gdaldatasetclearstatistics(hDS)
    aftercare(ccall((:GDALDatasetClearStatistics, libgdal), Cvoid, (GDALDatasetH,), hDS))
end

# typedef CPLErr ( * GDALDerivedPixelFunc ) ( void * * papoSources , int nSources , void * pData , int nBufXSize , int nBufYSize , GDALDataType eSrcType , GDALDataType eBufType , int nPixelSpace , int nLineSpace )
"""
Type of functions to pass to [`GDALAddDerivedBandPixelFunc`](@ref). 

\\since GDAL 2.2 
"""
const GDALDerivedPixelFunc = Ptr{Cvoid}

function gdalgetrasterdatatype(arg1)
    aftercare(ccall((:GDALGetRasterDataType, libgdal), GDALDataType, (GDALRasterBandH,), arg1))
end

function gdalgetblocksize(arg1, pnXSize, pnYSize)
    aftercare(ccall((:GDALGetBlockSize, libgdal), Cvoid, (GDALRasterBandH, Ptr{Cint}, Ptr{Cint}), arg1, pnXSize, pnYSize))
end

function gdalgetactualblocksize(arg1, nXBlockOff, nYBlockOff, pnXValid, pnYValid)
    aftercare(ccall((:GDALGetActualBlockSize, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cint}, Ptr{Cint}), arg1, nXBlockOff, nYBlockOff, pnXValid, pnYValid))
end

function gdalrasteradviseread(hRB, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, papszOptions)
    aftercare(ccall((:GDALRasterAdviseRead, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, CSLConstList), hRB, nDSXOff, nDSYOff, nDSXSize, nDSYSize, nBXSize, nBYSize, eBDataType, papszOptions))
end

function gdalrasterio(hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace)
    aftercare(ccall((:GDALRasterIO, libgdal), CPLErr, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Cint), hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace))
end

function gdalrasterioex(hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace, psExtraArg)
    aftercare(ccall((:GDALRasterIOEx, libgdal), CPLErr, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{Cvoid}, Cint, Cint, GDALDataType, GSpacing, GSpacing, Ptr{GDALRasterIOExtraArg}), hRBand, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize, pBuffer, nBXSize, nBYSize, eBDataType, nPixelSpace, nLineSpace, psExtraArg))
end

function gdalreadblock(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALReadBlock, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

function gdalwriteblock(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALWriteBlock, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

function gdalgetrasterbandxsize(arg1)
    aftercare(ccall((:GDALGetRasterBandXSize, libgdal), Cint, (GDALRasterBandH,), arg1))
end

function gdalgetrasterbandysize(arg1)
    aftercare(ccall((:GDALGetRasterBandYSize, libgdal), Cint, (GDALRasterBandH,), arg1))
end

function gdalgetrasteraccess(arg1)
    aftercare(ccall((:GDALGetRasterAccess, libgdal), GDALAccess, (GDALRasterBandH,), arg1))
end

function gdalgetbandnumber(arg1)
    aftercare(ccall((:GDALGetBandNumber, libgdal), Cint, (GDALRasterBandH,), arg1))
end

function gdalgetbanddataset(arg1)
    aftercare(ccall((:GDALGetBandDataset, libgdal), GDALDatasetH, (GDALRasterBandH,), arg1))
end

function gdalgetrastercolorinterpretation(arg1)
    aftercare(ccall((:GDALGetRasterColorInterpretation, libgdal), GDALColorInterp, (GDALRasterBandH,), arg1))
end

function gdalsetrastercolorinterpretation(arg1, arg2)
    aftercare(ccall((:GDALSetRasterColorInterpretation, libgdal), CPLErr, (GDALRasterBandH, GDALColorInterp), arg1, arg2))
end

function gdalgetrastercolortable(arg1)
    aftercare(ccall((:GDALGetRasterColorTable, libgdal), GDALColorTableH, (GDALRasterBandH,), arg1))
end

function gdalsetrastercolortable(arg1, arg2)
    aftercare(ccall((:GDALSetRasterColorTable, libgdal), CPLErr, (GDALRasterBandH, GDALColorTableH), arg1, arg2))
end

function gdalhasarbitraryoverviews(arg1)
    aftercare(ccall((:GDALHasArbitraryOverviews, libgdal), Cint, (GDALRasterBandH,), arg1))
end

function gdalgetoverviewcount(arg1)
    aftercare(ccall((:GDALGetOverviewCount, libgdal), Cint, (GDALRasterBandH,), arg1))
end

function gdalgetoverview(arg1, arg2)
    aftercare(ccall((:GDALGetOverview, libgdal), GDALRasterBandH, (GDALRasterBandH, Cint), arg1, arg2))
end

function gdalgetrasternodatavalue(arg1, arg2)
    aftercare(ccall((:GDALGetRasterNoDataValue, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, arg2))
end

function gdalsetrasternodatavalue(arg1, arg2)
    aftercare(ccall((:GDALSetRasterNoDataValue, libgdal), CPLErr, (GDALRasterBandH, Cdouble), arg1, arg2))
end

function gdaldeleterasternodatavalue(arg1)
    aftercare(ccall((:GDALDeleteRasterNoDataValue, libgdal), CPLErr, (GDALRasterBandH,), arg1))
end

function gdalgetrastercategorynames(arg1)
    aftercare(ccall((:GDALGetRasterCategoryNames, libgdal), Ptr{Cstring}, (GDALRasterBandH,), arg1))
end

function gdalsetrastercategorynames(arg1, arg2)
    aftercare(ccall((:GDALSetRasterCategoryNames, libgdal), CPLErr, (GDALRasterBandH, CSLConstList), arg1, arg2))
end

function gdalgetrasterminimum(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterMinimum, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

function gdalgetrastermaximum(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterMaximum, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

function gdalgetrasterstatistics(arg1, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev)
    aftercare(ccall((:GDALGetRasterStatistics, libgdal), CPLErr, (GDALRasterBandH, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), arg1, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev))
end

function gdalcomputerasterstatistics(arg1, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pfnProgress, pProgressData)
    aftercare(ccall((:GDALComputeRasterStatistics, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, GDALProgressFunc, Ptr{Cvoid}), arg1, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pfnProgress, pProgressData))
end

function gdalsetrasterstatistics(hBand, dfMin, dfMax, dfMean, dfStdDev)
    aftercare(ccall((:GDALSetRasterStatistics, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cdouble, Cdouble), hBand, dfMin, dfMax, dfMean, dfStdDev))
end

function gdalrasterbandasmdarray(arg1)
    aftercare(ccall((:GDALRasterBandAsMDArray, libgdal), GDALMDArrayH, (GDALRasterBandH,), arg1))
end

function gdalgetrasterunittype(arg1)
    aftercare(ccall((:GDALGetRasterUnitType, libgdal), Cstring, (GDALRasterBandH,), arg1), false)
end

function gdalsetrasterunittype(hBand, pszNewValue)
    aftercare(ccall((:GDALSetRasterUnitType, libgdal), CPLErr, (GDALRasterBandH, Cstring), hBand, pszNewValue))
end

function gdalgetrasteroffset(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterOffset, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

function gdalsetrasteroffset(hBand, dfNewOffset)
    aftercare(ccall((:GDALSetRasterOffset, libgdal), CPLErr, (GDALRasterBandH, Cdouble), hBand, dfNewOffset))
end

function gdalgetrasterscale(arg1, pbSuccess)
    aftercare(ccall((:GDALGetRasterScale, libgdal), Cdouble, (GDALRasterBandH, Ptr{Cint}), arg1, pbSuccess))
end

function gdalsetrasterscale(hBand, dfNewOffset)
    aftercare(ccall((:GDALSetRasterScale, libgdal), CPLErr, (GDALRasterBandH, Cdouble), hBand, dfNewOffset))
end

function gdalcomputerasterminmax(hBand, bApproxOK, adfMinMax)
    aftercare(ccall((:GDALComputeRasterMinMax, libgdal), Cvoid, (GDALRasterBandH, Cint, Ptr{Cdouble}), hBand, bApproxOK, adfMinMax))
end

function gdalflushrastercache(hBand)
    aftercare(ccall((:GDALFlushRasterCache, libgdal), CPLErr, (GDALRasterBandH,), hBand))
end

function gdalgetrasterhistogram(hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetRasterHistogram, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cint}, Cint, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData))
end

function gdalgetrasterhistogramex(hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetRasterHistogramEx, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{GUIntBig}, Cint, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, dfMin, dfMax, nBuckets, panHistogram, bIncludeOutOfRange, bApproxOK, pfnProgress, pProgressData))
end

function gdalgetdefaulthistogram(hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetDefaultHistogram, libgdal), CPLErr, (GDALRasterBandH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cint}}, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData))
end

function gdalgetdefaulthistogramex(hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGetDefaultHistogramEx, libgdal), CPLErr, (GDALRasterBandH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{GUIntBig}}, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram, bForce, pfnProgress, pProgressData))
end

function gdalsetdefaulthistogram(hBand, dfMin, dfMax, nBuckets, panHistogram)
    aftercare(ccall((:GDALSetDefaultHistogram, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cint}), hBand, dfMin, dfMax, nBuckets, panHistogram))
end

function gdalsetdefaulthistogramex(hBand, dfMin, dfMax, nBuckets, panHistogram)
    aftercare(ccall((:GDALSetDefaultHistogramEx, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{GUIntBig}), hBand, dfMin, dfMax, nBuckets, panHistogram))
end

function gdalgetrandomrastersample(arg1, arg2, arg3)
    aftercare(ccall((:GDALGetRandomRasterSample, libgdal), Cint, (GDALRasterBandH, Cint, Ptr{Cfloat}), arg1, arg2, arg3))
end

function gdalgetrastersampleoverview(arg1, arg2)
    aftercare(ccall((:GDALGetRasterSampleOverview, libgdal), GDALRasterBandH, (GDALRasterBandH, Cint), arg1, arg2))
end

function gdalgetrastersampleoverviewex(arg1, arg2)
    aftercare(ccall((:GDALGetRasterSampleOverviewEx, libgdal), GDALRasterBandH, (GDALRasterBandH, GUIntBig), arg1, arg2))
end

function gdalfillraster(hBand, dfRealValue, dfImaginaryValue)
    aftercare(ccall((:GDALFillRaster, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble), hBand, dfRealValue, dfImaginaryValue))
end

function gdalcomputebandstats(hBand, nSampleStep, pdfMean, pdfStdDev, pfnProgress, pProgressData)
    aftercare(ccall((:GDALComputeBandStats, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, GDALProgressFunc, Ptr{Cvoid}), hBand, nSampleStep, pdfMean, pdfStdDev, pfnProgress, pProgressData))
end

function gdaloverviewmagnitudecorrection(hBaseBand, nOverviewCount, pahOverviews, pfnProgress, pProgressData)
    aftercare(ccall((:GDALOverviewMagnitudeCorrection, libgdal), CPLErr, (GDALRasterBandH, Cint, Ptr{GDALRasterBandH}, GDALProgressFunc, Ptr{Cvoid}), hBaseBand, nOverviewCount, pahOverviews, pfnProgress, pProgressData))
end

function gdalgetdefaultrat(hBand)
    aftercare(ccall((:GDALGetDefaultRAT, libgdal), GDALRasterAttributeTableH, (GDALRasterBandH,), hBand))
end

function gdalsetdefaultrat(arg1, arg2)
    aftercare(ccall((:GDALSetDefaultRAT, libgdal), CPLErr, (GDALRasterBandH, GDALRasterAttributeTableH), arg1, arg2))
end

function gdaladdderivedbandpixelfunc(pszName, pfnPixelFunc)
    aftercare(ccall((:GDALAddDerivedBandPixelFunc, libgdal), CPLErr, (Cstring, GDALDerivedPixelFunc), pszName, pfnPixelFunc))
end

function gdalgetmaskband(hBand)
    aftercare(ccall((:GDALGetMaskBand, libgdal), GDALRasterBandH, (GDALRasterBandH,), hBand))
end

function gdalgetmaskflags(hBand)
    aftercare(ccall((:GDALGetMaskFlags, libgdal), Cint, (GDALRasterBandH,), hBand))
end

function gdalcreatemaskband(hBand, nFlags)
    aftercare(ccall((:GDALCreateMaskBand, libgdal), CPLErr, (GDALRasterBandH, Cint), hBand, nFlags))
end

function gdalgetdatacoveragestatus(hBand, nXOff, nYOff, nXSize, nYSize, nMaskFlagStop, pdfDataPct)
    aftercare(ccall((:GDALGetDataCoverageStatus, libgdal), Cint, (GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Ptr{Cdouble}), hBand, nXOff, nYOff, nXSize, nYSize, nMaskFlagStop, pdfDataPct))
end

function gdalargetnextupdatedregion(hARIO, dfTimeout, pnXBufOff, pnYBufOff, pnXBufSize, pnYBufSize)
    aftercare(ccall((:GDALARGetNextUpdatedRegion, libgdal), GDALAsyncStatusType, (GDALAsyncReaderH, Cdouble, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), hARIO, dfTimeout, pnXBufOff, pnYBufOff, pnXBufSize, pnYBufSize))
end

function gdalarlockbuffer(hARIO, dfTimeout)
    aftercare(ccall((:GDALARLockBuffer, libgdal), Cint, (GDALAsyncReaderH, Cdouble), hARIO, dfTimeout))
end

function gdalarunlockbuffer(hARIO)
    aftercare(ccall((:GDALARUnlockBuffer, libgdal), Cvoid, (GDALAsyncReaderH,), hARIO))
end

function gdalgeneralcmdlineprocessor(nArgc, ppapszArgv, nOptions)
    aftercare(ccall((:GDALGeneralCmdLineProcessor, libgdal), Cint, (Cint, Ptr{Ptr{Cstring}}, Cint), nArgc, ppapszArgv, nOptions))
end

function gdalswapwords(pData, nWordSize, nWordCount, nWordSkip)
    aftercare(ccall((:GDALSwapWords, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Cint, Cint), pData, nWordSize, nWordCount, nWordSkip))
end

function gdalswapwordsex(pData, nWordSize, nWordCount, nWordSkip)
    aftercare(ccall((:GDALSwapWordsEx, libgdal), Cvoid, (Ptr{Cvoid}, Cint, Csize_t, Cint), pData, nWordSize, nWordCount, nWordSkip))
end

function gdalcopywords(pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount)
    aftercare(ccall((:GDALCopyWords, libgdal), Cvoid, (Ptr{Cvoid}, GDALDataType, Cint, Ptr{Cvoid}, GDALDataType, Cint, Cint), pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount))
end

function gdalcopywords64(pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount)
    aftercare(ccall((:GDALCopyWords64, libgdal), Cvoid, (Ptr{Cvoid}, GDALDataType, Cint, Ptr{Cvoid}, GDALDataType, Cint, GPtrDiff_t), pSrcData, eSrcType, nSrcPixelOffset, pDstData, eDstType, nDstPixelOffset, nWordCount))
end

function gdalcopybits(pabySrcData, nSrcOffset, nSrcStep, pabyDstData, nDstOffset, nDstStep, nBitCount, nStepCount)
    aftercare(ccall((:GDALCopyBits, libgdal), Cvoid, (Ptr{GByte}, Cint, Cint, Ptr{GByte}, Cint, Cint, Cint, Cint), pabySrcData, nSrcOffset, nSrcStep, pabyDstData, nDstOffset, nDstStep, nBitCount, nStepCount))
end

function gdalloadworldfile(arg1, arg2)
    aftercare(ccall((:GDALLoadWorldFile, libgdal), Cint, (Cstring, Ptr{Cdouble}), arg1, arg2))
end

function gdalreadworldfile(arg1, arg2, arg3)
    aftercare(ccall((:GDALReadWorldFile, libgdal), Cint, (Cstring, Cstring, Ptr{Cdouble}), arg1, arg2, arg3))
end

function gdalwriteworldfile(arg1, arg2, arg3)
    aftercare(ccall((:GDALWriteWorldFile, libgdal), Cint, (Cstring, Cstring, Ptr{Cdouble}), arg1, arg2, arg3))
end

function gdalloadtabfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALLoadTabFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

function gdalreadtabfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALReadTabFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

function gdalloadozimapfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALLoadOziMapFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

function gdalreadozimapfile(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALReadOziMapFile, libgdal), Cint, (Cstring, Ptr{Cdouble}, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}), arg1, arg2, arg3, arg4, arg5))
end

function gdaldectodms(arg1, arg2, arg3)
    aftercare(ccall((:GDALDecToDMS, libgdal), Cstring, (Cdouble, Cstring, Cint), arg1, arg2, arg3), false)
end

function gdalpackeddmstodec(arg1)
    aftercare(ccall((:GDALPackedDMSToDec, libgdal), Cdouble, (Cdouble,), arg1))
end

function gdaldectopackeddms(arg1)
    aftercare(ccall((:GDALDecToPackedDMS, libgdal), Cdouble, (Cdouble,), arg1))
end

"""
    GDALRPCInfo

Structure to store Rational Polynomial Coefficients / Rigorous Projection Model. See http://geotiff.maptools.org/rpc\\_prop.html 

| Field                 | Note                                    |
| :-------------------- | :-------------------------------------- |
| dfLINE\\_OFF          | Line offset                             |
| dfSAMP\\_OFF          | Sample/Pixel offset                     |
| dfLAT\\_OFF           | Latitude offset                         |
| dfLONG\\_OFF          | Longitude offset                        |
| dfHEIGHT\\_OFF        | Height offset                           |
| dfLINE\\_SCALE        | Line scale                              |
| dfSAMP\\_SCALE        | Sample/Pixel scale                      |
| dfLAT\\_SCALE         | Latitude scale                          |
| dfLONG\\_SCALE        | Longitude scale                         |
| dfHEIGHT\\_SCALE      | Height scale                            |
| adfLINE\\_NUM\\_COEFF | Line Numerator Coefficients             |
| adfLINE\\_DEN\\_COEFF | Line Denominator Coefficients           |
| adfSAMP\\_NUM\\_COEFF | Sample/Pixel Numerator Coefficients     |
| adfSAMP\\_DEN\\_COEFF | Sample/Pixel Denominator Coefficients   |
| dfMIN\\_LONG          | Minimum longitude                       |
| dfMIN\\_LAT           | Minimum latitude                        |
| dfMAX\\_LONG          | Maximum longitude                       |
| dfMAX\\_LAT           | Maximum latitude                        |
"""
struct GDALRPCInfo
    dfLINE_OFF::Cdouble
    dfSAMP_OFF::Cdouble
    dfLAT_OFF::Cdouble
    dfLONG_OFF::Cdouble
    dfHEIGHT_OFF::Cdouble
    dfLINE_SCALE::Cdouble
    dfSAMP_SCALE::Cdouble
    dfLAT_SCALE::Cdouble
    dfLONG_SCALE::Cdouble
    dfHEIGHT_SCALE::Cdouble
    adfLINE_NUM_COEFF::NTuple{20, Cdouble}
    adfLINE_DEN_COEFF::NTuple{20, Cdouble}
    adfSAMP_NUM_COEFF::NTuple{20, Cdouble}
    adfSAMP_DEN_COEFF::NTuple{20, Cdouble}
    dfMIN_LONG::Cdouble
    dfMIN_LAT::Cdouble
    dfMAX_LONG::Cdouble
    dfMAX_LAT::Cdouble
end

function gdalextractrpcinfo(arg1, arg2)
    aftercare(ccall((:GDALExtractRPCInfo, libgdal), Cint, (CSLConstList, Ptr{GDALRPCInfo}), arg1, arg2))
end

"""
    GDALColorEntry

Color tuple 

| Field | Note                           |
| :---- | :----------------------------- |
| c1    | gray, red, cyan or hue         |
| c2    | green, magenta, or lightness   |
| c3    | blue, yellow, or saturation    |
| c4    | alpha or blackband             |
"""
struct GDALColorEntry
    c1::Cshort
    c2::Cshort
    c3::Cshort
    c4::Cshort
end

function gdalcreatecolortable(arg1)
    aftercare(ccall((:GDALCreateColorTable, libgdal), GDALColorTableH, (GDALPaletteInterp,), arg1))
end

function gdaldestroycolortable(arg1)
    aftercare(ccall((:GDALDestroyColorTable, libgdal), Cvoid, (GDALColorTableH,), arg1))
end

function gdalclonecolortable(arg1)
    aftercare(ccall((:GDALCloneColorTable, libgdal), GDALColorTableH, (GDALColorTableH,), arg1))
end

function gdalgetpaletteinterpretation(arg1)
    aftercare(ccall((:GDALGetPaletteInterpretation, libgdal), GDALPaletteInterp, (GDALColorTableH,), arg1))
end

function gdalgetcolorentrycount(arg1)
    aftercare(ccall((:GDALGetColorEntryCount, libgdal), Cint, (GDALColorTableH,), arg1))
end

function gdalgetcolorentry(arg1, arg2)
    aftercare(ccall((:GDALGetColorEntry, libgdal), Ptr{GDALColorEntry}, (GDALColorTableH, Cint), arg1, arg2))
end

function gdalgetcolorentryasrgb(arg1, arg2, arg3)
    aftercare(ccall((:GDALGetColorEntryAsRGB, libgdal), Cint, (GDALColorTableH, Cint, Ptr{GDALColorEntry}), arg1, arg2, arg3))
end

function gdalsetcolorentry(arg1, arg2, arg3)
    aftercare(ccall((:GDALSetColorEntry, libgdal), Cvoid, (GDALColorTableH, Cint, Ptr{GDALColorEntry}), arg1, arg2, arg3))
end

function gdalcreatecolorramp(hTable, nStartIndex, psStartColor, nEndIndex, psEndColor)
    aftercare(ccall((:GDALCreateColorRamp, libgdal), Cvoid, (GDALColorTableH, Cint, Ptr{GDALColorEntry}, Cint, Ptr{GDALColorEntry}), hTable, nStartIndex, psStartColor, nEndIndex, psEndColor))
end

"""
    GDALRATFieldType

Field type of raster attribute table 

| Enumerator    | Note                            |
| :------------ | :------------------------------ |
| GFT\\_Integer | Integer field                   |
| GFT\\_Real    | Floating point (double) field   |
| GFT\\_String  | String field                    |
"""
@cenum GDALRATFieldType::UInt32 begin
    GFT_Integer = 0
    GFT_Real = 1
    GFT_String = 2
end

"""
    GDALRATFieldUsage

Field usage of raster attribute table 

| Enumerator       | Note                                                       |
| :--------------- | :--------------------------------------------------------- |
| GFU\\_Generic    | General purpose field.                                     |
| GFU\\_PixelCount | Histogram pixel count                                      |
| GFU\\_Name       | Class name                                                 |
| GFU\\_Min        | Class range minimum                                        |
| GFU\\_Max        | Class range maximum                                        |
| GFU\\_MinMax     | Class value (min=max)                                      |
| GFU\\_Red        | Red class color (0-255)                                    |
| GFU\\_Green      | Green class color (0-255)                                  |
| GFU\\_Blue       | Blue class color (0-255)                                   |
| GFU\\_Alpha      | Alpha (0=transparent,255=opaque)                           |
| GFU\\_RedMin     | Color Range Red Minimum                                    |
| GFU\\_GreenMin   | Color Range Green Minimum                                  |
| GFU\\_BlueMin    | Color Range Blue Minimum                                   |
| GFU\\_AlphaMin   | Color Range Alpha Minimum                                  |
| GFU\\_RedMax     | Color Range Red Maximum                                    |
| GFU\\_GreenMax   | Color Range Green Maximum                                  |
| GFU\\_BlueMax    | Color Range Blue Maximum                                   |
| GFU\\_AlphaMax   | Color Range Alpha Maximum                                  |
| GFU\\_MaxCount   | Maximum GFU value (equals to GFU\\_AlphaMax+1 currently)   |
"""
@cenum GDALRATFieldUsage::UInt32 begin
    GFU_Generic = 0
    GFU_PixelCount = 1
    GFU_Name = 2
    GFU_Min = 3
    GFU_Max = 4
    GFU_MinMax = 5
    GFU_Red = 6
    GFU_Green = 7
    GFU_Blue = 8
    GFU_Alpha = 9
    GFU_RedMin = 10
    GFU_GreenMin = 11
    GFU_BlueMin = 12
    GFU_AlphaMin = 13
    GFU_RedMax = 14
    GFU_GreenMax = 15
    GFU_BlueMax = 16
    GFU_AlphaMax = 17
    GFU_MaxCount = 18
end

"""
    GDALRATTableType

RAT table type (thematic or athematic) 

\\since GDAL 2.4

| Enumerator       | Note                   |
| :--------------- | :--------------------- |
| GRTT\\_THEMATIC  | Thematic table type    |
| GRTT\\_ATHEMATIC | Athematic table type   |
"""
@cenum GDALRATTableType::UInt32 begin
    GRTT_THEMATIC = 0
    GRTT_ATHEMATIC = 1
end

function gdalcreaterasterattributetable()
    aftercare(ccall((:GDALCreateRasterAttributeTable, libgdal), GDALRasterAttributeTableH, ()))
end

function gdaldestroyrasterattributetable(arg1)
    aftercare(ccall((:GDALDestroyRasterAttributeTable, libgdal), Cvoid, (GDALRasterAttributeTableH,), arg1))
end

function gdalratgetcolumncount(arg1)
    aftercare(ccall((:GDALRATGetColumnCount, libgdal), Cint, (GDALRasterAttributeTableH,), arg1))
end

function gdalratgetnameofcol(arg1, arg2)
    aftercare(ccall((:GDALRATGetNameOfCol, libgdal), Cstring, (GDALRasterAttributeTableH, Cint), arg1, arg2), false)
end

function gdalratgetusageofcol(arg1, arg2)
    aftercare(ccall((:GDALRATGetUsageOfCol, libgdal), GDALRATFieldUsage, (GDALRasterAttributeTableH, Cint), arg1, arg2))
end

function gdalratgettypeofcol(arg1, arg2)
    aftercare(ccall((:GDALRATGetTypeOfCol, libgdal), GDALRATFieldType, (GDALRasterAttributeTableH, Cint), arg1, arg2))
end

function gdalratgetcolofusage(arg1, arg2)
    aftercare(ccall((:GDALRATGetColOfUsage, libgdal), Cint, (GDALRasterAttributeTableH, GDALRATFieldUsage), arg1, arg2))
end

function gdalratgetrowcount(arg1)
    aftercare(ccall((:GDALRATGetRowCount, libgdal), Cint, (GDALRasterAttributeTableH,), arg1))
end

function gdalratgetvalueasstring(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetValueAsString, libgdal), Cstring, (GDALRasterAttributeTableH, Cint, Cint), arg1, arg2, arg3), false)
end

function gdalratgetvalueasint(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetValueAsInt, libgdal), Cint, (GDALRasterAttributeTableH, Cint, Cint), arg1, arg2, arg3))
end

function gdalratgetvalueasdouble(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetValueAsDouble, libgdal), Cdouble, (GDALRasterAttributeTableH, Cint, Cint), arg1, arg2, arg3))
end

function gdalratsetvalueasstring(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATSetValueAsString, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint, Cint, Cstring), arg1, arg2, arg3, arg4))
end

function gdalratsetvalueasint(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATSetValueAsInt, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint, Cint, Cint), arg1, arg2, arg3, arg4))
end

function gdalratsetvalueasdouble(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATSetValueAsDouble, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint, Cint, Cdouble), arg1, arg2, arg3, arg4))
end

function gdalratchangesarewrittentofile(hRAT)
    aftercare(ccall((:GDALRATChangesAreWrittenToFile, libgdal), Cint, (GDALRasterAttributeTableH,), hRAT))
end

function gdalratvaluesioasdouble(hRAT, eRWFlag, iField, iStartRow, iLength, pdfData)
    aftercare(ccall((:GDALRATValuesIOAsDouble, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRWFlag, Cint, Cint, Cint, Ptr{Cdouble}), hRAT, eRWFlag, iField, iStartRow, iLength, pdfData))
end

function gdalratvaluesioasinteger(hRAT, eRWFlag, iField, iStartRow, iLength, pnData)
    aftercare(ccall((:GDALRATValuesIOAsInteger, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRWFlag, Cint, Cint, Cint, Ptr{Cint}), hRAT, eRWFlag, iField, iStartRow, iLength, pnData))
end

function gdalratvaluesioasstring(hRAT, eRWFlag, iField, iStartRow, iLength, papszStrList)
    aftercare(ccall((:GDALRATValuesIOAsString, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRWFlag, Cint, Cint, Cint, CSLConstList), hRAT, eRWFlag, iField, iStartRow, iLength, papszStrList))
end

function gdalratsetrowcount(arg1, arg2)
    aftercare(ccall((:GDALRATSetRowCount, libgdal), Cvoid, (GDALRasterAttributeTableH, Cint), arg1, arg2))
end

function gdalratcreatecolumn(arg1, arg2, arg3, arg4)
    aftercare(ccall((:GDALRATCreateColumn, libgdal), CPLErr, (GDALRasterAttributeTableH, Cstring, GDALRATFieldType, GDALRATFieldUsage), arg1, arg2, arg3, arg4))
end

function gdalratsetlinearbinning(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATSetLinearBinning, libgdal), CPLErr, (GDALRasterAttributeTableH, Cdouble, Cdouble), arg1, arg2, arg3))
end

function gdalratgetlinearbinning(arg1, arg2, arg3)
    aftercare(ccall((:GDALRATGetLinearBinning, libgdal), Cint, (GDALRasterAttributeTableH, Ptr{Cdouble}, Ptr{Cdouble}), arg1, arg2, arg3))
end

function gdalratsettabletype(hRAT, eInTableType)
    aftercare(ccall((:GDALRATSetTableType, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALRATTableType), hRAT, eInTableType))
end

function gdalratgettabletype(hRAT)
    aftercare(ccall((:GDALRATGetTableType, libgdal), GDALRATTableType, (GDALRasterAttributeTableH,), hRAT))
end

function gdalratinitializefromcolortable(arg1, arg2)
    aftercare(ccall((:GDALRATInitializeFromColorTable, libgdal), CPLErr, (GDALRasterAttributeTableH, GDALColorTableH), arg1, arg2))
end

function gdalrattranslatetocolortable(arg1, nEntryCount)
    aftercare(ccall((:GDALRATTranslateToColorTable, libgdal), GDALColorTableH, (GDALRasterAttributeTableH, Cint), arg1, nEntryCount))
end

function gdalratdumpreadable(arg1, arg2)
    aftercare(ccall((:GDALRATDumpReadable, libgdal), Cvoid, (GDALRasterAttributeTableH, Ptr{Libc.FILE}), arg1, arg2))
end

function gdalratclone(arg1)
    aftercare(ccall((:GDALRATClone, libgdal), GDALRasterAttributeTableH, (GDALRasterAttributeTableH,), arg1))
end

function gdalratserializejson(arg1)
    aftercare(ccall((:GDALRATSerializeJSON, libgdal), Ptr{Cvoid}, (GDALRasterAttributeTableH,), arg1))
end

function gdalratgetrowofvalue(arg1, arg2)
    aftercare(ccall((:GDALRATGetRowOfValue, libgdal), Cint, (GDALRasterAttributeTableH, Cdouble), arg1, arg2))
end

function gdalratremovestatistics(arg1)
    aftercare(ccall((:GDALRATRemoveStatistics, libgdal), Cvoid, (GDALRasterAttributeTableH,), arg1))
end

function gdalsetcachemax(nBytes)
    aftercare(ccall((:GDALSetCacheMax, libgdal), Cvoid, (Cint,), nBytes))
end

function gdalgetcachemax()
    aftercare(ccall((:GDALGetCacheMax, libgdal), Cint, ()))
end

function gdalgetcacheused()
    aftercare(ccall((:GDALGetCacheUsed, libgdal), Cint, ()))
end

function gdalsetcachemax64(nBytes)
    aftercare(ccall((:GDALSetCacheMax64, libgdal), Cvoid, (GIntBig,), nBytes))
end

function gdalgetcachemax64()
    aftercare(ccall((:GDALGetCacheMax64, libgdal), GIntBig, ()))
end

function gdalgetcacheused64()
    aftercare(ccall((:GDALGetCacheUsed64, libgdal), GIntBig, ()))
end

function gdalflushcacheblock()
    aftercare(ccall((:GDALFlushCacheBlock, libgdal), Cint, ()))
end

function gdaldatasetgetvirtualmem(hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALDatasetGetVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, GIntBig, GIntBig, Csize_t, Csize_t, Cint, CSLConstList), hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nBandCount, panBandMap, nPixelSpace, nLineSpace, nBandSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions))
end

function gdalrasterbandgetvirtualmem(hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALRasterBandGetVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, GIntBig, Csize_t, Csize_t, Cint, CSLConstList), hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nCacheSize, nPageSizeHint, bSingleThreadUsage, papszOptions))
end

function gdalgetvirtualmemauto(hBand, eRWFlag, pnPixelSpace, pnLineSpace, papszOptions)
    aftercare(ccall((:GDALGetVirtualMemAuto, libgdal), Ptr{CPLVirtualMem}, (GDALRasterBandH, GDALRWFlag, Ptr{Cint}, Ptr{GIntBig}, CSLConstList), hBand, eRWFlag, pnPixelSpace, pnLineSpace, papszOptions))
end

"""
    GDALTileOrganization

! Enumeration to describe the tile organization 

| Enumerator | Note                                                                                                                                           |
| :--------- | :--------------------------------------------------------------------------------------------------------------------------------------------- |
| GTO\\_TIP  | Tile Interleaved by Pixel: tile (0,0) with internal band interleaved by pixel organization, tile (1, 0), ...                                   |
| GTO\\_BIT  | Band Interleaved by Tile : tile (0,0) of first band, tile (0,0) of second band, ... tile (1,0) of first band, tile (1,0) of second band, ...   |
| GTO\\_BSQ  | Band SeQuential : all the tiles of first band, all the tiles of following band...                                                              |
"""
@cenum GDALTileOrganization::UInt32 begin
    GTO_TIP = 0
    GTO_BIT = 1
    GTO_BSQ = 2
end

function gdaldatasetgettiledvirtualmem(hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nBandCount, panBandMap, eTileOrganization, nCacheSize, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALDatasetGetTiledVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, GDALTileOrganization, Csize_t, Cint, CSLConstList), hDS, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nBandCount, panBandMap, eTileOrganization, nCacheSize, bSingleThreadUsage, papszOptions))
end

function gdalrasterbandgettiledvirtualmem(hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nCacheSize, bSingleThreadUsage, papszOptions)
    aftercare(ccall((:GDALRasterBandGetTiledVirtualMem, libgdal), Ptr{CPLVirtualMem}, (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Csize_t, Cint, CSLConstList), hBand, eRWFlag, nXOff, nYOff, nXSize, nYSize, nTileXSize, nTileYSize, eBufType, nCacheSize, bSingleThreadUsage, papszOptions))
end

function gdalcreatepansharpenedvrt(pszXML, hPanchroBand, nInputSpectralBands, pahInputSpectralBands)
    aftercare(ccall((:GDALCreatePansharpenedVRT, libgdal), GDALDatasetH, (Cstring, GDALRasterBandH, Cint, Ptr{GDALRasterBandH}), pszXML, hPanchroBand, nInputSpectralBands, pahInputSpectralBands))
end

function gdalgetjpeg2000structure(pszFilename, papszOptions)
    aftercare(ccall((:GDALGetJPEG2000Structure, libgdal), Ptr{CPLXMLNode}, (Cstring, CSLConstList), pszFilename, papszOptions))
end

function gdalcreatemultidimensional(hDriver, pszName, papszRootGroupOptions, papszOptions)
    aftercare(ccall((:GDALCreateMultiDimensional, libgdal), GDALDatasetH, (GDALDriverH, Cstring, CSLConstList, CSLConstList), hDriver, pszName, papszRootGroupOptions, papszOptions))
end

function gdalextendeddatatypecreate(eType)
    aftercare(ccall((:GDALExtendedDataTypeCreate, libgdal), GDALExtendedDataTypeH, (GDALDataType,), eType))
end

function gdalextendeddatatypecreatestring(nMaxStringLength)
    aftercare(ccall((:GDALExtendedDataTypeCreateString, libgdal), GDALExtendedDataTypeH, (Csize_t,), nMaxStringLength))
end

function gdalextendeddatatypecreatecompound(pszName, nTotalSize, nComponents, comps)
    aftercare(ccall((:GDALExtendedDataTypeCreateCompound, libgdal), GDALExtendedDataTypeH, (Cstring, Csize_t, Csize_t, Ptr{GDALEDTComponentH}), pszName, nTotalSize, nComponents, comps))
end

function gdalextendeddatatyperelease(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeRelease, libgdal), Cvoid, (GDALExtendedDataTypeH,), hEDT))
end

function gdalextendeddatatypegetname(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetName, libgdal), Cstring, (GDALExtendedDataTypeH,), hEDT), false)
end

function gdalextendeddatatypegetclass(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetClass, libgdal), GDALExtendedDataTypeClass, (GDALExtendedDataTypeH,), hEDT))
end

function gdalextendeddatatypegetnumericdatatype(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetNumericDataType, libgdal), GDALDataType, (GDALExtendedDataTypeH,), hEDT))
end

function gdalextendeddatatypegetsize(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetSize, libgdal), Csize_t, (GDALExtendedDataTypeH,), hEDT))
end

function gdalextendeddatatypegetmaxstringlength(hEDT)
    aftercare(ccall((:GDALExtendedDataTypeGetMaxStringLength, libgdal), Csize_t, (GDALExtendedDataTypeH,), hEDT))
end

function gdalextendeddatatypegetcomponents(hEDT, pnCount)
    aftercare(ccall((:GDALExtendedDataTypeGetComponents, libgdal), Ptr{GDALEDTComponentH}, (GDALExtendedDataTypeH, Ptr{Csize_t}), hEDT, pnCount))
end

function gdalextendeddatatypefreecomponents(components, nCount)
    aftercare(ccall((:GDALExtendedDataTypeFreeComponents, libgdal), Cvoid, (Ptr{GDALEDTComponentH}, Csize_t), components, nCount))
end

function gdalextendeddatatypecanconvertto(hSourceEDT, hTargetEDT)
    aftercare(ccall((:GDALExtendedDataTypeCanConvertTo, libgdal), Cint, (GDALExtendedDataTypeH, GDALExtendedDataTypeH), hSourceEDT, hTargetEDT))
end

function gdalextendeddatatypeequals(hFirstEDT, hSecondEDT)
    aftercare(ccall((:GDALExtendedDataTypeEquals, libgdal), Cint, (GDALExtendedDataTypeH, GDALExtendedDataTypeH), hFirstEDT, hSecondEDT))
end

function gdaledtcomponentcreate(pszName, nOffset, hType)
    aftercare(ccall((:GDALEDTComponentCreate, libgdal), GDALEDTComponentH, (Cstring, Csize_t, GDALExtendedDataTypeH), pszName, nOffset, hType))
end

function gdaledtcomponentrelease(hComp)
    aftercare(ccall((:GDALEDTComponentRelease, libgdal), Cvoid, (GDALEDTComponentH,), hComp))
end

function gdaledtcomponentgetname(hComp)
    aftercare(ccall((:GDALEDTComponentGetName, libgdal), Cstring, (GDALEDTComponentH,), hComp), false)
end

function gdaledtcomponentgetoffset(hComp)
    aftercare(ccall((:GDALEDTComponentGetOffset, libgdal), Csize_t, (GDALEDTComponentH,), hComp))
end

function gdaledtcomponentgettype(hComp)
    aftercare(ccall((:GDALEDTComponentGetType, libgdal), GDALExtendedDataTypeH, (GDALEDTComponentH,), hComp))
end

function gdaldatasetgetrootgroup(hDS)
    aftercare(ccall((:GDALDatasetGetRootGroup, libgdal), GDALGroupH, (GDALDatasetH,), hDS))
end

function gdalgrouprelease(hGroup)
    aftercare(ccall((:GDALGroupRelease, libgdal), Cvoid, (GDALGroupH,), hGroup))
end

function gdalgroupgetname(hGroup)
    aftercare(ccall((:GDALGroupGetName, libgdal), Cstring, (GDALGroupH,), hGroup), false)
end

function gdalgroupgetfullname(hGroup)
    aftercare(ccall((:GDALGroupGetFullName, libgdal), Cstring, (GDALGroupH,), hGroup), false)
end

function gdalgroupgetmdarraynames(hGroup, papszOptions)
    aftercare(ccall((:GDALGroupGetMDArrayNames, libgdal), Ptr{Cstring}, (GDALGroupH, CSLConstList), hGroup, papszOptions))
end

function gdalgroupopenmdarray(hGroup, pszMDArrayName, papszOptions)
    aftercare(ccall((:GDALGroupOpenMDArray, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszMDArrayName, papszOptions))
end

function gdalgroupopenmdarrayfromfullname(hGroup, pszMDArrayName, papszOptions)
    aftercare(ccall((:GDALGroupOpenMDArrayFromFullname, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszMDArrayName, papszOptions))
end

function gdalgroupresolvemdarray(hGroup, pszName, pszStartingPoint, papszOptions)
    aftercare(ccall((:GDALGroupResolveMDArray, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, Cstring, CSLConstList), hGroup, pszName, pszStartingPoint, papszOptions))
end

function gdalgroupgetgroupnames(hGroup, papszOptions)
    aftercare(ccall((:GDALGroupGetGroupNames, libgdal), Ptr{Cstring}, (GDALGroupH, CSLConstList), hGroup, papszOptions))
end

function gdalgroupopengroup(hGroup, pszSubGroupName, papszOptions)
    aftercare(ccall((:GDALGroupOpenGroup, libgdal), GDALGroupH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszSubGroupName, papszOptions))
end

function gdalgroupopengroupfromfullname(hGroup, pszMDArrayName, papszOptions)
    aftercare(ccall((:GDALGroupOpenGroupFromFullname, libgdal), GDALGroupH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszMDArrayName, papszOptions))
end

function gdalgroupgetdimensions(hGroup, pnCount, papszOptions)
    aftercare(ccall((:GDALGroupGetDimensions, libgdal), Ptr{GDALDimensionH}, (GDALGroupH, Ptr{Csize_t}, CSLConstList), hGroup, pnCount, papszOptions))
end

function gdalgroupgetattribute(hGroup, pszName)
    aftercare(ccall((:GDALGroupGetAttribute, libgdal), GDALAttributeH, (GDALGroupH, Cstring), hGroup, pszName))
end

function gdalgroupgetattributes(hGroup, pnCount, papszOptions)
    aftercare(ccall((:GDALGroupGetAttributes, libgdal), Ptr{GDALAttributeH}, (GDALGroupH, Ptr{Csize_t}, CSLConstList), hGroup, pnCount, papszOptions))
end

function gdalgroupgetstructuralinfo(hGroup)
    aftercare(ccall((:GDALGroupGetStructuralInfo, libgdal), CSLConstList, (GDALGroupH,), hGroup))
end

function gdalgroupcreategroup(hGroup, pszSubGroupName, papszOptions)
    aftercare(ccall((:GDALGroupCreateGroup, libgdal), GDALGroupH, (GDALGroupH, Cstring, CSLConstList), hGroup, pszSubGroupName, papszOptions))
end

function gdalgroupcreatedimension(hGroup, pszName, pszType, pszDirection, nSize, papszOptions)
    aftercare(ccall((:GDALGroupCreateDimension, libgdal), GDALDimensionH, (GDALGroupH, Cstring, Cstring, Cstring, GUInt64, CSLConstList), hGroup, pszName, pszType, pszDirection, nSize, papszOptions))
end

function gdalgroupcreatemdarray(hGroup, pszName, nDimensions, pahDimensions, hEDT, papszOptions)
    aftercare(ccall((:GDALGroupCreateMDArray, libgdal), GDALMDArrayH, (GDALGroupH, Cstring, Csize_t, Ptr{GDALDimensionH}, GDALExtendedDataTypeH, CSLConstList), hGroup, pszName, nDimensions, pahDimensions, hEDT, papszOptions))
end

function gdalgroupcreateattribute(hGroup, pszName, nDimensions, panDimensions, hEDT, papszOptions)
    aftercare(ccall((:GDALGroupCreateAttribute, libgdal), GDALAttributeH, (GDALGroupH, Cstring, Csize_t, Ptr{GUInt64}, GDALExtendedDataTypeH, CSLConstList), hGroup, pszName, nDimensions, panDimensions, hEDT, papszOptions))
end

function gdalmdarrayrelease(hMDArray)
    aftercare(ccall((:GDALMDArrayRelease, libgdal), Cvoid, (GDALMDArrayH,), hMDArray))
end

function gdalmdarraygetname(hArray)
    aftercare(ccall((:GDALMDArrayGetName, libgdal), Cstring, (GDALMDArrayH,), hArray), false)
end

function gdalmdarraygetfullname(hArray)
    aftercare(ccall((:GDALMDArrayGetFullName, libgdal), Cstring, (GDALMDArrayH,), hArray), false)
end

function gdalmdarraygettotalelementscount(hArray)
    aftercare(ccall((:GDALMDArrayGetTotalElementsCount, libgdal), GUInt64, (GDALMDArrayH,), hArray))
end

function gdalmdarraygetdimensioncount(hArray)
    aftercare(ccall((:GDALMDArrayGetDimensionCount, libgdal), Csize_t, (GDALMDArrayH,), hArray))
end

function gdalmdarraygetdimensions(hArray, pnCount)
    aftercare(ccall((:GDALMDArrayGetDimensions, libgdal), Ptr{GDALDimensionH}, (GDALMDArrayH, Ptr{Csize_t}), hArray, pnCount))
end

function gdalmdarraygetdatatype(hArray)
    aftercare(ccall((:GDALMDArrayGetDataType, libgdal), GDALExtendedDataTypeH, (GDALMDArrayH,), hArray))
end

function gdalmdarrayread(hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pDstBuffer, pDstBufferAllocStart, nDstBufferllocSize)
    aftercare(ccall((:GDALMDArrayRead, libgdal), Cint, (GDALMDArrayH, Ptr{GUInt64}, Ptr{Csize_t}, Ptr{GInt64}, Ptr{GPtrDiff_t}, GDALExtendedDataTypeH, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pDstBuffer, pDstBufferAllocStart, nDstBufferllocSize))
end

function gdalmdarraywrite(hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pSrcBuffer, psrcBufferAllocStart, nSrcBufferllocSize)
    aftercare(ccall((:GDALMDArrayWrite, libgdal), Cint, (GDALMDArrayH, Ptr{GUInt64}, Ptr{Csize_t}, Ptr{GInt64}, Ptr{GPtrDiff_t}, GDALExtendedDataTypeH, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), hArray, arrayStartIdx, count, arrayStep, bufferStride, bufferDatatype, pSrcBuffer, psrcBufferAllocStart, nSrcBufferllocSize))
end

function gdalmdarrayadviseread(hArray, arrayStartIdx, count)
    aftercare(ccall((:GDALMDArrayAdviseRead, libgdal), Cint, (GDALMDArrayH, Ptr{GUInt64}, Ptr{Csize_t}), hArray, arrayStartIdx, count))
end

function gdalmdarraygetattribute(hArray, pszName)
    aftercare(ccall((:GDALMDArrayGetAttribute, libgdal), GDALAttributeH, (GDALMDArrayH, Cstring), hArray, pszName))
end

function gdalmdarraygetattributes(hArray, pnCount, papszOptions)
    aftercare(ccall((:GDALMDArrayGetAttributes, libgdal), Ptr{GDALAttributeH}, (GDALMDArrayH, Ptr{Csize_t}, CSLConstList), hArray, pnCount, papszOptions))
end

function gdalmdarraycreateattribute(hArray, pszName, nDimensions, panDimensions, hEDT, papszOptions)
    aftercare(ccall((:GDALMDArrayCreateAttribute, libgdal), GDALAttributeH, (GDALMDArrayH, Cstring, Csize_t, Ptr{GUInt64}, GDALExtendedDataTypeH, CSLConstList), hArray, pszName, nDimensions, panDimensions, hEDT, papszOptions))
end

function gdalmdarraygetrawnodatavalue(hArray)
    aftercare(ccall((:GDALMDArrayGetRawNoDataValue, libgdal), Ptr{Cvoid}, (GDALMDArrayH,), hArray))
end

function gdalmdarraygetnodatavalueasdouble(hArray, pbHasNoDataValue)
    aftercare(ccall((:GDALMDArrayGetNoDataValueAsDouble, libgdal), Cdouble, (GDALMDArrayH, Ptr{Cint}), hArray, pbHasNoDataValue))
end

function gdalmdarraysetrawnodatavalue(hArray, arg2)
    aftercare(ccall((:GDALMDArraySetRawNoDataValue, libgdal), Cint, (GDALMDArrayH, Ptr{Cvoid}), hArray, arg2))
end

function gdalmdarraysetnodatavalueasdouble(hArray, dfNoDataValue)
    aftercare(ccall((:GDALMDArraySetNoDataValueAsDouble, libgdal), Cint, (GDALMDArrayH, Cdouble), hArray, dfNoDataValue))
end

function gdalmdarraysetscale(hArray, dfScale)
    aftercare(ccall((:GDALMDArraySetScale, libgdal), Cint, (GDALMDArrayH, Cdouble), hArray, dfScale))
end

function gdalmdarraygetscale(hArray, pbHasValue)
    aftercare(ccall((:GDALMDArrayGetScale, libgdal), Cdouble, (GDALMDArrayH, Ptr{Cint}), hArray, pbHasValue))
end

function gdalmdarraysetoffset(hArray, dfOffset)
    aftercare(ccall((:GDALMDArraySetOffset, libgdal), Cint, (GDALMDArrayH, Cdouble), hArray, dfOffset))
end

function gdalmdarraygetoffset(hArray, pbHasValue)
    aftercare(ccall((:GDALMDArrayGetOffset, libgdal), Cdouble, (GDALMDArrayH, Ptr{Cint}), hArray, pbHasValue))
end

function gdalmdarraygetblocksize(hArray, pnCount)
    aftercare(ccall((:GDALMDArrayGetBlockSize, libgdal), Ptr{GUInt64}, (GDALMDArrayH, Ptr{Csize_t}), hArray, pnCount))
end

function gdalmdarraysetunit(hArray, arg2)
    aftercare(ccall((:GDALMDArraySetUnit, libgdal), Cint, (GDALMDArrayH, Cstring), hArray, arg2))
end

function gdalmdarraygetunit(hArray)
    aftercare(ccall((:GDALMDArrayGetUnit, libgdal), Cstring, (GDALMDArrayH,), hArray), false)
end

function gdalmdarraysetspatialref(arg1, arg2)
    aftercare(ccall((:GDALMDArraySetSpatialRef, libgdal), Cint, (GDALMDArrayH, OGRSpatialReferenceH), arg1, arg2))
end

function gdalmdarraygetspatialref(hArray)
    aftercare(ccall((:GDALMDArrayGetSpatialRef, libgdal), OGRSpatialReferenceH, (GDALMDArrayH,), hArray))
end

function gdalmdarraygetprocessingchunksize(hArray, pnCount, nMaxChunkMemory)
    aftercare(ccall((:GDALMDArrayGetProcessingChunkSize, libgdal), Ptr{Csize_t}, (GDALMDArrayH, Ptr{Csize_t}, Csize_t), hArray, pnCount, nMaxChunkMemory))
end

function gdalmdarraygetstructuralinfo(hArray)
    aftercare(ccall((:GDALMDArrayGetStructuralInfo, libgdal), CSLConstList, (GDALMDArrayH,), hArray))
end

function gdalmdarraygetview(hArray, pszViewExpr)
    aftercare(ccall((:GDALMDArrayGetView, libgdal), GDALMDArrayH, (GDALMDArrayH, Cstring), hArray, pszViewExpr))
end

function gdalmdarraytranspose(hArray, nNewAxisCount, panMapNewAxisToOldAxis)
    aftercare(ccall((:GDALMDArrayTranspose, libgdal), GDALMDArrayH, (GDALMDArrayH, Csize_t, Ptr{Cint}), hArray, nNewAxisCount, panMapNewAxisToOldAxis))
end

function gdalmdarraygetunscaled(hArray)
    aftercare(ccall((:GDALMDArrayGetUnscaled, libgdal), GDALMDArrayH, (GDALMDArrayH,), hArray))
end

function gdalmdarraygetmask(hArray, papszOptions)
    aftercare(ccall((:GDALMDArrayGetMask, libgdal), GDALMDArrayH, (GDALMDArrayH, CSLConstList), hArray, papszOptions))
end

function gdalmdarrayasclassicdataset(hArray, iXDim, iYDim)
    aftercare(ccall((:GDALMDArrayAsClassicDataset, libgdal), GDALDatasetH, (GDALMDArrayH, Csize_t, Csize_t), hArray, iXDim, iYDim))
end

function gdalmdarraygetstatistics(hArray, arg2, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, pfnProgress, pProgressData)
    aftercare(ccall((:GDALMDArrayGetStatistics, libgdal), CPLErr, (GDALMDArrayH, GDALDatasetH, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{GUInt64}, GDALProgressFunc, Ptr{Cvoid}), hArray, arg2, bApproxOK, bForce, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, pfnProgress, pProgressData))
end

function gdalmdarraycomputestatistics(hArray, arg2, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, arg9, pProgressData)
    aftercare(ccall((:GDALMDArrayComputeStatistics, libgdal), Cint, (GDALMDArrayH, GDALDatasetH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{GUInt64}, GDALProgressFunc, Ptr{Cvoid}), hArray, arg2, bApproxOK, pdfMin, pdfMax, pdfMean, pdfStdDev, pnValidCount, arg9, pProgressData))
end

function gdalattributerelease(hAttr)
    aftercare(ccall((:GDALAttributeRelease, libgdal), Cvoid, (GDALAttributeH,), hAttr))
end

function gdalreleaseattributes(attributes, nCount)
    aftercare(ccall((:GDALReleaseAttributes, libgdal), Cvoid, (Ptr{GDALAttributeH}, Csize_t), attributes, nCount))
end

function gdalattributegetname(hAttr)
    aftercare(ccall((:GDALAttributeGetName, libgdal), Cstring, (GDALAttributeH,), hAttr), false)
end

function gdalattributegetfullname(hAttr)
    aftercare(ccall((:GDALAttributeGetFullName, libgdal), Cstring, (GDALAttributeH,), hAttr), false)
end

function gdalattributegettotalelementscount(hAttr)
    aftercare(ccall((:GDALAttributeGetTotalElementsCount, libgdal), GUInt64, (GDALAttributeH,), hAttr))
end

function gdalattributegetdimensioncount(hAttr)
    aftercare(ccall((:GDALAttributeGetDimensionCount, libgdal), Csize_t, (GDALAttributeH,), hAttr))
end

function gdalattributegetdimensionssize(hAttr, pnCount)
    aftercare(ccall((:GDALAttributeGetDimensionsSize, libgdal), Ptr{GUInt64}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnCount))
end

function gdalattributegetdatatype(hAttr)
    aftercare(ccall((:GDALAttributeGetDataType, libgdal), GDALExtendedDataTypeH, (GDALAttributeH,), hAttr))
end

function gdalattributereadasraw(hAttr, pnSize)
    aftercare(ccall((:GDALAttributeReadAsRaw, libgdal), Ptr{GByte}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnSize))
end

function gdalattributefreerawresult(hAttr, raw, nSize)
    aftercare(ccall((:GDALAttributeFreeRawResult, libgdal), Cvoid, (GDALAttributeH, Ptr{GByte}, Csize_t), hAttr, raw, nSize))
end

function gdalattributereadasstring(hAttr)
    aftercare(ccall((:GDALAttributeReadAsString, libgdal), Cstring, (GDALAttributeH,), hAttr), false)
end

function gdalattributereadasint(hAttr)
    aftercare(ccall((:GDALAttributeReadAsInt, libgdal), Cint, (GDALAttributeH,), hAttr))
end

function gdalattributereadasdouble(hAttr)
    aftercare(ccall((:GDALAttributeReadAsDouble, libgdal), Cdouble, (GDALAttributeH,), hAttr))
end

function gdalattributereadasstringarray(hAttr)
    aftercare(ccall((:GDALAttributeReadAsStringArray, libgdal), Ptr{Cstring}, (GDALAttributeH,), hAttr))
end

function gdalattributereadasintarray(hAttr, pnCount)
    aftercare(ccall((:GDALAttributeReadAsIntArray, libgdal), Ptr{Cint}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnCount))
end

function gdalattributereadasdoublearray(hAttr, pnCount)
    aftercare(ccall((:GDALAttributeReadAsDoubleArray, libgdal), Ptr{Cdouble}, (GDALAttributeH, Ptr{Csize_t}), hAttr, pnCount))
end

function gdalattributewriteraw(hAttr, arg2, arg3)
    aftercare(ccall((:GDALAttributeWriteRaw, libgdal), Cint, (GDALAttributeH, Ptr{Cvoid}, Csize_t), hAttr, arg2, arg3))
end

function gdalattributewritestring(hAttr, arg2)
    aftercare(ccall((:GDALAttributeWriteString, libgdal), Cint, (GDALAttributeH, Cstring), hAttr, arg2))
end

function gdalattributewritestringarray(hAttr, arg2)
    aftercare(ccall((:GDALAttributeWriteStringArray, libgdal), Cint, (GDALAttributeH, CSLConstList), hAttr, arg2))
end

function gdalattributewriteint(hAttr, arg2)
    aftercare(ccall((:GDALAttributeWriteInt, libgdal), Cint, (GDALAttributeH, Cint), hAttr, arg2))
end

function gdalattributewritedouble(hAttr, arg2)
    aftercare(ccall((:GDALAttributeWriteDouble, libgdal), Cint, (GDALAttributeH, Cdouble), hAttr, arg2))
end

function gdalattributewritedoublearray(hAttr, arg2, arg3)
    aftercare(ccall((:GDALAttributeWriteDoubleArray, libgdal), Cint, (GDALAttributeH, Ptr{Cdouble}, Csize_t), hAttr, arg2, arg3))
end

function gdaldimensionrelease(hDim)
    aftercare(ccall((:GDALDimensionRelease, libgdal), Cvoid, (GDALDimensionH,), hDim))
end

function gdalreleasedimensions(dims, nCount)
    aftercare(ccall((:GDALReleaseDimensions, libgdal), Cvoid, (Ptr{GDALDimensionH}, Csize_t), dims, nCount))
end

function gdaldimensiongetname(hDim)
    aftercare(ccall((:GDALDimensionGetName, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

function gdaldimensiongetfullname(hDim)
    aftercare(ccall((:GDALDimensionGetFullName, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

function gdaldimensiongettype(hDim)
    aftercare(ccall((:GDALDimensionGetType, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

function gdaldimensiongetdirection(hDim)
    aftercare(ccall((:GDALDimensionGetDirection, libgdal), Cstring, (GDALDimensionH,), hDim), false)
end

function gdaldimensiongetsize(hDim)
    aftercare(ccall((:GDALDimensionGetSize, libgdal), GUInt64, (GDALDimensionH,), hDim))
end

function gdaldimensiongetindexingvariable(hDim)
    aftercare(ccall((:GDALDimensionGetIndexingVariable, libgdal), GDALMDArrayH, (GDALDimensionH,), hDim))
end

function gdaldimensionsetindexingvariable(hDim, hArray)
    aftercare(ccall((:GDALDimensionSetIndexingVariable, libgdal), Cint, (GDALDimensionH, GDALMDArrayH), hDim, hArray))
end

function gdalcomputemediancutpct(hRed, hGreen, hBlue, pfnIncludePixel, nColors, hColorTable, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALComputeMedianCutPCT, libgdal), Cint, (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, Ptr{Cvoid}, Cint, GDALColorTableH, GDALProgressFunc, Ptr{Cvoid}), hRed, hGreen, hBlue, pfnIncludePixel, nColors, hColorTable, pfnProgress, pProgressArg))
end

function gdalditherrgb2pct(hRed, hGreen, hBlue, hTarget, hColorTable, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALDitherRGB2PCT, libgdal), Cint, (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, GDALColorTableH, GDALProgressFunc, Ptr{Cvoid}), hRed, hGreen, hBlue, hTarget, hColorTable, pfnProgress, pProgressArg))
end

function gdalchecksumimage(hBand, nXOff, nYOff, nXSize, nYSize)
    aftercare(ccall((:GDALChecksumImage, libgdal), Cint, (GDALRasterBandH, Cint, Cint, Cint, Cint), hBand, nXOff, nYOff, nXSize, nYSize))
end

function gdalcomputeproximity(hSrcBand, hProximityBand, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALComputeProximity, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hProximityBand, papszOptions, pfnProgress, pProgressArg))
end

function gdalfillnodata(hTargetBand, hMaskBand, dfMaxSearchDist, bDeprecatedOption, nSmoothingIterations, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALFillNodata, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, Cdouble, Cint, Cint, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hTargetBand, hMaskBand, dfMaxSearchDist, bDeprecatedOption, nSmoothingIterations, papszOptions, pfnProgress, pProgressArg))
end

function gdalpolygonize(hSrcBand, hMaskBand, hOutLayer, iPixValField, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALPolygonize, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, OGRLayerH, Cint, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hMaskBand, hOutLayer, iPixValField, papszOptions, pfnProgress, pProgressArg))
end

function gdalfpolygonize(hSrcBand, hMaskBand, hOutLayer, iPixValField, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALFPolygonize, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, OGRLayerH, Cint, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hMaskBand, hOutLayer, iPixValField, papszOptions, pfnProgress, pProgressArg))
end

function gdalsievefilter(hSrcBand, hMaskBand, hDstBand, nSizeThreshold, nConnectedness, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALSieveFilter, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, Cint, Cint, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hSrcBand, hMaskBand, hDstBand, nSizeThreshold, nConnectedness, papszOptions, pfnProgress, pProgressArg))
end

# typedef int ( * GDALTransformerFunc ) ( void * pTransformerArg , int bDstToSrc , int nPointCount , double * x , double * y , double * z , int * panSuccess )
const GDALTransformerFunc = Ptr{Cvoid}

struct GDALTransformerInfo
    abySignature::NTuple{4, GByte}
    pszClassName::Cstring
    pfnTransform::GDALTransformerFunc
    pfnCleanup::Ptr{Cvoid}
    pfnSerialize::Ptr{Cvoid}
    pfnCreateSimilar::Ptr{Cvoid}
end

"""
    gdaldestroytransformer(pTransformerArg)

Doxygen\\_Suppress 
"""
function gdaldestroytransformer(pTransformerArg)
    aftercare(ccall((:GDALDestroyTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformerArg))
end

function gdalusetransformer(pTransformerArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALUseTransformer, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformerArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

function gdalcreatesimilartransformer(psTransformerArg, dfSrcRatioX, dfSrcRatioY)
    aftercare(ccall((:GDALCreateSimilarTransformer, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Cdouble, Cdouble), psTransformerArg, dfSrcRatioX, dfSrcRatioY))
end

function gdalcreategenimgprojtransformer(hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, bGCPUseOK, dfGCPErrorThreshold, nOrder)
    aftercare(ccall((:GDALCreateGenImgProjTransformer, libgdal), Ptr{Cvoid}, (GDALDatasetH, Cstring, GDALDatasetH, Cstring, Cint, Cdouble, Cint), hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, bGCPUseOK, dfGCPErrorThreshold, nOrder))
end

function gdalcreategenimgprojtransformer2(hSrcDS, hDstDS, papszOptions)
    aftercare(ccall((:GDALCreateGenImgProjTransformer2, libgdal), Ptr{Cvoid}, (GDALDatasetH, GDALDatasetH, Ptr{Cstring}), hSrcDS, hDstDS, papszOptions))
end

function gdalcreategenimgprojtransformer3(pszSrcWKT, padfSrcGeoTransform, pszDstWKT, padfDstGeoTransform)
    aftercare(ccall((:GDALCreateGenImgProjTransformer3, libgdal), Ptr{Cvoid}, (Cstring, Ptr{Cdouble}, Cstring, Ptr{Cdouble}), pszSrcWKT, padfSrcGeoTransform, pszDstWKT, padfDstGeoTransform))
end

function gdalcreategenimgprojtransformer4(hSrcSRS, padfSrcGeoTransform, hDstSRS, padfDstGeoTransform, papszOptions)
    aftercare(ccall((:GDALCreateGenImgProjTransformer4, libgdal), Ptr{Cvoid}, (OGRSpatialReferenceH, Ptr{Cdouble}, OGRSpatialReferenceH, Ptr{Cdouble}, Ptr{Cstring}), hSrcSRS, padfSrcGeoTransform, hDstSRS, padfDstGeoTransform, papszOptions))
end

function gdalsetgenimgprojtransformerdstgeotransform(arg1, arg2)
    aftercare(ccall((:GDALSetGenImgProjTransformerDstGeoTransform, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}), arg1, arg2))
end

function gdaldestroygenimgprojtransformer(arg1)
    aftercare(ccall((:GDALDestroyGenImgProjTransformer, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

function gdalgenimgprojtransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALGenImgProjTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

function gdalsettransformerdstgeotransform(arg1, arg2)
    aftercare(ccall((:GDALSetTransformerDstGeoTransform, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}), arg1, arg2))
end

function gdalgettransformerdstgeotransform(arg1, arg2)
    aftercare(ccall((:GDALGetTransformerDstGeoTransform, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}), arg1, arg2))
end

function gdalcreatereprojectiontransformer(pszSrcWKT, pszDstWKT)
    aftercare(ccall((:GDALCreateReprojectionTransformer, libgdal), Ptr{Cvoid}, (Cstring, Cstring), pszSrcWKT, pszDstWKT))
end

function gdalcreatereprojectiontransformerex(hSrcSRS, hDstSRS, papszOptions)
    aftercare(ccall((:GDALCreateReprojectionTransformerEx, libgdal), Ptr{Cvoid}, (OGRSpatialReferenceH, OGRSpatialReferenceH, Ptr{Cstring}), hSrcSRS, hDstSRS, papszOptions))
end

function gdaldestroyreprojectiontransformer(arg1)
    aftercare(ccall((:GDALDestroyReprojectionTransformer, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

function gdalreprojectiontransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALReprojectionTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

function gdalcreategcptransformer(nGCPCount, pasGCPList, nReqOrder, bReversed)
    aftercare(ccall((:GDALCreateGCPTransformer, libgdal), Ptr{Cvoid}, (Cint, Ptr{GDAL_GCP}, Cint, Cint), nGCPCount, pasGCPList, nReqOrder, bReversed))
end

function gdalcreategcprefinetransformer(nGCPCount, pasGCPList, nReqOrder, bReversed, tolerance, minimumGcps)
    aftercare(ccall((:GDALCreateGCPRefineTransformer, libgdal), Ptr{Cvoid}, (Cint, Ptr{GDAL_GCP}, Cint, Cint, Cdouble, Cint), nGCPCount, pasGCPList, nReqOrder, bReversed, tolerance, minimumGcps))
end

function gdaldestroygcptransformer(pTransformArg)
    aftercare(ccall((:GDALDestroyGCPTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformArg))
end

function gdalgcptransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALGCPTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

function gdalcreatetpstransformer(nGCPCount, pasGCPList, bReversed)
    aftercare(ccall((:GDALCreateTPSTransformer, libgdal), Ptr{Cvoid}, (Cint, Ptr{GDAL_GCP}, Cint), nGCPCount, pasGCPList, bReversed))
end

function gdaldestroytpstransformer(pTransformArg)
    aftercare(ccall((:GDALDestroyTPSTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformArg))
end

function gdaltpstransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALTPSTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

"""
    rpcinfotomd(psRPCInfo)

Doxygen\\_Suppress 
"""
function rpcinfotomd(psRPCInfo)
    aftercare(ccall((:RPCInfoToMD, libgdal), Ptr{Cstring}, (Ptr{GDALRPCInfo},), psRPCInfo))
end

function gdalcreaterpctransformer(psRPC, bReversed, dfPixErrThreshold, papszOptions)
    aftercare(ccall((:GDALCreateRPCTransformer, libgdal), Ptr{Cvoid}, (Ptr{GDALRPCInfo}, Cint, Cdouble, Ptr{Cstring}), psRPC, bReversed, dfPixErrThreshold, papszOptions))
end

function gdaldestroyrpctransformer(pTransformArg)
    aftercare(ccall((:GDALDestroyRPCTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformArg))
end

function gdalrpctransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALRPCTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

function gdalcreategeoloctransformer(hBaseDS, papszGeolocationInfo, bReversed)
    aftercare(ccall((:GDALCreateGeoLocTransformer, libgdal), Ptr{Cvoid}, (GDALDatasetH, Ptr{Cstring}, Cint), hBaseDS, papszGeolocationInfo, bReversed))
end

function gdaldestroygeoloctransformer(pTransformArg)
    aftercare(ccall((:GDALDestroyGeoLocTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pTransformArg))
end

function gdalgeoloctransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALGeoLocTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

function gdalcreateapproxtransformer(pfnRawTransformer, pRawTransformerArg, dfMaxError)
    aftercare(ccall((:GDALCreateApproxTransformer, libgdal), Ptr{Cvoid}, (GDALTransformerFunc, Ptr{Cvoid}, Cdouble), pfnRawTransformer, pRawTransformerArg, dfMaxError))
end

function gdalapproxtransformerownssubtransformer(pCBData, bOwnFlag)
    aftercare(ccall((:GDALApproxTransformerOwnsSubtransformer, libgdal), Cvoid, (Ptr{Cvoid}, Cint), pCBData, bOwnFlag))
end

function gdaldestroyapproxtransformer(pApproxArg)
    aftercare(ccall((:GDALDestroyApproxTransformer, libgdal), Cvoid, (Ptr{Cvoid},), pApproxArg))
end

function gdalapproxtransform(pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess)
    aftercare(ccall((:GDALApproxTransform, libgdal), Cint, (Ptr{Cvoid}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), pTransformArg, bDstToSrc, nPointCount, x, y, z, panSuccess))
end

function gdalsimpleimagewarp(hSrcDS, hDstDS, nBandCount, panBandList, pfnTransform, pTransformArg, pfnProgress, pProgressArg, papszWarpOptions)
    aftercare(ccall((:GDALSimpleImageWarp, libgdal), Cint, (GDALDatasetH, GDALDatasetH, Cint, Ptr{Cint}, GDALTransformerFunc, Ptr{Cvoid}, GDALProgressFunc, Ptr{Cvoid}, Ptr{Cstring}), hSrcDS, hDstDS, nBandCount, panBandList, pfnTransform, pTransformArg, pfnProgress, pProgressArg, papszWarpOptions))
end

function gdalsuggestedwarpoutput(hSrcDS, pfnTransformer, pTransformArg, padfGeoTransformOut, pnPixels, pnLines)
    aftercare(ccall((:GDALSuggestedWarpOutput, libgdal), CPLErr, (GDALDatasetH, GDALTransformerFunc, Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}), hSrcDS, pfnTransformer, pTransformArg, padfGeoTransformOut, pnPixels, pnLines))
end

function gdalsuggestedwarpoutput2(hSrcDS, pfnTransformer, pTransformArg, padfGeoTransformOut, pnPixels, pnLines, padfExtents, nOptions)
    aftercare(ccall((:GDALSuggestedWarpOutput2, libgdal), CPLErr, (GDALDatasetH, GDALTransformerFunc, Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), hSrcDS, pfnTransformer, pTransformArg, padfGeoTransformOut, pnPixels, pnLines, padfExtents, nOptions))
end

"""
    gdalserializetransformer(pfnFunc, pTransformArg)

Doxygen\\_Suppress 
"""
function gdalserializetransformer(pfnFunc, pTransformArg)
    aftercare(ccall((:GDALSerializeTransformer, libgdal), Ptr{CPLXMLNode}, (GDALTransformerFunc, Ptr{Cvoid}), pfnFunc, pTransformArg))
end

function gdaldeserializetransformer(psTree, ppfnFunc, ppTransformArg)
    aftercare(ccall((:GDALDeserializeTransformer, libgdal), CPLErr, (Ptr{CPLXMLNode}, Ptr{GDALTransformerFunc}, Ptr{Ptr{Cvoid}}), psTree, ppfnFunc, ppTransformArg))
end

function gdaltransformgeolocations(hXBand, hYBand, hZBand, pfnTransformer, pTransformArg, pfnProgress, pProgressArg, papszOptions)
    aftercare(ccall((:GDALTransformGeolocations, libgdal), CPLErr, (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, GDALTransformerFunc, Ptr{Cvoid}, GDALProgressFunc, Ptr{Cvoid}, Ptr{Cstring}), hXBand, hYBand, hZBand, pfnTransformer, pTransformArg, pfnProgress, pProgressArg, papszOptions))
end

# typedef CPLErr ( * GDALContourWriter ) ( double dfLevel , int nPoints , double * padfX , double * padfY , void * )
"""Contour writer callback type """
const GDALContourWriter = Ptr{Cvoid}

"""Contour generator opaque type """
const GDALContourGeneratorH = Ptr{Cvoid}

function gdal_cg_create(nWidth, nHeight, bNoDataSet, dfNoDataValue, dfContourInterval, dfContourBase, pfnWriter, pCBData)
    aftercare(ccall((:GDAL_CG_Create, libgdal), GDALContourGeneratorH, (Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, GDALContourWriter, Ptr{Cvoid}), nWidth, nHeight, bNoDataSet, dfNoDataValue, dfContourInterval, dfContourBase, pfnWriter, pCBData))
end

function gdal_cg_feedline(hCG, padfScanline)
    aftercare(ccall((:GDAL_CG_FeedLine, libgdal), CPLErr, (GDALContourGeneratorH, Ptr{Cdouble}), hCG, padfScanline))
end

function gdal_cg_destroy(hCG)
    aftercare(ccall((:GDAL_CG_Destroy, libgdal), Cvoid, (GDALContourGeneratorH,), hCG))
end

"""
    OGRContourWriterInfo

Doxygen\\_Suppress 
"""
struct OGRContourWriterInfo
    hLayer::Ptr{Cvoid}
    adfGeoTransform::NTuple{6, Cdouble}
    nElevField::Cint
    nElevFieldMin::Cint
    nElevFieldMax::Cint
    nIDField::Cint
    nNextID::Cint
end

function ogrcontourwriter(arg1, arg2, arg3, arg4, pInfo)
    aftercare(ccall((:OGRContourWriter, libgdal), CPLErr, (Cdouble, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}), arg1, arg2, arg3, arg4, pInfo))
end

function gdalcontourgenerate(hBand, dfContourInterval, dfContourBase, nFixedLevelCount, padfFixedLevels, bUseNoData, dfNoDataValue, hLayer, iIDField, iElevField, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALContourGenerate, libgdal), CPLErr, (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cdouble}, Cint, Cdouble, Ptr{Cvoid}, Cint, Cint, GDALProgressFunc, Ptr{Cvoid}), hBand, dfContourInterval, dfContourBase, nFixedLevelCount, padfFixedLevels, bUseNoData, dfNoDataValue, hLayer, iIDField, iElevField, pfnProgress, pProgressArg))
end

function gdalcontourgenerateex(hBand, hLayer, options, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALContourGenerateEx, libgdal), CPLErr, (GDALRasterBandH, Ptr{Cvoid}, CSLConstList, GDALProgressFunc, Ptr{Cvoid}), hBand, hLayer, options, pfnProgress, pProgressArg))
end

"""
    GDALViewshedMode

Viewshed Modes 
"""
@cenum GDALViewshedMode::UInt32 begin
    GVM_Diagonal = 1
    GVM_Edge = 2
    GVM_Max = 3
    GVM_Min = 4
end

"""
    GDALViewshedOutputType

Viewshed output types 
"""
@cenum GDALViewshedOutputType::UInt32 begin
    GVOT_NORMAL = 1
    GVOT_MIN_TARGET_HEIGHT_FROM_DEM = 2
    GVOT_MIN_TARGET_HEIGHT_FROM_GROUND = 3
end

function gdalviewshedgenerate(hBand, pszDriverName, pszTargetRasterName, papszCreationOptions, dfObserverX, dfObserverY, dfObserverHeight, dfTargetHeight, dfVisibleVal, dfInvisibleVal, dfOutOfRangeVal, dfNoDataVal, dfCurvCoeff, eMode, dfMaxDistance, pfnProgress, pProgressArg, heightMode, papszExtraOptions)
    aftercare(ccall((:GDALViewshedGenerate, libgdal), GDALDatasetH, (GDALRasterBandH, Cstring, Cstring, CSLConstList, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, GDALViewshedMode, Cdouble, GDALProgressFunc, Ptr{Cvoid}, GDALViewshedOutputType, CSLConstList), hBand, pszDriverName, pszTargetRasterName, papszCreationOptions, dfObserverX, dfObserverY, dfObserverHeight, dfTargetHeight, dfVisibleVal, dfInvisibleVal, dfOutOfRangeVal, dfNoDataVal, dfCurvCoeff, eMode, dfMaxDistance, pfnProgress, pProgressArg, heightMode, papszExtraOptions))
end

"""
    gdalrasterizegeometries(hDS, nBandCount, panBandList, nGeomCount, pahGeometries, pfnTransformer, pTransformArg, padfGeomBurnValue, papszOptions, pfnProgress, pProgressArg)

*********************************************************************
"""
function gdalrasterizegeometries(hDS, nBandCount, panBandList, nGeomCount, pahGeometries, pfnTransformer, pTransformArg, padfGeomBurnValue, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALRasterizeGeometries, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{Cint}, Cint, Ptr{OGRGeometryH}, GDALTransformerFunc, Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hDS, nBandCount, panBandList, nGeomCount, pahGeometries, pfnTransformer, pTransformArg, padfGeomBurnValue, papszOptions, pfnProgress, pProgressArg))
end

function gdalrasterizelayers(hDS, nBandCount, panBandList, nLayerCount, pahLayers, pfnTransformer, pTransformArg, padfLayerBurnValues, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALRasterizeLayers, libgdal), CPLErr, (GDALDatasetH, Cint, Ptr{Cint}, Cint, Ptr{OGRLayerH}, GDALTransformerFunc, Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), hDS, nBandCount, panBandList, nLayerCount, pahLayers, pfnTransformer, pTransformArg, padfLayerBurnValues, papszOptions, pfnProgress, pProgressArg))
end

function gdalrasterizelayersbuf(pData, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nLayerCount, pahLayers, pszDstProjection, padfDstGeoTransform, pfnTransformer, pTransformArg, dfBurnValue, papszOptions, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALRasterizeLayersBuf, libgdal), CPLErr, (Ptr{Cvoid}, Cint, Cint, GDALDataType, Cint, Cint, Cint, Ptr{OGRLayerH}, Cstring, Ptr{Cdouble}, GDALTransformerFunc, Ptr{Cvoid}, Cdouble, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), pData, nBufXSize, nBufYSize, eBufType, nPixelSpace, nLineSpace, nLayerCount, pahLayers, pszDstProjection, padfDstGeoTransform, pfnTransformer, pTransformArg, dfBurnValue, papszOptions, pfnProgress, pProgressArg))
end

"""
    GDALGridAlgorithm

Gridding Algorithms 

| Enumerator                                   | Note                                                                      |
| :------------------------------------------- | :------------------------------------------------------------------------ |
| GGA\\_InverseDistanceToAPower                | Inverse distance to a power                                               |
| GGA\\_MovingAverage                          | Moving Average                                                            |
| GGA\\_NearestNeighbor                        | Nearest Neighbor                                                          |
| GGA\\_MetricMinimum                          | Minimum Value (Data Metric)                                               |
| GGA\\_MetricMaximum                          | Maximum Value (Data Metric)                                               |
| GGA\\_MetricRange                            | Data Range (Data Metric)                                                  |
| GGA\\_MetricCount                            | Number of Points (Data Metric)                                            |
| GGA\\_MetricAverageDistance                  | Average Distance (Data Metric)                                            |
| GGA\\_MetricAverageDistancePts               | Average Distance Between Data Points (Data Metric)                        |
| GGA\\_Linear                                 | Linear interpolation (from Delaunay triangulation. Since GDAL 2.1         |
| GGA\\_InverseDistanceToAPowerNearestNeighbor | Inverse distance to a power with nearest neighbor search for max points   |
"""
@cenum GDALGridAlgorithm::UInt32 begin
    GGA_InverseDistanceToAPower = 1
    GGA_MovingAverage = 2
    GGA_NearestNeighbor = 3
    GGA_MetricMinimum = 4
    GGA_MetricMaximum = 5
    GGA_MetricRange = 6
    GGA_MetricCount = 7
    GGA_MetricAverageDistance = 8
    GGA_MetricAverageDistancePts = 9
    GGA_Linear = 10
    GGA_InverseDistanceToAPowerNearestNeighbor = 11
end

"""
    GDALGridInverseDistanceToAPowerOptions

Inverse distance to a power method control options 

| Field             | Note                                                                                                                                                                                         |
| :---------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dfPower           | Weighting power.                                                                                                                                                                             |
| dfSmoothing       | Smoothing parameter.                                                                                                                                                                         |
| dfAnisotropyRatio | Reserved for future use.                                                                                                                                                                     |
| dfAnisotropyAngle |                                                                                                                                                                                              |
| dfRadius1         | The first radius (X axis if rotation angle is 0) of search ellipse.                                                                                                                          |
| dfRadius2         | The second radius (Y axis if rotation angle is 0) of search ellipse.                                                                                                                         |
| dfAngle           | Angle of ellipse rotation in degrees.  Ellipse rotated counter clockwise.                                                                                                                    |
| nMaxPoints        | Maximum number of data points to use.  Do not search for more points than this number. If less amount of points found the grid node considered empty and will be filled with NODATA marker.  |
| nMinPoints        | Minimum number of data points to use.  If less amount of points found the grid node considered empty and will be filled with NODATA marker.                                                  |
| dfNoDataValue     | No data marker to fill empty points.                                                                                                                                                         |
"""
struct GDALGridInverseDistanceToAPowerOptions
    dfPower::Cdouble
    dfSmoothing::Cdouble
    dfAnisotropyRatio::Cdouble
    dfAnisotropyAngle::Cdouble
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMaxPoints::GUInt32
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

"""
    GDALGridInverseDistanceToAPowerNearestNeighborOptions

Inverse distance to a power, with nearest neighbour search, control options 

| Field         | Note                                                                                                                                                                                         |
| :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dfPower       | Weighting power.                                                                                                                                                                             |
| dfRadius      | The radius of search circle.                                                                                                                                                                 |
| dfSmoothing   | Smoothing parameter.                                                                                                                                                                         |
| nMaxPoints    | Maximum number of data points to use.  Do not search for more points than this number. If less amount of points found the grid node considered empty and will be filled with NODATA marker.  |
| nMinPoints    | Minimum number of data points to use.  If less amount of points found the grid node considered empty and will be filled with NODATA marker.                                                  |
| dfNoDataValue | No data marker to fill empty points.                                                                                                                                                         |
"""
struct GDALGridInverseDistanceToAPowerNearestNeighborOptions
    dfPower::Cdouble
    dfRadius::Cdouble
    dfSmoothing::Cdouble
    nMaxPoints::GUInt32
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

"""
    GDALGridMovingAverageOptions

Moving average method control options 

| Field         | Note                                                                                                                                             |
| :------------ | :----------------------------------------------------------------------------------------------------------------------------------------------- |
| dfRadius1     | The first radius (X axis if rotation angle is 0) of search ellipse.                                                                              |
| dfRadius2     | The second radius (Y axis if rotation angle is 0) of search ellipse.                                                                             |
| dfAngle       | Angle of ellipse rotation in degrees.  Ellipse rotated counter clockwise.                                                                        |
| nMinPoints    | Minimum number of data points to average.  If less amount of points found the grid node considered empty and will be filled with NODATA marker.  |
| dfNoDataValue | No data marker to fill empty points.                                                                                                             |
"""
struct GDALGridMovingAverageOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

"""
    GDALGridNearestNeighborOptions

Nearest neighbor method control options 

| Field         | Note                                                                       |
| :------------ | :------------------------------------------------------------------------- |
| dfRadius1     | The first radius (X axis if rotation angle is 0) of search ellipse.        |
| dfRadius2     | The second radius (Y axis if rotation angle is 0) of search ellipse.       |
| dfAngle       | Angle of ellipse rotation in degrees.  Ellipse rotated counter clockwise.  |
| dfNoDataValue | No data marker to fill empty points.                                       |
"""
struct GDALGridNearestNeighborOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    dfNoDataValue::Cdouble
end

"""
    GDALGridDataMetricsOptions

Data metrics method control options 

| Field         | Note                                                                                                                                             |
| :------------ | :----------------------------------------------------------------------------------------------------------------------------------------------- |
| dfRadius1     | The first radius (X axis if rotation angle is 0) of search ellipse.                                                                              |
| dfRadius2     | The second radius (Y axis if rotation angle is 0) of search ellipse.                                                                             |
| dfAngle       | Angle of ellipse rotation in degrees.  Ellipse rotated counter clockwise.                                                                        |
| nMinPoints    | Minimum number of data points to average.  If less amount of points found the grid node considered empty and will be filled with NODATA marker.  |
| dfNoDataValue | No data marker to fill empty points.                                                                                                             |
"""
struct GDALGridDataMetricsOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

"""
    GDALGridLinearOptions

Linear method control options 

| Field         | Note                                                                                                                                                                                                                                                                              |
| :------------ | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dfRadius      | In case the point to be interpolated does not fit into a triangle of the Delaunay triangulation, use that maximum distance to search a nearest neighbour, or use nodata otherwise. If set to -1, the search distance is infinite. If set to 0, nodata value will be always used.  |
| dfNoDataValue | No data marker to fill empty points.                                                                                                                                                                                                                                              |
"""
struct GDALGridLinearOptions
    dfRadius::Cdouble
    dfNoDataValue::Cdouble
end

function gdalgridcreate(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16)
    aftercare(ccall((:GDALGridCreate, libgdal), CPLErr, (GDALGridAlgorithm, Ptr{Cvoid}, GUInt32, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, Cdouble, Cdouble, GUInt32, GUInt32, GDALDataType, Ptr{Cvoid}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16))
end

const GDALGridContext = Cvoid

function gdalgridcontextcreate(eAlgorithm, poOptions, nPoints, padfX, padfY, padfZ, bCallerWillKeepPointArraysAlive)
    aftercare(ccall((:GDALGridContextCreate, libgdal), Ptr{GDALGridContext}, (GDALGridAlgorithm, Ptr{Cvoid}, GUInt32, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint), eAlgorithm, poOptions, nPoints, padfX, padfY, padfZ, bCallerWillKeepPointArraysAlive))
end

function gdalgridcontextfree(psContext)
    aftercare(ccall((:GDALGridContextFree, libgdal), Cvoid, (Ptr{GDALGridContext},), psContext))
end

function gdalgridcontextprocess(psContext, dfXMin, dfXMax, dfYMin, dfYMax, nXSize, nYSize, eType, pData, pfnProgress, pProgressArg)
    aftercare(ccall((:GDALGridContextProcess, libgdal), CPLErr, (Ptr{GDALGridContext}, Cdouble, Cdouble, Cdouble, Cdouble, GUInt32, GUInt32, GDALDataType, Ptr{Cvoid}, GDALProgressFunc, Ptr{Cvoid}), psContext, dfXMin, dfXMax, dfYMin, dfYMax, nXSize, nYSize, eType, pData, pfnProgress, pProgressArg))
end

function gdalcomputematchingpoints(hFirstImage, hSecondImage, papszOptions, pnGCPCount)
    aftercare(ccall((:GDALComputeMatchingPoints, libgdal), Ptr{GDAL_GCP}, (GDALDatasetH, GDALDatasetH, Ptr{Cstring}, Ptr{Cint}), hFirstImage, hSecondImage, papszOptions, pnGCPCount))
end

"""
    GDALTriFacet

Triangle fact 

| Field         | Note                                                  |
| :------------ | :---------------------------------------------------- |
| anVertexIdx   | index to the padfX/padfY arrays                       |
| anNeighborIdx | index to GDALDelaunayTriangulation.pasFacets, or -1   |
"""
struct GDALTriFacet
    anVertexIdx::NTuple{3, Cint}
    anNeighborIdx::NTuple{3, Cint}
end

"""
    GDALTriBarycentricCoefficients

Triangle barycentric coefficients.

Conversion from cartesian (x,y) to barycentric (l1,l2,l3) with : l1 = dfMul1X * (x - dfCxtX) + dfMul1Y * (y - dfCstY) l2 = dfMul2X * (x - dfCxtX) + dfMul2Y * (y - dfCstY) l3 = 1 - l1 - l2

| Field   | Note      |
| :------ | :-------- |
| dfMul1X | dfMul1X   |
| dfMul1Y | dfMul1Y   |
| dfMul2X | dfMul2X   |
| dfMul2Y | dfMul2Y   |
| dfCstX  | dfCstX    |
| dfCstY  | dfCstY    |
"""
struct GDALTriBarycentricCoefficients
    dfMul1X::Cdouble
    dfMul1Y::Cdouble
    dfMul2X::Cdouble
    dfMul2Y::Cdouble
    dfCstX::Cdouble
    dfCstY::Cdouble
end

"""
    GDALTriangulation

Triangulation structure 

| Field                | Note                                       |
| :------------------- | :----------------------------------------- |
| nFacets              | number of facets                           |
| pasFacets            | array of nFacets facets                    |
| pasFacetCoefficients | arra of nFacets barycentric coefficients   |
"""
struct GDALTriangulation
    nFacets::Cint
    pasFacets::Ptr{GDALTriFacet}
    pasFacetCoefficients::Ptr{GDALTriBarycentricCoefficients}
end

function gdalhastriangulation()
    aftercare(ccall((:GDALHasTriangulation, libgdal), Cint, ()))
end

function gdaltriangulationcreatedelaunay(nPoints, padfX, padfY)
    aftercare(ccall((:GDALTriangulationCreateDelaunay, libgdal), Ptr{GDALTriangulation}, (Cint, Ptr{Cdouble}, Ptr{Cdouble}), nPoints, padfX, padfY))
end

function gdaltriangulationcomputebarycentriccoefficients(psDT, padfX, padfY)
    aftercare(ccall((:GDALTriangulationComputeBarycentricCoefficients, libgdal), Cint, (Ptr{GDALTriangulation}, Ptr{Cdouble}, Ptr{Cdouble}), psDT, padfX, padfY))
end

function gdaltriangulationcomputebarycentriccoordinates(psDT, nFacetIdx, dfX, dfY, pdfL1, pdfL2, pdfL3)
    aftercare(ccall((:GDALTriangulationComputeBarycentricCoordinates, libgdal), Cint, (Ptr{GDALTriangulation}, Cint, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), psDT, nFacetIdx, dfX, dfY, pdfL1, pdfL2, pdfL3))
end

function gdaltriangulationfindfacetbruteforce(psDT, dfX, dfY, panOutputFacetIdx)
    aftercare(ccall((:GDALTriangulationFindFacetBruteForce, libgdal), Cint, (Ptr{GDALTriangulation}, Cdouble, Cdouble, Ptr{Cint}), psDT, dfX, dfY, panOutputFacetIdx))
end

function gdaltriangulationfindfacetdirected(psDT, nFacetIdx, dfX, dfY, panOutputFacetIdx)
    aftercare(ccall((:GDALTriangulationFindFacetDirected, libgdal), Cint, (Ptr{GDALTriangulation}, Cint, Cdouble, Cdouble, Ptr{Cint}), psDT, nFacetIdx, dfX, dfY, panOutputFacetIdx))
end

function gdaltriangulationfree(psDT)
    aftercare(ccall((:GDALTriangulationFree, libgdal), Cvoid, (Ptr{GDALTriangulation},), psDT))
end

"""
    gdaltriangulationterminate()

Doxygen\\_Suppress 
"""
function gdaltriangulationterminate()
    aftercare(ccall((:GDALTriangulationTerminate, libgdal), Cvoid, ()))
end

function gdalopenverticalshiftgrid(pszProj4Geoidgrids, pbError)
    aftercare(ccall((:GDALOpenVerticalShiftGrid, libgdal), GDALDatasetH, (Cstring, Ptr{Cint}), pszProj4Geoidgrids, pbError))
end

function gdalapplyverticalshiftgrid(hSrcDataset, hGridDataset, bInverse, dfSrcUnitToMeter, dfDstUnitToMeter, papszOptions)
    aftercare(ccall((:GDALApplyVerticalShiftGrid, libgdal), GDALDatasetH, (GDALDatasetH, GDALDatasetH, Cint, Cdouble, Cdouble, Ptr{Cstring}), hSrcDataset, hGridDataset, bInverse, dfSrcUnitToMeter, dfDstUnitToMeter, papszOptions))
end

# typedef void ( * CPLThreadFunc ) ( void * )
const CPLThreadFunc = Ptr{Cvoid}

function cpllockfile(pszPath, dfWaitInSeconds)
    aftercare(ccall((:CPLLockFile, libgdal), Ptr{Cvoid}, (Cstring, Cdouble), pszPath, dfWaitInSeconds))
end

function cplunlockfile(hLock)
    aftercare(ccall((:CPLUnlockFile, libgdal), Cvoid, (Ptr{Cvoid},), hLock))
end

function cplcreatemutex()
    aftercare(ccall((:CPLCreateMutex, libgdal), Ptr{Cvoid}, ()))
end

function cplcreatemutexex(nOptions)
    aftercare(ccall((:CPLCreateMutexEx, libgdal), Ptr{Cvoid}, (Cint,), nOptions))
end

function cplcreateoracquiremutex(arg1, dfWaitInSeconds)
    aftercare(ccall((:CPLCreateOrAcquireMutex, libgdal), Cint, (Ptr{Ptr{Cvoid}}, Cdouble), arg1, dfWaitInSeconds))
end

function cplcreateoracquiremutexex(arg1, dfWaitInSeconds, nOptions)
    aftercare(ccall((:CPLCreateOrAcquireMutexEx, libgdal), Cint, (Ptr{Ptr{Cvoid}}, Cdouble, Cint), arg1, dfWaitInSeconds, nOptions))
end

function cplacquiremutex(hMutex, dfWaitInSeconds)
    aftercare(ccall((:CPLAcquireMutex, libgdal), Cint, (Ptr{Cvoid}, Cdouble), hMutex, dfWaitInSeconds))
end

function cplreleasemutex(hMutex)
    aftercare(ccall((:CPLReleaseMutex, libgdal), Cvoid, (Ptr{Cvoid},), hMutex))
end

function cpldestroymutex(hMutex)
    aftercare(ccall((:CPLDestroyMutex, libgdal), Cvoid, (Ptr{Cvoid},), hMutex))
end

function cplcleanupmastermutex()
    aftercare(ccall((:CPLCleanupMasterMutex, libgdal), Cvoid, ()))
end

function cplcreatecond()
    aftercare(ccall((:CPLCreateCond, libgdal), Ptr{Cvoid}, ()))
end

function cplcondwait(hCond, hMutex)
    aftercare(ccall((:CPLCondWait, libgdal), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), hCond, hMutex))
end

@cenum CPLCondTimedWaitReason::UInt32 begin
    COND_TIMED_WAIT_COND = 0
    COND_TIMED_WAIT_TIME_OUT = 1
    COND_TIMED_WAIT_OTHER = 2
end

function cplcondtimedwait(hCond, hMutex, dfWaitInSeconds)
    aftercare(ccall((:CPLCondTimedWait, libgdal), CPLCondTimedWaitReason, (Ptr{Cvoid}, Ptr{Cvoid}, Cdouble), hCond, hMutex, dfWaitInSeconds))
end

function cplcondsignal(hCond)
    aftercare(ccall((:CPLCondSignal, libgdal), Cvoid, (Ptr{Cvoid},), hCond))
end

function cplcondbroadcast(hCond)
    aftercare(ccall((:CPLCondBroadcast, libgdal), Cvoid, (Ptr{Cvoid},), hCond))
end

function cpldestroycond(hCond)
    aftercare(ccall((:CPLDestroyCond, libgdal), Cvoid, (Ptr{Cvoid},), hCond))
end

"""
    cplgetpid()

Contrary to what its name suggests, [`CPLGetPID`](@ref)() actually returns the thread id 
"""
function cplgetpid()
    aftercare(ccall((:CPLGetPID, libgdal), GIntBig, ()))
end

function cplgetcurrentprocessid()
    aftercare(ccall((:CPLGetCurrentProcessID, libgdal), Cint, ()))
end

function cplcreatethread(pfnMain, pArg)
    aftercare(ccall((:CPLCreateThread, libgdal), Cint, (CPLThreadFunc, Ptr{Cvoid}), pfnMain, pArg))
end

function cplcreatejoinablethread(pfnMain, pArg)
    aftercare(ccall((:CPLCreateJoinableThread, libgdal), Ptr{Cvoid}, (CPLThreadFunc, Ptr{Cvoid}), pfnMain, pArg))
end

function cpljointhread(hJoinableThread)
    aftercare(ccall((:CPLJoinThread, libgdal), Cvoid, (Ptr{Cvoid},), hJoinableThread))
end

function cplsleep(dfWaitInSeconds)
    aftercare(ccall((:CPLSleep, libgdal), Cvoid, (Cdouble,), dfWaitInSeconds))
end

function cplgetthreadingmodel()
    aftercare(ccall((:CPLGetThreadingModel, libgdal), Cstring, ()), false)
end

function cplgetnumcpus()
    aftercare(ccall((:CPLGetNumCPUs, libgdal), Cint, ()))
end

const _CPLLock = Cvoid

const CPLLock = _CPLLock

@cenum CPLLockType::UInt32 begin
    LOCK_RECURSIVE_MUTEX = 0
    LOCK_ADAPTIVE_MUTEX = 1
    LOCK_SPIN = 2
end

function cplcreatelock(eType)
    aftercare(ccall((:CPLCreateLock, libgdal), Ptr{CPLLock}, (CPLLockType,), eType))
end

function cplcreateoracquirelock(arg1, eType)
    aftercare(ccall((:CPLCreateOrAcquireLock, libgdal), Cint, (Ptr{Ptr{CPLLock}}, CPLLockType), arg1, eType))
end

function cplacquirelock(arg1)
    aftercare(ccall((:CPLAcquireLock, libgdal), Cint, (Ptr{CPLLock},), arg1))
end

function cplreleaselock(arg1)
    aftercare(ccall((:CPLReleaseLock, libgdal), Cvoid, (Ptr{CPLLock},), arg1))
end

function cpldestroylock(arg1)
    aftercare(ccall((:CPLDestroyLock, libgdal), Cvoid, (Ptr{CPLLock},), arg1))
end

function cpllocksetdebugperf(arg1, bEnableIn)
    aftercare(ccall((:CPLLockSetDebugPerf, libgdal), Cvoid, (Ptr{CPLLock}, Cint), arg1, bEnableIn))
end

function cplgettls(nIndex)
    aftercare(ccall((:CPLGetTLS, libgdal), Ptr{Cvoid}, (Cint,), nIndex))
end

function cplgettlsex(nIndex, pbMemoryErrorOccurred)
    aftercare(ccall((:CPLGetTLSEx, libgdal), Ptr{Cvoid}, (Cint, Ptr{Cint}), nIndex, pbMemoryErrorOccurred))
end

function cplsettls(nIndex, pData, bFreeOnExit)
    aftercare(ccall((:CPLSetTLS, libgdal), Cvoid, (Cint, Ptr{Cvoid}, Cint), nIndex, pData, bFreeOnExit))
end

# typedef void ( * CPLTLSFreeFunc ) ( void * pData )
const CPLTLSFreeFunc = Ptr{Cvoid}

function cplsettlswithfreefunc(nIndex, pData, pfnFree)
    aftercare(ccall((:CPLSetTLSWithFreeFunc, libgdal), Cvoid, (Cint, Ptr{Cvoid}, CPLTLSFreeFunc), nIndex, pData, pfnFree))
end

function cplsettlswithfreefuncex(nIndex, pData, pfnFree, pbMemoryErrorOccurred)
    aftercare(ccall((:CPLSetTLSWithFreeFuncEx, libgdal), Cvoid, (Cint, Ptr{Cvoid}, CPLTLSFreeFunc, Ptr{Cint}), nIndex, pData, pfnFree, pbMemoryErrorOccurred))
end

function cplcleanuptls()
    aftercare(ccall((:CPLCleanupTLS, libgdal), Cvoid, ()))
end

"""
    GDALResampleAlg

Warp Resampling Algorithm 

| Enumerator             | Note                                                                                      |
| :--------------------- | :---------------------------------------------------------------------------------------- |
| GRA\\_NearestNeighbour | Nearest neighbour (select on one input pixel)                                             |
| GRA\\_Bilinear         | Bilinear (2x2 kernel)                                                                     |
| GRA\\_Cubic            | Cubic Convolution Approximation (4x4 kernel)                                              |
| GRA\\_CubicSpline      | Cubic B-Spline Approximation (4x4 kernel)                                                 |
| GRA\\_Lanczos          | Lanczos windowed sinc interpolation (6x6 kernel)                                          |
| GRA\\_Average          | Average (computes the weighted average of all non-NODATA contributing pixels)             |
| GRA\\_Mode             | Mode (selects the value which appears most often of all the sampled points)               |
| GRA\\_Max              | Max (selects maximum of all non-NODATA contributing pixels)                               |
| GRA\\_Min              | Min (selects minimum of all non-NODATA contributing pixels)                               |
| GRA\\_Med              | Med (selects median of all non-NODATA contributing pixels)                                |
| GRA\\_Q1               | Q1 (selects first quartile of all non-NODATA contributing pixels)                         |
| GRA\\_Q3               | Q3 (selects third quartile of all non-NODATA contributing pixels)                         |
| GRA\\_Sum              | Sum (computes the weighed sum of all non-NODATA contributing pixels). Added in GDAL 3.1   |
"""
@cenum GDALResampleAlg::UInt32 begin
    GRA_NearestNeighbour = 0
    GRA_Bilinear = 1
    GRA_Cubic = 2
    GRA_CubicSpline = 3
    GRA_Lanczos = 4
    GRA_Average = 5
    GRA_Mode = 6
    GRA_Max = 8
    GRA_Min = 9
    GRA_Med = 10
    GRA_Q1 = 11
    GRA_Q3 = 12
    GRA_Sum = 13
end

"""
    GWKAverageOrModeAlg

GWKAverageOrMode Algorithm 

| Enumerator       | Note                                               |
| :--------------- | :------------------------------------------------- |
| GWKAOM\\_Average | Average                                            |
| GWKAOM\\_Fmode   | Mode                                               |
| GWKAOM\\_Imode   | Mode of GDT\\_Byte, GDT\\_UInt16, or GDT\\_Int16   |
| GWKAOM\\_Max     | Maximum                                            |
| GWKAOM\\_Min     | Minimum                                            |
| GWKAOM\\_Quant   | Quantile                                           |
| GWKAOM\\_Sum     | Sum                                                |
"""
@cenum GWKAverageOrModeAlg::UInt32 begin
    GWKAOM_Average = 1
    GWKAOM_Fmode = 2
    GWKAOM_Imode = 3
    GWKAOM_Max = 4
    GWKAOM_Min = 5
    GWKAOM_Quant = 6
    GWKAOM_Sum = 7
end

# typedef int ( * GDALMaskFunc ) ( void * pMaskFuncArg , int nBandCount , GDALDataType eType , int nXOff , int nYOff , int nXSize , int nYSize , GByte * * papabyImageData , int bMaskIsFloat , void * pMask )
"""Doxygen\\_Suppress """
const GDALMaskFunc = Ptr{Cvoid}

function gdalwarpnodatamasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, papabyImageData, bMaskIsFloat, pValidityMask, pbOutAllValid)
    aftercare(ccall((:GDALWarpNoDataMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}, Ptr{Cint}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, papabyImageData, bMaskIsFloat, pValidityMask, pbOutAllValid))
end

function gdalwarpdstalphamasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask)
    aftercare(ccall((:GDALWarpDstAlphaMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask))
end

function gdalwarpsrcalphamasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask, pbOutAllOpaque)
    aftercare(ccall((:GDALWarpSrcAlphaMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}, Ptr{Cint}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask, pbOutAllOpaque))
end

function gdalwarpsrcmaskmasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask)
    aftercare(ccall((:GDALWarpSrcMaskMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask))
end

function gdalwarpcutlinemasker(pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask)
    aftercare(ccall((:GDALWarpCutlineMasker, libgdal), CPLErr, (Ptr{Cvoid}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{Cvoid}), pMaskFuncArg, nBandCount, eType, nXOff, nYOff, nXSize, nYSize, arg8, bMaskIsFloat, pValidityMask))
end

"""
    GDALWarpOptions

Warp control options for use with GDALWarpOperation::Initialize() 

| Field                            | Note                                                                                                                                                                       |
| :------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| dfWarpMemoryLimit                | In bytes, 0.0 for internal default                                                                                                                                         |
| eResampleAlg                     | Resampling algorithm to use                                                                                                                                                |
| eWorkingDataType                 | data type to use during warp operation, GDT\\_Unknown lets the algorithm select the type                                                                                   |
| hSrcDS                           | Source image dataset.                                                                                                                                                      |
| hDstDS                           | Destination image dataset - may be NULL if only using GDALWarpOperation::WarpRegionToBuffer().                                                                             |
| nBandCount                       | Number of bands to process, may be 0 to select all bands.                                                                                                                  |
| panSrcBands                      | The band numbers for the source bands to process (1 based)                                                                                                                 |
| panDstBands                      | The band numbers for the destination bands to process (1 based)                                                                                                            |
| nSrcAlphaBand                    | The source band so use as an alpha (transparency) value, 0=disabled                                                                                                        |
| nDstAlphaBand                    | The dest. band so use as an alpha (transparency) value, 0=disabled                                                                                                         |
| padfSrcNoDataReal                | The "nodata" value real component for each input band, if NULL there isn't one                                                                                             |
| padfSrcNoDataImag                | The "nodata" value imaginary component - may be NULL even if real component is provided. This value is not used to flag invalid values. Only the real component is used.   |
| padfDstNoDataReal                | The "nodata" value real component for each output band, if NULL there isn't one                                                                                            |
| padfDstNoDataImag                | The "nodata" value imaginary component - may be NULL even if real component is provided. Note that warp operations only use real component for flagging invalid data.      |
| pfnProgress                      | [`GDALProgressFunc`](@ref)() compatible progress reporting function, or NULL if there isn't one.                                                                           |
| pProgressArg                     | Callback argument to be passed to pfnProgress.                                                                                                                             |
| pfnTransformer                   | Type of spatial point transformer function                                                                                                                                 |
| pTransformerArg                  | Handle to image transformer setup structure                                                                                                                                |
| papfnSrcPerBandValidityMaskFunc  | Unused. Must be NULL                                                                                                                                                       |
| papSrcPerBandValidityMaskFuncArg |                                                                                                                                                                            |
| pfnSrcValidityMaskFunc           |                                                                                                                                                                            |
| pSrcValidityMaskFuncArg          |                                                                                                                                                                            |
| pfnSrcDensityMaskFunc            |                                                                                                                                                                            |
| pSrcDensityMaskFuncArg           |                                                                                                                                                                            |
| pfnDstDensityMaskFunc            |                                                                                                                                                                            |
| pDstDensityMaskFuncArg           |                                                                                                                                                                            |
| pfnDstValidityMaskFunc           |                                                                                                                                                                            |
| pDstValidityMaskFuncArg          |                                                                                                                                                                            |
| pfnPreWarpChunkProcessor         |                                                                                                                                                                            |
| pPreWarpProcessorArg             |                                                                                                                                                                            |
| pfnPostWarpChunkProcessor        |                                                                                                                                                                            |
| pPostWarpProcessorArg            |                                                                                                                                                                            |
| hCutline                         | Optional OGRPolygonH for a masking cutline.                                                                                                                                |
| dfCutlineBlendDist               | Optional blending distance to apply across cutline in pixels, default is zero.                                                                                             |
"""
struct GDALWarpOptions
    papszWarpOptions::Ptr{Cstring}
    dfWarpMemoryLimit::Cdouble
    eResampleAlg::GDALResampleAlg
    eWorkingDataType::GDALDataType
    hSrcDS::GDALDatasetH
    hDstDS::GDALDatasetH
    nBandCount::Cint
    panSrcBands::Ptr{Cint}
    panDstBands::Ptr{Cint}
    nSrcAlphaBand::Cint
    nDstAlphaBand::Cint
    padfSrcNoDataReal::Ptr{Cdouble}
    padfSrcNoDataImag::Ptr{Cdouble}
    padfDstNoDataReal::Ptr{Cdouble}
    padfDstNoDataImag::Ptr{Cdouble}
    pfnProgress::GDALProgressFunc
    pProgressArg::Ptr{Cvoid}
    pfnTransformer::GDALTransformerFunc
    pTransformerArg::Ptr{Cvoid}
    papfnSrcPerBandValidityMaskFunc::Ptr{GDALMaskFunc}
    papSrcPerBandValidityMaskFuncArg::Ptr{Ptr{Cvoid}}
    pfnSrcValidityMaskFunc::GDALMaskFunc
    pSrcValidityMaskFuncArg::Ptr{Cvoid}
    pfnSrcDensityMaskFunc::GDALMaskFunc
    pSrcDensityMaskFuncArg::Ptr{Cvoid}
    pfnDstDensityMaskFunc::GDALMaskFunc
    pDstDensityMaskFuncArg::Ptr{Cvoid}
    pfnDstValidityMaskFunc::GDALMaskFunc
    pDstValidityMaskFuncArg::Ptr{Cvoid}
    pfnPreWarpChunkProcessor::Ptr{Cvoid}
    pPreWarpProcessorArg::Ptr{Cvoid}
    pfnPostWarpChunkProcessor::Ptr{Cvoid}
    pPostWarpProcessorArg::Ptr{Cvoid}
    hCutline::Ptr{Cvoid}
    dfCutlineBlendDist::Cdouble
end

function gdalcreatewarpoptions()
    aftercare(ccall((:GDALCreateWarpOptions, libgdal), Ptr{GDALWarpOptions}, ()))
end

function gdaldestroywarpoptions(arg1)
    aftercare(ccall((:GDALDestroyWarpOptions, libgdal), Cvoid, (Ptr{GDALWarpOptions},), arg1))
end

function gdalclonewarpoptions(arg1)
    aftercare(ccall((:GDALCloneWarpOptions, libgdal), Ptr{GDALWarpOptions}, (Ptr{GDALWarpOptions},), arg1))
end

function gdalwarpinitdstnodatareal(arg1, dNoDataReal)
    aftercare(ccall((:GDALWarpInitDstNoDataReal, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataReal))
end

function gdalwarpinitsrcnodatareal(arg1, dNoDataReal)
    aftercare(ccall((:GDALWarpInitSrcNoDataReal, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataReal))
end

function gdalwarpinitnodatareal(arg1, dNoDataReal)
    aftercare(ccall((:GDALWarpInitNoDataReal, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataReal))
end

function gdalwarpinitdstnodataimag(arg1, dNoDataImag)
    aftercare(ccall((:GDALWarpInitDstNoDataImag, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataImag))
end

function gdalwarpinitsrcnodataimag(arg1, dNoDataImag)
    aftercare(ccall((:GDALWarpInitSrcNoDataImag, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cdouble), arg1, dNoDataImag))
end

function gdalwarpresolveworkingdatatype(arg1)
    aftercare(ccall((:GDALWarpResolveWorkingDataType, libgdal), Cvoid, (Ptr{GDALWarpOptions},), arg1))
end

function gdalwarpinitdefaultbandmapping(arg1, nBandCount)
    aftercare(ccall((:GDALWarpInitDefaultBandMapping, libgdal), Cvoid, (Ptr{GDALWarpOptions}, Cint), arg1, nBandCount))
end

"""
    gdalserializewarpoptions(arg1)

Doxygen\\_Suppress 
"""
function gdalserializewarpoptions(arg1)
    aftercare(ccall((:GDALSerializeWarpOptions, libgdal), Ptr{CPLXMLNode}, (Ptr{GDALWarpOptions},), arg1))
end

function gdaldeserializewarpoptions(arg1)
    aftercare(ccall((:GDALDeserializeWarpOptions, libgdal), Ptr{GDALWarpOptions}, (Ptr{CPLXMLNode},), arg1))
end

"""
    gdalreprojectimage(hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions)

*********************************************************************
"""
function gdalreprojectimage(hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions)
    aftercare(ccall((:GDALReprojectImage, libgdal), CPLErr, (GDALDatasetH, Cstring, GDALDatasetH, Cstring, GDALResampleAlg, Cdouble, Cdouble, GDALProgressFunc, Ptr{Cvoid}, Ptr{GDALWarpOptions}), hSrcDS, pszSrcWKT, hDstDS, pszDstWKT, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions))
end

function gdalcreateandreprojectimage(hSrcDS, pszSrcWKT, pszDstFilename, pszDstWKT, hDstDriver, papszCreateOptions, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions)
    aftercare(ccall((:GDALCreateAndReprojectImage, libgdal), CPLErr, (GDALDatasetH, Cstring, Cstring, Cstring, GDALDriverH, Ptr{Cstring}, GDALResampleAlg, Cdouble, Cdouble, GDALProgressFunc, Ptr{Cvoid}, Ptr{GDALWarpOptions}), hSrcDS, pszSrcWKT, pszDstFilename, pszDstWKT, hDstDriver, papszCreateOptions, eResampleAlg, dfWarpMemoryLimit, dfMaxError, pfnProgress, pProgressArg, psOptions))
end

"""
    gdalautocreatewarpedvrt(hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions)

*********************************************************************
"""
function gdalautocreatewarpedvrt(hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions)
    aftercare(ccall((:GDALAutoCreateWarpedVRT, libgdal), GDALDatasetH, (GDALDatasetH, Cstring, Cstring, GDALResampleAlg, Cdouble, Ptr{GDALWarpOptions}), hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions))
end

function gdalautocreatewarpedvrtex(hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions, papszTransformerOptions)
    aftercare(ccall((:GDALAutoCreateWarpedVRTEx, libgdal), GDALDatasetH, (GDALDatasetH, Cstring, Cstring, GDALResampleAlg, Cdouble, Ptr{GDALWarpOptions}, CSLConstList), hSrcDS, pszSrcWKT, pszDstWKT, eResampleAlg, dfMaxError, psOptions, papszTransformerOptions))
end

function gdalcreatewarpedvrt(hSrcDS, nPixels, nLines, padfGeoTransform, psOptions)
    aftercare(ccall((:GDALCreateWarpedVRT, libgdal), GDALDatasetH, (GDALDatasetH, Cint, Cint, Ptr{Cdouble}, Ptr{GDALWarpOptions}), hSrcDS, nPixels, nLines, padfGeoTransform, psOptions))
end

function gdalinitializewarpedvrt(hDS, psWO)
    aftercare(ccall((:GDALInitializeWarpedVRT, libgdal), CPLErr, (GDALDatasetH, Ptr{GDALWarpOptions}), hDS, psWO))
end

"""Opaque type representing a GDALWarpOperation object """
const GDALWarpOperationH = Ptr{Cvoid}

function gdalcreatewarpoperation(arg1)
    aftercare(ccall((:GDALCreateWarpOperation, libgdal), GDALWarpOperationH, (Ptr{GDALWarpOptions},), arg1))
end

function gdaldestroywarpoperation(arg1)
    aftercare(ccall((:GDALDestroyWarpOperation, libgdal), Cvoid, (GDALWarpOperationH,), arg1))
end

function gdalchunkandwarpimage(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALChunkAndWarpImage, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5))
end

function gdalchunkandwarpmulti(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:GDALChunkAndWarpMulti, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5))
end

function gdalwarpregion(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    aftercare(ccall((:GDALWarpRegion, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9))
end

function gdalwarpregiontobuffer(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11)
    aftercare(ccall((:GDALWarpRegionToBuffer, libgdal), CPLErr, (GDALWarpOperationH, Cint, Cint, Cint, Cint, Ptr{Cvoid}, GDALDataType, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11))
end

"""
    gwkgetfilterradius(eResampleAlg)

Doxygen\\_Suppress 
"""
function gwkgetfilterradius(eResampleAlg)
    aftercare(ccall((:GWKGetFilterRadius, libgdal), Cint, (GDALResampleAlg,), eResampleAlg))
end

# typedef double ( * FilterFuncType ) ( double dfX )
const FilterFuncType = Ptr{Cvoid}

function gwkgetfilterfunc(eResampleAlg)
    aftercare(ccall((:GWKGetFilterFunc, libgdal), FilterFuncType, (GDALResampleAlg,), eResampleAlg))
end

# typedef double ( * FilterFunc4ValuesType ) ( double * padfVals )
const FilterFunc4ValuesType = Ptr{Cvoid}

function gwkgetfilterfunc4values(eResampleAlg)
    aftercare(ccall((:GWKGetFilterFunc4Values, libgdal), FilterFunc4ValuesType, (GDALResampleAlg,), eResampleAlg))
end

# typedef CPLErr ( * VRTImageReadFunc ) ( void * hCBData , int nXOff , int nYOff , int nXSize , int nYSize , void * pData )
"""Type for a function that returns the pixel data in a provided window """
const VRTImageReadFunc = Ptr{Cvoid}

"""Doxygen\\_Suppress """
const VRTAveragedSourceH = Ptr{Cvoid}

const VRTAverageFilteredSourceH = Ptr{Cvoid}

const VRTComplexSourceH = Ptr{Cvoid}

const VRTDerivedRasterBandH = Ptr{Cvoid}

const VRTDriverH = Ptr{Cvoid}

const VRTFilteredSourceH = Ptr{Cvoid}

const VRTFuncSourceH = Ptr{Cvoid}

const VRTKernelFilteredSourceH = Ptr{Cvoid}

const VRTRasterBandH = Ptr{Cvoid}

const VRTRawRasterBandH = Ptr{Cvoid}

const VRTSimpleSourceH = Ptr{Cvoid}

const VRTSourceH = Ptr{Cvoid}

const VRTWarpedDatasetH = Ptr{Cvoid}

const VRTWarpedRasterBandH = Ptr{Cvoid}

"""Opaque type for a VRT dataset """
const VRTDatasetH = Ptr{Cvoid}

"""Opaque type for a VRT sourced raster band """
const VRTSourcedRasterBandH = Ptr{Cvoid}

function vrtcreate(arg1, arg2)
    aftercare(ccall((:VRTCreate, libgdal), VRTDatasetH, (Cint, Cint), arg1, arg2))
end

function vrtflushcache(arg1)
    aftercare(ccall((:VRTFlushCache, libgdal), Cvoid, (VRTDatasetH,), arg1))
end

function vrtserializetoxml(arg1, arg2)
    aftercare(ccall((:VRTSerializeToXML, libgdal), Ptr{CPLXMLNode}, (VRTDatasetH, Cstring), arg1, arg2))
end

function vrtaddband(arg1, arg2, arg3)
    aftercare(ccall((:VRTAddBand, libgdal), Cint, (VRTDatasetH, GDALDataType, Ptr{Cstring}), arg1, arg2, arg3))
end

function vrtaddsource(arg1, arg2)
    aftercare(ccall((:VRTAddSource, libgdal), CPLErr, (VRTSourcedRasterBandH, VRTSourceH), arg1, arg2))
end

function vrtaddsimplesource(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
    aftercare(ccall((:VRTAddSimpleSource, libgdal), CPLErr, (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cstring, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12))
end

function vrtaddcomplexsource(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
    aftercare(ccall((:VRTAddComplexSource, libgdal), CPLErr, (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13))
end

function vrtaddfuncsource(arg1, arg2, arg3, arg4)
    aftercare(ccall((:VRTAddFuncSource, libgdal), CPLErr, (VRTSourcedRasterBandH, VRTImageReadFunc, Ptr{Cvoid}, Cdouble), arg1, arg2, arg3, arg4))
end

const GDALInfoOptions = Cvoid

const GDALInfoOptionsForBinary = Cvoid

function gdalinfooptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALInfoOptionsNew, libgdal), Ptr{GDALInfoOptions}, (Ptr{Cstring}, Ptr{GDALInfoOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdalinfooptionsfree(psOptions)
    aftercare(ccall((:GDALInfoOptionsFree, libgdal), Cvoid, (Ptr{GDALInfoOptions},), psOptions))
end

function gdalinfo(hDataset, psOptions)
    aftercare(ccall((:GDALInfo, libgdal), Cstring, (GDALDatasetH, Ptr{GDALInfoOptions}), hDataset, psOptions), true)
end

const GDALTranslateOptions = Cvoid

const GDALTranslateOptionsForBinary = Cvoid

function gdaltranslateoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALTranslateOptionsNew, libgdal), Ptr{GDALTranslateOptions}, (Ptr{Cstring}, Ptr{GDALTranslateOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdaltranslateoptionsfree(psOptions)
    aftercare(ccall((:GDALTranslateOptionsFree, libgdal), Cvoid, (Ptr{GDALTranslateOptions},), psOptions))
end

function gdaltranslateoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALTranslateOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALTranslateOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

function gdaltranslate(pszDestFilename, hSrcDataset, psOptions, pbUsageError)
    aftercare(ccall((:GDALTranslate, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Ptr{GDALTranslateOptions}, Ptr{Cint}), pszDestFilename, hSrcDataset, psOptions, pbUsageError))
end

const GDALWarpAppOptions = Cvoid

const GDALWarpAppOptionsForBinary = Cvoid

function gdalwarpappoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALWarpAppOptionsNew, libgdal), Ptr{GDALWarpAppOptions}, (Ptr{Cstring}, Ptr{GDALWarpAppOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdalwarpappoptionsfree(psOptions)
    aftercare(ccall((:GDALWarpAppOptionsFree, libgdal), Cvoid, (Ptr{GDALWarpAppOptions},), psOptions))
end

function gdalwarpappoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALWarpAppOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALWarpAppOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

function gdalwarpappoptionssetquiet(psOptions, bQuiet)
    aftercare(ccall((:GDALWarpAppOptionsSetQuiet, libgdal), Cvoid, (Ptr{GDALWarpAppOptions}, Cint), psOptions, bQuiet))
end

function gdalwarpappoptionssetwarpoption(psOptions, pszKey, pszValue)
    aftercare(ccall((:GDALWarpAppOptionsSetWarpOption, libgdal), Cvoid, (Ptr{GDALWarpAppOptions}, Cstring, Cstring), psOptions, pszKey, pszValue))
end

function gdalwarp(pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALWarp, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cint, Ptr{GDALDatasetH}, Ptr{GDALWarpAppOptions}, Ptr{Cint}), pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError))
end

const GDALVectorTranslateOptions = Cvoid

const GDALVectorTranslateOptionsForBinary = Cvoid

function gdalvectortranslateoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALVectorTranslateOptionsNew, libgdal), Ptr{GDALVectorTranslateOptions}, (Ptr{Cstring}, Ptr{GDALVectorTranslateOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdalvectortranslateoptionsfree(psOptions)
    aftercare(ccall((:GDALVectorTranslateOptionsFree, libgdal), Cvoid, (Ptr{GDALVectorTranslateOptions},), psOptions))
end

function gdalvectortranslateoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALVectorTranslateOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALVectorTranslateOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

function gdalvectortranslate(pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALVectorTranslate, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cint, Ptr{GDALDatasetH}, Ptr{GDALVectorTranslateOptions}, Ptr{Cint}), pszDest, hDstDS, nSrcCount, pahSrcDS, psOptions, pbUsageError))
end

const GDALDEMProcessingOptions = Cvoid

const GDALDEMProcessingOptionsForBinary = Cvoid

function gdaldemprocessingoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALDEMProcessingOptionsNew, libgdal), Ptr{GDALDEMProcessingOptions}, (Ptr{Cstring}, Ptr{GDALDEMProcessingOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdaldemprocessingoptionsfree(psOptions)
    aftercare(ccall((:GDALDEMProcessingOptionsFree, libgdal), Cvoid, (Ptr{GDALDEMProcessingOptions},), psOptions))
end

function gdaldemprocessingoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALDEMProcessingOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALDEMProcessingOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

function gdaldemprocessing(pszDestFilename, hSrcDataset, pszProcessing, pszColorFilename, psOptions, pbUsageError)
    aftercare(ccall((:GDALDEMProcessing, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cstring, Cstring, Ptr{GDALDEMProcessingOptions}, Ptr{Cint}), pszDestFilename, hSrcDataset, pszProcessing, pszColorFilename, psOptions, pbUsageError))
end

const GDALNearblackOptions = Cvoid

const GDALNearblackOptionsForBinary = Cvoid

function gdalnearblackoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALNearblackOptionsNew, libgdal), Ptr{GDALNearblackOptions}, (Ptr{Cstring}, Ptr{GDALNearblackOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdalnearblackoptionsfree(psOptions)
    aftercare(ccall((:GDALNearblackOptionsFree, libgdal), Cvoid, (Ptr{GDALNearblackOptions},), psOptions))
end

function gdalnearblackoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALNearblackOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALNearblackOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

function gdalnearblack(pszDest, hDstDS, hSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALNearblack, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, GDALDatasetH, Ptr{GDALNearblackOptions}, Ptr{Cint}), pszDest, hDstDS, hSrcDS, psOptions, pbUsageError))
end

const GDALGridOptions = Cvoid

const GDALGridOptionsForBinary = Cvoid

function gdalgridoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALGridOptionsNew, libgdal), Ptr{GDALGridOptions}, (Ptr{Cstring}, Ptr{GDALGridOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdalgridoptionsfree(psOptions)
    aftercare(ccall((:GDALGridOptionsFree, libgdal), Cvoid, (Ptr{GDALGridOptions},), psOptions))
end

function gdalgridoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALGridOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALGridOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

function gdalgrid(pszDest, hSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALGrid, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Ptr{GDALGridOptions}, Ptr{Cint}), pszDest, hSrcDS, psOptions, pbUsageError))
end

const GDALRasterizeOptions = Cvoid

const GDALRasterizeOptionsForBinary = Cvoid

function gdalrasterizeoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALRasterizeOptionsNew, libgdal), Ptr{GDALRasterizeOptions}, (Ptr{Cstring}, Ptr{GDALRasterizeOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdalrasterizeoptionsfree(psOptions)
    aftercare(ccall((:GDALRasterizeOptionsFree, libgdal), Cvoid, (Ptr{GDALRasterizeOptions},), psOptions))
end

function gdalrasterizeoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALRasterizeOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALRasterizeOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

function gdalrasterize(pszDest, hDstDS, hSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALRasterize, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, GDALDatasetH, Ptr{GDALRasterizeOptions}, Ptr{Cint}), pszDest, hDstDS, hSrcDS, psOptions, pbUsageError))
end

const GDALBuildVRTOptions = Cvoid

const GDALBuildVRTOptionsForBinary = Cvoid

function gdalbuildvrtoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALBuildVRTOptionsNew, libgdal), Ptr{GDALBuildVRTOptions}, (Ptr{Cstring}, Ptr{GDALBuildVRTOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdalbuildvrtoptionsfree(psOptions)
    aftercare(ccall((:GDALBuildVRTOptionsFree, libgdal), Cvoid, (Ptr{GDALBuildVRTOptions},), psOptions))
end

function gdalbuildvrtoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALBuildVRTOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALBuildVRTOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

function gdalbuildvrt(pszDest, nSrcCount, pahSrcDS, papszSrcDSNames, psOptions, pbUsageError)
    aftercare(ccall((:GDALBuildVRT, libgdal), GDALDatasetH, (Cstring, Cint, Ptr{GDALDatasetH}, Ptr{Cstring}, Ptr{GDALBuildVRTOptions}, Ptr{Cint}), pszDest, nSrcCount, pahSrcDS, papszSrcDSNames, psOptions, pbUsageError))
end

const GDALMultiDimInfoOptions = Cvoid

const GDALMultiDimInfoOptionsForBinary = Cvoid

function gdalmultidiminfooptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALMultiDimInfoOptionsNew, libgdal), Ptr{GDALMultiDimInfoOptions}, (Ptr{Cstring}, Ptr{GDALMultiDimInfoOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdalmultidiminfooptionsfree(psOptions)
    aftercare(ccall((:GDALMultiDimInfoOptionsFree, libgdal), Cvoid, (Ptr{GDALMultiDimInfoOptions},), psOptions))
end

function gdalmultidiminfo(hDataset, psOptions)
    aftercare(ccall((:GDALMultiDimInfo, libgdal), Cstring, (GDALDatasetH, Ptr{GDALMultiDimInfoOptions}), hDataset, psOptions), false)
end

const GDALMultiDimTranslateOptions = Cvoid

const GDALMultiDimTranslateOptionsForBinary = Cvoid

function gdalmultidimtranslateoptionsnew(papszArgv, psOptionsForBinary)
    aftercare(ccall((:GDALMultiDimTranslateOptionsNew, libgdal), Ptr{GDALMultiDimTranslateOptions}, (Ptr{Cstring}, Ptr{GDALMultiDimTranslateOptionsForBinary}), papszArgv, psOptionsForBinary))
end

function gdalmultidimtranslateoptionsfree(psOptions)
    aftercare(ccall((:GDALMultiDimTranslateOptionsFree, libgdal), Cvoid, (Ptr{GDALMultiDimTranslateOptions},), psOptions))
end

function gdalmultidimtranslateoptionssetprogress(psOptions, pfnProgress, pProgressData)
    aftercare(ccall((:GDALMultiDimTranslateOptionsSetProgress, libgdal), Cvoid, (Ptr{GDALMultiDimTranslateOptions}, GDALProgressFunc, Ptr{Cvoid}), psOptions, pfnProgress, pProgressData))
end

function gdalmultidimtranslate(pszDest, hDstDataset, nSrcCount, pahSrcDS, psOptions, pbUsageError)
    aftercare(ccall((:GDALMultiDimTranslate, libgdal), GDALDatasetH, (Cstring, GDALDatasetH, Cint, Ptr{GDALDatasetH}, Ptr{GDALMultiDimTranslateOptions}, Ptr{Cint}), pszDest, hDstDataset, nSrcCount, pahSrcDS, psOptions, pbUsageError))
end

"""Opaque type for a coordinate transformation object """
const OGRCoordinateTransformationH = Ptr{Cvoid}

const _CPLXMLNode = Cvoid

function ogr_g_createfromwkb(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_G_CreateFromWkb, libgdal), OGRErr, (Ptr{Cvoid}, OGRSpatialReferenceH, Ptr{OGRGeometryH}, Cint), arg1, arg2, arg3, arg4))
end

function ogr_g_createfromwkt(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_CreateFromWkt, libgdal), OGRErr, (Ptr{Cstring}, OGRSpatialReferenceH, Ptr{OGRGeometryH}), arg1, arg2, arg3))
end

function ogr_g_createfromfgf(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_CreateFromFgf, libgdal), OGRErr, (Ptr{Cvoid}, OGRSpatialReferenceH, Ptr{OGRGeometryH}, Cint, Ptr{Cint}), arg1, arg2, arg3, arg4, arg5))
end

function ogr_g_destroygeometry(arg1)
    aftercare(ccall((:OGR_G_DestroyGeometry, libgdal), Cvoid, (OGRGeometryH,), arg1))
end

function ogr_g_creategeometry(arg1)
    aftercare(ccall((:OGR_G_CreateGeometry, libgdal), OGRGeometryH, (OGRwkbGeometryType,), arg1))
end

function ogr_g_approximatearcangles(dfCenterX, dfCenterY, dfZ, dfPrimaryRadius, dfSecondaryAxis, dfRotation, dfStartAngle, dfEndAngle, dfMaxAngleStepSizeDegrees)
    aftercare(ccall((:OGR_G_ApproximateArcAngles, libgdal), OGRGeometryH, (Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), dfCenterX, dfCenterY, dfZ, dfPrimaryRadius, dfSecondaryAxis, dfRotation, dfStartAngle, dfEndAngle, dfMaxAngleStepSizeDegrees))
end

function ogr_g_forcetopolygon(arg1)
    aftercare(ccall((:OGR_G_ForceToPolygon, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_forcetolinestring(arg1)
    aftercare(ccall((:OGR_G_ForceToLineString, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_forcetomultipolygon(arg1)
    aftercare(ccall((:OGR_G_ForceToMultiPolygon, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_forcetomultipoint(arg1)
    aftercare(ccall((:OGR_G_ForceToMultiPoint, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_forcetomultilinestring(arg1)
    aftercare(ccall((:OGR_G_ForceToMultiLineString, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_forceto(hGeom, eTargetType, papszOptions)
    aftercare(ccall((:OGR_G_ForceTo, libgdal), OGRGeometryH, (OGRGeometryH, OGRwkbGeometryType, Ptr{Cstring}), hGeom, eTargetType, papszOptions))
end

function ogr_g_removelowerdimensionsubgeoms(hGeom)
    aftercare(ccall((:OGR_G_RemoveLowerDimensionSubGeoms, libgdal), OGRGeometryH, (OGRGeometryH,), hGeom))
end

function ogr_g_getdimension(arg1)
    aftercare(ccall((:OGR_G_GetDimension, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_getcoordinatedimension(arg1)
    aftercare(ccall((:OGR_G_GetCoordinateDimension, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_coordinatedimension(arg1)
    aftercare(ccall((:OGR_G_CoordinateDimension, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_setcoordinatedimension(arg1, arg2)
    aftercare(ccall((:OGR_G_SetCoordinateDimension, libgdal), Cvoid, (OGRGeometryH, Cint), arg1, arg2))
end

function ogr_g_is3d(arg1)
    aftercare(ccall((:OGR_G_Is3D, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_ismeasured(arg1)
    aftercare(ccall((:OGR_G_IsMeasured, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_set3d(arg1, arg2)
    aftercare(ccall((:OGR_G_Set3D, libgdal), Cvoid, (OGRGeometryH, Cint), arg1, arg2))
end

function ogr_g_setmeasured(arg1, arg2)
    aftercare(ccall((:OGR_G_SetMeasured, libgdal), Cvoid, (OGRGeometryH, Cint), arg1, arg2))
end

function ogr_g_clone(arg1)
    aftercare(ccall((:OGR_G_Clone, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

struct OGREnvelope
    MinX::Cdouble
    MaxX::Cdouble
    MinY::Cdouble
    MaxY::Cdouble
end

function ogr_g_getenvelope(arg1, arg2)
    aftercare(ccall((:OGR_G_GetEnvelope, libgdal), Cvoid, (OGRGeometryH, Ptr{OGREnvelope}), arg1, arg2))
end

struct OGREnvelope3D
    MinX::Cdouble
    MaxX::Cdouble
    MinY::Cdouble
    MaxY::Cdouble
    MinZ::Cdouble
    MaxZ::Cdouble
end

function ogr_g_getenvelope3d(arg1, arg2)
    aftercare(ccall((:OGR_G_GetEnvelope3D, libgdal), Cvoid, (OGRGeometryH, Ptr{OGREnvelope3D}), arg1, arg2))
end

function ogr_g_importfromwkb(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_ImportFromWkb, libgdal), OGRErr, (OGRGeometryH, Ptr{Cvoid}, Cint), arg1, arg2, arg3))
end

"""
    OGRwkbByteOrder

Enumeration to describe byte order 

| Enumerator | Note                                             |
| :--------- | :----------------------------------------------- |
| wkbXDR     | MSB/Sun/Motoroloa: Most Significant Byte First   |
| wkbNDR     | LSB/Intel/Vax: Least Significant Byte First      |
"""
@cenum OGRwkbByteOrder::UInt32 begin
    wkbXDR = 0
    wkbNDR = 1
end

function ogr_g_exporttowkb(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_ExportToWkb, libgdal), OGRErr, (OGRGeometryH, OGRwkbByteOrder, Ptr{Cuchar}), arg1, arg2, arg3))
end

function ogr_g_exporttoisowkb(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_ExportToIsoWkb, libgdal), OGRErr, (OGRGeometryH, OGRwkbByteOrder, Ptr{Cuchar}), arg1, arg2, arg3))
end

function ogr_g_wkbsize(hGeom)
    aftercare(ccall((:OGR_G_WkbSize, libgdal), Cint, (OGRGeometryH,), hGeom))
end

function ogr_g_importfromwkt(arg1, arg2)
    aftercare(ccall((:OGR_G_ImportFromWkt, libgdal), OGRErr, (OGRGeometryH, Ptr{Cstring}), arg1, arg2))
end

function ogr_g_exporttowkt(arg1, arg2)
    aftercare(ccall((:OGR_G_ExportToWkt, libgdal), OGRErr, (OGRGeometryH, Ptr{Cstring}), arg1, arg2))
end

function ogr_g_exporttoisowkt(arg1, arg2)
    aftercare(ccall((:OGR_G_ExportToIsoWkt, libgdal), OGRErr, (OGRGeometryH, Ptr{Cstring}), arg1, arg2))
end

function ogr_g_getgeometrytype(arg1)
    aftercare(ccall((:OGR_G_GetGeometryType, libgdal), OGRwkbGeometryType, (OGRGeometryH,), arg1))
end

function ogr_g_getgeometryname(arg1)
    aftercare(ccall((:OGR_G_GetGeometryName, libgdal), Cstring, (OGRGeometryH,), arg1), false)
end

function ogr_g_dumpreadable(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_DumpReadable, libgdal), Cvoid, (OGRGeometryH, Ptr{Libc.FILE}, Cstring), arg1, arg2, arg3))
end

function ogr_g_flattento2d(arg1)
    aftercare(ccall((:OGR_G_FlattenTo2D, libgdal), Cvoid, (OGRGeometryH,), arg1))
end

function ogr_g_closerings(arg1)
    aftercare(ccall((:OGR_G_CloseRings, libgdal), Cvoid, (OGRGeometryH,), arg1))
end

function ogr_g_createfromgml(arg1)
    aftercare(ccall((:OGR_G_CreateFromGML, libgdal), OGRGeometryH, (Cstring,), arg1))
end

function ogr_g_exporttogml(arg1)
    aftercare(ccall((:OGR_G_ExportToGML, libgdal), Cstring, (OGRGeometryH,), arg1), false)
end

function ogr_g_exporttogmlex(arg1, papszOptions)
    aftercare(ccall((:OGR_G_ExportToGMLEx, libgdal), Cstring, (OGRGeometryH, Ptr{Cstring}), arg1, papszOptions), false)
end

function ogr_g_createfromgmltree(arg1)
    aftercare(ccall((:OGR_G_CreateFromGMLTree, libgdal), OGRGeometryH, (Ptr{CPLXMLNode},), arg1))
end

function ogr_g_exporttogmltree(arg1)
    aftercare(ccall((:OGR_G_ExportToGMLTree, libgdal), Ptr{CPLXMLNode}, (OGRGeometryH,), arg1))
end

function ogr_g_exportenvelopetogmltree(arg1)
    aftercare(ccall((:OGR_G_ExportEnvelopeToGMLTree, libgdal), Ptr{CPLXMLNode}, (OGRGeometryH,), arg1))
end

function ogr_g_exporttokml(arg1, pszAltitudeMode)
    aftercare(ccall((:OGR_G_ExportToKML, libgdal), Cstring, (OGRGeometryH, Cstring), arg1, pszAltitudeMode), false)
end

function ogr_g_exporttojson(arg1)
    aftercare(ccall((:OGR_G_ExportToJson, libgdal), Cstring, (OGRGeometryH,), arg1), false)
end

function ogr_g_exporttojsonex(arg1, papszOptions)
    aftercare(ccall((:OGR_G_ExportToJsonEx, libgdal), Cstring, (OGRGeometryH, Ptr{Cstring}), arg1, papszOptions), false)
end

"""
    ogr_g_creategeometryfromjson(arg1)

Create a OGR geometry from a GeoJSON geometry object 
"""
function ogr_g_creategeometryfromjson(arg1)
    aftercare(ccall((:OGR_G_CreateGeometryFromJson, libgdal), OGRGeometryH, (Cstring,), arg1))
end

"""
    ogr_g_creategeometryfromesrijson(arg1)

Create a OGR geometry from a ESRI JSON geometry object 
"""
function ogr_g_creategeometryfromesrijson(arg1)
    aftercare(ccall((:OGR_G_CreateGeometryFromEsriJson, libgdal), OGRGeometryH, (Cstring,), arg1))
end

function ogr_g_assignspatialreference(arg1, arg2)
    aftercare(ccall((:OGR_G_AssignSpatialReference, libgdal), Cvoid, (OGRGeometryH, OGRSpatialReferenceH), arg1, arg2))
end

function ogr_g_getspatialreference(arg1)
    aftercare(ccall((:OGR_G_GetSpatialReference, libgdal), OGRSpatialReferenceH, (OGRGeometryH,), arg1))
end

function ogr_g_transform(arg1, arg2)
    aftercare(ccall((:OGR_G_Transform, libgdal), OGRErr, (OGRGeometryH, OGRCoordinateTransformationH), arg1, arg2))
end

function ogr_g_transformto(arg1, arg2)
    aftercare(ccall((:OGR_G_TransformTo, libgdal), OGRErr, (OGRGeometryH, OGRSpatialReferenceH), arg1, arg2))
end

const OGRGeomTransformer = Cvoid

"""Opaque type for a geometry transformer. """
const OGRGeomTransformerH = Ptr{OGRGeomTransformer}

function ogr_geomtransformer_create(arg1, papszOptions)
    aftercare(ccall((:OGR_GeomTransformer_Create, libgdal), OGRGeomTransformerH, (OGRCoordinateTransformationH, CSLConstList), arg1, papszOptions))
end

function ogr_geomtransformer_transform(hTransformer, hGeom)
    aftercare(ccall((:OGR_GeomTransformer_Transform, libgdal), OGRGeometryH, (OGRGeomTransformerH, OGRGeometryH), hTransformer, hGeom))
end

function ogr_geomtransformer_destroy(hTransformer)
    aftercare(ccall((:OGR_GeomTransformer_Destroy, libgdal), Cvoid, (OGRGeomTransformerH,), hTransformer))
end

function ogr_g_simplify(hThis, tolerance)
    aftercare(ccall((:OGR_G_Simplify, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble), hThis, tolerance))
end

function ogr_g_simplifypreservetopology(hThis, tolerance)
    aftercare(ccall((:OGR_G_SimplifyPreserveTopology, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble), hThis, tolerance))
end

function ogr_g_delaunaytriangulation(hThis, dfTolerance, bOnlyEdges)
    aftercare(ccall((:OGR_G_DelaunayTriangulation, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble, Cint), hThis, dfTolerance, bOnlyEdges))
end

function ogr_g_segmentize(hGeom, dfMaxLength)
    aftercare(ccall((:OGR_G_Segmentize, libgdal), Cvoid, (OGRGeometryH, Cdouble), hGeom, dfMaxLength))
end

function ogr_g_intersects(arg1, arg2)
    aftercare(ccall((:OGR_G_Intersects, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_equals(arg1, arg2)
    aftercare(ccall((:OGR_G_Equals, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_disjoint(arg1, arg2)
    aftercare(ccall((:OGR_G_Disjoint, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_touches(arg1, arg2)
    aftercare(ccall((:OGR_G_Touches, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_crosses(arg1, arg2)
    aftercare(ccall((:OGR_G_Crosses, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_within(arg1, arg2)
    aftercare(ccall((:OGR_G_Within, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_contains(arg1, arg2)
    aftercare(ccall((:OGR_G_Contains, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_overlaps(arg1, arg2)
    aftercare(ccall((:OGR_G_Overlaps, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_boundary(arg1)
    aftercare(ccall((:OGR_G_Boundary, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_convexhull(arg1)
    aftercare(ccall((:OGR_G_ConvexHull, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_buffer(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_Buffer, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble, Cint), arg1, arg2, arg3))
end

function ogr_g_intersection(arg1, arg2)
    aftercare(ccall((:OGR_G_Intersection, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_union(arg1, arg2)
    aftercare(ccall((:OGR_G_Union, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_unioncascaded(arg1)
    aftercare(ccall((:OGR_G_UnionCascaded, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_pointonsurface(arg1)
    aftercare(ccall((:OGR_G_PointOnSurface, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_difference(arg1, arg2)
    aftercare(ccall((:OGR_G_Difference, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_symdifference(arg1, arg2)
    aftercare(ccall((:OGR_G_SymDifference, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_distance(arg1, arg2)
    aftercare(ccall((:OGR_G_Distance, libgdal), Cdouble, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_distance3d(arg1, arg2)
    aftercare(ccall((:OGR_G_Distance3D, libgdal), Cdouble, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_length(arg1)
    aftercare(ccall((:OGR_G_Length, libgdal), Cdouble, (OGRGeometryH,), arg1))
end

function ogr_g_area(arg1)
    aftercare(ccall((:OGR_G_Area, libgdal), Cdouble, (OGRGeometryH,), arg1))
end

function ogr_g_centroid(arg1, arg2)
    aftercare(ccall((:OGR_G_Centroid, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_value(arg1, dfDistance)
    aftercare(ccall((:OGR_G_Value, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble), arg1, dfDistance))
end

function ogr_g_empty(arg1)
    aftercare(ccall((:OGR_G_Empty, libgdal), Cvoid, (OGRGeometryH,), arg1))
end

function ogr_g_isempty(arg1)
    aftercare(ccall((:OGR_G_IsEmpty, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_isvalid(arg1)
    aftercare(ccall((:OGR_G_IsValid, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_makevalid(arg1)
    aftercare(ccall((:OGR_G_MakeValid, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_issimple(arg1)
    aftercare(ccall((:OGR_G_IsSimple, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_isring(arg1)
    aftercare(ccall((:OGR_G_IsRing, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_polygonize(arg1)
    aftercare(ccall((:OGR_G_Polygonize, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

"""
    ogr_g_intersect(arg1, arg2)

Doxygen\\_Suppress 
"""
function ogr_g_intersect(arg1, arg2)
    aftercare(ccall((:OGR_G_Intersect, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_equal(arg1, arg2)
    aftercare(ccall((:OGR_G_Equal, libgdal), Cint, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_symmetricdifference(arg1, arg2)
    aftercare(ccall((:OGR_G_SymmetricDifference, libgdal), OGRGeometryH, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_getarea(arg1)
    aftercare(ccall((:OGR_G_GetArea, libgdal), Cdouble, (OGRGeometryH,), arg1))
end

function ogr_g_getboundary(arg1)
    aftercare(ccall((:OGR_G_GetBoundary, libgdal), OGRGeometryH, (OGRGeometryH,), arg1))
end

function ogr_g_getpointcount(arg1)
    aftercare(ccall((:OGR_G_GetPointCount, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_getpoints(hGeom, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride)
    aftercare(ccall((:OGR_G_GetPoints, libgdal), Cint, (OGRGeometryH, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint), hGeom, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride))
end

function ogr_g_getpointszm(hGeom, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride, pabyM, nMStride)
    aftercare(ccall((:OGR_G_GetPointsZM, libgdal), Cint, (OGRGeometryH, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint), hGeom, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride, pabyM, nMStride))
end

function ogr_g_getx(arg1, arg2)
    aftercare(ccall((:OGR_G_GetX, libgdal), Cdouble, (OGRGeometryH, Cint), arg1, arg2))
end

function ogr_g_gety(arg1, arg2)
    aftercare(ccall((:OGR_G_GetY, libgdal), Cdouble, (OGRGeometryH, Cint), arg1, arg2))
end

function ogr_g_getz(arg1, arg2)
    aftercare(ccall((:OGR_G_GetZ, libgdal), Cdouble, (OGRGeometryH, Cint), arg1, arg2))
end

function ogr_g_getm(arg1, arg2)
    aftercare(ccall((:OGR_G_GetM, libgdal), Cdouble, (OGRGeometryH, Cint), arg1, arg2))
end

function ogr_g_getpoint(arg1, iPoint, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_GetPoint, libgdal), Cvoid, (OGRGeometryH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), arg1, iPoint, arg3, arg4, arg5))
end

function ogr_g_getpointzm(arg1, iPoint, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_G_GetPointZM, libgdal), Cvoid, (OGRGeometryH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), arg1, iPoint, arg3, arg4, arg5, arg6))
end

function ogr_g_setpointcount(hGeom, nNewPointCount)
    aftercare(ccall((:OGR_G_SetPointCount, libgdal), Cvoid, (OGRGeometryH, Cint), hGeom, nNewPointCount))
end

function ogr_g_setpoint(arg1, iPoint, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_SetPoint, libgdal), Cvoid, (OGRGeometryH, Cint, Cdouble, Cdouble, Cdouble), arg1, iPoint, arg3, arg4, arg5))
end

function ogr_g_setpoint_2d(arg1, iPoint, arg3, arg4)
    aftercare(ccall((:OGR_G_SetPoint_2D, libgdal), Cvoid, (OGRGeometryH, Cint, Cdouble, Cdouble), arg1, iPoint, arg3, arg4))
end

function ogr_g_setpointm(arg1, iPoint, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_SetPointM, libgdal), Cvoid, (OGRGeometryH, Cint, Cdouble, Cdouble, Cdouble), arg1, iPoint, arg3, arg4, arg5))
end

function ogr_g_setpointzm(arg1, iPoint, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_G_SetPointZM, libgdal), Cvoid, (OGRGeometryH, Cint, Cdouble, Cdouble, Cdouble, Cdouble), arg1, iPoint, arg3, arg4, arg5, arg6))
end

function ogr_g_addpoint(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_G_AddPoint, libgdal), Cvoid, (OGRGeometryH, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4))
end

function ogr_g_addpoint_2d(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_AddPoint_2D, libgdal), Cvoid, (OGRGeometryH, Cdouble, Cdouble), arg1, arg2, arg3))
end

function ogr_g_addpointm(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_G_AddPointM, libgdal), Cvoid, (OGRGeometryH, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4))
end

function ogr_g_addpointzm(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OGR_G_AddPointZM, libgdal), Cvoid, (OGRGeometryH, Cdouble, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5))
end

function ogr_g_setpoints(hGeom, nPointsIn, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride)
    aftercare(ccall((:OGR_G_SetPoints, libgdal), Cvoid, (OGRGeometryH, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint), hGeom, nPointsIn, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride))
end

function ogr_g_setpointszm(hGeom, nPointsIn, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride, pabyM, nMStride)
    aftercare(ccall((:OGR_G_SetPointsZM, libgdal), Cvoid, (OGRGeometryH, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Cint), hGeom, nPointsIn, pabyX, nXStride, pabyY, nYStride, pabyZ, nZStride, pabyM, nMStride))
end

function ogr_g_swapxy(hGeom)
    aftercare(ccall((:OGR_G_SwapXY, libgdal), Cvoid, (OGRGeometryH,), hGeom))
end

function ogr_g_getgeometrycount(arg1)
    aftercare(ccall((:OGR_G_GetGeometryCount, libgdal), Cint, (OGRGeometryH,), arg1))
end

function ogr_g_getgeometryref(arg1, arg2)
    aftercare(ccall((:OGR_G_GetGeometryRef, libgdal), OGRGeometryH, (OGRGeometryH, Cint), arg1, arg2))
end

function ogr_g_addgeometry(arg1, arg2)
    aftercare(ccall((:OGR_G_AddGeometry, libgdal), OGRErr, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_addgeometrydirectly(arg1, arg2)
    aftercare(ccall((:OGR_G_AddGeometryDirectly, libgdal), OGRErr, (OGRGeometryH, OGRGeometryH), arg1, arg2))
end

function ogr_g_removegeometry(arg1, arg2, arg3)
    aftercare(ccall((:OGR_G_RemoveGeometry, libgdal), OGRErr, (OGRGeometryH, Cint, Cint), arg1, arg2, arg3))
end

function ogr_g_hascurvegeometry(arg1, bLookForNonLinear)
    aftercare(ccall((:OGR_G_HasCurveGeometry, libgdal), Cint, (OGRGeometryH, Cint), arg1, bLookForNonLinear))
end

function ogr_g_getlineargeometry(hGeom, dfMaxAngleStepSizeDegrees, papszOptions)
    aftercare(ccall((:OGR_G_GetLinearGeometry, libgdal), OGRGeometryH, (OGRGeometryH, Cdouble, Ptr{Cstring}), hGeom, dfMaxAngleStepSizeDegrees, papszOptions))
end

function ogr_g_getcurvegeometry(hGeom, papszOptions)
    aftercare(ccall((:OGR_G_GetCurveGeometry, libgdal), OGRGeometryH, (OGRGeometryH, Ptr{Cstring}), hGeom, papszOptions))
end

function ogrbuildpolygonfromedges(hLinesAsCollection, bBestEffort, bAutoClose, dfTolerance, peErr)
    aftercare(ccall((:OGRBuildPolygonFromEdges, libgdal), OGRGeometryH, (OGRGeometryH, Cint, Cint, Cdouble, Ptr{OGRErr}), hLinesAsCollection, bBestEffort, bAutoClose, dfTolerance, peErr))
end

"""
    ogrsetgenerate_db2_v72_byte_order(bGenerate_DB2_V72_BYTE_ORDER)

Doxygen\\_Suppress 
"""
function ogrsetgenerate_db2_v72_byte_order(bGenerate_DB2_V72_BYTE_ORDER)
    aftercare(ccall((:OGRSetGenerate_DB2_V72_BYTE_ORDER, libgdal), OGRErr, (Cint,), bGenerate_DB2_V72_BYTE_ORDER))
end

function ogrgetgenerate_db2_v72_byte_order()
    aftercare(ccall((:OGRGetGenerate_DB2_V72_BYTE_ORDER, libgdal), Cint, ()))
end

function ogrsetnonlineargeometriesenabledflag(bFlag)
    aftercare(ccall((:OGRSetNonLinearGeometriesEnabledFlag, libgdal), Cvoid, (Cint,), bFlag))
end

function ogrgetnonlineargeometriesenabledflag()
    aftercare(ccall((:OGRGetNonLinearGeometriesEnabledFlag, libgdal), Cint, ()))
end

"""Opaque type for a field definition (OGRFieldDefn) """
const OGRFieldDefnH = Ptr{Cvoid}

"""Opaque type for a feature definition (OGRFeatureDefn) """
const OGRFeatureDefnH = Ptr{Cvoid}

const OGRGeomFieldDefnHS = Cvoid

"""Opaque type for a geometry field definition (OGRGeomFieldDefn) """
const OGRGeomFieldDefnH = Ptr{OGRGeomFieldDefnHS}

"""
    OGRFieldType

List of feature field types. This list is likely to be extended in the future ... avoid coding applications based on the assumption that all field types can be known.

| Enumerator        | Note                              |
| :---------------- | :-------------------------------- |
| OFTInteger        | Simple 32bit integer              |
| OFTIntegerList    | List of 32bit integers            |
| OFTReal           | Double Precision floating point   |
| OFTRealList       | List of doubles                   |
| OFTString         | String of ASCII chars             |
| OFTStringList     | Array of strings                  |
| OFTWideString     | deprecated                        |
| OFTWideStringList |                                   |
| OFTBinary         | Raw Binary data                   |
| OFTDate           | Date                              |
| OFTTime           | Time                              |
| OFTDateTime       | Date and Time                     |
| OFTInteger64      | Single 64bit integer              |
| OFTInteger64List  | List of 64bit integers            |
| OFTMaxType        |                                   |
"""
@cenum OGRFieldType::UInt32 begin
    OFTInteger = 0
    OFTIntegerList = 1
    OFTReal = 2
    OFTRealList = 3
    OFTString = 4
    OFTStringList = 5
    OFTWideString = 6
    OFTWideStringList = 7
    OFTBinary = 8
    OFTDate = 9
    OFTTime = 10
    OFTDateTime = 11
    OFTInteger64 = 12
    OFTInteger64List = 13
    OFTMaxType = 13
end

function ogr_fld_create(arg1, arg2)
    aftercare(ccall((:OGR_Fld_Create, libgdal), OGRFieldDefnH, (Cstring, OGRFieldType), arg1, arg2))
end

function ogr_fld_destroy(arg1)
    aftercare(ccall((:OGR_Fld_Destroy, libgdal), Cvoid, (OGRFieldDefnH,), arg1))
end

function ogr_fld_setname(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetName, libgdal), Cvoid, (OGRFieldDefnH, Cstring), arg1, arg2))
end

function ogr_fld_getnameref(arg1)
    aftercare(ccall((:OGR_Fld_GetNameRef, libgdal), Cstring, (OGRFieldDefnH,), arg1), false)
end

function ogr_fld_setalternativename(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetAlternativeName, libgdal), Cvoid, (OGRFieldDefnH, Cstring), arg1, arg2))
end

function ogr_fld_getalternativenameref(arg1)
    aftercare(ccall((:OGR_Fld_GetAlternativeNameRef, libgdal), Cstring, (OGRFieldDefnH,), arg1), false)
end

function ogr_fld_gettype(arg1)
    aftercare(ccall((:OGR_Fld_GetType, libgdal), OGRFieldType, (OGRFieldDefnH,), arg1))
end

function ogr_fld_settype(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetType, libgdal), Cvoid, (OGRFieldDefnH, OGRFieldType), arg1, arg2))
end

"""
    OGRFieldSubType

List of field subtypes. A subtype represents a hint, a restriction of the main type, that is not strictly necessary to consult. This list is likely to be extended in the future ... avoid coding applications based on the assumption that all field types can be known. Most subtypes only make sense for a restricted set of main types. 

\\since GDAL 2.0

| Enumerator     | Note                                                                                |
| :------------- | :---------------------------------------------------------------------------------- |
| OFSTNone       | No subtype. This is the default value                                               |
| OFSTBoolean    | Boolean integer. Only valid for OFTInteger and OFTIntegerList.                      |
| OFSTInt16      | Signed 16-bit integer. Only valid for OFTInteger and OFTIntegerList.                |
| OFSTFloat32    | Single precision (32 bit) floating point. Only valid for OFTReal and OFTRealList.   |
| OFSTJSON       | JSON content. Only valid for OFTString.   \\since GDAL 2.4                          |
| OFSTMaxSubType |                                                                                     |
"""
@cenum OGRFieldSubType::UInt32 begin
    OFSTNone = 0
    OFSTBoolean = 1
    OFSTInt16 = 2
    OFSTFloat32 = 3
    OFSTJSON = 4
    OFSTMaxSubType = 4
end

function ogr_fld_getsubtype(arg1)
    aftercare(ccall((:OGR_Fld_GetSubType, libgdal), OGRFieldSubType, (OGRFieldDefnH,), arg1))
end

function ogr_fld_setsubtype(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetSubType, libgdal), Cvoid, (OGRFieldDefnH, OGRFieldSubType), arg1, arg2))
end

"""
    OGRJustification

Display justification for field values.
"""
@cenum OGRJustification::UInt32 begin
    OJUndefined = 0
    OJLeft = 1
    OJRight = 2
end

function ogr_fld_getjustify(arg1)
    aftercare(ccall((:OGR_Fld_GetJustify, libgdal), OGRJustification, (OGRFieldDefnH,), arg1))
end

function ogr_fld_setjustify(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetJustify, libgdal), Cvoid, (OGRFieldDefnH, OGRJustification), arg1, arg2))
end

function ogr_fld_getwidth(arg1)
    aftercare(ccall((:OGR_Fld_GetWidth, libgdal), Cint, (OGRFieldDefnH,), arg1))
end

function ogr_fld_setwidth(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetWidth, libgdal), Cvoid, (OGRFieldDefnH, Cint), arg1, arg2))
end

function ogr_fld_getprecision(arg1)
    aftercare(ccall((:OGR_Fld_GetPrecision, libgdal), Cint, (OGRFieldDefnH,), arg1))
end

function ogr_fld_setprecision(arg1, arg2)
    aftercare(ccall((:OGR_Fld_SetPrecision, libgdal), Cvoid, (OGRFieldDefnH, Cint), arg1, arg2))
end

function ogr_fld_set(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_Fld_Set, libgdal), Cvoid, (OGRFieldDefnH, Cstring, OGRFieldType, Cint, Cint, OGRJustification), arg1, arg2, arg3, arg4, arg5, arg6))
end

function ogr_fld_isignored(hDefn)
    aftercare(ccall((:OGR_Fld_IsIgnored, libgdal), Cint, (OGRFieldDefnH,), hDefn))
end

function ogr_fld_setignored(hDefn, arg2)
    aftercare(ccall((:OGR_Fld_SetIgnored, libgdal), Cvoid, (OGRFieldDefnH, Cint), hDefn, arg2))
end

function ogr_fld_isnullable(hDefn)
    aftercare(ccall((:OGR_Fld_IsNullable, libgdal), Cint, (OGRFieldDefnH,), hDefn))
end

function ogr_fld_setnullable(hDefn, arg2)
    aftercare(ccall((:OGR_Fld_SetNullable, libgdal), Cvoid, (OGRFieldDefnH, Cint), hDefn, arg2))
end

function ogr_fld_isunique(hDefn)
    aftercare(ccall((:OGR_Fld_IsUnique, libgdal), Cint, (OGRFieldDefnH,), hDefn))
end

function ogr_fld_setunique(hDefn, arg2)
    aftercare(ccall((:OGR_Fld_SetUnique, libgdal), Cvoid, (OGRFieldDefnH, Cint), hDefn, arg2))
end

function ogr_fld_getdefault(hDefn)
    aftercare(ccall((:OGR_Fld_GetDefault, libgdal), Cstring, (OGRFieldDefnH,), hDefn), false)
end

function ogr_fld_setdefault(hDefn, arg2)
    aftercare(ccall((:OGR_Fld_SetDefault, libgdal), Cvoid, (OGRFieldDefnH, Cstring), hDefn, arg2))
end

function ogr_fld_isdefaultdriverspecific(hDefn)
    aftercare(ccall((:OGR_Fld_IsDefaultDriverSpecific, libgdal), Cint, (OGRFieldDefnH,), hDefn))
end

function ogr_getfieldtypename(arg1)
    aftercare(ccall((:OGR_GetFieldTypeName, libgdal), Cstring, (OGRFieldType,), arg1), false)
end

function ogr_getfieldsubtypename(arg1)
    aftercare(ccall((:OGR_GetFieldSubTypeName, libgdal), Cstring, (OGRFieldSubType,), arg1), false)
end

function ogr_aretypesubtypecompatible(eType, eSubType)
    aftercare(ccall((:OGR_AreTypeSubTypeCompatible, libgdal), Cint, (OGRFieldType, OGRFieldSubType), eType, eSubType))
end

function ogr_gfld_create(arg1, arg2)
    aftercare(ccall((:OGR_GFld_Create, libgdal), OGRGeomFieldDefnH, (Cstring, OGRwkbGeometryType), arg1, arg2))
end

function ogr_gfld_destroy(arg1)
    aftercare(ccall((:OGR_GFld_Destroy, libgdal), Cvoid, (OGRGeomFieldDefnH,), arg1))
end

function ogr_gfld_setname(arg1, arg2)
    aftercare(ccall((:OGR_GFld_SetName, libgdal), Cvoid, (OGRGeomFieldDefnH, Cstring), arg1, arg2))
end

function ogr_gfld_getnameref(arg1)
    aftercare(ccall((:OGR_GFld_GetNameRef, libgdal), Cstring, (OGRGeomFieldDefnH,), arg1), false)
end

function ogr_gfld_gettype(arg1)
    aftercare(ccall((:OGR_GFld_GetType, libgdal), OGRwkbGeometryType, (OGRGeomFieldDefnH,), arg1))
end

function ogr_gfld_settype(arg1, arg2)
    aftercare(ccall((:OGR_GFld_SetType, libgdal), Cvoid, (OGRGeomFieldDefnH, OGRwkbGeometryType), arg1, arg2))
end

function ogr_gfld_getspatialref(arg1)
    aftercare(ccall((:OGR_GFld_GetSpatialRef, libgdal), OGRSpatialReferenceH, (OGRGeomFieldDefnH,), arg1))
end

function ogr_gfld_setspatialref(arg1, hSRS)
    aftercare(ccall((:OGR_GFld_SetSpatialRef, libgdal), Cvoid, (OGRGeomFieldDefnH, OGRSpatialReferenceH), arg1, hSRS))
end

function ogr_gfld_isnullable(hDefn)
    aftercare(ccall((:OGR_GFld_IsNullable, libgdal), Cint, (OGRGeomFieldDefnH,), hDefn))
end

function ogr_gfld_setnullable(hDefn, arg2)
    aftercare(ccall((:OGR_GFld_SetNullable, libgdal), Cvoid, (OGRGeomFieldDefnH, Cint), hDefn, arg2))
end

function ogr_gfld_isignored(hDefn)
    aftercare(ccall((:OGR_GFld_IsIgnored, libgdal), Cint, (OGRGeomFieldDefnH,), hDefn))
end

function ogr_gfld_setignored(hDefn, arg2)
    aftercare(ccall((:OGR_GFld_SetIgnored, libgdal), Cvoid, (OGRGeomFieldDefnH, Cint), hDefn, arg2))
end

function ogr_fd_create(arg1)
    aftercare(ccall((:OGR_FD_Create, libgdal), OGRFeatureDefnH, (Cstring,), arg1))
end

function ogr_fd_destroy(arg1)
    aftercare(ccall((:OGR_FD_Destroy, libgdal), Cvoid, (OGRFeatureDefnH,), arg1))
end

function ogr_fd_release(arg1)
    aftercare(ccall((:OGR_FD_Release, libgdal), Cvoid, (OGRFeatureDefnH,), arg1))
end

function ogr_fd_getname(arg1)
    aftercare(ccall((:OGR_FD_GetName, libgdal), Cstring, (OGRFeatureDefnH,), arg1), false)
end

function ogr_fd_getfieldcount(arg1)
    aftercare(ccall((:OGR_FD_GetFieldCount, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

function ogr_fd_getfielddefn(arg1, arg2)
    aftercare(ccall((:OGR_FD_GetFieldDefn, libgdal), OGRFieldDefnH, (OGRFeatureDefnH, Cint), arg1, arg2))
end

function ogr_fd_getfieldindex(arg1, arg2)
    aftercare(ccall((:OGR_FD_GetFieldIndex, libgdal), Cint, (OGRFeatureDefnH, Cstring), arg1, arg2))
end

function ogr_fd_addfielddefn(arg1, arg2)
    aftercare(ccall((:OGR_FD_AddFieldDefn, libgdal), Cvoid, (OGRFeatureDefnH, OGRFieldDefnH), arg1, arg2))
end

function ogr_fd_deletefielddefn(hDefn, iField)
    aftercare(ccall((:OGR_FD_DeleteFieldDefn, libgdal), OGRErr, (OGRFeatureDefnH, Cint), hDefn, iField))
end

function ogr_fd_reorderfielddefns(hDefn, panMap)
    aftercare(ccall((:OGR_FD_ReorderFieldDefns, libgdal), OGRErr, (OGRFeatureDefnH, Ptr{Cint}), hDefn, panMap))
end

function ogr_fd_getgeomtype(arg1)
    aftercare(ccall((:OGR_FD_GetGeomType, libgdal), OGRwkbGeometryType, (OGRFeatureDefnH,), arg1))
end

function ogr_fd_setgeomtype(arg1, arg2)
    aftercare(ccall((:OGR_FD_SetGeomType, libgdal), Cvoid, (OGRFeatureDefnH, OGRwkbGeometryType), arg1, arg2))
end

function ogr_fd_isgeometryignored(arg1)
    aftercare(ccall((:OGR_FD_IsGeometryIgnored, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

function ogr_fd_setgeometryignored(arg1, arg2)
    aftercare(ccall((:OGR_FD_SetGeometryIgnored, libgdal), Cvoid, (OGRFeatureDefnH, Cint), arg1, arg2))
end

function ogr_fd_isstyleignored(arg1)
    aftercare(ccall((:OGR_FD_IsStyleIgnored, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

function ogr_fd_setstyleignored(arg1, arg2)
    aftercare(ccall((:OGR_FD_SetStyleIgnored, libgdal), Cvoid, (OGRFeatureDefnH, Cint), arg1, arg2))
end

function ogr_fd_reference(arg1)
    aftercare(ccall((:OGR_FD_Reference, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

function ogr_fd_dereference(arg1)
    aftercare(ccall((:OGR_FD_Dereference, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

function ogr_fd_getreferencecount(arg1)
    aftercare(ccall((:OGR_FD_GetReferenceCount, libgdal), Cint, (OGRFeatureDefnH,), arg1))
end

function ogr_fd_getgeomfieldcount(hFDefn)
    aftercare(ccall((:OGR_FD_GetGeomFieldCount, libgdal), Cint, (OGRFeatureDefnH,), hFDefn))
end

function ogr_fd_getgeomfielddefn(hFDefn, i)
    aftercare(ccall((:OGR_FD_GetGeomFieldDefn, libgdal), OGRGeomFieldDefnH, (OGRFeatureDefnH, Cint), hFDefn, i))
end

function ogr_fd_getgeomfieldindex(hFDefn, pszName)
    aftercare(ccall((:OGR_FD_GetGeomFieldIndex, libgdal), Cint, (OGRFeatureDefnH, Cstring), hFDefn, pszName))
end

function ogr_fd_addgeomfielddefn(hFDefn, hGFldDefn)
    aftercare(ccall((:OGR_FD_AddGeomFieldDefn, libgdal), Cvoid, (OGRFeatureDefnH, OGRGeomFieldDefnH), hFDefn, hGFldDefn))
end

function ogr_fd_deletegeomfielddefn(hFDefn, iGeomField)
    aftercare(ccall((:OGR_FD_DeleteGeomFieldDefn, libgdal), OGRErr, (OGRFeatureDefnH, Cint), hFDefn, iGeomField))
end

function ogr_fd_issame(hFDefn, hOtherFDefn)
    aftercare(ccall((:OGR_FD_IsSame, libgdal), Cint, (OGRFeatureDefnH, OGRFeatureDefnH), hFDefn, hOtherFDefn))
end

function ogr_f_create(arg1)
    aftercare(ccall((:OGR_F_Create, libgdal), OGRFeatureH, (OGRFeatureDefnH,), arg1))
end

function ogr_f_destroy(arg1)
    aftercare(ccall((:OGR_F_Destroy, libgdal), Cvoid, (OGRFeatureH,), arg1))
end

function ogr_f_getdefnref(arg1)
    aftercare(ccall((:OGR_F_GetDefnRef, libgdal), OGRFeatureDefnH, (OGRFeatureH,), arg1))
end

function ogr_f_setgeometrydirectly(arg1, arg2)
    aftercare(ccall((:OGR_F_SetGeometryDirectly, libgdal), OGRErr, (OGRFeatureH, OGRGeometryH), arg1, arg2))
end

function ogr_f_setgeometry(arg1, arg2)
    aftercare(ccall((:OGR_F_SetGeometry, libgdal), OGRErr, (OGRFeatureH, OGRGeometryH), arg1, arg2))
end

function ogr_f_getgeometryref(arg1)
    aftercare(ccall((:OGR_F_GetGeometryRef, libgdal), OGRGeometryH, (OGRFeatureH,), arg1))
end

function ogr_f_stealgeometry(arg1)
    aftercare(ccall((:OGR_F_StealGeometry, libgdal), OGRGeometryH, (OGRFeatureH,), arg1))
end

function ogr_f_clone(arg1)
    aftercare(ccall((:OGR_F_Clone, libgdal), OGRFeatureH, (OGRFeatureH,), arg1))
end

function ogr_f_equal(arg1, arg2)
    aftercare(ccall((:OGR_F_Equal, libgdal), Cint, (OGRFeatureH, OGRFeatureH), arg1, arg2))
end

function ogr_f_getfieldcount(arg1)
    aftercare(ccall((:OGR_F_GetFieldCount, libgdal), Cint, (OGRFeatureH,), arg1))
end

function ogr_f_getfielddefnref(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldDefnRef, libgdal), OGRFieldDefnH, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_f_getfieldindex(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldIndex, libgdal), Cint, (OGRFeatureH, Cstring), arg1, arg2))
end

function ogr_f_isfieldset(arg1, arg2)
    aftercare(ccall((:OGR_F_IsFieldSet, libgdal), Cint, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_f_unsetfield(arg1, arg2)
    aftercare(ccall((:OGR_F_UnsetField, libgdal), Cvoid, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_f_isfieldnull(arg1, arg2)
    aftercare(ccall((:OGR_F_IsFieldNull, libgdal), Cint, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_f_isfieldsetandnotnull(arg1, arg2)
    aftercare(ccall((:OGR_F_IsFieldSetAndNotNull, libgdal), Cint, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_f_setfieldnull(arg1, arg2)
    aftercare(ccall((:OGR_F_SetFieldNull, libgdal), Cvoid, (OGRFeatureH, Cint), arg1, arg2))
end

"""
    OGRField

OGRFeature field attribute value union.
"""
struct OGRField
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{OGRField}, f::Symbol)
    f === :Integer && return Ptr{Cint}(x + 0)
    f === :Integer64 && return Ptr{GIntBig}(x + 0)
    f === :Real && return Ptr{Cdouble}(x + 0)
    f === :String && return Ptr{Cstring}(x + 0)
    f === :IntegerList && return Ptr{__JL_Ctag_153}(x + 0)
    f === :Integer64List && return Ptr{__JL_Ctag_154}(x + 0)
    f === :RealList && return Ptr{__JL_Ctag_155}(x + 0)
    f === :StringList && return Ptr{__JL_Ctag_156}(x + 0)
    f === :Binary && return Ptr{__JL_Ctag_157}(x + 0)
    f === :Set && return Ptr{__JL_Ctag_158}(x + 0)
    f === :Date && return Ptr{__JL_Ctag_159}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::OGRField, f::Symbol)
    r = Ref{OGRField}(x)
    ptr = Base.unsafe_convert(Ptr{OGRField}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{OGRField}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function ogr_f_getrawfieldref(arg1, arg2)
    aftercare(ccall((:OGR_F_GetRawFieldRef, libgdal), Ptr{OGRField}, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_rawfield_isunset(arg1)
    aftercare(ccall((:OGR_RawField_IsUnset, libgdal), Cint, (Ptr{OGRField},), arg1))
end

function ogr_rawfield_isnull(arg1)
    aftercare(ccall((:OGR_RawField_IsNull, libgdal), Cint, (Ptr{OGRField},), arg1))
end

function ogr_rawfield_setunset(arg1)
    aftercare(ccall((:OGR_RawField_SetUnset, libgdal), Cvoid, (Ptr{OGRField},), arg1))
end

function ogr_rawfield_setnull(arg1)
    aftercare(ccall((:OGR_RawField_SetNull, libgdal), Cvoid, (Ptr{OGRField},), arg1))
end

function ogr_f_getfieldasinteger(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsInteger, libgdal), Cint, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_f_getfieldasinteger64(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsInteger64, libgdal), GIntBig, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_f_getfieldasdouble(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsDouble, libgdal), Cdouble, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_f_getfieldasstring(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsString, libgdal), Cstring, (OGRFeatureH, Cint), arg1, arg2), false)
end

function ogr_f_getfieldasintegerlist(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_GetFieldAsIntegerList, libgdal), Ptr{Cint}, (OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3))
end

function ogr_f_getfieldasinteger64list(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_GetFieldAsInteger64List, libgdal), Ptr{GIntBig}, (OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3))
end

function ogr_f_getfieldasdoublelist(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_GetFieldAsDoubleList, libgdal), Ptr{Cdouble}, (OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3))
end

function ogr_f_getfieldasstringlist(arg1, arg2)
    aftercare(ccall((:OGR_F_GetFieldAsStringList, libgdal), Ptr{Cstring}, (OGRFeatureH, Cint), arg1, arg2))
end

function ogr_f_getfieldasbinary(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_GetFieldAsBinary, libgdal), Ptr{GByte}, (OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3))
end

function ogr_f_getfieldasdatetime(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    aftercare(ccall((:OGR_F_GetFieldAsDateTime, libgdal), Cint, (OGRFeatureH, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9))
end

function ogr_f_getfieldasdatetimeex(hFeat, iField, pnYear, pnMonth, pnDay, pnHour, pnMinute, pfSecond, pnTZFlag)
    aftercare(ccall((:OGR_F_GetFieldAsDateTimeEx, libgdal), Cint, (OGRFeatureH, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cfloat}, Ptr{Cint}), hFeat, iField, pnYear, pnMonth, pnDay, pnHour, pnMinute, pfSecond, pnTZFlag))
end

function ogr_f_setfieldinteger(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldInteger, libgdal), Cvoid, (OGRFeatureH, Cint, Cint), arg1, arg2, arg3))
end

function ogr_f_setfieldinteger64(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldInteger64, libgdal), Cvoid, (OGRFeatureH, Cint, GIntBig), arg1, arg2, arg3))
end

function ogr_f_setfielddouble(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldDouble, libgdal), Cvoid, (OGRFeatureH, Cint, Cdouble), arg1, arg2, arg3))
end

function ogr_f_setfieldstring(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldString, libgdal), Cvoid, (OGRFeatureH, Cint, Cstring), arg1, arg2, arg3))
end

function ogr_f_setfieldintegerlist(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFieldIntegerList, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Ptr{Cint}), arg1, arg2, arg3, arg4))
end

function ogr_f_setfieldinteger64list(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFieldInteger64List, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Ptr{GIntBig}), arg1, arg2, arg3, arg4))
end

function ogr_f_setfielddoublelist(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFieldDoubleList, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Ptr{Cdouble}), arg1, arg2, arg3, arg4))
end

function ogr_f_setfieldstringlist(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldStringList, libgdal), Cvoid, (OGRFeatureH, Cint, CSLConstList), arg1, arg2, arg3))
end

function ogr_f_setfieldraw(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFieldRaw, libgdal), Cvoid, (OGRFeatureH, Cint, Ptr{OGRField}), arg1, arg2, arg3))
end

function ogr_f_setfieldbinary(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFieldBinary, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Ptr{Cvoid}), arg1, arg2, arg3, arg4))
end

function ogr_f_setfielddatetime(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    aftercare(ccall((:OGR_F_SetFieldDateTime, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9))
end

function ogr_f_setfielddatetimeex(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
    aftercare(ccall((:OGR_F_SetFieldDateTimeEx, libgdal), Cvoid, (OGRFeatureH, Cint, Cint, Cint, Cint, Cint, Cint, Cfloat, Cint), arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9))
end

function ogr_f_getgeomfieldcount(hFeat)
    aftercare(ccall((:OGR_F_GetGeomFieldCount, libgdal), Cint, (OGRFeatureH,), hFeat))
end

function ogr_f_getgeomfielddefnref(hFeat, iField)
    aftercare(ccall((:OGR_F_GetGeomFieldDefnRef, libgdal), OGRGeomFieldDefnH, (OGRFeatureH, Cint), hFeat, iField))
end

function ogr_f_getgeomfieldindex(hFeat, pszName)
    aftercare(ccall((:OGR_F_GetGeomFieldIndex, libgdal), Cint, (OGRFeatureH, Cstring), hFeat, pszName))
end

function ogr_f_getgeomfieldref(hFeat, iField)
    aftercare(ccall((:OGR_F_GetGeomFieldRef, libgdal), OGRGeometryH, (OGRFeatureH, Cint), hFeat, iField))
end

function ogr_f_setgeomfielddirectly(hFeat, iField, hGeom)
    aftercare(ccall((:OGR_F_SetGeomFieldDirectly, libgdal), OGRErr, (OGRFeatureH, Cint, OGRGeometryH), hFeat, iField, hGeom))
end

function ogr_f_setgeomfield(hFeat, iField, hGeom)
    aftercare(ccall((:OGR_F_SetGeomField, libgdal), OGRErr, (OGRFeatureH, Cint, OGRGeometryH), hFeat, iField, hGeom))
end

function ogr_f_getfid(arg1)
    aftercare(ccall((:OGR_F_GetFID, libgdal), GIntBig, (OGRFeatureH,), arg1))
end

function ogr_f_setfid(arg1, arg2)
    aftercare(ccall((:OGR_F_SetFID, libgdal), OGRErr, (OGRFeatureH, GIntBig), arg1, arg2))
end

function ogr_f_dumpreadable(arg1, arg2)
    aftercare(ccall((:OGR_F_DumpReadable, libgdal), Cvoid, (OGRFeatureH, Ptr{Libc.FILE}), arg1, arg2))
end

function ogr_f_setfrom(arg1, arg2, arg3)
    aftercare(ccall((:OGR_F_SetFrom, libgdal), OGRErr, (OGRFeatureH, OGRFeatureH, Cint), arg1, arg2, arg3))
end

function ogr_f_setfromwithmap(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_F_SetFromWithMap, libgdal), OGRErr, (OGRFeatureH, OGRFeatureH, Cint, Ptr{Cint}), arg1, arg2, arg3, arg4))
end

function ogr_f_getstylestring(arg1)
    aftercare(ccall((:OGR_F_GetStyleString, libgdal), Cstring, (OGRFeatureH,), arg1), false)
end

function ogr_f_setstylestring(arg1, arg2)
    aftercare(ccall((:OGR_F_SetStyleString, libgdal), Cvoid, (OGRFeatureH, Cstring), arg1, arg2))
end

function ogr_f_setstylestringdirectly(arg1, arg2)
    aftercare(ccall((:OGR_F_SetStyleStringDirectly, libgdal), Cvoid, (OGRFeatureH, Cstring), arg1, arg2))
end

"""
    ogr_f_getstyletable(arg1)

Return style table 
"""
function ogr_f_getstyletable(arg1)
    aftercare(ccall((:OGR_F_GetStyleTable, libgdal), OGRStyleTableH, (OGRFeatureH,), arg1))
end

"""
    ogr_f_setstyletabledirectly(arg1, arg2)

Set style table and take ownership 
"""
function ogr_f_setstyletabledirectly(arg1, arg2)
    aftercare(ccall((:OGR_F_SetStyleTableDirectly, libgdal), Cvoid, (OGRFeatureH, OGRStyleTableH), arg1, arg2))
end

"""
    ogr_f_setstyletable(arg1, arg2)

Set style table 
"""
function ogr_f_setstyletable(arg1, arg2)
    aftercare(ccall((:OGR_F_SetStyleTable, libgdal), Cvoid, (OGRFeatureH, OGRStyleTableH), arg1, arg2))
end

function ogr_f_getnativedata(arg1)
    aftercare(ccall((:OGR_F_GetNativeData, libgdal), Cstring, (OGRFeatureH,), arg1), false)
end

function ogr_f_setnativedata(arg1, arg2)
    aftercare(ccall((:OGR_F_SetNativeData, libgdal), Cvoid, (OGRFeatureH, Cstring), arg1, arg2))
end

function ogr_f_getnativemediatype(arg1)
    aftercare(ccall((:OGR_F_GetNativeMediaType, libgdal), Cstring, (OGRFeatureH,), arg1), false)
end

function ogr_f_setnativemediatype(arg1, arg2)
    aftercare(ccall((:OGR_F_SetNativeMediaType, libgdal), Cvoid, (OGRFeatureH, Cstring), arg1, arg2))
end

function ogr_f_fillunsetwithdefault(hFeat, bNotNullableOnly, papszOptions)
    aftercare(ccall((:OGR_F_FillUnsetWithDefault, libgdal), Cvoid, (OGRFeatureH, Cint, Ptr{Cstring}), hFeat, bNotNullableOnly, papszOptions))
end

function ogr_f_validate(arg1, nValidateFlags, bEmitError)
    aftercare(ccall((:OGR_F_Validate, libgdal), Cint, (OGRFeatureH, Cint, Cint), arg1, nValidateFlags, bEmitError))
end

"""Opaque type for a OGR datasource (OGRDataSource) """
const OGRDataSourceH = Ptr{Cvoid}

"""Opaque type for a OGR driver (OGRSFDriver) """
const OGRSFDriverH = Ptr{Cvoid}

function ogr_l_getname(arg1)
    aftercare(ccall((:OGR_L_GetName, libgdal), Cstring, (OGRLayerH,), arg1), false)
end

function ogr_l_getgeomtype(arg1)
    aftercare(ccall((:OGR_L_GetGeomType, libgdal), OGRwkbGeometryType, (OGRLayerH,), arg1))
end

function ogr_l_getspatialfilter(arg1)
    aftercare(ccall((:OGR_L_GetSpatialFilter, libgdal), OGRGeometryH, (OGRLayerH,), arg1))
end

function ogr_l_setspatialfilter(arg1, arg2)
    aftercare(ccall((:OGR_L_SetSpatialFilter, libgdal), Cvoid, (OGRLayerH, OGRGeometryH), arg1, arg2))
end

function ogr_l_setspatialfilterrect(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OGR_L_SetSpatialFilterRect, libgdal), Cvoid, (OGRLayerH, Cdouble, Cdouble, Cdouble, Cdouble), arg1, arg2, arg3, arg4, arg5))
end

function ogr_l_setspatialfilterex(arg1, iGeomField, hGeom)
    aftercare(ccall((:OGR_L_SetSpatialFilterEx, libgdal), Cvoid, (OGRLayerH, Cint, OGRGeometryH), arg1, iGeomField, hGeom))
end

function ogr_l_setspatialfilterrectex(arg1, iGeomField, dfMinX, dfMinY, dfMaxX, dfMaxY)
    aftercare(ccall((:OGR_L_SetSpatialFilterRectEx, libgdal), Cvoid, (OGRLayerH, Cint, Cdouble, Cdouble, Cdouble, Cdouble), arg1, iGeomField, dfMinX, dfMinY, dfMaxX, dfMaxY))
end

function ogr_l_setattributefilter(arg1, arg2)
    aftercare(ccall((:OGR_L_SetAttributeFilter, libgdal), OGRErr, (OGRLayerH, Cstring), arg1, arg2))
end

function ogr_l_resetreading(arg1)
    aftercare(ccall((:OGR_L_ResetReading, libgdal), Cvoid, (OGRLayerH,), arg1))
end

function ogr_l_getnextfeature(arg1)
    aftercare(ccall((:OGR_L_GetNextFeature, libgdal), OGRFeatureH, (OGRLayerH,), arg1))
end

function ogr_l_setnextbyindex(arg1, arg2)
    aftercare(ccall((:OGR_L_SetNextByIndex, libgdal), OGRErr, (OGRLayerH, GIntBig), arg1, arg2))
end

function ogr_l_getfeature(arg1, arg2)
    aftercare(ccall((:OGR_L_GetFeature, libgdal), OGRFeatureH, (OGRLayerH, GIntBig), arg1, arg2))
end

function ogr_l_setfeature(arg1, arg2)
    aftercare(ccall((:OGR_L_SetFeature, libgdal), OGRErr, (OGRLayerH, OGRFeatureH), arg1, arg2))
end

function ogr_l_createfeature(arg1, arg2)
    aftercare(ccall((:OGR_L_CreateFeature, libgdal), OGRErr, (OGRLayerH, OGRFeatureH), arg1, arg2))
end

function ogr_l_deletefeature(arg1, arg2)
    aftercare(ccall((:OGR_L_DeleteFeature, libgdal), OGRErr, (OGRLayerH, GIntBig), arg1, arg2))
end

function ogr_l_getlayerdefn(arg1)
    aftercare(ccall((:OGR_L_GetLayerDefn, libgdal), OGRFeatureDefnH, (OGRLayerH,), arg1))
end

function ogr_l_getspatialref(arg1)
    aftercare(ccall((:OGR_L_GetSpatialRef, libgdal), OGRSpatialReferenceH, (OGRLayerH,), arg1))
end

function ogr_l_findfieldindex(arg1, arg2, bExactMatch)
    aftercare(ccall((:OGR_L_FindFieldIndex, libgdal), Cint, (OGRLayerH, Cstring, Cint), arg1, arg2, bExactMatch))
end

function ogr_l_getfeaturecount(arg1, arg2)
    aftercare(ccall((:OGR_L_GetFeatureCount, libgdal), GIntBig, (OGRLayerH, Cint), arg1, arg2))
end

function ogr_l_getextent(arg1, arg2, arg3)
    aftercare(ccall((:OGR_L_GetExtent, libgdal), OGRErr, (OGRLayerH, Ptr{OGREnvelope}, Cint), arg1, arg2, arg3))
end

function ogr_l_getextentex(arg1, iGeomField, psExtent, bForce)
    aftercare(ccall((:OGR_L_GetExtentEx, libgdal), OGRErr, (OGRLayerH, Cint, Ptr{OGREnvelope}, Cint), arg1, iGeomField, psExtent, bForce))
end

function ogr_l_testcapability(arg1, arg2)
    aftercare(ccall((:OGR_L_TestCapability, libgdal), Cint, (OGRLayerH, Cstring), arg1, arg2))
end

function ogr_l_createfield(arg1, arg2, arg3)
    aftercare(ccall((:OGR_L_CreateField, libgdal), OGRErr, (OGRLayerH, OGRFieldDefnH, Cint), arg1, arg2, arg3))
end

function ogr_l_creategeomfield(hLayer, hFieldDefn, bForce)
    aftercare(ccall((:OGR_L_CreateGeomField, libgdal), OGRErr, (OGRLayerH, OGRGeomFieldDefnH, Cint), hLayer, hFieldDefn, bForce))
end

function ogr_l_deletefield(arg1, iField)
    aftercare(ccall((:OGR_L_DeleteField, libgdal), OGRErr, (OGRLayerH, Cint), arg1, iField))
end

function ogr_l_reorderfields(arg1, panMap)
    aftercare(ccall((:OGR_L_ReorderFields, libgdal), OGRErr, (OGRLayerH, Ptr{Cint}), arg1, panMap))
end

function ogr_l_reorderfield(arg1, iOldFieldPos, iNewFieldPos)
    aftercare(ccall((:OGR_L_ReorderField, libgdal), OGRErr, (OGRLayerH, Cint, Cint), arg1, iOldFieldPos, iNewFieldPos))
end

function ogr_l_alterfielddefn(arg1, iField, hNewFieldDefn, nFlags)
    aftercare(ccall((:OGR_L_AlterFieldDefn, libgdal), OGRErr, (OGRLayerH, Cint, OGRFieldDefnH, Cint), arg1, iField, hNewFieldDefn, nFlags))
end

function ogr_l_starttransaction(arg1)
    aftercare(ccall((:OGR_L_StartTransaction, libgdal), OGRErr, (OGRLayerH,), arg1))
end

function ogr_l_committransaction(arg1)
    aftercare(ccall((:OGR_L_CommitTransaction, libgdal), OGRErr, (OGRLayerH,), arg1))
end

function ogr_l_rollbacktransaction(arg1)
    aftercare(ccall((:OGR_L_RollbackTransaction, libgdal), OGRErr, (OGRLayerH,), arg1))
end

"""
    ogr_l_reference(arg1)

Doxygen\\_Suppress 
"""
function ogr_l_reference(arg1)
    aftercare(ccall((:OGR_L_Reference, libgdal), Cint, (OGRLayerH,), arg1))
end

function ogr_l_dereference(arg1)
    aftercare(ccall((:OGR_L_Dereference, libgdal), Cint, (OGRLayerH,), arg1))
end

function ogr_l_getrefcount(arg1)
    aftercare(ccall((:OGR_L_GetRefCount, libgdal), Cint, (OGRLayerH,), arg1))
end

function ogr_l_synctodisk(arg1)
    aftercare(ccall((:OGR_L_SyncToDisk, libgdal), OGRErr, (OGRLayerH,), arg1))
end

"""
    ogr_l_getfeaturesread(arg1)

Doxygen\\_Suppress 
"""
function ogr_l_getfeaturesread(arg1)
    aftercare(ccall((:OGR_L_GetFeaturesRead, libgdal), GIntBig, (OGRLayerH,), arg1))
end

function ogr_l_getfidcolumn(arg1)
    aftercare(ccall((:OGR_L_GetFIDColumn, libgdal), Cstring, (OGRLayerH,), arg1), false)
end

function ogr_l_getgeometrycolumn(arg1)
    aftercare(ccall((:OGR_L_GetGeometryColumn, libgdal), Cstring, (OGRLayerH,), arg1), false)
end

"""
    ogr_l_getstyletable(arg1)

Get style table 
"""
function ogr_l_getstyletable(arg1)
    aftercare(ccall((:OGR_L_GetStyleTable, libgdal), OGRStyleTableH, (OGRLayerH,), arg1))
end

"""
    ogr_l_setstyletabledirectly(arg1, arg2)

Set style table (and take ownership) 
"""
function ogr_l_setstyletabledirectly(arg1, arg2)
    aftercare(ccall((:OGR_L_SetStyleTableDirectly, libgdal), Cvoid, (OGRLayerH, OGRStyleTableH), arg1, arg2))
end

"""
    ogr_l_setstyletable(arg1, arg2)

Set style table 
"""
function ogr_l_setstyletable(arg1, arg2)
    aftercare(ccall((:OGR_L_SetStyleTable, libgdal), Cvoid, (OGRLayerH, OGRStyleTableH), arg1, arg2))
end

function ogr_l_setignoredfields(arg1, arg2)
    aftercare(ccall((:OGR_L_SetIgnoredFields, libgdal), OGRErr, (OGRLayerH, Ptr{Cstring}), arg1, arg2))
end

function ogr_l_intersection(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Intersection, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

function ogr_l_union(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Union, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

function ogr_l_symdifference(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_SymDifference, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

function ogr_l_identity(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Identity, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

function ogr_l_update(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Update, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

function ogr_l_clip(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Clip, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

function ogr_l_erase(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OGR_L_Erase, libgdal), OGRErr, (OGRLayerH, OGRLayerH, OGRLayerH, Ptr{Cstring}, GDALProgressFunc, Ptr{Cvoid}), arg1, arg2, arg3, arg4, arg5, arg6))
end

function ogr_ds_destroy(arg1)
    aftercare(ccall((:OGR_DS_Destroy, libgdal), Cvoid, (OGRDataSourceH,), arg1))
end

function ogr_ds_getname(arg1)
    aftercare(ccall((:OGR_DS_GetName, libgdal), Cstring, (OGRDataSourceH,), arg1), false)
end

function ogr_ds_getlayercount(arg1)
    aftercare(ccall((:OGR_DS_GetLayerCount, libgdal), Cint, (OGRDataSourceH,), arg1))
end

function ogr_ds_getlayer(arg1, arg2)
    aftercare(ccall((:OGR_DS_GetLayer, libgdal), OGRLayerH, (OGRDataSourceH, Cint), arg1, arg2))
end

function ogr_ds_getlayerbyname(arg1, arg2)
    aftercare(ccall((:OGR_DS_GetLayerByName, libgdal), OGRLayerH, (OGRDataSourceH, Cstring), arg1, arg2))
end

function ogr_ds_deletelayer(arg1, arg2)
    aftercare(ccall((:OGR_DS_DeleteLayer, libgdal), OGRErr, (OGRDataSourceH, Cint), arg1, arg2))
end

function ogr_ds_getdriver(arg1)
    aftercare(ccall((:OGR_DS_GetDriver, libgdal), OGRSFDriverH, (OGRDataSourceH,), arg1))
end

function ogr_ds_createlayer(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OGR_DS_CreateLayer, libgdal), OGRLayerH, (OGRDataSourceH, Cstring, OGRSpatialReferenceH, OGRwkbGeometryType, Ptr{Cstring}), arg1, arg2, arg3, arg4, arg5))
end

function ogr_ds_copylayer(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_DS_CopyLayer, libgdal), OGRLayerH, (OGRDataSourceH, OGRLayerH, Cstring, Ptr{Cstring}), arg1, arg2, arg3, arg4))
end

function ogr_ds_testcapability(arg1, arg2)
    aftercare(ccall((:OGR_DS_TestCapability, libgdal), Cint, (OGRDataSourceH, Cstring), arg1, arg2))
end

function ogr_ds_executesql(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_DS_ExecuteSQL, libgdal), OGRLayerH, (OGRDataSourceH, Cstring, OGRGeometryH, Cstring), arg1, arg2, arg3, arg4))
end

function ogr_ds_releaseresultset(arg1, arg2)
    aftercare(ccall((:OGR_DS_ReleaseResultSet, libgdal), Cvoid, (OGRDataSourceH, OGRLayerH), arg1, arg2))
end

"""
    ogr_ds_reference(arg1)

Doxygen\\_Suppress 
"""
function ogr_ds_reference(arg1)
    aftercare(ccall((:OGR_DS_Reference, libgdal), Cint, (OGRDataSourceH,), arg1))
end

function ogr_ds_dereference(arg1)
    aftercare(ccall((:OGR_DS_Dereference, libgdal), Cint, (OGRDataSourceH,), arg1))
end

function ogr_ds_getrefcount(arg1)
    aftercare(ccall((:OGR_DS_GetRefCount, libgdal), Cint, (OGRDataSourceH,), arg1))
end

function ogr_ds_getsummaryrefcount(arg1)
    aftercare(ccall((:OGR_DS_GetSummaryRefCount, libgdal), Cint, (OGRDataSourceH,), arg1))
end

"""
    ogr_ds_synctodisk(arg1)



Flush pending changes to disk. See GDALDataset::FlushCache() 
"""
function ogr_ds_synctodisk(arg1)
    aftercare(ccall((:OGR_DS_SyncToDisk, libgdal), OGRErr, (OGRDataSourceH,), arg1))
end

"""
    ogr_ds_getstyletable(arg1)

Get style table 
"""
function ogr_ds_getstyletable(arg1)
    aftercare(ccall((:OGR_DS_GetStyleTable, libgdal), OGRStyleTableH, (OGRDataSourceH,), arg1))
end

"""
    ogr_ds_setstyletabledirectly(arg1, arg2)

Set style table (and take ownership) 
"""
function ogr_ds_setstyletabledirectly(arg1, arg2)
    aftercare(ccall((:OGR_DS_SetStyleTableDirectly, libgdal), Cvoid, (OGRDataSourceH, OGRStyleTableH), arg1, arg2))
end

"""
    ogr_ds_setstyletable(arg1, arg2)

Set style table 
"""
function ogr_ds_setstyletable(arg1, arg2)
    aftercare(ccall((:OGR_DS_SetStyleTable, libgdal), Cvoid, (OGRDataSourceH, OGRStyleTableH), arg1, arg2))
end

function ogr_dr_getname(arg1)
    aftercare(ccall((:OGR_Dr_GetName, libgdal), Cstring, (OGRSFDriverH,), arg1), false)
end

function ogr_dr_open(arg1, arg2, arg3)
    aftercare(ccall((:OGR_Dr_Open, libgdal), OGRDataSourceH, (OGRSFDriverH, Cstring, Cint), arg1, arg2, arg3))
end

function ogr_dr_testcapability(arg1, arg2)
    aftercare(ccall((:OGR_Dr_TestCapability, libgdal), Cint, (OGRSFDriverH, Cstring), arg1, arg2))
end

function ogr_dr_createdatasource(arg1, arg2, arg3)
    aftercare(ccall((:OGR_Dr_CreateDataSource, libgdal), OGRDataSourceH, (OGRSFDriverH, Cstring, Ptr{Cstring}), arg1, arg2, arg3))
end

function ogr_dr_copydatasource(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OGR_Dr_CopyDataSource, libgdal), OGRDataSourceH, (OGRSFDriverH, OGRDataSourceH, Cstring, Ptr{Cstring}), arg1, arg2, arg3, arg4))
end

function ogr_dr_deletedatasource(arg1, arg2)
    aftercare(ccall((:OGR_Dr_DeleteDataSource, libgdal), OGRErr, (OGRSFDriverH, Cstring), arg1, arg2))
end

function ogropen(arg1, arg2, arg3)
    aftercare(ccall((:OGROpen, libgdal), OGRDataSourceH, (Cstring, Cint, Ptr{OGRSFDriverH}), arg1, arg2, arg3))
end

function ogropenshared(arg1, arg2, arg3)
    aftercare(ccall((:OGROpenShared, libgdal), OGRDataSourceH, (Cstring, Cint, Ptr{OGRSFDriverH}), arg1, arg2, arg3))
end

function ogrreleasedatasource(arg1)
    aftercare(ccall((:OGRReleaseDataSource, libgdal), OGRErr, (OGRDataSourceH,), arg1))
end

"""
    ogrregisterdriver(arg1)

Doxygen\\_Suppress 
"""
function ogrregisterdriver(arg1)
    aftercare(ccall((:OGRRegisterDriver, libgdal), Cvoid, (OGRSFDriverH,), arg1))
end

function ogrderegisterdriver(arg1)
    aftercare(ccall((:OGRDeregisterDriver, libgdal), Cvoid, (OGRSFDriverH,), arg1))
end

function ogrgetdrivercount()
    aftercare(ccall((:OGRGetDriverCount, libgdal), Cint, ()))
end

function ogrgetdriver(arg1)
    aftercare(ccall((:OGRGetDriver, libgdal), OGRSFDriverH, (Cint,), arg1))
end

function ogrgetdriverbyname(arg1)
    aftercare(ccall((:OGRGetDriverByName, libgdal), OGRSFDriverH, (Cstring,), arg1))
end

"""
    ogrgetopendscount()

Doxygen\\_Suppress 
"""
function ogrgetopendscount()
    aftercare(ccall((:OGRGetOpenDSCount, libgdal), Cint, ()))
end

function ogrgetopends(iDS)
    aftercare(ccall((:OGRGetOpenDS, libgdal), OGRDataSourceH, (Cint,), iDS))
end

function ogrregisterall()
    aftercare(ccall((:OGRRegisterAll, libgdal), Cvoid, ()))
end

"""
    ogrcleanupall()

Clean-up all drivers (including raster ones starting with GDAL 2.0. See [`GDALDestroyDriverManager`](@ref)() 
"""
function ogrcleanupall()
    aftercare(ccall((:OGRCleanupAll, libgdal), Cvoid, ()))
end

"""Style manager opaque type """
const OGRStyleMgrH = Ptr{Cvoid}

"""Style tool opaque type """
const OGRStyleToolH = Ptr{Cvoid}

function ogr_sm_create(hStyleTable)
    aftercare(ccall((:OGR_SM_Create, libgdal), OGRStyleMgrH, (OGRStyleTableH,), hStyleTable))
end

function ogr_sm_destroy(hSM)
    aftercare(ccall((:OGR_SM_Destroy, libgdal), Cvoid, (OGRStyleMgrH,), hSM))
end

function ogr_sm_initfromfeature(hSM, hFeat)
    aftercare(ccall((:OGR_SM_InitFromFeature, libgdal), Cstring, (OGRStyleMgrH, OGRFeatureH), hSM, hFeat), false)
end

function ogr_sm_initstylestring(hSM, pszStyleString)
    aftercare(ccall((:OGR_SM_InitStyleString, libgdal), Cint, (OGRStyleMgrH, Cstring), hSM, pszStyleString))
end

function ogr_sm_getpartcount(hSM, pszStyleString)
    aftercare(ccall((:OGR_SM_GetPartCount, libgdal), Cint, (OGRStyleMgrH, Cstring), hSM, pszStyleString))
end

function ogr_sm_getpart(hSM, nPartId, pszStyleString)
    aftercare(ccall((:OGR_SM_GetPart, libgdal), OGRStyleToolH, (OGRStyleMgrH, Cint, Cstring), hSM, nPartId, pszStyleString))
end

function ogr_sm_addpart(hSM, hST)
    aftercare(ccall((:OGR_SM_AddPart, libgdal), Cint, (OGRStyleMgrH, OGRStyleToolH), hSM, hST))
end

function ogr_sm_addstyle(hSM, pszStyleName, pszStyleString)
    aftercare(ccall((:OGR_SM_AddStyle, libgdal), Cint, (OGRStyleMgrH, Cstring, Cstring), hSM, pszStyleName, pszStyleString))
end

"""
    ogr_style_tool_class_id

OGRStyleTool derived class types (returned by GetType()).

| Enumerator   | Note     |
| :----------- | :------- |
| OGRSTCNone   | None     |
| OGRSTCPen    | Pen      |
| OGRSTCBrush  | Brush    |
| OGRSTCSymbol | Symbol   |
| OGRSTCLabel  | Label    |
| OGRSTCVector | Vector   |
"""
@cenum ogr_style_tool_class_id::UInt32 begin
    OGRSTCNone = 0
    OGRSTCPen = 1
    OGRSTCBrush = 2
    OGRSTCSymbol = 3
    OGRSTCLabel = 4
    OGRSTCVector = 5
end

"""OGRStyleTool derived class types (returned by GetType())."""
const OGRSTClassId = ogr_style_tool_class_id

function ogr_st_create(eClassId)
    aftercare(ccall((:OGR_ST_Create, libgdal), OGRStyleToolH, (OGRSTClassId,), eClassId))
end

function ogr_st_destroy(hST)
    aftercare(ccall((:OGR_ST_Destroy, libgdal), Cvoid, (OGRStyleToolH,), hST))
end

function ogr_st_gettype(hST)
    aftercare(ccall((:OGR_ST_GetType, libgdal), OGRSTClassId, (OGRStyleToolH,), hST))
end

"""
    ogr_style_tool_units_id

List of units supported by OGRStyleTools.

| Enumerator   | Note          |
| :----------- | :------------ |
| OGRSTUGround | Ground unit   |
| OGRSTUPixel  | Pixel         |
| OGRSTUPoints | Points        |
| OGRSTUMM     | Millimeter    |
| OGRSTUCM     | Centimeter    |
| OGRSTUInches | Inch          |
"""
@cenum ogr_style_tool_units_id::UInt32 begin
    OGRSTUGround = 0
    OGRSTUPixel = 1
    OGRSTUPoints = 2
    OGRSTUMM = 3
    OGRSTUCM = 4
    OGRSTUInches = 5
end

"""List of units supported by OGRStyleTools."""
const OGRSTUnitId = ogr_style_tool_units_id

function ogr_st_getunit(hST)
    aftercare(ccall((:OGR_ST_GetUnit, libgdal), OGRSTUnitId, (OGRStyleToolH,), hST))
end

function ogr_st_setunit(hST, eUnit, dfGroundPaperScale)
    aftercare(ccall((:OGR_ST_SetUnit, libgdal), Cvoid, (OGRStyleToolH, OGRSTUnitId, Cdouble), hST, eUnit, dfGroundPaperScale))
end

function ogr_st_getparamstr(hST, eParam, bValueIsNull)
    aftercare(ccall((:OGR_ST_GetParamStr, libgdal), Cstring, (OGRStyleToolH, Cint, Ptr{Cint}), hST, eParam, bValueIsNull), false)
end

function ogr_st_getparamnum(hST, eParam, bValueIsNull)
    aftercare(ccall((:OGR_ST_GetParamNum, libgdal), Cint, (OGRStyleToolH, Cint, Ptr{Cint}), hST, eParam, bValueIsNull))
end

function ogr_st_getparamdbl(hST, eParam, bValueIsNull)
    aftercare(ccall((:OGR_ST_GetParamDbl, libgdal), Cdouble, (OGRStyleToolH, Cint, Ptr{Cint}), hST, eParam, bValueIsNull))
end

function ogr_st_setparamstr(hST, eParam, pszValue)
    aftercare(ccall((:OGR_ST_SetParamStr, libgdal), Cvoid, (OGRStyleToolH, Cint, Cstring), hST, eParam, pszValue))
end

function ogr_st_setparamnum(hST, eParam, nValue)
    aftercare(ccall((:OGR_ST_SetParamNum, libgdal), Cvoid, (OGRStyleToolH, Cint, Cint), hST, eParam, nValue))
end

function ogr_st_setparamdbl(hST, eParam, dfValue)
    aftercare(ccall((:OGR_ST_SetParamDbl, libgdal), Cvoid, (OGRStyleToolH, Cint, Cdouble), hST, eParam, dfValue))
end

function ogr_st_getstylestring(hST)
    aftercare(ccall((:OGR_ST_GetStyleString, libgdal), Cstring, (OGRStyleToolH,), hST), false)
end

function ogr_st_getrgbfromstring(hST, pszColor, pnRed, pnGreen, pnBlue, pnAlpha)
    aftercare(ccall((:OGR_ST_GetRGBFromString, libgdal), Cint, (OGRStyleToolH, Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), hST, pszColor, pnRed, pnGreen, pnBlue, pnAlpha))
end

function ogr_stbl_create()
    aftercare(ccall((:OGR_STBL_Create, libgdal), OGRStyleTableH, ()))
end

function ogr_stbl_destroy(hSTBL)
    aftercare(ccall((:OGR_STBL_Destroy, libgdal), Cvoid, (OGRStyleTableH,), hSTBL))
end

function ogr_stbl_addstyle(hStyleTable, pszName, pszStyleString)
    aftercare(ccall((:OGR_STBL_AddStyle, libgdal), Cint, (OGRStyleTableH, Cstring, Cstring), hStyleTable, pszName, pszStyleString))
end

function ogr_stbl_savestyletable(hStyleTable, pszFilename)
    aftercare(ccall((:OGR_STBL_SaveStyleTable, libgdal), Cint, (OGRStyleTableH, Cstring), hStyleTable, pszFilename))
end

function ogr_stbl_loadstyletable(hStyleTable, pszFilename)
    aftercare(ccall((:OGR_STBL_LoadStyleTable, libgdal), Cint, (OGRStyleTableH, Cstring), hStyleTable, pszFilename))
end

function ogr_stbl_find(hStyleTable, pszName)
    aftercare(ccall((:OGR_STBL_Find, libgdal), Cstring, (OGRStyleTableH, Cstring), hStyleTable, pszName), false)
end

function ogr_stbl_resetstylestringreading(hStyleTable)
    aftercare(ccall((:OGR_STBL_ResetStyleStringReading, libgdal), Cvoid, (OGRStyleTableH,), hStyleTable))
end

function ogr_stbl_getnextstyle(hStyleTable)
    aftercare(ccall((:OGR_STBL_GetNextStyle, libgdal), Cstring, (OGRStyleTableH,), hStyleTable), false)
end

function ogr_stbl_getlaststylename(hStyleTable)
    aftercare(ccall((:OGR_STBL_GetLastStyleName, libgdal), Cstring, (OGRStyleTableH,), hStyleTable), false)
end

"""
    ogrmalloc(arg1)

Doxygen\\_Suppress 
"""
function ogrmalloc(arg1)
    aftercare(ccall((:OGRMalloc, libgdal), Ptr{Cvoid}, (Csize_t,), arg1))
end

function ogrcalloc(arg1, arg2)
    aftercare(ccall((:OGRCalloc, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), arg1, arg2))
end

function ogrrealloc(arg1, arg2)
    aftercare(ccall((:OGRRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t), arg1, arg2))
end

function ogrstrdup(arg1)
    aftercare(ccall((:OGRStrdup, libgdal), Cstring, (Cstring,), arg1), false)
end

function ogrfree(arg1)
    aftercare(ccall((:OGRFree, libgdal), Cvoid, (Ptr{Cvoid},), arg1))
end

"""Type for a OGR boolean """
const OGRBoolean = Cint

"""
    OGRwkbVariant

Output variants of WKB we support.

99-402 was a short-lived extension to SFSQL 1.1 that used a high-bit flag to indicate the presence of Z coordinates in a WKB geometry.

SQL/MM Part 3 and SFSQL 1.2 use offsets of 1000 (Z), 2000 (M) and 3000 (ZM) to indicate the present of higher dimensional coordinates in a WKB geometry. Reference: <a href="https://portal.opengeospatial.org/files/?artifact_id=320243"> 09-009\\_Committee\\_Draft\\_ISOIEC\\_CD\\_13249-3\\_SQLMM\\_Spatial.pdf</a>, ISO/IEC JTC 1/SC 32 N 1820, ISO/IEC CD 13249-3:201x(E), Date: 2009-01-16. The codes are also found in §8.2.3 of <a href="http://portal.opengeospatial.org/files/?artifact_id=25355"> OGC 06-103r4 "OpenGIS® Implementation Standard for Geographic information - Simple feature access - Part 1: Common architecture", v1.2.1</a>

| Enumerator         | Note                                                                            |
| :----------------- | :------------------------------------------------------------------------------ |
| wkbVariantOldOgc   | Old-style 99-402 extended dimension (Z) WKB types                               |
| wkbVariantIso      | SFSQL 1.2 and ISO SQL/MM Part 3 extended dimension (Z&M) WKB types              |
| wkbVariantPostGIS1 | PostGIS 1.X has different codes for CurvePolygon, MultiCurve and MultiSurface   |
"""
@cenum OGRwkbVariant::UInt32 begin
    wkbVariantOldOgc = 0
    wkbVariantIso = 1
    wkbVariantPostGIS1 = 2
end

function ogrgeometrytypetoname(eType)
    aftercare(ccall((:OGRGeometryTypeToName, libgdal), Cstring, (OGRwkbGeometryType,), eType), false)
end

function ogrmergegeometrytypes(eMain, eExtra)
    aftercare(ccall((:OGRMergeGeometryTypes, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, OGRwkbGeometryType), eMain, eExtra))
end

function ogrmergegeometrytypesex(eMain, eExtra, bAllowPromotingToCurves)
    aftercare(ccall((:OGRMergeGeometryTypesEx, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, OGRwkbGeometryType, Cint), eMain, eExtra, bAllowPromotingToCurves))
end

function ogr_gt_flatten(eType)
    aftercare(ccall((:OGR_GT_Flatten, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

function ogr_gt_setz(eType)
    aftercare(ccall((:OGR_GT_SetZ, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

function ogr_gt_setm(eType)
    aftercare(ccall((:OGR_GT_SetM, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

function ogr_gt_setmodifier(eType, bSetZ, bSetM)
    aftercare(ccall((:OGR_GT_SetModifier, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType, Cint, Cint), eType, bSetZ, bSetM))
end

function ogr_gt_hasz(eType)
    aftercare(ccall((:OGR_GT_HasZ, libgdal), Cint, (OGRwkbGeometryType,), eType))
end

function ogr_gt_hasm(eType)
    aftercare(ccall((:OGR_GT_HasM, libgdal), Cint, (OGRwkbGeometryType,), eType))
end

function ogr_gt_issubclassof(eType, eSuperType)
    aftercare(ccall((:OGR_GT_IsSubClassOf, libgdal), Cint, (OGRwkbGeometryType, OGRwkbGeometryType), eType, eSuperType))
end

function ogr_gt_iscurve(arg1)
    aftercare(ccall((:OGR_GT_IsCurve, libgdal), Cint, (OGRwkbGeometryType,), arg1))
end

function ogr_gt_issurface(arg1)
    aftercare(ccall((:OGR_GT_IsSurface, libgdal), Cint, (OGRwkbGeometryType,), arg1))
end

function ogr_gt_isnonlinear(arg1)
    aftercare(ccall((:OGR_GT_IsNonLinear, libgdal), Cint, (OGRwkbGeometryType,), arg1))
end

function ogr_gt_getcollection(eType)
    aftercare(ccall((:OGR_GT_GetCollection, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

function ogr_gt_getcurve(eType)
    aftercare(ccall((:OGR_GT_GetCurve, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

function ogr_gt_getlinear(eType)
    aftercare(ccall((:OGR_GT_GetLinear, libgdal), OGRwkbGeometryType, (OGRwkbGeometryType,), eType))
end

function ogrparsedate(pszInput, psOutput, nOptions)
    aftercare(ccall((:OGRParseDate, libgdal), Cint, (Cstring, Ptr{OGRField}, Cint), pszInput, psOutput, nOptions))
end

"""
    ogr_style_tool_param_pen_id

List of parameters for use with OGRStylePen.

| Enumerator        | Note                   |
| :---------------- | :--------------------- |
| OGRSTPenColor     | Color                  |
| OGRSTPenWidth     | Width                  |
| OGRSTPenPattern   | Pattern                |
| OGRSTPenId        | Id                     |
| OGRSTPenPerOffset | Perpendicular offset   |
| OGRSTPenCap       | Cap                    |
| OGRSTPenJoin      | Join                   |
| OGRSTPenPriority  | Priority               |
"""
@cenum ogr_style_tool_param_pen_id::UInt32 begin
    OGRSTPenColor = 0
    OGRSTPenWidth = 1
    OGRSTPenPattern = 2
    OGRSTPenId = 3
    OGRSTPenPerOffset = 4
    OGRSTPenCap = 5
    OGRSTPenJoin = 6
    OGRSTPenPriority = 7
    OGRSTPenLast = 8
end

"""List of parameters for use with OGRStylePen."""
const OGRSTPenParam = ogr_style_tool_param_pen_id

"""
    ogr_style_tool_param_brush_id

List of parameters for use with OGRStyleBrush.

| Enumerator         | Note               |
| :----------------- | :----------------- |
| OGRSTBrushFColor   | Foreground color   |
| OGRSTBrushBColor   | Background color   |
| OGRSTBrushId       | Id                 |
| OGRSTBrushAngle    | Angle              |
| OGRSTBrushSize     | Size               |
| OGRSTBrushDx       | Dx                 |
| OGRSTBrushDy       | Dy                 |
| OGRSTBrushPriority | Priority           |
"""
@cenum ogr_style_tool_param_brush_id::UInt32 begin
    OGRSTBrushFColor = 0
    OGRSTBrushBColor = 1
    OGRSTBrushId = 2
    OGRSTBrushAngle = 3
    OGRSTBrushSize = 4
    OGRSTBrushDx = 5
    OGRSTBrushDy = 6
    OGRSTBrushPriority = 7
    OGRSTBrushLast = 8
end

"""List of parameters for use with OGRStyleBrush."""
const OGRSTBrushParam = ogr_style_tool_param_brush_id

"""
    ogr_style_tool_param_symbol_id

List of parameters for use with OGRStyleSymbol.

| Enumerator          | Note            |
| :------------------ | :-------------- |
| OGRSTSymbolId       | Id              |
| OGRSTSymbolAngle    | Angle           |
| OGRSTSymbolColor    | Color           |
| OGRSTSymbolSize     | Size            |
| OGRSTSymbolDx       | Dx              |
| OGRSTSymbolDy       | Dy              |
| OGRSTSymbolStep     | Step            |
| OGRSTSymbolPerp     | Perpendicular   |
| OGRSTSymbolOffset   | Offset          |
| OGRSTSymbolPriority | Priority        |
| OGRSTSymbolFontName | Font name       |
| OGRSTSymbolOColor   | Outline color   |
"""
@cenum ogr_style_tool_param_symbol_id::UInt32 begin
    OGRSTSymbolId = 0
    OGRSTSymbolAngle = 1
    OGRSTSymbolColor = 2
    OGRSTSymbolSize = 3
    OGRSTSymbolDx = 4
    OGRSTSymbolDy = 5
    OGRSTSymbolStep = 6
    OGRSTSymbolPerp = 7
    OGRSTSymbolOffset = 8
    OGRSTSymbolPriority = 9
    OGRSTSymbolFontName = 10
    OGRSTSymbolOColor = 11
    OGRSTSymbolLast = 12
end

"""List of parameters for use with OGRStyleSymbol."""
const OGRSTSymbolParam = ogr_style_tool_param_symbol_id

"""
    ogr_style_tool_param_label_id

List of parameters for use with OGRStyleLabel.

| Enumerator           | Note                   |
| :------------------- | :--------------------- |
| OGRSTLabelFontName   | Font name              |
| OGRSTLabelSize       | Size                   |
| OGRSTLabelTextString | Text string            |
| OGRSTLabelAngle      | Angle                  |
| OGRSTLabelFColor     | Foreground color       |
| OGRSTLabelBColor     | Background color       |
| OGRSTLabelPlacement  | Placement              |
| OGRSTLabelAnchor     | Anchor                 |
| OGRSTLabelDx         | Dx                     |
| OGRSTLabelDy         | Dy                     |
| OGRSTLabelPerp       | Perpendicular          |
| OGRSTLabelBold       | Bold                   |
| OGRSTLabelItalic     | Italic                 |
| OGRSTLabelUnderline  | Underline              |
| OGRSTLabelPriority   | Priority               |
| OGRSTLabelStrikeout  | Strike out             |
| OGRSTLabelStretch    | Stretch                |
| OGRSTLabelAdjHor     | OBSOLETE; do not use   |
| OGRSTLabelAdjVert    |                        |
| OGRSTLabelHColor     | Highlight color        |
| OGRSTLabelOColor     | Outline color          |
"""
@cenum ogr_style_tool_param_label_id::UInt32 begin
    OGRSTLabelFontName = 0
    OGRSTLabelSize = 1
    OGRSTLabelTextString = 2
    OGRSTLabelAngle = 3
    OGRSTLabelFColor = 4
    OGRSTLabelBColor = 5
    OGRSTLabelPlacement = 6
    OGRSTLabelAnchor = 7
    OGRSTLabelDx = 8
    OGRSTLabelDy = 9
    OGRSTLabelPerp = 10
    OGRSTLabelBold = 11
    OGRSTLabelItalic = 12
    OGRSTLabelUnderline = 13
    OGRSTLabelPriority = 14
    OGRSTLabelStrikeout = 15
    OGRSTLabelStretch = 16
    OGRSTLabelAdjHor = 17
    OGRSTLabelAdjVert = 18
    OGRSTLabelHColor = 19
    OGRSTLabelOColor = 20
    OGRSTLabelLast = 21
end

"""List of parameters for use with OGRStyleLabel."""
const OGRSTLabelParam = ogr_style_tool_param_label_id

function gdalversioninfo(arg1)
    aftercare(ccall((:GDALVersionInfo, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    gdalcheckversion(nVersionMajor, nVersionMinor, pszCallingComponentName)

Return [`TRUE`](@ref) if GDAL library version at runtime matches nVersionMajor.nVersionMinor.

The purpose of this method is to ensure that calling code will run with the GDAL version it is compiled for. It is primarily indented for external plugins.

### Parameters
* `nVersionMajor`: Major version to be tested against 

* `nVersionMinor`: Minor version to be tested against 

* `pszCallingComponentName`: If not NULL, in case of version mismatch, the method will issue a failure mentioning the name of the calling component.
"""
function gdalcheckversion(nVersionMajor, nVersionMinor, pszCallingComponentName)
    aftercare(ccall((:GDALCheckVersion, libgdal), Cint, (Cint, Cint, Cstring), nVersionMajor, nVersionMinor, pszCallingComponentName))
end

"""
    OGRAxisOrientation

Axis orientations (corresponds to CS\\_AxisOrientationEnum). 

| Enumerator  | Note                     |
| :---------- | :----------------------- |
| OAO\\_Other | Other                    |
| OAO\\_North | North                    |
| OAO\\_South | South                    |
| OAO\\_East  | East                     |
| OAO\\_West  | West                     |
| OAO\\_Up    | Up (to space)            |
| OAO\\_Down  | Down (to Earth center)   |
"""
@cenum OGRAxisOrientation::UInt32 begin
    OAO_Other = 0
    OAO_North = 1
    OAO_South = 2
    OAO_East = 3
    OAO_West = 4
    OAO_Up = 5
    OAO_Down = 6
end

function osraxisenumtoname(eOrientation)
    aftercare(ccall((:OSRAxisEnumToName, libgdal), Cstring, (OGRAxisOrientation,), eOrientation), false)
end

function osrsetprojsearchpaths(papszPaths)
    aftercare(ccall((:OSRSetPROJSearchPaths, libgdal), Cvoid, (Ptr{Cstring},), papszPaths))
end

function osrgetprojsearchpaths()
    aftercare(ccall((:OSRGetPROJSearchPaths, libgdal), Ptr{Cstring}, ()))
end

function osrgetprojversion(pnMajor, pnMinor, pnPatch)
    aftercare(ccall((:OSRGetPROJVersion, libgdal), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), pnMajor, pnMinor, pnPatch))
end

function osrnewspatialreference(arg1)
    aftercare(ccall((:OSRNewSpatialReference, libgdal), OGRSpatialReferenceH, (Cstring,), arg1))
end

function osrclonegeogcs(arg1)
    aftercare(ccall((:OSRCloneGeogCS, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH,), arg1))
end

function osrclone(arg1)
    aftercare(ccall((:OSRClone, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH,), arg1))
end

function osrdestroyspatialreference(arg1)
    aftercare(ccall((:OSRDestroySpatialReference, libgdal), Cvoid, (OGRSpatialReferenceH,), arg1))
end

function osrreference(arg1)
    aftercare(ccall((:OSRReference, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

function osrdereference(arg1)
    aftercare(ccall((:OSRDereference, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

function osrrelease(arg1)
    aftercare(ccall((:OSRRelease, libgdal), Cvoid, (OGRSpatialReferenceH,), arg1))
end

function osrvalidate(arg1)
    aftercare(ccall((:OSRValidate, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1))
end

function osrimportfromepsg(arg1, arg2)
    aftercare(ccall((:OSRImportFromEPSG, libgdal), OGRErr, (OGRSpatialReferenceH, Cint), arg1, arg2))
end

function osrimportfromepsga(arg1, arg2)
    aftercare(ccall((:OSRImportFromEPSGA, libgdal), OGRErr, (OGRSpatialReferenceH, Cint), arg1, arg2))
end

function osrimportfromwkt(arg1, arg2)
    aftercare(ccall((:OSRImportFromWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

function osrimportfromproj4(arg1, arg2)
    aftercare(ccall((:OSRImportFromProj4, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

function osrimportfromesri(arg1, arg2)
    aftercare(ccall((:OSRImportFromESRI, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

function osrimportfrompci(hSRS, arg2, arg3, arg4)
    aftercare(ccall((:OSRImportFromPCI, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Ptr{Cdouble}), hSRS, arg2, arg3, arg4))
end

function osrimportfromusgs(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OSRImportFromUSGS, libgdal), OGRErr, (OGRSpatialReferenceH, Clong, Clong, Ptr{Cdouble}, Clong), arg1, arg2, arg3, arg4, arg5))
end

function osrimportfromxml(arg1, arg2)
    aftercare(ccall((:OSRImportFromXML, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

function osrimportfromdict(arg1, arg2, arg3)
    aftercare(ccall((:OSRImportFromDict, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring), arg1, arg2, arg3))
end

function osrimportfrompanorama(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OSRImportFromPanorama, libgdal), OGRErr, (OGRSpatialReferenceH, Clong, Clong, Clong, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5))
end

function osrimportfromozi(arg1, arg2)
    aftercare(ccall((:OSRImportFromOzi, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

function osrimportfrommicoordsys(arg1, arg2)
    aftercare(ccall((:OSRImportFromMICoordSys, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

function osrimportfromerm(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OSRImportFromERM, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4))
end

function osrimportfromurl(arg1, arg2)
    aftercare(ccall((:OSRImportFromUrl, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

function osrexporttowkt(arg1, arg2)
    aftercare(ccall((:OSRExportToWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

function osrexporttowktex(arg1, ppszResult, papszOptions)
    aftercare(ccall((:OSRExportToWktEx, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cstring}), arg1, ppszResult, papszOptions))
end

function osrexporttoprettywkt(arg1, arg2, arg3)
    aftercare(ccall((:OSRExportToPrettyWkt, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Cint), arg1, arg2, arg3))
end

function osrexporttoprojjson(hSRS, ppszReturn, papszOptions)
    aftercare(ccall((:OSRExportToPROJJSON, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cstring}), hSRS, ppszReturn, papszOptions))
end

function osrexporttoproj4(arg1, arg2)
    aftercare(ccall((:OSRExportToProj4, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

function osrexporttopci(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OSRExportToPCI, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cstring}, Ptr{Ptr{Cdouble}}), arg1, arg2, arg3, arg4))
end

function osrexporttousgs(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:OSRExportToUSGS, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Clong}, Ptr{Clong}, Ptr{Ptr{Cdouble}}, Ptr{Clong}), arg1, arg2, arg3, arg4, arg5))
end

function osrexporttoxml(arg1, arg2, arg3)
    aftercare(ccall((:OSRExportToXML, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}, Cstring), arg1, arg2, arg3))
end

function osrexporttopanorama(arg1, arg2, arg3, arg4, arg5, arg6)
    aftercare(ccall((:OSRExportToPanorama, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Cdouble}), arg1, arg2, arg3, arg4, arg5, arg6))
end

function osrexporttomicoordsys(arg1, arg2)
    aftercare(ccall((:OSRExportToMICoordSys, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

function osrexporttoerm(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OSRExportToERM, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring), arg1, arg2, arg3, arg4))
end

function osrmorphtoesri(arg1)
    aftercare(ccall((:OSRMorphToESRI, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1))
end

function osrmorphfromesri(arg1)
    aftercare(ccall((:OSRMorphFromESRI, libgdal), OGRErr, (OGRSpatialReferenceH,), arg1))
end

function osrconverttootherprojection(hSRS, pszTargetProjection, papszOptions)
    aftercare(ccall((:OSRConvertToOtherProjection, libgdal), OGRSpatialReferenceH, (OGRSpatialReferenceH, Cstring, Ptr{Cstring}), hSRS, pszTargetProjection, papszOptions))
end

function osrgetname(hSRS)
    aftercare(ccall((:OSRGetName, libgdal), Cstring, (OGRSpatialReferenceH,), hSRS), false)
end

function osrsetattrvalue(hSRS, pszNodePath, pszNewNodeValue)
    aftercare(ccall((:OSRSetAttrValue, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring), hSRS, pszNodePath, pszNewNodeValue))
end

function osrgetattrvalue(hSRS, pszName, iChild)
    aftercare(ccall((:OSRGetAttrValue, libgdal), Cstring, (OGRSpatialReferenceH, Cstring, Cint), hSRS, pszName, iChild), false)
end

function osrsetangularunits(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetAngularUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

function osrgetangularunits(arg1, arg2)
    aftercare(ccall((:OSRGetAngularUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

function osrsetlinearunits(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetLinearUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

function osrsettargetlinearunits(arg1, arg2, arg3, arg4)
    aftercare(ccall((:OSRSetTargetLinearUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cdouble), arg1, arg2, arg3, arg4))
end

function osrsetlinearunitsandupdateparameters(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetLinearUnitsAndUpdateParameters, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

function osrgetlinearunits(arg1, arg2)
    aftercare(ccall((:OSRGetLinearUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

function osrgettargetlinearunits(arg1, arg2, arg3)
    aftercare(ccall((:OSRGetTargetLinearUnits, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Ptr{Cstring}), arg1, arg2, arg3))
end

function osrgetprimemeridian(arg1, arg2)
    aftercare(ccall((:OSRGetPrimeMeridian, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2))
end

function osrisgeographic(arg1)
    aftercare(ccall((:OSRIsGeographic, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

function osrisderivedgeographic(arg1)
    aftercare(ccall((:OSRIsDerivedGeographic, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

function osrislocal(arg1)
    aftercare(ccall((:OSRIsLocal, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

function osrisprojected(arg1)
    aftercare(ccall((:OSRIsProjected, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

function osriscompound(arg1)
    aftercare(ccall((:OSRIsCompound, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

function osrisgeocentric(arg1)
    aftercare(ccall((:OSRIsGeocentric, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

function osrisvertical(arg1)
    aftercare(ccall((:OSRIsVertical, libgdal), Cint, (OGRSpatialReferenceH,), arg1))
end

function osrissamegeogcs(arg1, arg2)
    aftercare(ccall((:OSRIsSameGeogCS, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2))
end

function osrissamevertcs(arg1, arg2)
    aftercare(ccall((:OSRIsSameVertCS, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2))
end

function osrissame(arg1, arg2)
    aftercare(ccall((:OSRIsSame, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH), arg1, arg2))
end

function osrissameex(arg1, arg2, papszOptions)
    aftercare(ccall((:OSRIsSameEx, libgdal), Cint, (OGRSpatialReferenceH, OGRSpatialReferenceH, Ptr{Cstring}), arg1, arg2, papszOptions))
end

function osrsetlocalcs(hSRS, pszName)
    aftercare(ccall((:OSRSetLocalCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

function osrsetprojcs(hSRS, pszName)
    aftercare(ccall((:OSRSetProjCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

function osrsetgeoccs(hSRS, pszName)
    aftercare(ccall((:OSRSetGeocCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

function osrsetwellknowngeogcs(hSRS, pszName)
    aftercare(ccall((:OSRSetWellKnownGeogCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

function osrsetfromuserinput(hSRS, arg2)
    aftercare(ccall((:OSRSetFromUserInput, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, arg2))
end

function osrcopygeogcsfrom(hSRS, hSrcSRS)
    aftercare(ccall((:OSRCopyGeogCSFrom, libgdal), OGRErr, (OGRSpatialReferenceH, OGRSpatialReferenceH), hSRS, hSrcSRS))
end

function osrsettowgs84(hSRS, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    aftercare(ccall((:OSRSetTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, arg2, arg3, arg4, arg5, arg6, arg7, arg8))
end

function osrgettowgs84(hSRS, arg2, arg3)
    aftercare(ccall((:OSRGetTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH, Ptr{Cdouble}, Cint), hSRS, arg2, arg3))
end

function osraddguessedtowgs84(hSRS)
    aftercare(ccall((:OSRAddGuessedTOWGS84, libgdal), OGRErr, (OGRSpatialReferenceH,), hSRS))
end

function osrsetcompoundcs(hSRS, pszName, hHorizSRS, hVertSRS)
    aftercare(ccall((:OSRSetCompoundCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, OGRSpatialReferenceH, OGRSpatialReferenceH), hSRS, pszName, hHorizSRS, hVertSRS))
end

function osrpromoteto3d(hSRS, pszName)
    aftercare(ccall((:OSRPromoteTo3D, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

function osrdemoteto2d(hSRS, pszName)
    aftercare(ccall((:OSRDemoteTo2D, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), hSRS, pszName))
end

function osrsetgeogcs(hSRS, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor, dfInvFlattening, pszPMName, dfPMOffset, pszUnits, dfConvertToRadians)
    aftercare(ccall((:OSRSetGeogCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cstring, Cdouble, Cdouble, Cstring, Cdouble, Cstring, Cdouble), hSRS, pszGeogName, pszDatumName, pszEllipsoidName, dfSemiMajor, dfInvFlattening, pszPMName, dfPMOffset, pszUnits, dfConvertToRadians))
end

function osrsetvertcs(hSRS, pszVertCSName, pszVertDatumName, nVertDatumType)
    aftercare(ccall((:OSRSetVertCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cint), hSRS, pszVertCSName, pszVertDatumName, nVertDatumType))
end

function osrgetsemimajor(arg1, arg2)
    aftercare(ccall((:OSRGetSemiMajor, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2))
end

function osrgetsemiminor(arg1, arg2)
    aftercare(ccall((:OSRGetSemiMinor, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2))
end

function osrgetinvflattening(arg1, arg2)
    aftercare(ccall((:OSRGetInvFlattening, libgdal), Cdouble, (OGRSpatialReferenceH, Ptr{OGRErr}), arg1, arg2))
end

function osrsetauthority(hSRS, pszTargetKey, pszAuthority, nCode)
    aftercare(ccall((:OSRSetAuthority, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, Cint), hSRS, pszTargetKey, pszAuthority, nCode))
end

function osrgetauthoritycode(hSRS, pszTargetKey)
    aftercare(ccall((:OSRGetAuthorityCode, libgdal), Cstring, (OGRSpatialReferenceH, Cstring), hSRS, pszTargetKey), false)
end

function osrgetauthorityname(hSRS, pszTargetKey)
    aftercare(ccall((:OSRGetAuthorityName, libgdal), Cstring, (OGRSpatialReferenceH, Cstring), hSRS, pszTargetKey), false)
end

function osrgetareaofuse(hSRS, pdfWestLongitudeDeg, pdfSouthLatitudeDeg, pdfEastLongitudeDeg, pdfNorthLatitudeDeg, ppszAreaName)
    aftercare(ccall((:OSRGetAreaOfUse, libgdal), Cint, (OGRSpatialReferenceH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cstring}), hSRS, pdfWestLongitudeDeg, pdfSouthLatitudeDeg, pdfEastLongitudeDeg, pdfNorthLatitudeDeg, ppszAreaName))
end

function osrsetprojection(arg1, arg2)
    aftercare(ccall((:OSRSetProjection, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring), arg1, arg2))
end

function osrsetprojparm(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetProjParm, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

function osrgetprojparm(hSRS, pszParmName, dfDefault, arg4)
    aftercare(ccall((:OSRGetProjParm, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg4))
end

function osrsetnormprojparm(arg1, arg2, arg3)
    aftercare(ccall((:OSRSetNormProjParm, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble), arg1, arg2, arg3))
end

function osrgetnormprojparm(hSRS, pszParmName, dfDefault, arg4)
    aftercare(ccall((:OSRGetNormProjParm, libgdal), Cdouble, (OGRSpatialReferenceH, Cstring, Cdouble, Ptr{OGRErr}), hSRS, pszParmName, dfDefault, arg4))
end

function osrsetutm(hSRS, nZone, bNorth)
    aftercare(ccall((:OSRSetUTM, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint), hSRS, nZone, bNorth))
end

function osrgetutmzone(hSRS, pbNorth)
    aftercare(ccall((:OSRGetUTMZone, libgdal), Cint, (OGRSpatialReferenceH, Ptr{Cint}), hSRS, pbNorth))
end

function osrsetstateplane(hSRS, nZone, bNAD83)
    aftercare(ccall((:OSRSetStatePlane, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint), hSRS, nZone, bNAD83))
end

function osrsetstateplanewithunits(hSRS, nZone, bNAD83, pszOverrideUnitName, dfOverrideUnit)
    aftercare(ccall((:OSRSetStatePlaneWithUnits, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cint, Cstring, Cdouble), hSRS, nZone, bNAD83, pszOverrideUnitName, dfOverrideUnit))
end

function osrautoidentifyepsg(hSRS)
    aftercare(ccall((:OSRAutoIdentifyEPSG, libgdal), OGRErr, (OGRSpatialReferenceH,), hSRS))
end

function osrfindmatches(hSRS, papszOptions, pnEntries, ppanMatchConfidence)
    aftercare(ccall((:OSRFindMatches, libgdal), Ptr{OGRSpatialReferenceH}, (OGRSpatialReferenceH, Ptr{Cstring}, Ptr{Cint}, Ptr{Ptr{Cint}}), hSRS, papszOptions, pnEntries, ppanMatchConfidence))
end

function osrfreesrsarray(pahSRS)
    aftercare(ccall((:OSRFreeSRSArray, libgdal), Cvoid, (Ptr{OGRSpatialReferenceH},), pahSRS))
end

function osrepsgtreatsaslatlong(hSRS)
    aftercare(ccall((:OSREPSGTreatsAsLatLong, libgdal), Cint, (OGRSpatialReferenceH,), hSRS))
end

function osrepsgtreatsasnorthingeasting(hSRS)
    aftercare(ccall((:OSREPSGTreatsAsNorthingEasting, libgdal), Cint, (OGRSpatialReferenceH,), hSRS))
end

function osrgetaxis(hSRS, pszTargetKey, iAxis, peOrientation)
    aftercare(ccall((:OSRGetAxis, libgdal), Cstring, (OGRSpatialReferenceH, Cstring, Cint, Ptr{OGRAxisOrientation}), hSRS, pszTargetKey, iAxis, peOrientation), false)
end

function osrgetaxescount(hSRS)
    aftercare(ccall((:OSRGetAxesCount, libgdal), Cint, (OGRSpatialReferenceH,), hSRS))
end

function osrsetaxes(hSRS, pszTargetKey, pszXAxisName, eXAxisOrientation, pszYAxisName, eYAxisOrientation)
    aftercare(ccall((:OSRSetAxes, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cstring, OGRAxisOrientation, Cstring, OGRAxisOrientation), hSRS, pszTargetKey, pszXAxisName, eXAxisOrientation, pszYAxisName, eYAxisOrientation))
end

"""
    OSRAxisMappingStrategy

Data axis to CRS axis mapping strategy. 

| Enumerator                       | Note                                                     |
| :------------------------------- | :------------------------------------------------------- |
| OAMS\\_TRADITIONAL\\_GIS\\_ORDER | Traditional GIS order                                    |
| OAMS\\_AUTHORITY\\_COMPLIANT     | Compliant with the order mandated by the CRS authority   |
| OAMS\\_CUSTOM                    | Custom                                                   |
"""
@cenum OSRAxisMappingStrategy::UInt32 begin
    OAMS_TRADITIONAL_GIS_ORDER = 0
    OAMS_AUTHORITY_COMPLIANT = 1
    OAMS_CUSTOM = 2
end

function osrgetaxismappingstrategy(hSRS)
    aftercare(ccall((:OSRGetAxisMappingStrategy, libgdal), OSRAxisMappingStrategy, (OGRSpatialReferenceH,), hSRS))
end

function osrsetaxismappingstrategy(hSRS, strategy)
    aftercare(ccall((:OSRSetAxisMappingStrategy, libgdal), Cvoid, (OGRSpatialReferenceH, OSRAxisMappingStrategy), hSRS, strategy))
end

function osrgetdataaxistosrsaxismapping(hSRS, pnCount)
    aftercare(ccall((:OSRGetDataAxisToSRSAxisMapping, libgdal), Ptr{Cint}, (OGRSpatialReferenceH, Ptr{Cint}), hSRS, pnCount))
end

function osrsetdataaxistosrsaxismapping(hSRS, nMappingSize, panMapping)
    aftercare(ccall((:OSRSetDataAxisToSRSAxisMapping, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Ptr{Cint}), hSRS, nMappingSize, panMapping))
end

"""
    osrsetacea(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Albers Conic Equal Area 
"""
function osrsetacea(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetACEA, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetae(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Azimuthal Equidistant 
"""
function osrsetae(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetAE, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetbonne(hSRS, dfStandardParallel, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Bonne 
"""
function osrsetbonne(hSRS, dfStandardParallel, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetBonne, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStandardParallel, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetcea(hSRS, dfStdP1, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Cylindrical Equal Area 
"""
function osrsetcea(hSRS, dfStdP1, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetCEA, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetcs(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Cassini-Soldner 
"""
function osrsetcs(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetCS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetec(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Equidistant Conic 
"""
function osrsetec(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrseteckert(hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Eckert I-VI 
"""
function osrseteckert(hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEckert, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrseteckertiv(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Eckert IV 
"""
function osrseteckertiv(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEckertIV, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrseteckertvi(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Eckert VI 
"""
function osrseteckertvi(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEckertVI, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetequirectangular(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Equirectangular 
"""
function osrsetequirectangular(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEquirectangular, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetequirectangular2(hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing)

Equirectangular generalized form 
"""
function osrsetequirectangular2(hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetEquirectangular2, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfPseudoStdParallel1, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetgs(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Gall Stereograpic 
"""
function osrsetgs(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetgh(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Goode Homolosine 
"""
function osrsetgh(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGH, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetigh(hSRS)

Interrupted Goode Homolosine 
"""
function osrsetigh(hSRS)
    aftercare(ccall((:OSRSetIGH, libgdal), OGRErr, (OGRSpatialReferenceH,), hSRS))
end

"""
    osrsetgeos(hSRS, dfCentralMeridian, dfSatelliteHeight, dfFalseEasting, dfFalseNorthing)

GEOS - Geostationary Satellite View 
"""
function osrsetgeos(hSRS, dfCentralMeridian, dfSatelliteHeight, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGEOS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfSatelliteHeight, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetgaussschreibertmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Gauss Schreiber Transverse Mercator 
"""
function osrsetgaussschreibertmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGaussSchreiberTMercator, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetgnomonic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Gnomonic 
"""
function osrsetgnomonic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetGnomonic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsethom(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)

Hotine Oblique Mercator using azimuth angle 
"""
function osrsethom(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetHOM, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing))
end

function osrsethomac(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetHOMAC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfRectToSkew, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsethom2pno(hSRS, dfCenterLat, dfLat1, dfLong1, dfLat2, dfLong2, dfScale, dfFalseEasting, dfFalseNorthing)

Hotine Oblique Mercator using two points on centerline 
"""
function osrsethom2pno(hSRS, dfCenterLat, dfLat1, dfLong1, dfLat2, dfLong2, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetHOM2PNO, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfLat1, dfLong1, dfLat2, dfLong2, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetiwmpolyconic(hSRS, dfLat1, dfLat2, dfCenterLong, dfFalseEasting, dfFalseNorthing)

International Map of the World Polyconic 
"""
function osrsetiwmpolyconic(hSRS, dfLat1, dfLat2, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetIWMPolyconic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLat1, dfLat2, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetkrovak(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfPseudoStdParallelLat, dfScale, dfFalseEasting, dfFalseNorthing)

Krovak Oblique Conic Conformal 
"""
function osrsetkrovak(hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfPseudoStdParallelLat, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetKrovak, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfAzimuth, dfPseudoStdParallelLat, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetlaea(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Lambert Azimuthal Equal-Area 
"""
function osrsetlaea(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetLAEA, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetlcc(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Lambert Conformal Conic 
"""
function osrsetlcc(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetLCC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetlcc1sp(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Lambert Conformal Conic 1SP 
"""
function osrsetlcc1sp(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetLCC1SP, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetlccb(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Lambert Conformal Conic (Belgium) 
"""
function osrsetlccb(hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetLCCB, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfStdP2, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetmc(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Miller Cylindrical 
"""
function osrsetmc(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetMC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Mercator 
"""
function osrsetmercator(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetMercator, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetmercator2sp(hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Mercator 2SP 
"""
function osrsetmercator2sp(hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetMercator2SP, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfStdP1, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetmollweide(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Mollweide 
"""
function osrsetmollweide(hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetMollweide, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetnzmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

New Zealand Map Grid 
"""
function osrsetnzmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetNZMG, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetos(hSRS, dfOriginLat, dfCMeridian, dfScale, dfFalseEasting, dfFalseNorthing)

Oblique Stereographic 
"""
function osrsetos(hSRS, dfOriginLat, dfCMeridian, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetOS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfOriginLat, dfCMeridian, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetorthographic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Orthographic 
"""
function osrsetorthographic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetOrthographic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetpolyconic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Polyconic 
"""
function osrsetpolyconic(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetPolyconic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetps(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Polar Stereographic 
"""
function osrsetps(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetPS, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetrobinson(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Robinson 
"""
function osrsetrobinson(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetRobinson, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetsinusoidal(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Sinusoidal 
"""
function osrsetsinusoidal(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetSinusoidal, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetstereographic(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Stereographic 
"""
function osrsetstereographic(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetStereographic, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetsoc(hSRS, dfLatitudeOfOrigin, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)

Swiss Oblique Cylindrical 
"""
function osrsetsoc(hSRS, dfLatitudeOfOrigin, dfCentralMeridian, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetSOC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLatitudeOfOrigin, dfCentralMeridian, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettm(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Transverse Mercator

Special processing available for Transverse Mercator with GDAL >= 1.10 and PROJ >= 4.8 : see OGRSpatialReference::exportToProj4().
"""
function osrsettm(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTM, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettmvariant(hSRS, pszVariantName, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Transverse Mercator variant 
"""
function osrsettmvariant(hSRS, pszVariantName, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTMVariant, libgdal), OGRErr, (OGRSpatialReferenceH, Cstring, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, pszVariantName, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)

Tunesia Mining Grid 
"""
function osrsettmg(hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTMG, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettmso(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)

Transverse Mercator (South Oriented) 
"""
function osrsettmso(hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTMSO, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong, dfScale, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsettped(hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing)

TPED (Two Point Equi Distant) 
"""
function osrsettped(hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetTPED, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfLat1, dfLong1, dfLat2, dfLong2, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetvdg(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)

VanDerGrinten 
"""
function osrsetvdg(hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetVDG, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble), hSRS, dfCenterLong, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetwagner(hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing)

Wagner I -- VII 
"""
function osrsetwagner(hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetWagner, libgdal), OGRErr, (OGRSpatialReferenceH, Cint, Cdouble, Cdouble, Cdouble), hSRS, nVariation, dfCenterLat, dfFalseEasting, dfFalseNorthing))
end

"""
    osrsetqsc(hSRS, dfCenterLat, dfCenterLong)

Quadrilateralized Spherical Cube 
"""
function osrsetqsc(hSRS, dfCenterLat, dfCenterLong)
    aftercare(ccall((:OSRSetQSC, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble), hSRS, dfCenterLat, dfCenterLong))
end

"""
    osrsetsch(hSRS, dfPegLat, dfPegLong, dfPegHeading, dfPegHgt)

Spherical, Cross-track, Height 
"""
function osrsetsch(hSRS, dfPegLat, dfPegLong, dfPegHeading, dfPegHgt)
    aftercare(ccall((:OSRSetSCH, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfPegLat, dfPegLong, dfPegHeading, dfPegHgt))
end

"""
    osrsetverticalperspective(hSRS, dfTopoOriginLat, dfTopoOriginLon, dfTopoOriginHeight, dfViewPointHeight, dfFalseEasting, dfFalseNorthing)

Vertical Perspective / Near-sided Perspective 
"""
function osrsetverticalperspective(hSRS, dfTopoOriginLat, dfTopoOriginLon, dfTopoOriginHeight, dfViewPointHeight, dfFalseEasting, dfFalseNorthing)
    aftercare(ccall((:OSRSetVerticalPerspective, libgdal), OGRErr, (OGRSpatialReferenceH, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), hSRS, dfTopoOriginLat, dfTopoOriginLon, dfTopoOriginHeight, dfViewPointHeight, dfFalseEasting, dfFalseNorthing))
end

function osrcalcinvflattening(dfSemiMajor, dfSemiMinor)
    aftercare(ccall((:OSRCalcInvFlattening, libgdal), Cdouble, (Cdouble, Cdouble), dfSemiMajor, dfSemiMinor))
end

function osrcalcsemiminorfrominvflattening(dfSemiMajor, dfInvFlattening)
    aftercare(ccall((:OSRCalcSemiMinorFromInvFlattening, libgdal), Cdouble, (Cdouble, Cdouble), dfSemiMajor, dfInvFlattening))
end

function osrcleanup()
    aftercare(ccall((:OSRCleanup, libgdal), Cvoid, ()))
end

"""
    OSRCRSType

Type of Coordinate Reference System (CRS). 

| Enumerator                         | Note                |
| :--------------------------------- | :------------------ |
| OSR\\_CRS\\_TYPE\\_GEOGRAPHIC\\_2D | Geographic 2D CRS   |
| OSR\\_CRS\\_TYPE\\_GEOGRAPHIC\\_3D | Geographic 3D CRS   |
| OSR\\_CRS\\_TYPE\\_GEOCENTRIC      | Geocentric CRS      |
| OSR\\_CRS\\_TYPE\\_PROJECTED       | Projected CRS       |
| OSR\\_CRS\\_TYPE\\_VERTICAL        | Vertical CRS        |
| OSR\\_CRS\\_TYPE\\_COMPOUND        | Compound CRS        |
| OSR\\_CRS\\_TYPE\\_OTHER           | Other               |
"""
@cenum OSRCRSType::UInt32 begin
    OSR_CRS_TYPE_GEOGRAPHIC_2D = 0
    OSR_CRS_TYPE_GEOGRAPHIC_3D = 1
    OSR_CRS_TYPE_GEOCENTRIC = 2
    OSR_CRS_TYPE_PROJECTED = 3
    OSR_CRS_TYPE_VERTICAL = 4
    OSR_CRS_TYPE_COMPOUND = 5
    OSR_CRS_TYPE_OTHER = 6
end

"""
    OSRCRSInfo

Structure given overall description of a CRS.

This structure may grow over time, and should not be directly allocated by client code.

| Field               | Note                                                                                                                    |
| :------------------ | :---------------------------------------------------------------------------------------------------------------------- |
| pszAuthName         | Authority name.                                                                                                         |
| pszCode             | Object code.                                                                                                            |
| pszName             | Object name.                                                                                                            |
| eType               | Object type.                                                                                                            |
| bDeprecated         | Whether the object is deprecated                                                                                        |
| bBboxValid          | Whereas the west\\_lon\\_degree, south\\_lat\\_degree, east\\_lon\\_degree and north\\_lat\\_degree fields are valid.   |
| dfWestLongitudeDeg  | Western-most longitude of the area of use, in degrees.                                                                  |
| dfSouthLatitudeDeg  | Southern-most latitude of the area of use, in degrees.                                                                  |
| dfEastLongitudeDeg  | Eastern-most longitude of the area of use, in degrees.                                                                  |
| dfNorthLatitudeDeg  | Northern-most latitude of the area of use, in degrees.                                                                  |
| pszAreaName         | Name of the area of use.                                                                                                |
| pszProjectionMethod | Name of the projection method for a projected CRS. Might be NULL evenfor projected CRS in some cases.                   |
"""
struct OSRCRSInfo
    pszAuthName::Cstring
    pszCode::Cstring
    pszName::Cstring
    eType::OSRCRSType
    bDeprecated::Cint
    bBboxValid::Cint
    dfWestLongitudeDeg::Cdouble
    dfSouthLatitudeDeg::Cdouble
    dfEastLongitudeDeg::Cdouble
    dfNorthLatitudeDeg::Cdouble
    pszAreaName::Cstring
    pszProjectionMethod::Cstring
end

const OSRCRSListParameters = Cvoid

function osrgetcrsinfolistfromdatabase(pszAuthName, params, pnOutResultCount)
    aftercare(ccall((:OSRGetCRSInfoListFromDatabase, libgdal), Ptr{Ptr{OSRCRSInfo}}, (Cstring, Ptr{OSRCRSListParameters}, Ptr{Cint}), pszAuthName, params, pnOutResultCount))
end

function osrdestroycrsinfolist(list)
    aftercare(ccall((:OSRDestroyCRSInfoList, libgdal), Cvoid, (Ptr{Ptr{OSRCRSInfo}},), list))
end

function octnewcoordinatetransformation(hSourceSRS, hTargetSRS)
    aftercare(ccall((:OCTNewCoordinateTransformation, libgdal), OGRCoordinateTransformationH, (OGRSpatialReferenceH, OGRSpatialReferenceH), hSourceSRS, hTargetSRS))
end

const OGRCoordinateTransformationOptions = Cvoid

"""Coordinate transformation options. """
const OGRCoordinateTransformationOptionsH = Ptr{OGRCoordinateTransformationOptions}

function octnewcoordinatetransformationoptions()
    aftercare(ccall((:OCTNewCoordinateTransformationOptions, libgdal), OGRCoordinateTransformationOptionsH, ()))
end

function octcoordinatetransformationoptionssetoperation(hOptions, pszCO, bReverseCO)
    aftercare(ccall((:OCTCoordinateTransformationOptionsSetOperation, libgdal), Cint, (OGRCoordinateTransformationOptionsH, Cstring, Cint), hOptions, pszCO, bReverseCO))
end

function octcoordinatetransformationoptionssetareaofinterest(hOptions, dfWestLongitudeDeg, dfSouthLatitudeDeg, dfEastLongitudeDeg, dfNorthLatitudeDeg)
    aftercare(ccall((:OCTCoordinateTransformationOptionsSetAreaOfInterest, libgdal), Cint, (OGRCoordinateTransformationOptionsH, Cdouble, Cdouble, Cdouble, Cdouble), hOptions, dfWestLongitudeDeg, dfSouthLatitudeDeg, dfEastLongitudeDeg, dfNorthLatitudeDeg))
end

function octdestroycoordinatetransformationoptions(arg1)
    aftercare(ccall((:OCTDestroyCoordinateTransformationOptions, libgdal), Cvoid, (OGRCoordinateTransformationOptionsH,), arg1))
end

function octnewcoordinatetransformationex(hSourceSRS, hTargetSRS, hOptions)
    aftercare(ccall((:OCTNewCoordinateTransformationEx, libgdal), OGRCoordinateTransformationH, (OGRSpatialReferenceH, OGRSpatialReferenceH, OGRCoordinateTransformationOptionsH), hSourceSRS, hTargetSRS, hOptions))
end

function octdestroycoordinatetransformation(arg1)
    aftercare(ccall((:OCTDestroyCoordinateTransformation, libgdal), Cvoid, (OGRCoordinateTransformationH,), arg1))
end

function octtransform(hCT, nCount, x, y, z)
    aftercare(ccall((:OCTTransform, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), hCT, nCount, x, y, z))
end

function octtransformex(hCT, nCount, x, y, z, pabSuccess)
    aftercare(ccall((:OCTTransformEx, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), hCT, nCount, x, y, z, pabSuccess))
end

function octtransform4d(hCT, nCount, x, y, z, t, pabSuccess)
    aftercare(ccall((:OCTTransform4D, libgdal), Cint, (OGRCoordinateTransformationH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}), hCT, nCount, x, y, z, t, pabSuccess))
end

struct __JL_Ctag_153
    nCount::Cint
    paList::Ptr{Cint}
end
function Base.getproperty(x::Ptr{__JL_Ctag_153}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paList && return Ptr{Ptr{Cint}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_153, f::Symbol)
    r = Ref{__JL_Ctag_153}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_153}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_153}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_154
    nCount::Cint
    paList::Ptr{GIntBig}
end
function Base.getproperty(x::Ptr{__JL_Ctag_154}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paList && return Ptr{Ptr{GIntBig}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_154, f::Symbol)
    r = Ref{__JL_Ctag_154}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_154}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_154}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_155
    nCount::Cint
    paList::Ptr{Cdouble}
end
function Base.getproperty(x::Ptr{__JL_Ctag_155}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paList && return Ptr{Ptr{Cdouble}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_155, f::Symbol)
    r = Ref{__JL_Ctag_155}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_155}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_155}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_156
    nCount::Cint
    paList::Ptr{Cstring}
end
function Base.getproperty(x::Ptr{__JL_Ctag_156}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paList && return Ptr{Ptr{Cstring}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_156, f::Symbol)
    r = Ref{__JL_Ctag_156}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_156}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_156}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_157
    nCount::Cint
    paData::Ptr{GByte}
end
function Base.getproperty(x::Ptr{__JL_Ctag_157}, f::Symbol)
    f === :nCount && return Ptr{Cint}(x + 0)
    f === :paData && return Ptr{Ptr{GByte}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_157, f::Symbol)
    r = Ref{__JL_Ctag_157}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_157}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_157}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_158
    nMarker1::Cint
    nMarker2::Cint
    nMarker3::Cint
end
function Base.getproperty(x::Ptr{__JL_Ctag_158}, f::Symbol)
    f === :nMarker1 && return Ptr{Cint}(x + 0)
    f === :nMarker2 && return Ptr{Cint}(x + 4)
    f === :nMarker3 && return Ptr{Cint}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_158, f::Symbol)
    r = Ref{__JL_Ctag_158}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_158}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_158}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_159
    Year::GInt16
    Month::GByte
    Day::GByte
    Hour::GByte
    Minute::GByte
    TZFlag::GByte
    Reserved::GByte
    Second::Cfloat
end
function Base.getproperty(x::Ptr{__JL_Ctag_159}, f::Symbol)
    f === :Year && return Ptr{GInt16}(x + 0)
    f === :Month && return Ptr{GByte}(x + 2)
    f === :Day && return Ptr{GByte}(x + 3)
    f === :Hour && return Ptr{GByte}(x + 4)
    f === :Minute && return Ptr{GByte}(x + 5)
    f === :TZFlag && return Ptr{GByte}(x + 6)
    f === :Reserved && return Ptr{GByte}(x + 7)
    f === :Second && return Ptr{Cfloat}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_159, f::Symbol)
    r = Ref{__JL_Ctag_159}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_159}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_159}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


const CPL_MULTIPROC_PTHREAD = 1

const GDAL_PREFIX = "/workspace/destdir"

const HAVE_ATOLL = 1

const HAVE_CXX11 = 1

const HAVE_DECL_STRTOF = 1

const HAVE_GCC_ATOMIC_BUILTINS = 1

const HAVE_GCC_BSWAP = 1

const HAVE_GCC_WARNING_ZERO_AS_NULL_POINTER_CONSTANT = 1

const HAVE_GETCWD = 1

const HAVE_IEEEFP = 1

const HAVE_LONG_LONG = 1

const HAVE_PTHREAD_MUTEX_ADAPTIVE_NP = 1

const HAVE_PTHREAD_MUTEX_RECURSIVE = 1

const HAVE_PTHREAD_SPINLOCK = 1

const HAVE_SNPRINTF = 1

const HAVE_STD_IS_NAN = 1

const HAVE_STRTOF = 1

const HAVE_STRTOLL = 1

const HAVE_STRTOULL = 1

const HAVE_UINT128_T = 1

const HAVE_UINTPTR_T = 1

const HAVE_VPRINTF = 1

const HAVE_VSNPRINTF = 1

const LT_OBJDIR = ".libs/"

const PACKAGE_BUGREPORT = ""

const PACKAGE_NAME = ""

const PACKAGE_STRING = ""

const PACKAGE_TARNAME = ""

const PACKAGE_URL = ""

const PACKAGE_VERSION = ""

const SIZEOF_INT = 4

const SIZEOF_UNSIGNED_LONG = 4

const SIZEOF_VOIDP = 8

const STDC_HEADERS = 1

const CPLE_None = 0

const CPLE_AppDefined = 1

const CPLE_OutOfMemory = 2

const CPLE_FileIO = 3

const CPLE_OpenFailed = 4

const CPLE_IllegalArg = 5

const CPLE_NotSupported = 6

const CPLE_AssertionFailed = 7

const CPLE_NoWriteAccess = 8

const CPLE_UserInterrupt = 9

const CPLE_ObjectNull = 10

const CPLE_HttpResponse = 11

const CPLE_AWSBucketNotFound = 12

const CPLE_AWSObjectNotFound = 13

const CPLE_AWSAccessDenied = 14

const CPLE_AWSInvalidCredentials = 15

const CPLE_AWSSignatureDoesNotMatch = 16

const CPLE_AWSError = 17

const VALIDATE_POINTER_ERR = CE_Failure

const __MSVCRT_VERSION__ = 0x0700

const GINTBIG_MIN = CPL_STATIC_CAST(GIntBig, 0x80000000) << 32

const GINTBIG_MAX = CPL_STATIC_CAST(GIntBig, 0x7fffffff) << 32 | Cuint(0xffffffff)

const GUINTBIG_MAX = CPL_STATIC_CAST(GUIntBig, Cuint(0xffffffff)) << 32 | Cuint(0xffffffff)

const CPL_HAS_GINT64 = 1

const GINT64_MIN = GINTBIG_MIN

const GINT64_MAX = GINTBIG_MAX

const GUINT64_MAX = GUINTBIG_MAX

const CPL_FRMT_GB_WITHOUT_PREFIX = "I64"

const CPL_IS_LSB = 1

# Skipping MacroDefinition: CPL_NULL_TERMINATED __attribute__ ( ( __sentinel__ ) )

# Skipping MacroDefinition: CPL_WARN_UNUSED_RESULT __attribute__ ( ( warn_unused_result ) )

# Skipping MacroDefinition: CPL_NO_RETURN __attribute__ ( ( noreturn ) )

# Skipping MacroDefinition: CPL_RETURNS_NONNULL __attribute__ ( ( returns_nonnull ) )

# Skipping MacroDefinition: CPL_FALLTHROUGH [ [ clang : : fallthrough ] ] ;

const FALSE = 0

const TRUE = 1

# Skipping MacroDefinition: CPL_NOSANITIZE_UNSIGNED_INT_OVERFLOW __attribute__ ( ( no_sanitize ( "unsigned-integer-overflow" ) ) )

const VSI_L_OFFSET_MAX = GUINTBIG_MAX

const VSI_STAT_EXISTS_FLAG = 0x01

const VSI_STAT_NATURE_FLAG = 0x02

const VSI_STAT_SIZE_FLAG = 0x04

const VSI_STAT_SET_ERROR_FLAG = 0x08

const GDAL_VERSION_MAJOR = 3

const GDAL_VERSION_MINOR = 2

const GDAL_VERSION_REV = 1

const GDAL_VERSION_BUILD = 0

const GDAL_VERSION_NUM = GDAL_COMPUTE_VERSION(GDAL_VERSION_MAJOR, GDAL_VERSION_MINOR, GDAL_VERSION_REV) + GDAL_VERSION_BUILD

const GDAL_RELEASE_DATE = 20201229

const GDAL_RELEASE_NAME = "3.2.1"

const RASTERIO_EXTRA_ARG_CURRENT_VERSION = 1

const GDALMD_AREA_OR_POINT = "AREA_OR_POINT"

const GDALMD_AOP_AREA = "Area"

const GDALMD_AOP_POINT = "Point"

const CPLE_WrongFormat = CPL_STATIC_CAST(CPLErrorNum, 200)

const GDAL_DMD_LONGNAME = "DMD_LONGNAME"

const GDAL_DMD_HELPTOPIC = "DMD_HELPTOPIC"

const GDAL_DMD_MIMETYPE = "DMD_MIMETYPE"

const GDAL_DMD_EXTENSION = "DMD_EXTENSION"

const GDAL_DMD_CONNECTION_PREFIX = "DMD_CONNECTION_PREFIX"

const GDAL_DMD_EXTENSIONS = "DMD_EXTENSIONS"

const GDAL_DMD_CREATIONOPTIONLIST = "DMD_CREATIONOPTIONLIST"

const GDAL_DMD_MULTIDIM_DATASET_CREATIONOPTIONLIST = "DMD_MULTIDIM_DATASET_CREATIONOPTIONLIST"

const GDAL_DMD_MULTIDIM_GROUP_CREATIONOPTIONLIST = "DMD_MULTIDIM_GROUP_CREATIONOPTIONLIST"

const GDAL_DMD_MULTIDIM_DIMENSION_CREATIONOPTIONLIST = "DMD_MULTIDIM_DIMENSION_CREATIONOPTIONLIST"

const GDAL_DMD_MULTIDIM_ARRAY_CREATIONOPTIONLIST = "DMD_MULTIDIM_ARRAY_CREATIONOPTIONLIST"

const GDAL_DMD_MULTIDIM_ATTRIBUTE_CREATIONOPTIONLIST = "DMD_MULTIDIM_ATTRIBUTE_CREATIONOPTIONLIST"

const GDAL_DMD_OPENOPTIONLIST = "DMD_OPENOPTIONLIST"

const GDAL_DMD_CREATIONDATATYPES = "DMD_CREATIONDATATYPES"

const GDAL_DMD_CREATIONFIELDDATATYPES = "DMD_CREATIONFIELDDATATYPES"

const GDAL_DMD_CREATIONFIELDDATASUBTYPES = "DMD_CREATIONFIELDDATASUBTYPES"

const GDAL_DMD_SUBDATASETS = "DMD_SUBDATASETS"

const GDAL_DCAP_OPEN = "DCAP_OPEN"

const GDAL_DCAP_CREATE = "DCAP_CREATE"

const GDAL_DCAP_CREATE_MULTIDIMENSIONAL = "DCAP_CREATE_MULTIDIMENSIONAL"

const GDAL_DCAP_CREATECOPY = "DCAP_CREATECOPY"

const GDAL_DCAP_CREATECOPY_MULTIDIMENSIONAL = "DCAP_CREATECOPY_MULTIDIMENSIONAL"

const GDAL_DCAP_MULTIDIM_RASTER = "DCAP_MULTIDIM_RASTER"

const GDAL_DCAP_SUBCREATECOPY = "DCAP_SUBCREATECOPY"

const GDAL_DCAP_VIRTUALIO = "DCAP_VIRTUALIO"

const GDAL_DCAP_RASTER = "DCAP_RASTER"

const GDAL_DCAP_VECTOR = "DCAP_VECTOR"

const GDAL_DCAP_GNM = "DCAP_GNM"

const GDAL_DCAP_NOTNULL_FIELDS = "DCAP_NOTNULL_FIELDS"

const GDAL_DCAP_UNIQUE_FIELDS = "DCAP_UNIQUE_FIELDS"

const GDAL_DCAP_DEFAULT_FIELDS = "DCAP_DEFAULT_FIELDS"

const GDAL_DCAP_NOTNULL_GEOMFIELDS = "DCAP_NOTNULL_GEOMFIELDS"

const GDAL_DCAP_NONSPATIAL = "DCAP_NONSPATIAL"

const GDAL_DCAP_FEATURE_STYLES = "DCAP_FEATURE_STYLES"

const GDAL_DIM_TYPE_HORIZONTAL_X = "HORIZONTAL_X"

const GDAL_DIM_TYPE_HORIZONTAL_Y = "HORIZONTAL_Y"

const GDAL_DIM_TYPE_VERTICAL = "VERTICAL"

const GDAL_DIM_TYPE_TEMPORAL = "TEMPORAL"

const GDAL_DIM_TYPE_PARAMETRIC = "PARAMETRIC"

const GDAL_OF_READONLY = 0x00

const GDAL_OF_UPDATE = 0x01

const GDAL_OF_ALL = 0x00

const GDAL_OF_RASTER = 0x02

const GDAL_OF_VECTOR = 0x04

const GDAL_OF_GNM = 0x08

const GDAL_OF_MULTIDIM_RASTER = 0x10

const GDAL_OF_KIND_MASK = 0x1e

const GDAL_OF_SHARED = 0x20

const GDAL_OF_VERBOSE_ERROR = 0x40

const GDAL_OF_INTERNAL = 0x80

const GDAL_OF_DEFAULT_BLOCK_ACCESS = 0

const GDAL_OF_ARRAY_BLOCK_ACCESS = 0x0100

const GDAL_OF_HASHSET_BLOCK_ACCESS = 0x0200

const GDAL_OF_RESERVED_1 = 0x0300

const GDAL_OF_BLOCK_ACCESS_MASK = 0x0300

const GDAL_DS_LAYER_CREATIONOPTIONLIST = "DS_LAYER_CREATIONOPTIONLIST"

const GMF_ALL_VALID = 0x01

const GMF_PER_DATASET = 0x02

const GMF_ALPHA = 0x04

const GMF_NODATA = 0x08

const GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED = 0x01

const GDAL_DATA_COVERAGE_STATUS_DATA = 0x02

const GDAL_DATA_COVERAGE_STATUS_EMPTY = 0x04

const GDAL_GTI2_SIGNATURE = "GTI2"

const CPLMutex = Cvoid

const CPLCond = Cvoid

const CPLJoinableThread = Cvoid

const CPL_MUTEX_RECURSIVE = 0

const CPL_MUTEX_ADAPTIVE = 1

const CPL_MUTEX_REGULAR = 2

const CTLS_RLBUFFERINFO = 1

const CTLS_WIN32_COND = 2

const CTLS_CSVTABLEPTR = 3

const CTLS_CSVDEFAULTFILENAME = 4

const CTLS_ERRORCONTEXT = 5

const CTLS_VSICURL_CACHEDCONNECTION = 6

const CTLS_PATHBUF = 7

const CTLS_ABSTRACTARCHIVE_SPLIT = 8

const CTLS_GDALOPEN_ANTIRECURSION = 9

const CTLS_CPLSPRINTF = 10

const CTLS_RESPONSIBLEPID = 11

const CTLS_VERSIONINFO = 12

const CTLS_VERSIONINFO_LICENCE = 13

const CTLS_CONFIGOPTIONS = 14

const CTLS_FINDFILE = 15

const CTLS_VSIERRORCONTEXT = 16

const CTLS_ERRORHANDLERACTIVEDATA = 17

const CTLS_PROJCONTEXTHOLDER = 18

const CTLS_GDALDEFAULTOVR_ANTIREC = 19

const CTLS_HTTPFETCHCALLBACK = 20

const CTLS_MAX = 32

const VRT_NODATA_UNSET = -1234.56

const OGRERR_NONE = 0

const OGRERR_NOT_ENOUGH_DATA = 1

const OGRERR_NOT_ENOUGH_MEMORY = 2

const OGRERR_UNSUPPORTED_GEOMETRY_TYPE = 3

const OGRERR_UNSUPPORTED_OPERATION = 4

const OGRERR_CORRUPT_DATA = 5

const OGRERR_FAILURE = 6

const OGRERR_UNSUPPORTED_SRS = 7

const OGRERR_INVALID_HANDLE = 8

const OGRERR_NON_EXISTING_FEATURE = 9

const wkb25DBit = 0x80000000

const ogrZMarker = 0x21125711

const ALTER_NAME_FLAG = 0x01

const ALTER_TYPE_FLAG = 0x02

const ALTER_WIDTH_PRECISION_FLAG = 0x04

const ALTER_NULLABLE_FLAG = 0x08

const ALTER_DEFAULT_FLAG = 0x10

const ALTER_UNIQUE_FLAG = 0x20

const ALTER_ALL_FLAG = ((((ALTER_NAME_FLAG | ALTER_TYPE_FLAG) | ALTER_WIDTH_PRECISION_FLAG) | ALTER_NULLABLE_FLAG) | ALTER_DEFAULT_FLAG) | ALTER_UNIQUE_FLAG

const OGR_F_VAL_NULL = 0x00000001

const OGR_F_VAL_GEOM_TYPE = 0x00000002

const OGR_F_VAL_WIDTH = 0x00000004

const OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT = 0x00000008

const OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM = 0x00000010

const OGR_F_VAL_ALL = 0x7fffffff & ~OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM

const OGRNullFID = -1

const OGRUnsetMarker = -21121

const OGRNullMarker = -21122

const OLCRandomRead = "RandomRead"

const OLCSequentialWrite = "SequentialWrite"

const OLCRandomWrite = "RandomWrite"

const OLCFastSpatialFilter = "FastSpatialFilter"

const OLCFastFeatureCount = "FastFeatureCount"

const OLCFastGetExtent = "FastGetExtent"

const OLCCreateField = "CreateField"

const OLCDeleteField = "DeleteField"

const OLCReorderFields = "ReorderFields"

const OLCAlterFieldDefn = "AlterFieldDefn"

const OLCTransactions = "Transactions"

const OLCDeleteFeature = "DeleteFeature"

const OLCFastSetNextByIndex = "FastSetNextByIndex"

const OLCStringsAsUTF8 = "StringsAsUTF8"

const OLCIgnoreFields = "IgnoreFields"

const OLCCreateGeomField = "CreateGeomField"

const OLCCurveGeometries = "CurveGeometries"

const OLCMeasuredGeometries = "MeasuredGeometries"

const ODsCCreateLayer = "CreateLayer"

const ODsCDeleteLayer = "DeleteLayer"

const ODsCCreateGeomFieldAfterCreateLayer = "CreateGeomFieldAfterCreateLayer"

const ODsCCurveGeometries = "CurveGeometries"

const ODsCTransactions = "Transactions"

const ODsCEmulatedTransactions = "EmulatedTransactions"

const ODsCMeasuredGeometries = "MeasuredGeometries"

const ODsCRandomLayerRead = "RandomLayerRead"

const ODsCRandomLayerWrite = "RandomLayerWrite "

const ODrCCreateDataSource = "CreateDataSource"

const ODrCDeleteDataSource = "DeleteDataSource"

const OLMD_FID64 = "OLMD_FID64"

const SRS_WKT_WGS84_LAT_LONG = "GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\",SPHEROID[\"WGS 84\",6378137,298.257223563,AUTHORITY[\"EPSG\",\"7030\"]],AUTHORITY[\"EPSG\",\"6326\"]],PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],UNIT[\"degree\",0.0174532925199433,AUTHORITY[\"EPSG\",\"9122\"]],AXIS[\"Latitude\",NORTH],AXIS[\"Longitude\",EAST],AUTHORITY[\"EPSG\",\"4326\"]]"

const SRS_PT_ALBERS_CONIC_EQUAL_AREA = "Albers_Conic_Equal_Area"

const SRS_PT_AZIMUTHAL_EQUIDISTANT = "Azimuthal_Equidistant"

const SRS_PT_CASSINI_SOLDNER = "Cassini_Soldner"

const SRS_PT_CYLINDRICAL_EQUAL_AREA = "Cylindrical_Equal_Area"

const SRS_PT_BONNE = "Bonne"

const SRS_PT_ECKERT_I = "Eckert_I"

const SRS_PT_ECKERT_II = "Eckert_II"

const SRS_PT_ECKERT_III = "Eckert_III"

const SRS_PT_ECKERT_IV = "Eckert_IV"

const SRS_PT_ECKERT_V = "Eckert_V"

const SRS_PT_ECKERT_VI = "Eckert_VI"

const SRS_PT_EQUIDISTANT_CONIC = "Equidistant_Conic"

const SRS_PT_EQUIRECTANGULAR = "Equirectangular"

const SRS_PT_GALL_STEREOGRAPHIC = "Gall_Stereographic"

const SRS_PT_GAUSSSCHREIBERTMERCATOR = "Gauss_Schreiber_Transverse_Mercator"

const SRS_PT_GEOSTATIONARY_SATELLITE = "Geostationary_Satellite"

const SRS_PT_GOODE_HOMOLOSINE = "Goode_Homolosine"

const SRS_PT_IGH = "Interrupted_Goode_Homolosine"

const SRS_PT_GNOMONIC = "Gnomonic"

const SRS_PT_HOTINE_OBLIQUE_MERCATOR_AZIMUTH_CENTER = "Hotine_Oblique_Mercator_Azimuth_Center"

const SRS_PT_HOTINE_OBLIQUE_MERCATOR = "Hotine_Oblique_Mercator"

const SRS_PT_HOTINE_OBLIQUE_MERCATOR_TWO_POINT_NATURAL_ORIGIN = "Hotine_Oblique_Mercator_Two_Point_Natural_Origin"

const SRS_PT_LABORDE_OBLIQUE_MERCATOR = "Laborde_Oblique_Mercator"

const SRS_PT_LAMBERT_CONFORMAL_CONIC_1SP = "Lambert_Conformal_Conic_1SP"

const SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP = "Lambert_Conformal_Conic_2SP"

const SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP_BELGIUM = "Lambert_Conformal_Conic_2SP_Belgium"

const SRS_PT_LAMBERT_AZIMUTHAL_EQUAL_AREA = "Lambert_Azimuthal_Equal_Area"

const SRS_PT_MERCATOR_1SP = "Mercator_1SP"

const SRS_PT_MERCATOR_2SP = "Mercator_2SP"

const SRS_PT_MERCATOR_AUXILIARY_SPHERE = "Mercator_Auxiliary_Sphere"

const SRS_PT_MILLER_CYLINDRICAL = "Miller_Cylindrical"

const SRS_PT_MOLLWEIDE = "Mollweide"

const SRS_PT_NEW_ZEALAND_MAP_GRID = "New_Zealand_Map_Grid"

const SRS_PT_OBLIQUE_STEREOGRAPHIC = "Oblique_Stereographic"

const SRS_PT_ORTHOGRAPHIC = "Orthographic"

const SRS_PT_POLAR_STEREOGRAPHIC = "Polar_Stereographic"

const SRS_PT_POLYCONIC = "Polyconic"

const SRS_PT_ROBINSON = "Robinson"

const SRS_PT_SINUSOIDAL = "Sinusoidal"

const SRS_PT_STEREOGRAPHIC = "Stereographic"

const SRS_PT_SWISS_OBLIQUE_CYLINDRICAL = "Swiss_Oblique_Cylindrical"

const SRS_PT_TRANSVERSE_MERCATOR = "Transverse_Mercator"

const SRS_PT_TRANSVERSE_MERCATOR_SOUTH_ORIENTED = "Transverse_Mercator_South_Orientated"

const SRS_PT_TRANSVERSE_MERCATOR_MI_21 = "Transverse_Mercator_MapInfo_21"

const SRS_PT_TRANSVERSE_MERCATOR_MI_22 = "Transverse_Mercator_MapInfo_22"

const SRS_PT_TRANSVERSE_MERCATOR_MI_23 = "Transverse_Mercator_MapInfo_23"

const SRS_PT_TRANSVERSE_MERCATOR_MI_24 = "Transverse_Mercator_MapInfo_24"

const SRS_PT_TRANSVERSE_MERCATOR_MI_25 = "Transverse_Mercator_MapInfo_25"

const SRS_PT_TUNISIA_MINING_GRID = "Tunisia_Mining_Grid"

const SRS_PT_TWO_POINT_EQUIDISTANT = "Two_Point_Equidistant"

const SRS_PT_VANDERGRINTEN = "VanDerGrinten"

const SRS_PT_KROVAK = "Krovak"

const SRS_PT_IMW_POLYCONIC = "International_Map_of_the_World_Polyconic"

const SRS_PT_WAGNER_I = "Wagner_I"

const SRS_PT_WAGNER_II = "Wagner_II"

const SRS_PT_WAGNER_III = "Wagner_III"

const SRS_PT_WAGNER_IV = "Wagner_IV"

const SRS_PT_WAGNER_V = "Wagner_V"

const SRS_PT_WAGNER_VI = "Wagner_VI"

const SRS_PT_WAGNER_VII = "Wagner_VII"

const SRS_PT_QSC = "Quadrilateralized_Spherical_Cube"

const SRS_PT_AITOFF = "Aitoff"

const SRS_PT_WINKEL_I = "Winkel_I"

const SRS_PT_WINKEL_II = "Winkel_II"

const SRS_PT_WINKEL_TRIPEL = "Winkel_Tripel"

const SRS_PT_CRASTER_PARABOLIC = "Craster_Parabolic"

const SRS_PT_LOXIMUTHAL = "Loximuthal"

const SRS_PT_QUARTIC_AUTHALIC = "Quartic_Authalic"

const SRS_PT_SCH = "Spherical_Cross_Track_Height"

const SRS_PP_CENTRAL_MERIDIAN = "central_meridian"

const SRS_PP_SCALE_FACTOR = "scale_factor"

const SRS_PP_STANDARD_PARALLEL_1 = "standard_parallel_1"

const SRS_PP_STANDARD_PARALLEL_2 = "standard_parallel_2"

const SRS_PP_PSEUDO_STD_PARALLEL_1 = "pseudo_standard_parallel_1"

const SRS_PP_LONGITUDE_OF_CENTER = "longitude_of_center"

const SRS_PP_LATITUDE_OF_CENTER = "latitude_of_center"

const SRS_PP_LONGITUDE_OF_ORIGIN = "longitude_of_origin"

const SRS_PP_LATITUDE_OF_ORIGIN = "latitude_of_origin"

const SRS_PP_FALSE_EASTING = "false_easting"

const SRS_PP_FALSE_NORTHING = "false_northing"

const SRS_PP_AZIMUTH = "azimuth"

const SRS_PP_LONGITUDE_OF_POINT_1 = "longitude_of_point_1"

const SRS_PP_LATITUDE_OF_POINT_1 = "latitude_of_point_1"

const SRS_PP_LONGITUDE_OF_POINT_2 = "longitude_of_point_2"

const SRS_PP_LATITUDE_OF_POINT_2 = "latitude_of_point_2"

const SRS_PP_LONGITUDE_OF_POINT_3 = "longitude_of_point_3"

const SRS_PP_LATITUDE_OF_POINT_3 = "latitude_of_point_3"

const SRS_PP_RECTIFIED_GRID_ANGLE = "rectified_grid_angle"

const SRS_PP_LANDSAT_NUMBER = "landsat_number"

const SRS_PP_PATH_NUMBER = "path_number"

const SRS_PP_PERSPECTIVE_POINT_HEIGHT = "perspective_point_height"

const SRS_PP_SATELLITE_HEIGHT = "satellite_height"

const SRS_PP_FIPSZONE = "fipszone"

const SRS_PP_ZONE = "zone"

const SRS_PP_LATITUDE_OF_1ST_POINT = "Latitude_Of_1st_Point"

const SRS_PP_LONGITUDE_OF_1ST_POINT = "Longitude_Of_1st_Point"

const SRS_PP_LATITUDE_OF_2ND_POINT = "Latitude_Of_2nd_Point"

const SRS_PP_LONGITUDE_OF_2ND_POINT = "Longitude_Of_2nd_Point"

const SRS_PP_PEG_POINT_LATITUDE = "peg_point_latitude"

const SRS_PP_PEG_POINT_LONGITUDE = "peg_point_longitude"

const SRS_PP_PEG_POINT_HEADING = "peg_point_heading"

const SRS_PP_PEG_POINT_HEIGHT = "peg_point_height"

const SRS_UL_METER = "Meter"

const SRS_UL_FOOT = "Foot (International)"

const SRS_UL_FOOT_CONV = "0.3048"

const SRS_UL_US_FOOT = "Foot_US"

const SRS_UL_US_FOOT_CONV = "0.3048006096012192"

const SRS_UL_NAUTICAL_MILE = "Nautical Mile"

const SRS_UL_NAUTICAL_MILE_CONV = "1852.0"

const SRS_UL_LINK = "Link"

const SRS_UL_LINK_CONV = "0.20116684023368047"

const SRS_UL_CHAIN = "Chain"

const SRS_UL_CHAIN_CONV = "20.116684023368047"

const SRS_UL_ROD = "Rod"

const SRS_UL_ROD_CONV = "5.02921005842012"

const SRS_UL_LINK_Clarke = "Link_Clarke"

const SRS_UL_LINK_Clarke_CONV = "0.2011661949"

const SRS_UL_KILOMETER = "Kilometer"

const SRS_UL_KILOMETER_CONV = "1000."

const SRS_UL_DECIMETER = "Decimeter"

const SRS_UL_DECIMETER_CONV = "0.1"

const SRS_UL_CENTIMETER = "Centimeter"

const SRS_UL_CENTIMETER_CONV = "0.01"

const SRS_UL_MILLIMETER = "Millimeter"

const SRS_UL_MILLIMETER_CONV = "0.001"

const SRS_UL_INTL_NAUT_MILE = "Nautical_Mile_International"

const SRS_UL_INTL_NAUT_MILE_CONV = "1852.0"

const SRS_UL_INTL_INCH = "Inch_International"

const SRS_UL_INTL_INCH_CONV = "0.0254"

const SRS_UL_INTL_FOOT = "Foot_International"

const SRS_UL_INTL_FOOT_CONV = "0.3048"

const SRS_UL_INTL_YARD = "Yard_International"

const SRS_UL_INTL_YARD_CONV = "0.9144"

const SRS_UL_INTL_STAT_MILE = "Statute_Mile_International"

const SRS_UL_INTL_STAT_MILE_CONV = "1609.344"

const SRS_UL_INTL_FATHOM = "Fathom_International"

const SRS_UL_INTL_FATHOM_CONV = "1.8288"

const SRS_UL_INTL_CHAIN = "Chain_International"

const SRS_UL_INTL_CHAIN_CONV = "20.1168"

const SRS_UL_INTL_LINK = "Link_International"

const SRS_UL_INTL_LINK_CONV = "0.201168"

const SRS_UL_US_INCH = "Inch_US_Surveyor"

const SRS_UL_US_INCH_CONV = "0.025400050800101603"

const SRS_UL_US_YARD = "Yard_US_Surveyor"

const SRS_UL_US_YARD_CONV = "0.914401828803658"

const SRS_UL_US_CHAIN = "Chain_US_Surveyor"

const SRS_UL_US_CHAIN_CONV = "20.11684023368047"

const SRS_UL_US_STAT_MILE = "Statute_Mile_US_Surveyor"

const SRS_UL_US_STAT_MILE_CONV = "1609.347218694437"

const SRS_UL_INDIAN_YARD = "Yard_Indian"

const SRS_UL_INDIAN_YARD_CONV = "0.91439523"

const SRS_UL_INDIAN_FOOT = "Foot_Indian"

const SRS_UL_INDIAN_FOOT_CONV = "0.30479841"

const SRS_UL_INDIAN_CHAIN = "Chain_Indian"

const SRS_UL_INDIAN_CHAIN_CONV = "20.11669506"

const SRS_UA_DEGREE = "degree"

const SRS_UA_DEGREE_CONV = "0.0174532925199433"

const SRS_UA_RADIAN = "radian"

const SRS_PM_GREENWICH = "Greenwich"

const SRS_DN_NAD27 = "North_American_Datum_1927"

const SRS_DN_NAD83 = "North_American_Datum_1983"

const SRS_DN_WGS72 = "WGS_1972"

const SRS_DN_WGS84 = "WGS_1984"

const SRS_WGS84_SEMIMAJOR = 6.378137e6

const SRS_WGS84_INVFLATTENING = 298.257223563


# begin of epilogue.jl

include("error.jl")

const GDALVERSION = Ref{VersionNumber}()
const GDAL_DATA = Ref{String}()
const PROJ_LIB = Ref{String}()

function __init__()
    # register custom error handler
    funcptr = @cfunction(gdaljl_errorhandler, Ptr{Cvoid}, (CPLErr, Cint, Cstring))
    cplseterrorhandler(funcptr)

    # get GDAL version number
    versionstring = gdalversioninfo("RELEASE_NAME")
    GDALVERSION[] = VersionNumber(versionstring)

    # set GDAL_DATA location, this overrides setting the environment variable
    GDAL_DATA[] = joinpath(GDAL_jll.artifact_dir, "share", "gdal")
    cplsetconfigoption("GDAL_DATA", GDAL_DATA[])

    # set path to CA certificates
    ca_path = @static if VERSION >= v"1.6"
        ca_roots()
    else
        ca_roots_path()
    end
    if ca_path !== nothing
        cplsetconfigoption("CURL_CA_BUNDLE", ca_path)
    end

    # set PROJ_LIB location, this overrides setting the environment variable
    PROJ_LIB[] = joinpath(PROJ_jll.artifact_dir, "share", "proj")
    osrsetprojsearchpaths([PROJ_LIB[]])
end

# end of epilogue.jl


end # module
