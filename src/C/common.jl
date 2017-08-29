# Automatically generated using Clang.jl wrap_c, version 0.0.0


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

# const CPLAssert = expr

# begin enum ANONYMOUS_1
const ANONYMOUS_1 = UInt32
const CE_None = (UInt32)(0)
const CE_Debug = (UInt32)(1)
const CE_Warning = (UInt32)(2)
const CE_Failure = (UInt32)(3)
const CE_Fatal = (UInt32)(4)
# end enum ANONYMOUS_1

const VALIDATE_POINTER_ERR = CE_Failure

# Skipping MacroDefinition: VALIDATE_POINTER0 ( ptr , func ) do { if ( NULL == ptr ) { CPLErr const ret = VALIDATE_POINTER_ERR ; CPLError ( ret , CPLE_ObjectNull , "Pointer \'%s\' is NULL in \'%s\'.\n" , # ptr , ( func ) ) ; return ; } } while ( 0 )
# Skipping MacroDefinition: VALIDATE_POINTER1 ( ptr , func , rc ) do { if ( NULL == ptr ) { CPLErr const ret = VALIDATE_POINTER_ERR ; CPLError ( ret , CPLE_ObjectNull , "Pointer \'%s\' is NULL in \'%s\'.\n" , # ptr , ( func ) ) ; return ( rc ) ; } } while ( 0 )

const CPLErr = Void
const CPLErrorNum = Cint
const CPLErrorHandler = Ptr{Void}

# begin enum ANONYMOUS_2
const ANONYMOUS_2 = UInt32
const CXT_Element = (UInt32)(0)
const CXT_Text = (UInt32)(1)
const CXT_Attribute = (UInt32)(2)
const CXT_Comment = (UInt32)(3)
const CXT_Literal = (UInt32)(4)
# end enum ANONYMOUS_2

const CPLXMLNodeType = Void

mutable struct CPLXMLNode
    eType::CPLXMLNodeType
    pszValue::Cstring
    psNext::Ptr{Void}
    psChild::Ptr{Void}
end

# Skipping MacroDefinition: GINTBIG_MIN ( ( GIntBig ) ( 0x80000000 ) << 32 )
# Skipping MacroDefinition: GINTBIG_MAX ( ( ( GIntBig ) ( 0x7FFFFFFF ) << 32 ) | 0xFFFFFFFFU )
# Skipping MacroDefinition: GUINTBIG_MAX ( ( ( GUIntBig ) ( 0xFFFFFFFFU ) << 32 ) | 0xFFFFFFFFU )

const CPL_HAS_GINT64 = 1

# const GINT64_MIN = GINTBIG_MIN
# const GINT64_MAX = GINTBIG_MAX
# const GUINT64_MAX = GUINTBIG_MAX
const CPL_FRMT_GB_WITHOUT_PREFIX = "ll"

# Skipping MacroDefinition: CPL_FRMT_GIB "%" CPL_FRMT_GB_WITHOUT_PREFIX "d"
# Skipping MacroDefinition: CPL_FRMT_GUIB "%" CPL_FRMT_GB_WITHOUT_PREFIX "u"
# Skipping MacroDefinition: GUINTBIG_TO_DOUBLE ( x ) ( double ) ( x )
# Skipping MacroDefinition: CPL_INT64_FITS_ON_INT32 ( x ) ( ( ( GIntBig ) ( int ) ( x ) ) == ( x ) )
# Skipping MacroDefinition: MIN ( a , b ) ( ( ( a ) < ( b ) ) ? ( a ) : ( b ) )
# Skipping MacroDefinition: MAX ( a , b ) ( ( ( a ) > ( b ) ) ? ( a ) : ( b ) )
# Skipping MacroDefinition: ABS ( x ) ( ( ( x ) < 0 ) ? ( - 1 * ( x ) ) : ( x ) )
# Skipping MacroDefinition: CPLIsEqual ( x , y ) ( fabs ( ( x ) - ( y ) ) < 0.0000000000001 )
# Skipping MacroDefinition: STRCASECMP ( a , b ) ( strcasecmp ( a , b ) )
# Skipping MacroDefinition: STRNCASECMP ( a , b , n ) ( strncasecmp ( a , b , n ) )
# Skipping MacroDefinition: EQUALN ( a , b , n ) ( STRNCASECMP ( a , b , n ) == 0 )
# Skipping MacroDefinition: EQUAL ( a , b ) ( STRCASECMP ( a , b ) == 0 )
# Skipping MacroDefinition: STARTS_WITH ( a , b ) ( strncmp ( a , b , strlen ( b ) ) == 0 )
# Skipping MacroDefinition: STARTS_WITH_CI ( a , b ) EQUALN ( a , b , strlen ( b ) )
# Skipping MacroDefinition: CPLIsNan ( x ) isnan ( x )
# Skipping MacroDefinition: CPLIsInf ( x ) isinf ( x )
# Skipping MacroDefinition: CPLIsFinite ( x ) ( ! isnan ( x ) && ! isinf ( x ) )

const CPL_IS_LSB = 1

