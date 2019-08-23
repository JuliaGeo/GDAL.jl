# Julia wrapper for header: cpl_conv.h
# Automatically generated using Clang.jl


"""
    CPLVerifyConfiguration() -> void
"""
function cplverifyconfiguration()
    aftercare(ccall((:CPLVerifyConfiguration, libgdal), Cvoid, ()))
end

"""
    CPLGetConfigOption(const char * pszKey,
                       const char * pszDefault) -> const char *

Get the value of a configuration option.

### Parameters
* **pszKey**: the key of the option to retrieve
* **pszDefault**: a default value if the key does not match existing defined options (may be NULL)

### Returns
the value associated to the key, or the default value if not found
"""
function cplgetconfigoption(arg1, arg2)
    aftercare(ccall((:CPLGetConfigOption, libgdal), Cstring, (Cstring, Cstring), arg1, arg2), false)
end

"""
    CPLGetThreadLocalConfigOption(const char * pszKey,
                                  const char * pszDefault) -> const char *

Same as CPLGetConfigOption() but only with options set with CPLSetThreadLocalConfigOption()
"""
function cplgetthreadlocalconfigoption(arg1, arg2)
    aftercare(ccall((:CPLGetThreadLocalConfigOption, libgdal), Cstring, (Cstring, Cstring), arg1, arg2), false)
end

"""
    CPLSetConfigOption(const char * pszKey,
                       const char * pszValue) -> void

Set a configuration option for GDAL/OGR use.

### Parameters
* **pszKey**: the key of the option
* **pszValue**: the value of the option, or NULL to clear a setting.
"""
function cplsetconfigoption(arg1, arg2)
    aftercare(ccall((:CPLSetConfigOption, libgdal), Cvoid, (Cstring, Cstring), arg1, arg2))
end

"""
    CPLSetThreadLocalConfigOption(const char * pszKey,
                                  const char * pszValue) -> void

Set a configuration option for GDAL/OGR use.

### Parameters
* **pszKey**: the key of the option
* **pszValue**: the value of the option, or NULL to clear a setting.
"""
function cplsetthreadlocalconfigoption(pszKey, pszValue)
    aftercare(ccall((:CPLSetThreadLocalConfigOption, libgdal), Cvoid, (Cstring, Cstring), pszKey, pszValue))
end

"""
    CPLFreeConfig() -> void
"""
function cplfreeconfig()
    aftercare(ccall((:CPLFreeConfig, libgdal), Cvoid, ()))
end

"""
    CPLGetConfigOptions(void) -> char **

Return the list of configuration options as KEY=VALUE pairs.

### Returns
a copy of the list, to be freed with CSLDestroy().
"""
function cplgetconfigoptions()
    aftercare(ccall((:CPLGetConfigOptions, libgdal), Ptr{Cstring}, ()))
end

"""
    CPLSetConfigOptions(const char *const * papszConfigOptions) -> void

Replace the full list of configuration options with the passed list of KEY=VALUE pairs.

### Parameters
* **papszConfigOptions**: the new list (or NULL).
"""
function cplsetconfigoptions(papszConfigOptions)
    aftercare(ccall((:CPLSetConfigOptions, libgdal), Cvoid, (Ptr{Cstring},), papszConfigOptions))
end

"""
    CPLGetThreadLocalConfigOptions(void) -> char **

Return the list of thread local configuration options as KEY=VALUE pairs.

### Returns
a copy of the list, to be freed with CSLDestroy().
"""
function cplgetthreadlocalconfigoptions()
    aftercare(ccall((:CPLGetThreadLocalConfigOptions, libgdal), Ptr{Cstring}, ()))
end

"""
    CPLSetThreadLocalConfigOptions(const char *const * papszConfigOptions) -> void

Replace the full list of thread local configuration options with the passed list of KEY=VALUE pairs.

### Parameters
* **papszConfigOptions**: the new list (or NULL).
"""
function cplsetthreadlocalconfigoptions(papszConfigOptions)
    aftercare(ccall((:CPLSetThreadLocalConfigOptions, libgdal), Cvoid, (Ptr{Cstring},), papszConfigOptions))
end

"""
    CPLMalloc(size_t nSize) -> void *

Safe version of malloc().

### Parameters
* **nSize**: size (in bytes) of memory block to allocate.

### Returns
pointer to newly allocated memory, only NULL if nSize is zero.
"""
function cplmalloc(arg1)
    aftercare(ccall((:CPLMalloc, libgdal), Ptr{Cvoid}, (Csize_t,), arg1))
end

"""
    CPLCalloc(size_t nCount,
              size_t nSize) -> void *

Safe version of calloc().

### Parameters
* **nCount**: number of objects to allocate.
* **nSize**: size (in bytes) of object to allocate.

### Returns
pointer to newly allocated memory, only NULL if nSize * nCount is NULL.
"""
function cplcalloc(arg1, arg2)
    aftercare(ccall((:CPLCalloc, libgdal), Ptr{Cvoid}, (Csize_t, Csize_t), arg1, arg2))
end

"""
    CPLRealloc(void * pData,
               size_t nNewSize) -> void *

Safe version of realloc().

### Parameters
* **pData**: existing memory block which should be copied to the new block.
* **nNewSize**: new size (in bytes) of memory block to allocate.

### Returns
pointer to allocated memory, only NULL if nNewSize is zero.
"""
function cplrealloc(arg1, arg2)
    aftercare(ccall((:CPLRealloc, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t), arg1, arg2))
