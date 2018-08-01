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
# const VALIDATE_POINTER_ERR = CE_Failure
# Skipping MacroDefinition: VALIDATE_POINTER0 ( ptr , func ) do { if ( NULL == ptr ) { CPLErr const ret = VALIDATE_POINTER_ERR ; CPLError ( ret , CPLE_ObjectNull , "Pointer \'%s\' is NULL in \'%s\'.\n" , # ptr , ( func ) ) ; return ; } } while ( 0 )
# Skipping MacroDefinition: VALIDATE_POINTER1 ( ptr , func , rc ) do { if ( NULL == ptr ) { CPLErr const ret = VALIDATE_POINTER_ERR ; CPLError ( ret , CPLE_ObjectNull , "Pointer \'%s\' is NULL in \'%s\'.\n" , # ptr , ( func ) ) ; return ( rc ) ; } } while ( 0 )

@enum CPLErr::UInt32 CE_None = 0 CE_Debug = 1 CE_Warning = 2 CE_Failure = 3 CE_Fatal = 4

const CPLErrorNum = Cint
const CPLErrorHandler = Ptr{Cvoid}

@enum CPLXMLNodeType::UInt32 CXT_Element = 0 CXT_Text = 1 CXT_Attribute = 2 CXT_Comment = 3 CXT_Literal = 4

mutable struct CPLXMLNode
    eType::CPLXMLNodeType
    pszValue::Cstring
    psNext::Ptr{Cvoid}
    psChild::Ptr{Cvoid}
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
const GDALProgressFunc = Ptr{Cvoid}
const CPLVirtualMem = Ptr{Cvoid}
const CPLVirtualMemCachePageCbk = Ptr{Cvoid}
const CPLVirtualMemUnCachePageCbk = Ptr{Cvoid}
const CPLVirtualMemFreeUserData = Ptr{Cvoid}

@enum CPLVirtualMemAccessMode::UInt32 VIRTUALMEM_READONLY = 0 VIRTUALMEM_READONLY_ENFORCED = 1 VIRTUALMEM_READWRITE = 2

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

const VSIStatBuf = Nothing
const vsi_l_offset = GUIntBig
const VSILFILE = FILE

@enum VSIRangeStatus::UInt32 VSI_RANGE_STATUS_UNKNOWN = 0 VSI_RANGE_STATUS_DATA = 1 VSI_RANGE_STATUS_HOLE = 2

const VSIStatBufL = Ptr{Cvoid}
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

@enum GDALDataType::UInt32 GDT_Unknown = 0 GDT_Byte = 1 GDT_UInt16 = 2 GDT_Int16 = 3 GDT_UInt32 = 4 GDT_Int32 = 5 GDT_Float32 = 6 GDT_Float64 = 7 GDT_CInt16 = 8 GDT_CInt32 = 9 GDT_CFloat32 = 10 GDT_CFloat64 = 11 GDT_TypeCount = 12
@enum GDALAsyncStatusType::UInt32 GARIO_PENDING = 0 GARIO_UPDATE = 1 GARIO_ERROR = 2 GARIO_COMPLETE = 3 GARIO_TypeCount = 4
@enum GDALAccess::UInt32 GA_ReadOnly = 0 GA_Update = 1
@enum GDALRWFlag::UInt32 GF_Read = 0 GF_Write = 1
@enum GDALRIOResampleAlg::UInt32 GRIORA_NearestNeighbour = 0 GRIORA_Bilinear = 1 GRIORA_Cubic = 2 GRIORA_CubicSpline = 3 GRIORA_Lanczos = 4 GRIORA_Average = 5 GRIORA_Mode = 6 GRIORA_Gauss = 7

mutable struct GDALRasterIOExtraArg
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

@enum GDALColorInterp::UInt32 GCI_Undefined = 0 GCI_GrayIndex = 1 GCI_PaletteIndex = 2 GCI_RedBand = 3 GCI_GreenBand = 4 GCI_BlueBand = 5 GCI_AlphaBand = 6 GCI_HueBand = 7 GCI_SaturationBand = 8 GCI_LightnessBand = 9 GCI_CyanBand = 10 GCI_MagentaBand = 11 GCI_YellowBand = 12 GCI_BlackBand = 13 GCI_YCbCr_YBand = 14 GCI_YCbCr_CbBand = 15 GCI_YCbCr_CrBand = 16