# const CPL_STATIC_ASSERT_IF_AVAILABLE = x
# Skipping MacroDefinition: CPL_SWAP16 ( x ) ( ( GUInt16 ) ( ( ( GUInt16 ) ( x ) << 8 ) | ( ( GUInt16 ) ( x ) >> 8 ) ) )
# Skipping MacroDefinition: CPL_SWAP32 ( x ) ( ( GUInt32 ) ( __builtin_bswap32 ( ( GUInt32 ) ( x ) ) ) )
# Skipping MacroDefinition: CPL_SWAP64 ( x ) ( ( GUInt64 ) ( __builtin_bswap64 ( ( GUInt64 ) ( x ) ) ) )
# Skipping MacroDefinition: CPL_SWAP16PTR ( x ) \
#{ GByte byTemp , * _pabyDataT = ( GByte * ) ( x ) ; CPL_STATIC_ASSERT_IF_AVAILABLE ( sizeof ( * ( x ) ) == 1 || sizeof ( * ( x ) ) == 2 ) ; byTemp = _pabyDataT [ 0 ] ; _pabyDataT [ 0 ] = _pabyDataT [ 1 ] ; _pabyDataT [ 1 ] = byTemp ; \
#}
# Skipping MacroDefinition: CPL_SWAP32PTR ( x ) \
#{ GUInt32 _n32 ; void * _lx = x ; memcpy ( & _n32 , _lx , 4 ) ; CPL_STATIC_ASSERT_IF_AVAILABLE ( sizeof ( * ( x ) ) == 1 || sizeof ( * ( x ) ) == 4 ) ; _n32 = CPL_SWAP32 ( _n32 ) ; memcpy ( _lx , & _n32 , 4 ) ; \
#}
# Skipping MacroDefinition: CPL_SWAP64PTR ( x ) \
#{ GUInt64 _n64 ; void * _lx = x ; memcpy ( & _n64 , _lx , 8 ) ; CPL_STATIC_ASSERT_IF_AVAILABLE ( sizeof ( * ( x ) ) == 1 || sizeof ( * ( x ) ) == 8 ) ; _n64 = CPL_SWAP64 ( _n64 ) ; memcpy ( _lx , & _n64 , 8 ) ; \
#}
# Skipping MacroDefinition: CPL_SWAPDOUBLE ( p ) CPL_SWAP64PTR ( p )
# Skipping MacroDefinition: CPL_LSBWORD16 ( x ) ( x )
# Skipping MacroDefinition: CPL_MSBWORD16 ( x ) CPL_SWAP16 ( x )
# Skipping MacroDefinition: CPL_LSBWORD32 ( x ) ( x )
# Skipping MacroDefinition: CPL_MSBWORD32 ( x ) CPL_SWAP32 ( x )
# Skipping MacroDefinition: CPL_LSBPTR16 ( x ) CPL_STATIC_ASSERT_IF_AVAILABLE ( sizeof ( * ( x ) ) == 1 || sizeof ( * ( x ) ) == 2 )
# Skipping MacroDefinition: CPL_MSBPTR16 ( x ) CPL_SWAP16PTR ( x )
# Skipping MacroDefinition: CPL_LSBPTR32 ( x ) CPL_STATIC_ASSERT_IF_AVAILABLE ( sizeof ( * ( x ) ) == 1 || sizeof ( * ( x ) ) == 4 )
# Skipping MacroDefinition: CPL_MSBPTR32 ( x ) CPL_SWAP32PTR ( x )
# Skipping MacroDefinition: CPL_LSBPTR64 ( x ) CPL_STATIC_ASSERT_IF_AVAILABLE ( sizeof ( * ( x ) ) == 1 || sizeof ( * ( x ) ) == 8 )
# Skipping MacroDefinition: CPL_MSBPTR64 ( x ) CPL_SWAP64PTR ( x )
# Skipping MacroDefinition: CPL_LSBINT16PTR ( x ) ( ( * ( GByte * ) ( x ) ) | ( * ( ( ( GByte * ) ( x ) ) + 1 ) << 8 ) )
# Skipping MacroDefinition: CPL_LSBINT32PTR ( x ) ( ( * ( GByte * ) ( x ) ) | ( * ( ( ( GByte * ) ( x ) ) + 1 ) << 8 ) | ( * ( ( ( GByte * ) ( x ) ) + 2 ) << 16 ) | ( * ( ( ( GByte * ) ( x ) ) + 3 ) << 24 ) )
# Skipping MacroDefinition: CPL_LSBSINT16PTR ( x ) ( ( GInt16 ) CPL_LSBINT16PTR ( x ) )
# Skipping MacroDefinition: CPL_LSBUINT16PTR ( x ) ( ( GUInt16 ) CPL_LSBINT16PTR ( x ) )
# Skipping MacroDefinition: CPL_LSBSINT32PTR ( x ) ( ( GInt32 ) CPL_LSBINT32PTR ( x ) )
# Skipping MacroDefinition: CPL_LSBUINT32PTR ( x ) ( ( GUInt32 ) CPL_LSBINT32PTR ( x ) )
# Skipping MacroDefinition: UNREFERENCED_PARAM ( param ) ( ( void ) param )
# Skipping MacroDefinition: CPL_CVSID ( string ) static const char cpl_cvsid [ ] __attribute__ ( ( used ) ) = string ;
# Skipping MacroDefinition: CPL_NULL_TERMINATED __attribute__ ( ( __sentinel__ ) )
# Skipping MacroDefinition: CPL_PRINT_FUNC_FORMAT ( format_idx , arg_idx ) __attribute__ ( ( __format__ ( __printf__ , format_idx , arg_idx ) ) )
# Skipping MacroDefinition: CPL_SCAN_FUNC_FORMAT ( format_idx , arg_idx ) __attribute__ ( ( __format__ ( __scanf__ , format_idx , arg_idx ) ) )
# Skipping MacroDefinition: CPL_FORMAT_STRING ( arg ) arg
# Skipping MacroDefinition: CPL_SCANF_FORMAT_STRING ( arg ) arg
# Skipping MacroDefinition: CPL_WARN_UNUSED_RESULT __attribute__ ( ( warn_unused_result ) )
# Skipping MacroDefinition: CPL_UNUSED __attribute ( ( __unused__ ) )
# Skipping MacroDefinition: CPL_NO_RETURN __attribute__ ( ( noreturn ) )
# Skipping MacroDefinition: CPL_RETURNS_NONNULL __attribute__ ( ( returns_nonnull ) )
# Skipping MacroDefinition: CPL_WARN_DEPRECATED ( x ) __attribute__ ( ( deprecated ( x ) ) )