end

"""
    CPLStrdup(const char * pszString) -> char *

Safe version of strdup() function.

### Parameters
* **pszString**: input string to be duplicated. May be NULL.

### Returns
pointer to a newly allocated copy of the string. Free with CPLFree() or VSIFree().
"""
function cplstrdup(arg1)
    aftercare(ccall((:CPLStrdup, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLStrlwr(char * pszString) -> char *

Convert each characters of the string to lower case.

### Parameters
* **pszString**: input string to be converted.

### Returns
pointer to the same string, pszString.
"""
function cplstrlwr(arg1)
    aftercare(ccall((:CPLStrlwr, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLFGets(char * pszBuffer,
             int nBufferSize,
             FILE * fp) -> char *

Reads in at most one less than nBufferSize characters from the fp stream and stores them into the buffer pointed to by pszBuffer.

### Parameters
* **pszBuffer**: pointer to the targeting character buffer.
* **nBufferSize**: maximum size of the string to read (not including terminating '\0').
* **fp**: file pointer to read from.

### Returns
pointer to the pszBuffer containing a string read from the file or NULL if the error or end of file was encountered.
"""
function cplfgets(arg1, arg2, arg3)
    aftercare(ccall((:CPLFGets, libgdal), Cstring, (Cstring, Cint, Ptr{Cint}), arg1, arg2, arg3), false)
end

"""
    CPLReadLine(FILE * fp) -> const char *

Simplified line reading from text file.

### Parameters
* **fp**: file pointer opened with VSIFOpen().

### Returns
pointer to an internal buffer containing a line of text read from the file or NULL if the end of file was encountered.
"""
function cplreadline(arg1)
    aftercare(ccall((:CPLReadLine, libgdal), Cstring, (Ptr{Cint},), arg1), false)
end

"""
    CPLReadLineL(VSILFILE * fp) -> const char *

Simplified line reading from text file.

### Parameters
* **fp**: file pointer opened with VSIFOpenL().

### Returns
pointer to an internal buffer containing a line of text read from the file or NULL if the end of file was encountered.
"""
function cplreadlinel(arg1)
    aftercare(ccall((:CPLReadLineL, libgdal), Cstring, (Ptr{VSILFILE},), arg1), false)
end

"""
    CPLReadLine2L(VSILFILE * fp,
                  int nMaxCars,
                  CSLConstList papszOptions) -> const char *

Simplified line reading from text file.

### Parameters
* **fp**: file pointer opened with VSIFOpenL().
* **nMaxCars**: maximum number of characters allowed, or -1 for no limit.
* **papszOptions**: NULL-terminated array of options. Unused for now.

### Returns
pointer to an internal buffer containing a line of text read from the file or NULL if the end of file was encountered or the maximum number of characters allowed reached.
"""
function cplreadline2l(arg1, arg2, arg3)
    aftercare(ccall((:CPLReadLine2L, libgdal), Cstring, (Ptr{VSILFILE}, Cint, CSLConstList), arg1, arg2, arg3), false)
end

"""
    CPLReadLine3L(VSILFILE * fp,
                  int nMaxCars,
                  int * pnBufLength,
                  CSLConstList papszOptions) -> const char *

Simplified line reading from text file.

### Parameters
* **fp**: file pointer opened with VSIFOpenL().
* **nMaxCars**: maximum number of characters allowed, or -1 for no limit.
* **papszOptions**: NULL-terminated array of options. Unused for now.
* **pnBufLength**: size of output string (must be non-NULL)

### Returns
pointer to an internal buffer containing a line of text read from the file or NULL if the end of file was encountered or the maximum number of characters allowed reached.
"""
function cplreadline3l(arg1, arg2, arg3, arg4)
    aftercare(ccall((:CPLReadLine3L, libgdal), Cstring, (Ptr{VSILFILE}, Cint, Ptr{Cint}, CSLConstList), arg1, arg2, arg3, arg4), false)
end

"""
    CPLAtof(const char * nptr) -> double

Converts ASCII string to floating point number.

### Parameters
* **nptr**: Pointer to string to convert.

### Returns
Converted value, if any.
"""
function cplatof(arg1)
    aftercare(ccall((:CPLAtof, libgdal), Cdouble, (Cstring,), arg1))
end

"""
    CPLAtofDelim(const char * nptr,
                 char point) -> double

Converts ASCII string to floating point number.

### Parameters
* **nptr**: Pointer to string to convert.
* **point**: Decimal delimiter.

### Returns
Converted value, if any.
"""
function cplatofdelim(arg1, arg2)
    aftercare(ccall((:CPLAtofDelim, libgdal), Cdouble, (Cstring, UInt8), arg1, arg2))
end

"""
    CPLStrtod(const char * nptr,
              char ** endptr) -> double

Converts ASCII string to floating point number.

### Parameters
* **nptr**: Pointer to string to convert.
* **endptr**: If is not NULL, a pointer to the character after the last character used in the conversion is stored in the location referenced by endptr.

### Returns
Converted value, if any.
"""
function cplstrtod(arg1, arg2)
    aftercare(ccall((:CPLStrtod, libgdal), Cdouble, (Cstring, Ptr{Cstring}), arg1, arg2))
end

"""
    CPLStrtodDelim(const char * nptr,
                   char ** endptr,
                   char point) -> double

Converts ASCII string to floating point number using specified delimiter.

### Parameters
* **nptr**: Pointer to string to convert.
* **endptr**: If is not NULL, a pointer to the character after the last character used in the conversion is stored in the location referenced by endptr.
* **point**: Decimal delimiter.

### Returns
Converted value, if any.
"""
function cplstrtoddelim(arg1, arg2, arg3)
    aftercare(ccall((:CPLStrtodDelim, libgdal), Cdouble, (Cstring, Ptr{Cstring}, UInt8), arg1, arg2, arg3))
end

"""
    CPLStrtof(const char * nptr,
              char ** endptr) -> float

Converts ASCII string to floating point number.

### Parameters
* **nptr**: Pointer to string to convert.
* **endptr**: If is not NULL, a pointer to the character after the last character used in the conversion is stored in the location referenced by endptr.

### Returns
Converted value, if any.
"""
function cplstrtof(arg1, arg2)
    aftercare(ccall((:CPLStrtof, libgdal), Cfloat, (Cstring, Ptr{Cstring}), arg1, arg2))
end

"""
    CPLStrtofDelim(const char * nptr,
                   char ** endptr,
                   char point) -> float

Converts ASCII string to floating point number using specified delimiter.

### Parameters
* **nptr**: Pointer to string to convert.
* **endptr**: If is not NULL, a pointer to the character after the last character used in the conversion is stored in the location referenced by endptr.
* **point**: Decimal delimiter.

### Returns
Converted value, if any.
"""
function cplstrtofdelim(arg1, arg2, arg3)
    aftercare(ccall((:CPLStrtofDelim, libgdal), Cfloat, (Cstring, Ptr{Cstring}, UInt8), arg1, arg2, arg3))
end

"""
    CPLAtofM(const char * nptr) -> double

Converts ASCII string to floating point number using any numeric locale.

### Parameters
* **nptr**: The string to convert.

### Returns
Converted value, if any. Zero on failure.
"""
function cplatofm(arg1)
    aftercare(ccall((:CPLAtofM, libgdal), Cdouble, (Cstring,), arg1))
end

"""
    CPLScanString(const char * pszString,
                  int nMaxLength,
                  int bTrimSpaces,
                  int bNormalize) -> char *

Scan up to a maximum number of characters from a given string, allocate a buffer for a new string and fill it with scanned characters.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to read. Less characters will be read if a null character is encountered.
* **bTrimSpaces**: If TRUE, trim ending spaces from the input string. Character considered as empty using isspace(3) function.
* **bNormalize**: If TRUE, replace ':' symbol with the '_'. It is needed if resulting string will be used in CPL dictionaries.

### Returns
Pointer to the resulting string buffer. Caller responsible to free this buffer with CPLFree().
"""
function cplscanstring(arg1, arg2, arg3, arg4)
    aftercare(ccall((:CPLScanString, libgdal), Cstring, (Cstring, Cint, Cint, Cint), arg1, arg2, arg3, arg4), false)
end

"""
    CPLScanDouble(const char * pszString,
                  int nMaxLength) -> double

Extract double from string.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
Double value, converted from its ASCII form.
"""
function cplscandouble(arg1, arg2)
    aftercare(ccall((:CPLScanDouble, libgdal), Cdouble, (Cstring, Cint), arg1, arg2))
end

"""
    CPLScanLong(const char * pszString,
                int nMaxLength) -> long

Scan up to a maximum number of characters from a string and convert the result to a long.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
Long value, converted from its ASCII form.
"""
function cplscanlong(arg1, arg2)
    aftercare(ccall((:CPLScanLong, libgdal), Clong, (Cstring, Cint), arg1, arg2))
end

"""
    CPLScanULong(const char * pszString,
                 int nMaxLength) -> unsigned long

Scan up to a maximum number of characters from a string and convert the result to a unsigned long.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
Unsigned long value, converted from its ASCII form.
"""
function cplscanulong(arg1, arg2)
    aftercare(ccall((:CPLScanULong, libgdal), Culong, (Cstring, Cint), arg1, arg2))
end

"""
    CPLScanUIntBig(const char * pszString,
                   int nMaxLength) -> GUIntBig

Extract big integer from string.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
GUIntBig value, converted from its ASCII form.
"""
function cplscanuintbig(arg1, arg2)
    aftercare(ccall((:CPLScanUIntBig, libgdal), GUIntBig, (Cstring, Cint), arg1, arg2))
end

"""
    CPLAtoGIntBig(const char * pszString) -> GIntBig

Convert a string to a 64 bit signed integer.

### Parameters
* **pszString**: String containing 64 bit signed integer.

### Returns
64 bit signed integer.
"""
function cplatogintbig(pszString)
    aftercare(ccall((:CPLAtoGIntBig, libgdal), GIntBig, (Cstring,), pszString))
end

"""
    CPLAtoGIntBigEx(const char * pszString,
                    int bWarn,
                    int * pbOverflow) -> GIntBig

Convert a string to a 64 bit signed integer.

### Parameters
* **pszString**: String containing 64 bit signed integer.
* **bWarn**: Issue a warning if an overflow occurs during conversion
* **pbOverflow**: Pointer to an integer to store if an overflow occurred, or NULL

### Returns
64 bit signed integer.
"""
function cplatogintbigex(pszString, bWarn, pbOverflow)
    aftercare(ccall((:CPLAtoGIntBigEx, libgdal), GIntBig, (Cstring, Cint, Ptr{Cint}), pszString, bWarn, pbOverflow))
end

"""
    CPLScanPointer(const char * pszString,
                   int nMaxLength) -> void *

Extract pointer from string.

### Parameters
* **pszString**: String containing characters to be scanned. It may be terminated with a null character.
* **nMaxLength**: The maximum number of character to consider as part of the number. Less characters will be considered if a null character is encountered.

### Returns
pointer value, converted from its ASCII form.
"""
function cplscanpointer(arg1, arg2)
    aftercare(ccall((:CPLScanPointer, libgdal), Ptr{Cvoid}, (Cstring, Cint), arg1, arg2))
end

"""
    CPLPrintString(char * pszDest,
                   const char * pszSrc,
                   int nMaxLen) -> int

Copy the string pointed to by pszSrc, NOT including the terminating \0 character, to the array pointed to by pszDest.

### Parameters
* **pszDest**: Pointer to the destination string buffer. Should be large enough to hold the resulting string.
* **pszSrc**: Pointer to the source buffer.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintstring(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintString, libgdal), Cint, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

"""
    CPLPrintStringFill(char * pszDest,
                       const char * pszSrc,
                       int nMaxLen) -> int

Copy the string pointed to by pszSrc, NOT including the terminating \0 character, to the array pointed to by pszDest.

### Parameters
* **pszDest**: Pointer to the destination string buffer. Should be large enough to hold the resulting string.
* **pszSrc**: Pointer to the source buffer.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintstringfill(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintStringFill, libgdal), Cint, (Cstring, Cstring, Cint), arg1, arg2, arg3))
end

"""
    CPLPrintInt32(char * pszBuffer,
                  GInt32 iValue,
                  int nMaxLen) -> int

Print GInt32 value into specified string buffer.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **iValue**: Numerical value to print.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintint32(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintInt32, libgdal), Cint, (Cstring, GInt32, Cint), arg1, arg2, arg3))
end

"""
    CPLPrintUIntBig(char * pszBuffer,
                    GUIntBig iValue,
                    int nMaxLen) -> int

Print GUIntBig value into specified string buffer.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **iValue**: Numerical value to print.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintuintbig(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintUIntBig, libgdal), Cint, (Cstring, GUIntBig, Cint), arg1, arg2, arg3))
end