const GCI_Max = GCI_YCbCr_CrBand

@enum GDALPaletteInterp::UInt32 GPI_Gray = 0 GPI_RGB = 1 GPI_CMYK = 2 GPI_HLS = 3

const GDALMajorObjectH = Ptr{Cvoid}
const GDALDatasetH = Ptr{Cvoid}
const GDALRasterBandH = Ptr{Cvoid}
const GDALDriverH = Ptr{Cvoid}
const GDALColorTableH = Ptr{Cvoid}
const GDALRasterAttributeTableH = Ptr{Cvoid}
const GDALAsyncReaderH = Ptr{Cvoid}
const GSpacing = GIntBig

mutable struct GDAL_GCP
    pszId::Cstring
    pszInfo::Cstring
    dfGCPPixel::Cdouble
    dfGCPLine::Cdouble
    dfGCPX::Cdouble
    dfGCPY::Cdouble
    dfGCPZ::Cdouble
end

const GDALDerivedPixelFunc = Ptr{Cvoid}

mutable struct GDALRPCInfo
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

mutable struct GDALColorEntry
    c1::Int16
    c2::Int16
    c3::Int16
    c4::Int16
end

@enum GDALRATFieldType::UInt32 GFT_Integer = 0 GFT_Real = 1 GFT_String = 2
@enum GDALRATFieldUsage::UInt32 GFU_Generic = 0 GFU_PixelCount = 1 GFU_Name = 2 GFU_Min = 3 GFU_Max = 4 GFU_MinMax = 5 GFU_Red = 6 GFU_Green = 7 GFU_Blue = 8 GFU_Alpha = 9 GFU_RedMin = 10 GFU_GreenMin = 11 GFU_BlueMin = 12 GFU_AlphaMin = 13 GFU_RedMax = 14 GFU_GreenMax = 15 GFU_BlueMax = 16 GFU_AlphaMax = 17 GFU_MaxCount = 18
@enum GDALTileOrganization::UInt32 GTO_TIP = 0 GTO_BIT = 1 GTO_BSQ = 2

const GDAL_GTI2_SIGNATURE = "GTI2"
const GDALTransformerFunc = Ptr{Cvoid}

mutable struct GDALTransformerInfo
    abySignature::NTuple{4, GByte}
    pszClassName::Cstring
    pfnTransform::GDALTransformerFunc
    pfnCleanup::Ptr{Cvoid}
    pfnSerialize::Ptr{Cvoid}
    pfnCreateSimilar::Ptr{Cvoid}
end

const GDALContourWriter = Ptr{Cvoid}
const GDALContourGeneratorH = Ptr{Cvoid}

mutable struct OGRContourWriterInfo
    hLayer::Ptr{Cvoid}
    adfGeoTransform::NTuple{6, Cdouble}
    nElevField::Cint
    nIDField::Cint
    nNextID::Cint
end

@enum GDALGridAlgorithm::UInt32 GGA_InverseDistanceToAPower = 1 GGA_MovingAverage = 2 GGA_NearestNeighbor = 3 GGA_MetricMinimum = 4 GGA_MetricMaximum = 5 GGA_MetricRange = 6 GGA_MetricCount = 7 GGA_MetricAverageDistance = 8 GGA_MetricAverageDistancePts = 9 GGA_Linear = 10 GGA_InverseDistanceToAPowerNearestNeighbor = 11

mutable struct GDALGridInverseDistanceToAPowerOptions
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

mutable struct GDALGridInverseDistanceToAPowerNearestNeighborOptions
    dfPower::Cdouble
    dfRadius::Cdouble
    dfSmoothing::Cdouble
    nMaxPoints::GUInt32
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

mutable struct GDALGridMovingAverageOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

mutable struct GDALGridNearestNeighborOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    dfNoDataValue::Cdouble
end

mutable struct GDALGridDataMetricsOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

mutable struct GDALGridLinearOptions
    dfRadius::Cdouble
    dfNoDataValue::Cdouble
end

const GDALGridContext = Ptr{Cvoid}

mutable struct GDALTriFacet
    anVertexIdx::NTuple{3, Cint}
    anNeighborIdx::NTuple{3, Cint}
end

mutable struct GDALTriBarycentricCoefficients
    dfMul1X::Cdouble
    dfMul1Y::Cdouble
    dfMul2X::Cdouble
    dfMul2Y::Cdouble
    dfCstX::Cdouble
    dfCstY::Cdouble
end

mutable struct GDALTriangulation
    nFacets::Cint
    pasFacets::Ptr{GDALTriFacet}
    pasFacetCoefficients::Ptr{GDALTriBarycentricCoefficients}
end

const OGRGeometryH = Ptr{Cvoid}
const OGRSpatialReferenceH = Ptr{Cvoid}
const OGRCoordinateTransformationH = Ptr{Cvoid}
const _CPLXMLNode = Ptr{Cvoid}
const OGRFieldDefnH = Ptr{Cvoid}
const OGRFeatureDefnH = Ptr{Cvoid}
const OGRFeatureH = Ptr{Cvoid}
const OGRStyleTableH = Ptr{Cvoid}
const OGRGeomFieldDefnH = Ptr{Cvoid}
const OGRLayerH = Ptr{Cvoid}
const OGRDataSourceH = Ptr{Cvoid}
const OGRSFDriverH = Ptr{Cvoid}
const OGRStyleMgrH = Ptr{Cvoid}
const OGRStyleToolH = Ptr{Cvoid}
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

mutable struct OGREnvelope
    MinX::Cdouble
    MaxX::Cdouble
    MinY::Cdouble
    MaxY::Cdouble
end

mutable struct OGREnvelope3D
    MinX::Cdouble
    MaxX::Cdouble
    MinY::Cdouble
    MaxY::Cdouble
    MinZ::Cdouble
    MaxZ::Cdouble
end

const OGRErr = Cint
const OGRBoolean = Cint

@enum OGRwkbGeometryType::UInt32 wkbUnknown = 0 wkbPoint = 1 wkbLineString = 2 wkbPolygon = 3 wkbMultiPoint = 4 wkbMultiLineString = 5 wkbMultiPolygon = 6 wkbGeometryCollection = 7 wkbCircularString = 8 wkbCompoundCurve = 9 wkbCurvePolygon = 10 wkbMultiCurve = 11 wkbMultiSurface = 12 wkbCurve = 13 wkbSurface = 14 wkbPolyhedralSurface = 15 wkbTIN = 16 wkbTriangle = 17 wkbNone = 100 wkbLinearRing = 101 wkbCircularStringZ = 1008 wkbCompoundCurveZ = 1009 wkbCurvePolygonZ = 1010 wkbMultiCurveZ = 1011 wkbMultiSurfaceZ = 1012 wkbCurveZ = 1013 wkbSurfaceZ = 1014 wkbPolyhedralSurfaceZ = 1015 wkbTINZ = 1016 wkbTriangleZ = 1017 wkbPointM = 2001 wkbLineStringM = 2002 wkbPolygonM = 2003 wkbMultiPointM = 2004 wkbMultiLineStringM = 2005 wkbMultiPolygonM = 2006 wkbGeometryCollectionM = 2007 wkbCircularStringM = 2008 wkbCompoundCurveM = 2009 wkbCurvePolygonM = 2010 wkbMultiCurveM = 2011 wkbMultiSurfaceM = 2012 wkbCurveM = 2013 wkbSurfaceM = 2014 wkbPolyhedralSurfaceM = 2015 wkbTINM = 2016 wkbTriangleM = 2017 wkbPointZM = 3001 wkbLineStringZM = 3002 wkbPolygonZM = 3003 wkbMultiPointZM = 3004 wkbMultiLineStringZM = 3005 wkbMultiPolygonZM = 3006 wkbGeometryCollectionZM = 3007 wkbCircularStringZM = 3008 wkbCompoundCurveZM = 3009 wkbCurvePolygonZM = 3010 wkbMultiCurveZM = 3011 wkbMultiSurfaceZM = 3012 wkbCurveZM = 3013 wkbSurfaceZM = 3014 wkbPolyhedralSurfaceZM = 3015 wkbTINZM = 3016 wkbTriangleZM = 3017 wkbPoint25D = 2147483649 wkbLineString25D = 2147483650 wkbPolygon25D = 2147483651 wkbMultiPoint25D = 2147483652 wkbMultiLineString25D = 2147483653 wkbMultiPolygon25D = 2147483654 wkbGeometryCollection25D = 2147483655
@enum OGRwkbVariant::UInt32 wkbVariantOldOgc = 0 wkbVariantIso = 1 wkbVariantPostGIS1 = 2
@enum OGRwkbByteOrder::UInt32 wkbXDR = 0 wkbNDR = 1
@enum OGRFieldType::UInt32 OFTInteger = 0 OFTIntegerList = 1 OFTReal = 2 OFTRealList = 3 OFTString = 4 OFTStringList = 5 OFTWideString = 6 OFTWideStringList = 7 OFTBinary = 8 OFTDate = 9 OFTTime = 10 OFTDateTime = 11 OFTInteger64 = 12 OFTInteger64List = 13