const FALSE = 0
const TRUE = 1

# const EMULATED_BOOL = bool
# Skipping MacroDefinition: VOLATILE_BOOL volatile bool

const GInt32 = Cint
const GUInt32 = UInt32
const GInt16 = Int16
const GUInt16 = UInt16
const GByte = Cuchar
const GBool = Cint
const GIntBig = Clonglong
const GUIntBig = Culonglong
const GInt64 = GIntBig
const GUInt64 = GUIntBig
const GPtrDiff_t = GIntBig
const GDALProgressFunc = Ptr{Void}

mutable struct CPLVirtualMem
end

const CPLVirtualMemCachePageCbk = Ptr{Void}
const CPLVirtualMemUnCachePageCbk = Ptr{Void}
const CPLVirtualMemFreeUserData = Ptr{Void}

# begin enum ANONYMOUS_3
const ANONYMOUS_3 = UInt32
const VIRTUALMEM_READONLY = (UInt32)(0)
const VIRTUALMEM_READONLY_ENFORCED = (UInt32)(1)
const VIRTUALMEM_READWRITE = (UInt32)(2)
# end enum ANONYMOUS_3

const CPLVirtualMemAccessMode = Void

# Skipping MacroDefinition: VSI_ISLNK ( x ) S_ISLNK ( x )
# Skipping MacroDefinition: VSI_ISREG ( x ) S_ISREG ( x )
# Skipping MacroDefinition: VSI_ISDIR ( x ) S_ISDIR ( x )
# Skipping MacroDefinition: VSI_ISCHR ( x ) S_ISCHR ( x )
# Skipping MacroDefinition: VSI_ISBLK ( x ) S_ISBLK ( x )

# const VSI_L_OFFSET_MAX = GUINTBIG_MAX
const VSI_STAT_EXISTS_FLAG = 0x01
const VSI_STAT_NATURE_FLAG = 0x02
const VSI_STAT_SIZE_FLAG = 0x04
const VSI_STAT_SET_ERROR_FLAG = 0x08

# Skipping MacroDefinition: VSI_MALLOC_ALIGNED_AUTO_VERBOSE ( size ) VSIMallocAlignedAutoVerbose ( size , __FILE__ , __LINE__ )
# Skipping MacroDefinition: VSI_MALLOC_VERBOSE ( size ) VSIMallocVerbose ( size , __FILE__ , __LINE__ )
# Skipping MacroDefinition: VSI_MALLOC2_VERBOSE ( nSize1 , nSize2 ) VSIMalloc2Verbose ( nSize1 , nSize2 , __FILE__ , __LINE__ )
# Skipping MacroDefinition: VSI_MALLOC3_VERBOSE ( nSize1 , nSize2 , nSize3 ) VSIMalloc3Verbose ( nSize1 , nSize2 , nSize3 , __FILE__ , __LINE__ )
# Skipping MacroDefinition: VSI_CALLOC_VERBOSE ( nCount , nSize ) VSICallocVerbose ( nCount , nSize , __FILE__ , __LINE__ )
# Skipping MacroDefinition: VSI_REALLOC_VERBOSE ( pOldPtr , nNewSize ) VSIReallocVerbose ( pOldPtr , nNewSize , __FILE__ , __LINE__ )
# Skipping MacroDefinition: VSI_STRDUP_VERBOSE ( pszStr ) VSIStrdupVerbose ( pszStr , __FILE__ , __LINE__ )

# const CPLReadDir = VSIReadDir
# Skipping MacroDefinition: VSIDebug4 ( f , a1 , a2 , a3 , a4 ) { }
# Skipping MacroDefinition: VSIDebug3 ( f , a1 , a2 , a3 ) { }
# Skipping MacroDefinition: VSIDebug2 ( f , a1 , a2 ) { }
# Skipping MacroDefinition: VSIDebug1 ( f , a1 ) { }

const VSIStatBuf = Void
const vsi_l_offset = GUIntBig
const VSILFILE = FILE

# begin enum ANONYMOUS_4
const ANONYMOUS_4 = UInt32
const VSI_RANGE_STATUS_UNKNOWN = (UInt32)(0)
const VSI_RANGE_STATUS_DATA = (UInt32)(1)
const VSI_RANGE_STATUS_HOLE = (UInt32)(2)
# end enum ANONYMOUS_4

const VSIRangeStatus = Void

mutable struct stat64
end

const VSIStatBufL = Void
const RASTERIO_EXTRA_ARG_CURRENT_VERSION = 1

# Skipping MacroDefinition: INIT_RASTERIO_EXTRA_ARG ( s ) do { ( s ) . nVersion = RASTERIO_EXTRA_ARG_CURRENT_VERSION ; ( s ) . eResampleAlg = GRIORA_NearestNeighbour ; ( s ) . pfnProgress = NULL ; ( s ) . pProgressData = NULL ; ( s ) . bFloatingPointWindowValidity = FALSE ; } while ( 0 )

const GDALMD_AREA_OR_POINT = "AREA_OR_POINT"
const GDALMD_AOP_AREA = "Area"
const GDALMD_AOP_POINT = "Point"

# Skipping MacroDefinition: CPLE_WrongFormat ( CPLErrorNum ) 200