"""
    CPLPrintDouble(char * pszBuffer,
                   const char * pszFormat,
                   double dfValue,
                   const char * pszLocale) -> int

Print double value into specified string buffer.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **pszFormat**: Format specifier (for example, "%16.9E").
* **dfValue**: Numerical value to print.
* **pszLocale**: Unused.

### Returns
Number of characters printed.
"""
function cplprintdouble(arg1, arg2, arg3, arg4)
    aftercare(ccall((:CPLPrintDouble, libgdal), Cint, (Cstring, Cstring, Cdouble, Cstring), arg1, arg2, arg3, arg4))
end

"""
    CPLPrintTime(char * pszBuffer,
                 int nMaxLen,
                 const char * pszFormat,
                 const struct tm * poBrokenTime,
                 const char * pszLocale) -> int

Print specified time value accordingly to the format options and specified locale name.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.
* **pszFormat**: Controls the output format. Options are the same as for strftime(3) function.
* **poBrokenTime**: Pointer to the broken-down time structure. May be requested with the VSIGMTime() and VSILocalTime() functions.
* **pszLocale**: Pointer to a character string containing locale name ("C", "POSIX", "us_US", "ru_RU.KOI8-R" etc.). If NULL we will not manipulate with locale settings and current process locale will be used for printing. Be aware that it may be unsuitable to use current locale for printing time, because all names will be printed in your native language, as well as time format settings also may be adjusted differently from the C/POSIX defaults. To solve these problems this option was introduced.

### Returns
Number of characters printed.
"""
function cplprinttime(arg1, arg2, arg3, arg4, arg5)
    aftercare(ccall((:CPLPrintTime, libgdal), Cint, (Cstring, Cint, Cstring, Ptr{Ctm}, Cstring), arg1, arg2, arg3, arg4, arg5))