const OFTMaxType = OFTInteger64List

@enum OGRFieldSubType::UInt32 OFSTNone = 0 OFSTBoolean = 1 OFSTInt16 = 2 OFSTFloat32 = 3

const OFSTMaxSubType = OFSTFloat32

@enum OGRJustification::UInt32 OJUndefined = 0 OJLeft = 1 OJRight = 2

const OGRField = Nothing

@enum OGRSTClassId::UInt32 OGRSTCNone = 0 OGRSTCPen = 1 OGRSTCBrush = 2 OGRSTCSymbol = 3 OGRSTCLabel = 4 OGRSTCVector = 5
@enum OGRSTUnitId::UInt32 OGRSTUGround = 0 OGRSTUPixel = 1 OGRSTUPoints = 2 OGRSTUMM = 3 OGRSTUCM = 4 OGRSTUInches = 5
@enum OGRSTPenParam::UInt32 OGRSTPenColor = 0 OGRSTPenWidth = 1 OGRSTPenPattern = 2 OGRSTPenId = 3 OGRSTPenPerOffset = 4 OGRSTPenCap = 5 OGRSTPenJoin = 6 OGRSTPenPriority = 7 OGRSTPenLast = 8
@enum OGRSTBrushParam::UInt32 OGRSTBrushFColor = 0 OGRSTBrushBColor = 1 OGRSTBrushId = 2 OGRSTBrushAngle = 3 OGRSTBrushSize = 4 OGRSTBrushDx = 5 OGRSTBrushDy = 6 OGRSTBrushPriority = 7 OGRSTBrushLast = 8
@enum OGRSTSymbolParam::UInt32 OGRSTSymbolId = 0 OGRSTSymbolAngle = 1 OGRSTSymbolColor = 2 OGRSTSymbolSize = 3 OGRSTSymbolDx = 4 OGRSTSymbolDy = 5 OGRSTSymbolStep = 6 OGRSTSymbolPerp = 7 OGRSTSymbolOffset = 8 OGRSTSymbolPriority = 9 OGRSTSymbolFontName = 10 OGRSTSymbolOColor = 11 OGRSTSymbolLast = 12
@enum OGRSTLabelParam::UInt32 OGRSTLabelFontName = 0 OGRSTLabelSize = 1 OGRSTLabelTextString = 2 OGRSTLabelAngle = 3 OGRSTLabelFColor = 4 OGRSTLabelBColor = 5 OGRSTLabelPlacement = 6 OGRSTLabelAnchor = 7 OGRSTLabelDx = 8 OGRSTLabelDy = 9 OGRSTLabelPerp = 10 OGRSTLabelBold = 11 OGRSTLabelItalic = 12 OGRSTLabelUnderline = 13 OGRSTLabelPriority = 14 OGRSTLabelStrikeout = 15 OGRSTLabelStretch = 16 OGRSTLabelAdjHor = 17 OGRSTLabelAdjVert = 18 OGRSTLabelHColor = 19 OGRSTLabelOColor = 20 OGRSTLabelLast = 21