const GDAL_DMD_LONGNAME = "DMD_LONGNAME"
const GDAL_DMD_HELPTOPIC = "DMD_HELPTOPIC"
const GDAL_DMD_MIMETYPE = "DMD_MIMETYPE"
const GDAL_DMD_EXTENSION = "DMD_EXTENSION"
const GDAL_DMD_CONNECTION_PREFIX = "DMD_CONNECTION_PREFIX"
const GDAL_DMD_EXTENSIONS = "DMD_EXTENSIONS"
const GDAL_DMD_CREATIONOPTIONLIST = "DMD_CREATIONOPTIONLIST"
const GDAL_DMD_OPENOPTIONLIST = "DMD_OPENOPTIONLIST"
const GDAL_DMD_CREATIONDATATYPES = "DMD_CREATIONDATATYPES"
const GDAL_DMD_CREATIONFIELDDATATYPES = "DMD_CREATIONFIELDDATATYPES"
const GDAL_DMD_SUBDATASETS = "DMD_SUBDATASETS"
const GDAL_DCAP_OPEN = "DCAP_OPEN"
const GDAL_DCAP_CREATE = "DCAP_CREATE"
const GDAL_DCAP_CREATECOPY = "DCAP_CREATECOPY"
const GDAL_DCAP_VIRTUALIO = "DCAP_VIRTUALIO"
const GDAL_DCAP_RASTER = "DCAP_RASTER"
const GDAL_DCAP_VECTOR = "DCAP_VECTOR"
const GDAL_DCAP_GNM = "DCAP_GNM"
const GDAL_DCAP_NOTNULL_FIELDS = "DCAP_NOTNULL_FIELDS"
const GDAL_DCAP_DEFAULT_FIELDS = "DCAP_DEFAULT_FIELDS"
const GDAL_DCAP_NOTNULL_GEOMFIELDS = "DCAP_NOTNULL_GEOMFIELDS"
const GDAL_OF_READONLY = 0x00
const GDAL_OF_UPDATE = 0x01
const GDAL_OF_ALL = 0x00
const GDAL_OF_RASTER = 0x02
const GDAL_OF_VECTOR = 0x04
const GDAL_OF_GNM = 0x08
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

# Skipping MacroDefinition: SRCVAL ( papoSource , eSrcType , ii ) ( eSrcType == GDT_Byte ? ( ( GByte * ) papoSource ) [ ii ] : ( eSrcType == GDT_Float32 ? ( ( float * ) papoSource ) [ ii ] : ( eSrcType == GDT_Float64 ? ( ( double * ) papoSource ) [ ii ] : ( eSrcType == GDT_Int32 ? ( ( GInt32 * ) papoSource ) [ ii ] : ( eSrcType == GDT_UInt16 ? ( ( GUInt16 * ) papoSource ) [ ii ] : ( eSrcType == GDT_Int16 ? ( ( GInt16 * ) papoSource ) [ ii ] : ( eSrcType == GDT_UInt32 ? ( ( GUInt32 * ) papoSource ) [ ii ] : ( eSrcType == GDT_CInt16 ? ( ( GInt16 * ) papoSource ) [ ii * 2 ] : ( eSrcType == GDT_CInt32 ? ( ( GInt32 * ) papoSource ) [ ii * 2 ] : ( eSrcType == GDT_CFloat32 ? ( ( float * ) papoSource ) [ ii * 2 ] : ( eSrcType == GDT_CFloat64 ? ( ( double * ) papoSource ) [ ii * 2 ] : 0 ) ) ) ) ) ) ) ) ) ) )

const GMF_ALL_VALID = 0x01
const GMF_PER_DATASET = 0x02
const GMF_ALPHA = 0x04
const GMF_NODATA = 0x08
const GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED = 0x01
const GDAL_DATA_COVERAGE_STATUS_DATA = 0x02
const GDAL_DATA_COVERAGE_STATUS_EMPTY = 0x04

# begin enum ANONYMOUS_5
const ANONYMOUS_5 = UInt32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_5

const GDALDataType = Void

# begin enum ANONYMOUS_6
const ANONYMOUS_6 = UInt32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_6

const GDALAsyncStatusType = Void

# begin enum ANONYMOUS_7
const ANONYMOUS_7 = UInt32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_7

const GDALAccess = Void

# begin enum ANONYMOUS_8
const ANONYMOUS_8 = UInt32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_8

const GDALRWFlag = Void

# begin enum ANONYMOUS_9
const ANONYMOUS_9 = UInt32
const GRIORA_NearestNeighbour = (UInt32)(0)
const GRIORA_Bilinear = (UInt32)(1)
const GRIORA_Cubic = (UInt32)(2)
const GRIORA_CubicSpline = (UInt32)(3)
const GRIORA_Lanczos = (UInt32)(4)
const GRIORA_Average = (UInt32)(5)
const GRIORA_Mode = (UInt32)(6)
const GRIORA_Gauss = (UInt32)(7)
# end enum ANONYMOUS_9

const GDALRIOResampleAlg = Void
const GDALRasterIOExtraArg = Void

# begin enum ANONYMOUS_10
const ANONYMOUS_10 = UInt32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_10

const GDALColorInterp = Void

# begin enum ANONYMOUS_11
const ANONYMOUS_11 = UInt32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_11

const GDALPaletteInterp = Void
const GDALMajorObjectH = Ptr{Void}
const GDALDatasetH = Ptr{Void}
const GDALRasterBandH = Ptr{Void}
const GDALDriverH = Ptr{Void}
const GDALColorTableH = Ptr{Void}
const GDALRasterAttributeTableH = Ptr{Void}
const GDALAsyncReaderH = Ptr{Void}
const GSpacing = GIntBig
const GDAL_GCP = Void
const GDALDerivedPixelFunc = Ptr{Void}
const GDALRPCInfo = Void
const GDALColorEntry = Void