end

"""
    CPLPrintPointer(char * pszBuffer,
                    void * pValue,
                    int nMaxLen) -> int

Print pointer value into specified string buffer.

### Parameters
* **pszBuffer**: Pointer to the destination string buffer. Should be large enough to hold the resulting string. Note, that the string will not be NULL-terminated, so user should do this himself, if needed.
* **pValue**: Pointer to ASCII encode.
* **nMaxLen**: Maximum length of the resulting string. If string length is greater than nMaxLen, it will be truncated.

### Returns
Number of characters printed.
"""
function cplprintpointer(arg1, arg2, arg3)
    aftercare(ccall((:CPLPrintPointer, libgdal), Cint, (Cstring, Ptr{Cvoid}, Cint), arg1, arg2, arg3))
end

"""
    CPLGetSymbol(const char * pszLibrary,
                 const char * pszSymbolName) -> void *

Fetch a function pointer from a shared library / DLL.

### Parameters
* **pszLibrary**: the name of the shared library or DLL containing the function. May contain path to file. If not system supplies search paths will be used.
* **pszSymbolName**: the name of the function to fetch a pointer to.

### Returns
A pointer to the function if found, or NULL if the function isn't found, or the shared library can't be loaded.
"""
function cplgetsymbol(arg1, arg2)
    aftercare(ccall((:CPLGetSymbol, libgdal), Ptr{Cvoid}, (Cstring, Cstring), arg1, arg2))
end