# const CPLFree = VSIFree
const CPLFileFinder = Ptr{Cvoid}

mutable struct CPLSharedFileInfo
    fp::Ptr{FILE}
    nRefCount::Cint
    bLarge::Cint
    pszFilename::Cstring
    pszAccess::Cstring
end

@enum GDALResampleAlg::UInt32 GRA_NearestNeighbour = 0 GRA_Bilinear = 1 GRA_Cubic = 2 GRA_CubicSpline = 3 GRA_Lanczos = 4 GRA_Average = 5 GRA_Mode = 6 GRA_Max = 8 GRA_Min = 9 GRA_Med = 10 GRA_Q1 = 11 GRA_Q3 = 12
@enum GWKAverageOrModeAlg::UInt32 GWKAOM_Average = 1 GWKAOM_Fmode = 2 GWKAOM_Imode = 3 GWKAOM_Max = 4 GWKAOM_Min = 5 GWKAOM_Quant = 6

const GDALMaskFunc = Ptr{Cvoid}

mutable struct GDALWarpOptions
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

const GDALWarpOperationH = Ptr{Cvoid}
const FilterFuncType = Ptr{Cvoid}
const FilterFunc4ValuesType = Ptr{Cvoid}
const VRT_NODATA_UNSET = -1234.56
const VRTImageReadFunc = Ptr{Cvoid}
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
const VRTDatasetH = Ptr{Cvoid}
const VRTSourcedRasterBandH = Ptr{Cvoid}
const GDALInfoOptions = Ptr{Cvoid}
const GDALInfoOptionsForBinary = Ptr{Cvoid}
const GDALTranslateOptions = Ptr{Cvoid}
const GDALTranslateOptionsForBinary = Ptr{Cvoid}
const GDALWarpAppOptions = Ptr{Cvoid}
const GDALWarpAppOptionsForBinary = Ptr{Cvoid}
const GDALVectorTranslateOptions = Ptr{Cvoid}
const GDALVectorTranslateOptionsForBinary = Ptr{Cvoid}
const GDALDEMProcessingOptions = Ptr{Cvoid}
const GDALDEMProcessingOptionsForBinary = Ptr{Cvoid}
const GDALNearblackOptions = Ptr{Cvoid}
const GDALNearblackOptionsForBinary = Ptr{Cvoid}
const GDALGridOptions = Ptr{Cvoid}
const GDALGridOptionsForBinary = Ptr{Cvoid}
const GDALRasterizeOptions = Ptr{Cvoid}
const GDALRasterizeOptionsForBinary = Ptr{Cvoid}
const GDALBuildVRTOptions = Ptr{Cvoid}
const GDALBuildVRTOptionsForBinary = Ptr{Cvoid}
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

@enum OGRAxisOrientation::UInt32 OAO_Other = 0 OAO_North = 1 OAO_South = 2 OAO_East = 3 OAO_West = 4 OAO_Up = 5 OAO_Down = 6
@enum OGRDatumType::UInt32 ODT_HD_Min = 1000 ODT_HD_Classic = 1001 ODT_HD_Geocentric = 1002 ODT_HD_Max = 1999 ODT_VD_Min = 2000 ODT_VD_Orthometric = 2001 ODT_VD_Ellipsoidal = 2002 ODT_VD_AltitudeBarometric = 2003 ODT_VD_Normal = 2004 ODT_VD_GeoidModelDerived = 2005 ODT_VD_Depth = 2006 ODT_VD_Max = 2999 ODT_LD_Min = 10000 ODT_LD_Max = 32767

const ODT_HD_Other = ODT_HD_Min
const ODT_VD_Other = ODT_VD_Min