# begin enum ANONYMOUS_12
const ANONYMOUS_12 = UInt32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_12

const GDALRATFieldType = Void

# begin enum ANONYMOUS_13
const ANONYMOUS_13 = UInt32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_13

const GDALRATFieldUsage = Void

# begin enum ANONYMOUS_14
const ANONYMOUS_14 = UInt32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_14

const GDALTileOrganization = Void
const GDAL_GTI2_SIGNATURE = "GTI2"
const GDALTransformerFunc = Ptr{Void}
const GDALTransformerInfo = Void
const GDALContourWriter = Ptr{Void}
const GDALContourGeneratorH = Ptr{Void}
const OGRContourWriterInfo = Void

# begin enum ANONYMOUS_15
const ANONYMOUS_15 = UInt32
const GGA_InverseDistanceToAPower = (UInt32)(1)
const GGA_MovingAverage = (UInt32)(2)
const GGA_NearestNeighbor = (UInt32)(3)
const GGA_MetricMinimum = (UInt32)(4)
const GGA_MetricMaximum = (UInt32)(5)
const GGA_MetricRange = (UInt32)(6)
const GGA_MetricCount = (UInt32)(7)
const GGA_MetricAverageDistance = (UInt32)(8)
const GGA_MetricAverageDistancePts = (UInt32)(9)
const GGA_Linear = (UInt32)(10)
const GGA_InverseDistanceToAPowerNearestNeighbor = (UInt32)(11)
# end enum ANONYMOUS_15

const GDALGridAlgorithm = Void
const GDALGridInverseDistanceToAPowerOptions = Void
const GDALGridInverseDistanceToAPowerNearestNeighborOptions = Void
const GDALGridMovingAverageOptions = Void
const GDALGridNearestNeighborOptions = Void
const GDALGridDataMetricsOptions = Void
const GDALGridLinearOptions = Void

mutable struct GDALGridContext
end

const GDALTriFacet = Void
const GDALTriBarycentricCoefficients = Void
const GDALTriangulation = Void
const OGRGeometryH = Ptr{Void}
const OGRSpatialReferenceH = Ptr{Void}
const OGRCoordinateTransformationH = Ptr{Void}

mutable struct _CPLXMLNode
end

const OGRFieldDefnH = Ptr{Void}
const OGRFeatureDefnH = Ptr{Void}
const OGRFeatureH = Ptr{Void}
const OGRStyleTableH = Ptr{Void}

mutable struct OGRGeomFieldDefnHS
end

const OGRGeomFieldDefnH = Ptr{Void}
const OGRLayerH = Ptr{Void}
const OGRDataSourceH = Ptr{Void}
const OGRSFDriverH = Ptr{Void}
const OGRStyleMgrH = Ptr{Void}
const OGRStyleToolH = Ptr{Void}
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

# Skipping MacroDefinition: wkbFlatten ( x ) OGR_GT_Flatten ( ( OGRwkbGeometryType ) ( x ) )
# Skipping MacroDefinition: wkbHasZ ( x ) ( OGR_GT_HasZ ( x ) != 0 )
# Skipping MacroDefinition: wkbSetZ ( x ) OGR_GT_SetZ ( x )
# Skipping MacroDefinition: wkbHasM ( x ) ( OGR_GT_HasM ( x ) != 0 )
# Skipping MacroDefinition: wkbSetM ( x ) OGR_GT_SetM ( x )

const ogrZMarker = 0x21125711

# Skipping MacroDefinition: DB2_V72_FIX_BYTE_ORDER ( x ) ( ( ( ( x ) & 0x31 ) == ( x ) ) ? ( ( x ) & 0x1 ) : ( x ) )
# Skipping MacroDefinition: DB2_V72_UNFIX_BYTE_ORDER ( x ) ( ( unsigned char ) ( OGRGeometry : : bGenerate_DB2_V72_BYTE_ORDER ? ( ( x ) | 0x30 ) : ( x ) ) )

const ALTER_NAME_FLAG = 0x01
const ALTER_TYPE_FLAG = 0x02
const ALTER_WIDTH_PRECISION_FLAG = 0x04
const ALTER_NULLABLE_FLAG = 0x08
const ALTER_DEFAULT_FLAG = 0x10
const ALTER_ALL_FLAG = (((ALTER_NAME_FLAG | ALTER_TYPE_FLAG) | ALTER_WIDTH_PRECISION_FLAG) | ALTER_NULLABLE_FLAG) | ALTER_DEFAULT_FLAG
const OGR_F_VAL_NULL = 0x00000001
const OGR_F_VAL_GEOM_TYPE = 0x00000002
const OGR_F_VAL_WIDTH = 0x00000004
const OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT = 0x00000008
const OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM = 0x00000010

# Skipping MacroDefinition: OGR_F_VAL_ALL ( 0x7FFFFFFF & ~ OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM )

const OGRNullFID = -1
const OGRUnsetMarker = -21121
const OGRNullMarker = -21122

# Skipping MacroDefinition: OGR_GET_MS ( floatingpoint_sec ) ( int ) ( ( ( floatingpoint_sec ) - ( int ) ( floatingpoint_sec ) ) * 1000 + 0.5 )

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

# Skipping MacroDefinition: GDAL_CHECK_VERSION ( pszCallingComponentName ) GDALCheckVersion ( GDAL_VERSION_MAJOR , GDAL_VERSION_MINOR , pszCallingComponentName )