"""
    CPLGetExecPath(char * pszPathBuf,
                   int nMaxLength) -> int

Fetch path of executable.

### Parameters
* **pszPathBuf**: the buffer into which the path is placed.
* **nMaxLength**: the buffer size, MAX_PATH+1 is suggested.

### Returns
FALSE on failure or TRUE on success.
"""
function cplgetexecpath(pszPathBuf, nMaxLength)
    aftercare(ccall((:CPLGetExecPath, libgdal), Cint, (Cstring, Cint), pszPathBuf, nMaxLength))
end

"""
    CPLGetPath(const char * pszFilename) -> const char *

Extract directory path portion of filename.

### Parameters
* **pszFilename**: the filename potentially including a path.

### Returns
Path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call. The returned will generally not contain a trailing path separator.
"""
function cplgetpath(arg1)
    aftercare(ccall((:CPLGetPath, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetDirname(const char * pszFilename) -> const char *

Extract directory path portion of filename.

### Parameters
* **pszFilename**: the filename potentially including a path.

### Returns
Path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call. The returned will generally not contain a trailing path separator.
"""
function cplgetdirname(arg1)
    aftercare(ccall((:CPLGetDirname, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetFilename(const char * pszFullFilename) -> const char *

Extract non-directory portion of filename.

### Parameters
* **pszFullFilename**: the full filename potentially including a path.

### Returns
just the non-directory portion of the path (points back into original string).
"""
function cplgetfilename(arg1)
    aftercare(ccall((:CPLGetFilename, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetBasename(const char * pszFullFilename) -> const char *

Extract basename (non-directory, non-extension) portion of filename.

### Parameters
* **pszFullFilename**: the full filename potentially including a path.

### Returns
just the non-directory, non-extension portion of the path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call.
"""
function cplgetbasename(arg1)
    aftercare(ccall((:CPLGetBasename, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetExtension(const char * pszFullFilename) -> const char *

Extract filename extension from full filename.

### Parameters
* **pszFullFilename**: the full filename potentially including a path.

### Returns
just the extension portion of the path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call.
"""
function cplgetextension(arg1)
    aftercare(ccall((:CPLGetExtension, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLGetCurrentDir() -> char *

Get the current working directory name.

### Returns
a pointer to buffer, containing current working directory path or NULL in case of error. User is responsible to free that buffer after usage with CPLFree() function. If HAVE_GETCWD macro is not defined, the function returns NULL.
"""
function cplgetcurrentdir()
    aftercare(ccall((:CPLGetCurrentDir, libgdal), Cstring, ()), false)
end

"""
    CPLFormFilename(const char * pszPath,
                    const char * pszBasename,
                    const char * pszExtension) -> const char *

Build a full file path from a passed path, file basename and extension.

### Parameters
* **pszPath**: directory path to the directory containing the file. This may be relative or absolute, and may have a trailing path separator or not. May be NULL.
* **pszBasename**: file basename. May optionally have path and/or extension. Must NOT be NULL.
* **pszExtension**: file extension, optionally including the period. May be NULL.

### Returns
a fully formed filename in an internal static string. Do not modify or free the returned string. The string may be destroyed by the next CPL call.
"""
function cplformfilename(pszPath, pszBasename, pszExtension)
    aftercare(ccall((:CPLFormFilename, libgdal), Cstring, (Cstring, Cstring, Cstring), pszPath, pszBasename, pszExtension), false)
end

"""
    CPLFormCIFilename(const char * pszPath,
                      const char * pszBasename,
                      const char * pszExtension) -> const char *

Case insensitive file searching, returning full path.

### Parameters
* **pszPath**: directory path to the directory containing the file. This may be relative or absolute, and may have a trailing path separator or not. May be NULL.
* **pszBasename**: file basename. May optionally have path and/or extension. May not be NULL.
* **pszExtension**: file extension, optionally including the period. May be NULL.

### Returns
a fully formed filename in an internal static string. Do not modify or free the returned string. The string may be destroyed by the next CPL call.
"""
function cplformcifilename(pszPath, pszBasename, pszExtension)
    aftercare(ccall((:CPLFormCIFilename, libgdal), Cstring, (Cstring, Cstring, Cstring), pszPath, pszBasename, pszExtension), false)
end

"""
    CPLResetExtension(const char * pszPath,
                      const char * pszExt) -> const char *

Replace the extension with the provided one.

### Parameters
* **pszPath**: the input path, this string is not altered.
* **pszExt**: the new extension to apply to the given path.

### Returns
an altered filename with the new extension. Do not modify or free the returned string. The string may be destroyed by the next CPL call.
"""
function cplresetextension(arg1, arg2)
    aftercare(ccall((:CPLResetExtension, libgdal), Cstring, (Cstring, Cstring), arg1, arg2), false)
end

"""
    CPLProjectRelativeFilename(const char * pszProjectDir,
                               const char * pszSecondaryFilename) -> const char *

Find a file relative to a project file.

### Parameters
* **pszProjectDir**: the directory relative to which the secondary files path should be interpreted.
* **pszSecondaryFilename**: the filename (potentially with path) that is to be interpreted relative to the project directory.

### Returns
a composed path to the secondary file. The returned string is internal and should not be altered, freed, or depending on past the next CPL call.
"""
function cplprojectrelativefilename(pszProjectDir, pszSecondaryFilename)
    aftercare(ccall((:CPLProjectRelativeFilename, libgdal), Cstring, (Cstring, Cstring), pszProjectDir, pszSecondaryFilename), false)
end

"""
    CPLIsFilenameRelative(const char * pszFilename) -> int

Is filename relative or absolute?

### Parameters
* **pszFilename**: the filename with path to test.

### Returns
TRUE if the filename is relative or FALSE if it is absolute.
"""
function cplisfilenamerelative(pszFilename)
    aftercare(ccall((:CPLIsFilenameRelative, libgdal), Cint, (Cstring,), pszFilename))
end

"""
    CPLExtractRelativePath(const char * pszBaseDir,
                           const char * pszTarget,
                           int * pbGotRelative) -> const char *

Get relative path from directory to target file.

### Parameters
* **pszBaseDir**: the name of the directory relative to which the path should be computed. pszBaseDir may be NULL in which case the original target is returned without relativizing.
* **pszTarget**: the filename to be changed to be relative to pszBaseDir.
* **pbGotRelative**: Pointer to location in which a flag is placed indicating that the returned path is relative to the basename (TRUE) or not (FALSE). This pointer may be NULL if flag is not desired.

### Returns
an adjusted path or the original if it could not be made relative to the pszBaseFile's path.
"""
function cplextractrelativepath(arg1, arg2, arg3)
    aftercare(ccall((:CPLExtractRelativePath, libgdal), Cstring, (Cstring, Cstring, Ptr{Cint}), arg1, arg2, arg3), false)
end

"""
    CPLCleanTrailingSlash(const char * pszPath) -> const char *

Remove trailing forward/backward slash from the path for UNIX/Windows resp.

### Parameters
* **pszPath**: the path to be cleaned up

### Returns
Path in an internal string which must not be freed. The string may be destroyed by the next CPL filename handling call.
"""
function cplcleantrailingslash(arg1)
    aftercare(ccall((:CPLCleanTrailingSlash, libgdal), Cstring, (Cstring,), arg1), false)
end

"""
    CPLCorrespondingPaths(const char * pszOldFilename,
                          const char * pszNewFilename,
                          char ** papszFileList) -> char **

Identify corresponding paths.

### Parameters
* **pszOldFilename**: path to old prototype file.
* **pszNewFilename**: path to new prototype file.
* **papszFileList**: list of other files associated with pszOldFilename to rename similarly.

### Returns
a list of files corresponding to papszFileList but renamed to correspond to pszNewFilename.
"""
function cplcorrespondingpaths(pszOldFilename, pszNewFilename, papszFileList)
    aftercare(ccall((:CPLCorrespondingPaths, libgdal), Ptr{Cstring}, (Cstring, Cstring, Ptr{Cstring}), pszOldFilename, pszNewFilename, papszFileList))
end

"""
    CPLCheckForFile(char * pszFilename,
                    char ** papszSiblingFiles) -> int

Check for file existence.

### Parameters
* **pszFilename**: name of file to check for - filename case updated in some cases.
* **papszSiblingFiles**: a list of files in the same directory as pszFilename if available, or NULL. This list should have no path components.

### Returns
TRUE if a match is found, or FALSE if not.
"""
function cplcheckforfile(pszFilename, papszSiblingList)
    aftercare(ccall((:CPLCheckForFile, libgdal), Cint, (Cstring, Ptr{Cstring}), pszFilename, papszSiblingList))
end

"""
    CPLGenerateTempFilename(const char * pszStem) -> const char *

Generate temporary file name.

### Parameters
* **pszStem**: if non-NULL this will be part of the filename.

### Returns
a filename which is valid till the next CPL call in this thread.
"""
function cplgeneratetempfilename(pszStem)
    aftercare(ccall((:CPLGenerateTempFilename, libgdal), Cstring, (Cstring,), pszStem), false)
end

"""
    CPLExpandTilde(const char * pszFilename) -> const char *

Expands ~/ at start of filename.

### Parameters
* **pszFilename**: filename potentially starting with ~/

### Returns
an expanded filename.
"""
function cplexpandtilde(pszFilename)
    aftercare(ccall((:CPLExpandTilde, libgdal), Cstring, (Cstring,), pszFilename), false)
end

"""
    CPLGetHomeDir() -> const char *

Return the path to the home directory.

### Returns
the home directory, or NULL.
"""
function cplgethomedir()
    aftercare(ccall((:CPLGetHomeDir, libgdal), Cstring, ()), false)
end

"""
    CPLFindFile(const char * pszClass,
                const char * pszBasename) -> const char *

CPLFindFile.
"""
function cplfindfile(pszClass, pszBasename)
    aftercare(ccall((:CPLFindFile, libgdal), Cstring, (Cstring, Cstring), pszClass, pszBasename), false)
end

"""
    CPLDefaultFindFile(const char *,
                       const char * pszBasename) -> const char *

CPLDefaultFindFile.
"""
function cpldefaultfindfile(pszClass, pszBasename)
    aftercare(ccall((:CPLDefaultFindFile, libgdal), Cstring, (Cstring, Cstring), pszClass, pszBasename), false)
end

"""
    CPLPushFileFinder(CPLFileFinder pfnFinder) -> void

CPLPushFileFinder.
"""
function cplpushfilefinder(pfnFinder)
    aftercare(ccall((:CPLPushFileFinder, libgdal), Cvoid, (CPLFileFinder,), pfnFinder))
end

"""
    CPLPopFileFinder() -> CPLFileFinder

CPLPopFileFinder.
"""
function cplpopfilefinder()
    aftercare(ccall((:CPLPopFileFinder, libgdal), CPLFileFinder, ()))
end

"""
    CPLPushFinderLocation(const char * pszLocation) -> void

CPLPushFinderLocation.
"""
function cplpushfinderlocation(arg1)
    aftercare(ccall((:CPLPushFinderLocation, libgdal), Cvoid, (Cstring,), arg1))
end

"""
    CPLPopFinderLocation() -> void

CPLPopFinderLocation.
"""
function cplpopfinderlocation()
    aftercare(ccall((:CPLPopFinderLocation, libgdal), Cvoid, ()))
end

"""
    CPLFinderClean() -> void

CPLFinderClean.
"""
function cplfinderclean()
    aftercare(ccall((:CPLFinderClean, libgdal), Cvoid, ()))
end

"""
    CPLStat(const char * pszPath,
            VSIStatBuf * psStatBuf) -> int

Same as VSIStat() except it works on "C:" as if it were "C:\".
"""
function cplstat(arg1, arg2)
    aftercare(ccall((:CPLStat, libgdal), Cint, (Cstring, Ptr{VSIStatBuf}), arg1, arg2))
end

"""
    CPLOpenShared(const char * pszFilename,
                  const char * pszAccess,
                  int bLargeIn) -> FILE *

Open a shared file handle.

### Parameters
* **pszFilename**: the name of the file to open.
* **pszAccess**: the normal fopen()/VSIFOpen() style access string.
* **bLargeIn**: If TRUE VSIFOpenL() (for large files) will be used instead of VSIFOpen().

### Returns
a file handle or NULL if opening fails.
"""
function cplopenshared()
    aftercare(ccall((:CPLOpenShared, libgdal), Ptr{Cint}, ()))
end

"""
    CPLCloseShared(FILE * fp) -> void

Close shared file.

### Parameters
* **fp**: file handle from CPLOpenShared() to deaccess.
"""
function cplcloseshared(arg1)
    aftercare(ccall((:CPLCloseShared, libgdal), Cvoid, (Ptr{Cint},), arg1))
end

"""
    CPLGetSharedList(int * pnCount) -> CPLSharedFileInfo *

Fetch list of open shared files.

### Parameters
* **pnCount**: place to put the count of entries.

### Returns
the pointer to the first in the array of shared file info structures.
"""
function cplgetsharedlist(arg1)
    aftercare(ccall((:CPLGetSharedList, libgdal), Ptr{CPLSharedFileInfo}, (Ptr{Cint},), arg1))
end

"""
    CPLDumpSharedList(FILE * fp) -> void

Report open shared files.

### Parameters
* **fp**: File handle to write to.
"""
function cpldumpsharedlist(arg1)
    aftercare(ccall((:CPLDumpSharedList, libgdal), Cvoid, (Ptr{Cint},), arg1))
end

"""
    CPLCleanupSharedFileMutex() -> void
"""
function cplcleanupsharedfilemutex()
    aftercare(ccall((:CPLCleanupSharedFileMutex, libgdal), Cvoid, ()))
end

"""
    CPLDMSToDec(const char * is) -> double

CPLDMSToDec.
"""
function cpldmstodec(is)
    aftercare(ccall((:CPLDMSToDec, libgdal), Cdouble, (Cstring,), is))
end

"""
    CPLDecToDMS(double dfAngle,
                const char * pszAxis,
                int nPrecision) -> const char *

Translate a decimal degrees value to a DMS string with hemisphere.
"""
function cpldectodms(dfAngle, pszAxis, nPrecision)
    aftercare(ccall((:CPLDecToDMS, libgdal), Cstring, (Cdouble, Cstring, Cint), dfAngle, pszAxis, nPrecision), false)
end

"""
    CPLPackedDMSToDec(double dfPacked) -> double

Convert a packed DMS value (DDDMMMSSS.SS) into decimal degrees.

### Parameters
* **dfPacked**: Angle in packed DMS format.

### Returns
Angle in decimal degrees.
"""
function cplpackeddmstodec(arg1)
    aftercare(ccall((:CPLPackedDMSToDec, libgdal), Cdouble, (Cdouble,), arg1))
end

"""
    CPLDecToPackedDMS(double dfDec) -> double

Convert decimal degrees into packed DMS value (DDDMMMSSS.SS).

### Parameters
* **dfDec**: Angle in decimal degrees.

### Returns
Angle in packed DMS format.
"""
function cpldectopackeddms(dfDec)
    aftercare(ccall((:CPLDecToPackedDMS, libgdal), Cdouble, (Cdouble,), dfDec))
end

"""
    CPLStringToComplex(const char * pszString,
                       double * pdfReal,
                       double * pdfImag) -> void

Fetch the real and imaginary part of a serialized complex number.
"""
function cplstringtocomplex(pszString, pdfReal, pdfImag)
    aftercare(ccall((:CPLStringToComplex, libgdal), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}), pszString, pdfReal, pdfImag))
end

"""
    CPLUnlinkTree(const char * pszPath) -> int

Recursively unlink a directory.

### Returns
0 on successful completion, -1 if function fails.
"""
function cplunlinktree(arg1)
    aftercare(ccall((:CPLUnlinkTree, libgdal), Cint, (Cstring,), arg1))
end

"""
    CPLCopyFile(const char * pszNewPath,
                const char * pszOldPath) -> int

Copy a file.
"""
function cplcopyfile(pszNewPath, pszOldPath)
    aftercare(ccall((:CPLCopyFile, libgdal), Cint, (Cstring, Cstring), pszNewPath, pszOldPath))
end

"""
    CPLCopyTree(const char * pszNewPath,
                const char * pszOldPath) -> int

Recursively copy a tree.
"""
function cplcopytree(pszNewPath, pszOldPath)
    aftercare(ccall((:CPLCopyTree, libgdal), Cint, (Cstring, Cstring), pszNewPath, pszOldPath))
end

"""
    CPLMoveFile(const char * pszNewPath,
                const char * pszOldPath) -> int

Move a file.
"""
function cplmovefile(pszNewPath, pszOldPath)
    aftercare(ccall((:CPLMoveFile, libgdal), Cint, (Cstring, Cstring), pszNewPath, pszOldPath))
end

"""
    CPLSymlink(const char * pszOldPath,
               const char * pszNewPath,
               CSLConstList) -> int

Create a symbolic link.
"""
function cplsymlink(pszOldPath, pszNewPath, papszOptions)
    aftercare(ccall((:CPLSymlink, libgdal), Cint, (Cstring, Cstring, CSLConstList), pszOldPath, pszNewPath, papszOptions))
end

"""
    CPLCreateZip(const char *,
                 char **) -> void *
"""
function cplcreatezip(pszZipFilename, papszOptions)
    aftercare(ccall((:CPLCreateZip, libgdal), Ptr{Cvoid}, (Cstring, Ptr{Cstring}), pszZipFilename, papszOptions))
end

"""
    CPLCreateFileInZip(void *,
                       const char *,
                       char **) -> CPLErr
"""
function cplcreatefileinzip(hZip, pszFilename, papszOptions)
    aftercare(ccall((:CPLCreateFileInZip, libgdal), CPLErr, (Ptr{Cvoid}, Cstring, Ptr{Cstring}), hZip, pszFilename, papszOptions))
end

"""
    CPLWriteFileInZip(void *,
                      const void *,
                      int) -> CPLErr
"""
function cplwritefileinzip(hZip, pBuffer, nBufferSize)
    aftercare(ccall((:CPLWriteFileInZip, libgdal), CPLErr, (Ptr{Cvoid}, Ptr{Cvoid}, Cint), hZip, pBuffer, nBufferSize))
end

"""
    CPLCloseFileInZip(void *) -> CPLErr
"""
function cplclosefileinzip(hZip)
    aftercare(ccall((:CPLCloseFileInZip, libgdal), CPLErr, (Ptr{Cvoid},), hZip))
end

"""
    CPLCloseZip(void *) -> CPLErr
"""
function cplclosezip(hZip)
    aftercare(ccall((:CPLCloseZip, libgdal), CPLErr, (Ptr{Cvoid},), hZip))
end

"""
    CPLZLibDeflate(const void *,
                   size_t,
                   int,
                   void *,
                   size_t,
                   size_t * pnOutBytes) -> void *
"""
function cplzlibdeflate(ptr, nBytes, nLevel, outptr, nOutAvailableBytes, pnOutBytes)
    aftercare(ccall((:CPLZLibDeflate, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Cint, Ptr{Cvoid}, Csize_t, Ptr{Csize_t}), ptr, nBytes, nLevel, outptr, nOutAvailableBytes, pnOutBytes))
end

"""
    CPLZLibInflate(const void *,
                   size_t,
                   void *,
                   size_t,
                   size_t * pnOutBytes) -> void *
"""
function cplzlibinflate(ptr, nBytes, outptr, nOutAvailableBytes, pnOutBytes)
    aftercare(ccall((:CPLZLibInflate, libgdal), Ptr{Cvoid}, (Ptr{Cvoid}, Csize_t, Ptr{Cvoid}, Csize_t, Ptr{Csize_t}), ptr, nBytes, outptr, nOutAvailableBytes, pnOutBytes))
end

"""
    CPLValidateXML(const char * pszXMLFilename,
                   const char * pszXSDFilename,
                   CSLConstList papszOptions) -> int

Validate a XML file against a XML schema.

### Parameters
* **pszXMLFilename**: the filename of the XML file to validate.
* **pszXSDFilename**: the filename of the XSD schema.
* **papszOptions**: unused for now. Set to NULL.

### Returns
TRUE if the XML file validates against the XML schema.
"""
function cplvalidatexml(pszXMLFilename, pszXSDFilename, papszOptions)
    aftercare(ccall((:CPLValidateXML, libgdal), Cint, (Cstring, Cstring, CSLConstList), pszXMLFilename, pszXSDFilename, papszOptions))
end

"""
    CPLsetlocale(int category,
                 const char * locale) -> char *

Prevents parallel executions of setlocale().

### Parameters
* **category**: See your compiler's documentation on setlocale.
* **locale**: See your compiler's documentation on setlocale.

### Returns
See your compiler's documentation on setlocale.
"""
function cplsetlocale(category, locale)
    aftercare(ccall((:CPLsetlocale, libgdal), Cstring, (Cint, Cstring), category, locale), false)
end

"""
    CPLCleanupSetlocaleMutex(void) -> void
"""
function cplcleanupsetlocalemutex()
    aftercare(ccall((:CPLCleanupSetlocaleMutex, libgdal), Cvoid, ()))
end

"""
    CPLIsPowerOfTwo(unsigned int i) -> int

### Parameters
* **i**: - tested number

### Returns
TRUE if i is power of two otherwise return FALSE
"""
function cplispoweroftwo(i)
    aftercare(ccall((:CPLIsPowerOfTwo, libgdal), Cint, (UInt32,), i))
end