const OGREnvelope = Void
const OGREnvelope3D = Void
const OGRErr = Cint
const OGRBoolean = Cint

# begin enum ANONYMOUS_16
const ANONYMOUS_16 = UInt32
const wkbUnknown = (UInt32)(0)
const wkbPoint = (UInt32)(1)
const wkbLineString = (UInt32)(2)
const wkbPolygon = (UInt32)(3)
const wkbMultiPoint = (UInt32)(4)
const wkbMultiLineString = (UInt32)(5)
const wkbMultiPolygon = (UInt32)(6)
const wkbGeometryCollection = (UInt32)(7)
const wkbCircularString = (UInt32)(8)
const wkbCompoundCurve = (UInt32)(9)
const wkbCurvePolygon = (UInt32)(10)
const wkbMultiCurve = (UInt32)(11)
const wkbMultiSurface = (UInt32)(12)
const wkbCurve = (UInt32)(13)
const wkbSurface = (UInt32)(14)
const wkbPolyhedralSurface = (UInt32)(15)
const wkbTIN = (UInt32)(16)
const wkbTriangle = (UInt32)(17)
const wkbNone = (UInt32)(100)
const wkbLinearRing = (UInt32)(101)
const wkbCircularStringZ = (UInt32)(1008)
const wkbCompoundCurveZ = (UInt32)(1009)
const wkbCurvePolygonZ = (UInt32)(1010)
const wkbMultiCurveZ = (UInt32)(1011)
const wkbMultiSurfaceZ = (UInt32)(1012)
const wkbCurveZ = (UInt32)(1013)
const wkbSurfaceZ = (UInt32)(1014)
const wkbPolyhedralSurfaceZ = (UInt32)(1015)
const wkbTINZ = (UInt32)(1016)
const wkbTriangleZ = (UInt32)(1017)
const wkbPointM = (UInt32)(2001)
const wkbLineStringM = (UInt32)(2002)
const wkbPolygonM = (UInt32)(2003)
const wkbMultiPointM = (UInt32)(2004)
const wkbMultiLineStringM = (UInt32)(2005)
const wkbMultiPolygonM = (UInt32)(2006)
const wkbGeometryCollectionM = (UInt32)(2007)
const wkbCircularStringM = (UInt32)(2008)
const wkbCompoundCurveM = (UInt32)(2009)
const wkbCurvePolygonM = (UInt32)(2010)
const wkbMultiCurveM = (UInt32)(2011)
const wkbMultiSurfaceM = (UInt32)(2012)
const wkbCurveM = (UInt32)(2013)
const wkbSurfaceM = (UInt32)(2014)
const wkbPolyhedralSurfaceM = (UInt32)(2015)
const wkbTINM = (UInt32)(2016)
const wkbTriangleM = (UInt32)(2017)
const wkbPointZM = (UInt32)(3001)
const wkbLineStringZM = (UInt32)(3002)
const wkbPolygonZM = (UInt32)(3003)
const wkbMultiPointZM = (UInt32)(3004)
const wkbMultiLineStringZM = (UInt32)(3005)
const wkbMultiPolygonZM = (UInt32)(3006)
const wkbGeometryCollectionZM = (UInt32)(3007)
const wkbCircularStringZM = (UInt32)(3008)
const wkbCompoundCurveZM = (UInt32)(3009)
const wkbCurvePolygonZM = (UInt32)(3010)
const wkbMultiCurveZM = (UInt32)(3011)
const wkbMultiSurfaceZM = (UInt32)(3012)
const wkbCurveZM = (UInt32)(3013)
const wkbSurfaceZM = (UInt32)(3014)
const wkbPolyhedralSurfaceZM = (UInt32)(3015)
const wkbTINZM = (UInt32)(3016)
const wkbTriangleZM = (UInt32)(3017)
const wkbPoint25D = (UInt32)(0x0000000080000001)
const wkbLineString25D = (UInt32)(0x0000000080000002)
const wkbPolygon25D = (UInt32)(0x0000000080000003)
const wkbMultiPoint25D = (UInt32)(0x0000000080000004)
const wkbMultiLineString25D = (UInt32)(0x0000000080000005)
const wkbMultiPolygon25D = (UInt32)(0x0000000080000006)
const wkbGeometryCollection25D = (UInt32)(0x0000000080000007)
# end enum ANONYMOUS_16

const OGRwkbGeometryType = Void

# begin enum ANONYMOUS_17
const ANONYMOUS_17 = UInt32
const wkbVariantOldOgc = (UInt32)(0)
const wkbVariantIso = (UInt32)(1)
const wkbVariantPostGIS1 = (UInt32)(2)
# end enum ANONYMOUS_17

const OGRwkbVariant = Void

# begin enum ANONYMOUS_18
const ANONYMOUS_18 = UInt32
const wkbXDR = (UInt32)(0)
const wkbNDR = (UInt32)(1)
# end enum ANONYMOUS_18

const OGRwkbByteOrder = Void

# begin enum ANONYMOUS_19
const ANONYMOUS_19 = UInt32
const OFTInteger = (UInt32)(0)
const OFTIntegerList = (UInt32)(1)
const OFTReal = (UInt32)(2)
const OFTRealList = (UInt32)(3)
const OFTString = (UInt32)(4)
const OFTStringList = (UInt32)(5)
const OFTWideString = (UInt32)(6)
const OFTWideStringList = (UInt32)(7)
const OFTBinary = (UInt32)(8)
const OFTDate = (UInt32)(9)
const OFTTime = (UInt32)(10)
const OFTDateTime = (UInt32)(11)
const OFTInteger64 = (UInt32)(12)
const OFTInteger64List = (UInt32)(13)
const OFTMaxType = (UInt32)(13)
# end enum ANONYMOUS_19

const OGRFieldType = Void

# begin enum ANONYMOUS_20
const ANONYMOUS_20 = UInt32
const OFSTNone = (UInt32)(0)
const OFSTBoolean = (UInt32)(1)
const OFSTInt16 = (UInt32)(2)
const OFSTFloat32 = (UInt32)(3)
const OFSTMaxSubType = (UInt32)(3)
# end enum ANONYMOUS_20

const OGRFieldSubType = Void

# begin enum ANONYMOUS_21
const ANONYMOUS_21 = UInt32
const OJUndefined = (UInt32)(0)
const OJLeft = (UInt32)(1)
const OJRight = (UInt32)(2)
# end enum ANONYMOUS_21

const OGRJustification = Void
const OGRField = Void

# begin enum ogr_style_tool_class_id
const ogr_style_tool_class_id = UInt32
const OGRSTCNone = (UInt32)(0)
const OGRSTCPen = (UInt32)(1)
const OGRSTCBrush = (UInt32)(2)
const OGRSTCSymbol = (UInt32)(3)
const OGRSTCLabel = (UInt32)(4)
const OGRSTCVector = (UInt32)(5)
# end enum ogr_style_tool_class_id

const OGRSTClassId = Void

# begin enum ogr_style_tool_units_id
const ogr_style_tool_units_id = UInt32
const OGRSTUGround = (UInt32)(0)
const OGRSTUPixel = (UInt32)(1)
const OGRSTUPoints = (UInt32)(2)
const OGRSTUMM = (UInt32)(3)
const OGRSTUCM = (UInt32)(4)
const OGRSTUInches = (UInt32)(5)
# end enum ogr_style_tool_units_id

const OGRSTUnitId = Void

# begin enum ogr_style_tool_param_pen_id
const ogr_style_tool_param_pen_id = UInt32
const OGRSTPenColor = (UInt32)(0)
const OGRSTPenWidth = (UInt32)(1)
const OGRSTPenPattern = (UInt32)(2)
const OGRSTPenId = (UInt32)(3)
const OGRSTPenPerOffset = (UInt32)(4)
const OGRSTPenCap = (UInt32)(5)
const OGRSTPenJoin = (UInt32)(6)
const OGRSTPenPriority = (UInt32)(7)
const OGRSTPenLast = (UInt32)(8)
# end enum ogr_style_tool_param_pen_id

const OGRSTPenParam = Void

# begin enum ogr_style_tool_param_brush_id
const ogr_style_tool_param_brush_id = UInt32
const OGRSTBrushFColor = (UInt32)(0)
const OGRSTBrushBColor = (UInt32)(1)
const OGRSTBrushId = (UInt32)(2)
const OGRSTBrushAngle = (UInt32)(3)
const OGRSTBrushSize = (UInt32)(4)
const OGRSTBrushDx = (UInt32)(5)
const OGRSTBrushDy = (UInt32)(6)
const OGRSTBrushPriority = (UInt32)(7)
const OGRSTBrushLast = (UInt32)(8)
# end enum ogr_style_tool_param_brush_id

const OGRSTBrushParam = Void

# begin enum ogr_style_tool_param_symbol_id
const ogr_style_tool_param_symbol_id = UInt32
const OGRSTSymbolId = (UInt32)(0)
const OGRSTSymbolAngle = (UInt32)(1)
const OGRSTSymbolColor = (UInt32)(2)
const OGRSTSymbolSize = (UInt32)(3)
const OGRSTSymbolDx = (UInt32)(4)
const OGRSTSymbolDy = (UInt32)(5)
const OGRSTSymbolStep = (UInt32)(6)
const OGRSTSymbolPerp = (UInt32)(7)
const OGRSTSymbolOffset = (UInt32)(8)
const OGRSTSymbolPriority = (UInt32)(9)
const OGRSTSymbolFontName = (UInt32)(10)
const OGRSTSymbolOColor = (UInt32)(11)
const OGRSTSymbolLast = (UInt32)(12)
# end enum ogr_style_tool_param_symbol_id

const OGRSTSymbolParam = Void

# begin enum ogr_style_tool_param_label_id
const ogr_style_tool_param_label_id = UInt32
const OGRSTLabelFontName = (UInt32)(0)
const OGRSTLabelSize = (UInt32)(1)
const OGRSTLabelTextString = (UInt32)(2)
const OGRSTLabelAngle = (UInt32)(3)
const OGRSTLabelFColor = (UInt32)(4)
const OGRSTLabelBColor = (UInt32)(5)
const OGRSTLabelPlacement = (UInt32)(6)
const OGRSTLabelAnchor = (UInt32)(7)
const OGRSTLabelDx = (UInt32)(8)
const OGRSTLabelDy = (UInt32)(9)
const OGRSTLabelPerp = (UInt32)(10)
const OGRSTLabelBold = (UInt32)(11)
const OGRSTLabelItalic = (UInt32)(12)
const OGRSTLabelUnderline = (UInt32)(13)
const OGRSTLabelPriority = (UInt32)(14)
const OGRSTLabelStrikeout = (UInt32)(15)
const OGRSTLabelStretch = (UInt32)(16)
const OGRSTLabelAdjHor = (UInt32)(17)
const OGRSTLabelAdjVert = (UInt32)(18)
const OGRSTLabelHColor = (UInt32)(19)
const OGRSTLabelOColor = (UInt32)(20)
const OGRSTLabelLast = (UInt32)(21)
# end enum ogr_style_tool_param_label_id

const OGRSTLabelParam = Void

# const CPLFree = VSIFree
const CPLFileFinder = Ptr{Void}
const CPLSharedFileInfo = Void

# begin enum ANONYMOUS_22
const ANONYMOUS_22 = UInt32
const GRA_NearestNeighbour = (UInt32)(0)
const GRA_Bilinear = (UInt32)(1)
const GRA_Cubic = (UInt32)(2)
const GRA_CubicSpline = (UInt32)(3)
const GRA_Lanczos = (UInt32)(4)
const GRA_Average = (UInt32)(5)
const GRA_Mode = (UInt32)(6)
const GRA_Max = (UInt32)(8)
const GRA_Min = (UInt32)(9)
const GRA_Med = (UInt32)(10)
const GRA_Q1 = (UInt32)(11)
const GRA_Q3 = (UInt32)(12)
# end enum ANONYMOUS_22

const GDALResampleAlg = Void

# begin enum ANONYMOUS_23
const ANONYMOUS_23 = UInt32
const GWKAOM_Average = (UInt32)(1)
const GWKAOM_Fmode = (UInt32)(2)
const GWKAOM_Imode = (UInt32)(3)
const GWKAOM_Max = (UInt32)(4)
const GWKAOM_Min = (UInt32)(5)
const GWKAOM_Quant = (UInt32)(6)
# end enum ANONYMOUS_23

const GWKAverageOrModeAlg = Void
const GDALMaskFunc = Ptr{Void}
const GDALWarpOptions = Void
const GDALWarpOperationH = Ptr{Void}
const FilterFuncType = Ptr{Void}
const FilterFunc4ValuesType = Ptr{Void}
const VRT_NODATA_UNSET = -1234.56
const VRTImageReadFunc = Ptr{Void}
const VRTAveragedSourceH = Ptr{Void}
const VRTAverageFilteredSourceH = Ptr{Void}
const VRTComplexSourceH = Ptr{Void}
const VRTDerivedRasterBandH = Ptr{Void}
const VRTDriverH = Ptr{Void}
const VRTFilteredSourceH = Ptr{Void}
const VRTFuncSourceH = Ptr{Void}
const VRTKernelFilteredSourceH = Ptr{Void}
const VRTRasterBandH = Ptr{Void}
const VRTRawRasterBandH = Ptr{Void}
const VRTSimpleSourceH = Ptr{Void}
const VRTSourceH = Ptr{Void}
const VRTWarpedDatasetH = Ptr{Void}
const VRTWarpedRasterBandH = Ptr{Void}
const VRTDatasetH = Ptr{Void}
const VRTSourcedRasterBandH = Ptr{Void}

mutable struct GDALInfoOptions
end

mutable struct GDALInfoOptionsForBinary
end

mutable struct GDALTranslateOptions
end

mutable struct GDALTranslateOptionsForBinary
end

mutable struct GDALWarpAppOptions
end

mutable struct GDALWarpAppOptionsForBinary
end

mutable struct GDALVectorTranslateOptions
end

mutable struct GDALVectorTranslateOptionsForBinary
end

mutable struct GDALDEMProcessingOptions
end

mutable struct GDALDEMProcessingOptionsForBinary
end

mutable struct GDALNearblackOptions
end

mutable struct GDALNearblackOptionsForBinary
end

mutable struct GDALGridOptions
end

mutable struct GDALGridOptionsForBinary
end

mutable struct GDALRasterizeOptions
end

mutable struct GDALRasterizeOptionsForBinary
end

mutable struct GDALBuildVRTOptions
end

mutable struct GDALBuildVRTOptionsForBinary
end

const SRS_WKT_WGS84 = "GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\",SPHEROID[\"WGS 84\",6378137,298.257223563,AUTHORITY[\"EPSG\",\"7030\"]],AUTHORITY[\"EPSG\",\"6326\"]],PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],UNIT[\"degree\",0.0174532925199433,AUTHORITY[\"EPSG\",\"9122\"]],AUTHORITY[\"EPSG\",\"4326\"]]"
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

# begin enum ANONYMOUS_24
const ANONYMOUS_24 = UInt32
const OAO_Other = (UInt32)(0)
const OAO_North = (UInt32)(1)
const OAO_South = (UInt32)(2)
const OAO_East = (UInt32)(3)
const OAO_West = (UInt32)(4)
const OAO_Up = (UInt32)(5)
const OAO_Down = (UInt32)(6)
# end enum ANONYMOUS_24

const OGRAxisOrientation = Void

# begin enum ANONYMOUS_25
const ANONYMOUS_25 = UInt32
const ODT_HD_Min = (UInt32)(1000)
const ODT_HD_Other = (UInt32)(1000)
const ODT_HD_Classic = (UInt32)(1001)
const ODT_HD_Geocentric = (UInt32)(1002)
const ODT_HD_Max = (UInt32)(1999)
const ODT_VD_Min = (UInt32)(2000)
const ODT_VD_Other = (UInt32)(2000)
const ODT_VD_Orthometric = (UInt32)(2001)
const ODT_VD_Ellipsoidal = (UInt32)(2002)
const ODT_VD_AltitudeBarometric = (UInt32)(2003)
const ODT_VD_Normal = (UInt32)(2004)
const ODT_VD_GeoidModelDerived = (UInt32)(2005)
const ODT_VD_Depth = (UInt32)(2006)
const ODT_VD_Max = (UInt32)(2999)
const ODT_LD_Min = (UInt32)(10000)
const ODT_LD_Max = (UInt32)(32767)
# end enum ANONYMOUS_25

const OGRDatumType = Void
