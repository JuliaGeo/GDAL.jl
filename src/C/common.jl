# Automatically generated using Clang.jl


"Callback for CPLPushFileFinder"
const CPLFileFinder = Ptr{Cvoid}

struct CPLSharedFileInfo
    fp::Ptr{Cint}
    nRefCount::Cint
    bLarge::Cint
    pszFilename::Cstring
    pszAccess::Cstring
end

"No error"
const CPLE_None = 0

"Application defined error"
const CPLE_AppDefined = 1

"Out of memory error"
const CPLE_OutOfMemory = 2

"File I/O error"
const CPLE_FileIO = 3

"Open failed"
const CPLE_OpenFailed = 4

"Illegal argument"
const CPLE_IllegalArg = 5

"Not supported"
const CPLE_NotSupported = 6

"Assertion failed"
const CPLE_AssertionFailed = 7

"No write access"
const CPLE_NoWriteAccess = 8

"User interrupted"
const CPLE_UserInterrupt = 9

"NULL object"
const CPLE_ObjectNull = 10

"HTTP response"
const CPLE_HttpResponse = 11

"AWSBucketNotFound"
const CPLE_AWSBucketNotFound = 12

"AWSObjectNotFound"
const CPLE_AWSObjectNotFound = 13

"AWSAccessDenied"
const CPLE_AWSAccessDenied = 14

"AWSInvalidCredentials"
const CPLE_AWSInvalidCredentials = 15

"AWSSignatureDoesNotMatch"
const CPLE_AWSSignatureDoesNotMatch = 16

"VSIE_AWSError"
const CPLE_AWSError = 17

"Error category"
@cenum CPLErr::UInt32 begin
        CE_None = 0
        CE_Debug = 1
        CE_Warning = 2
        CE_Failure = 3
        CE_Fatal = 4
    end

"Error number"
const CPLErrorNum = Cint

"Callback for a custom error handler"
const CPLErrorHandler = Ptr{Cvoid}

"XML node type"
@cenum CPLXMLNodeType::UInt32 begin
        CXT_Element = 0
        CXT_Text = 1
        CXT_Attribute = 2
        CXT_Comment = 3
        CXT_Literal = 4
    end

"Document node structure"
struct CPLXMLNode
    eType::CPLXMLNodeType
    pszValue::Cstring
    psNext::Ptr{CPLXMLNode}
    psChild::Ptr{CPLXMLNode}
end

const CPL_HAS_GINT64 = 1

"Printf formatting suffix for GIntBig"
const CPL_FRMT_GB_WITHOUT_PREFIX = "I64"

"PI definition"
const M_PI = 3.141592653589793

const CPL_IS_LSB = 1

const FALSE = 0

const TRUE = 1

"Int32 type"
const GInt32 = Cint

"Unsigned int32 type"
const GUInt32 = UInt32

"Int16 type"
const GInt16 = Int16

"Unsigned int16 type"
const GUInt16 = UInt16

"Unsigned byte type"
const GByte = Cuchar

"Type for boolean values (alias to int)"
const GBool = Cint

"Large signed integer type (generally 64-bit integer type)"
const GIntBig = Clonglong

"Large unsigned integer type (generally 64-bit unsigned integer type)"
const GUIntBig = Culonglong

"Signed 64 bit integer type"
const GInt64 = GIntBig

"Unsigned 64 bit integer type"
const GUInt64 = GUIntBig

"Integer type large enough to hold the difference between 2 addresses"
const GPtrDiff_t = GIntBig

"Type of a constant null-terminated list of nul terminated strings"
const CSLConstList = Ptr{Cstring}

"Callback progress definition for long operations"
const GDALProgressFunc = Ptr{Cvoid}

"Opaque type that represents a virtual memory mapping"
const CPLVirtualMem = Cvoid

"Callback triggered when a still unmapped page of virtual memory is accessed"
const CPLVirtualMemCachePageCbk = Ptr{Cvoid}

"Callback triggered when a dirty mapped page is going to be freed"
const CPLVirtualMemUnCachePageCbk = Ptr{Cvoid}

"Callback triggered when a virtual memory mapping is destroyed"
const CPLVirtualMemFreeUserData = Ptr{Cvoid}

"Access mode of a virtual memory mapping"
@cenum CPLVirtualMemAccessMode::UInt32 begin
        VIRTUALMEM_READONLY = 0
        VIRTUALMEM_READONLY_ENFORCED = 1
        VIRTUALMEM_READWRITE = 2
    end

"Flag provided to VSIStatExL() to test if the file exists"
const VSI_STAT_EXISTS_FLAG = 0x01

"Flag provided to VSIStatExL() to query the nature (file/dir) of the file"
const VSI_STAT_NATURE_FLAG = 0x02

"Flag provided to VSIStatExL() to query the file size"
const VSI_STAT_SIZE_FLAG = 0x04

"Flag provided to VSIStatExL() to issue a VSIError in case of failure"
const VSI_STAT_SET_ERROR_FLAG = 0x08

const stat = Cvoid

const VSIStatBuf = stat

"Type for a file offset"
const vsi_l_offset = GUIntBig

"Opaque type for a FILE that implements the VSIVirtualHandle API"
const VSILFILE = Cint

"Range status"
@cenum VSIRangeStatus::UInt32 begin
        VSI_RANGE_STATUS_UNKNOWN = 0
        VSI_RANGE_STATUS_DATA = 1
        VSI_RANGE_STATUS_HOLE = 2
    end

"Opaque type for a directory iterator"
const VSIDIR = Cvoid

"Directory entry"
struct VSIDIREntry
    pszName::Cstring
    nMode::Cint
    nSize::vsi_l_offset
    nMTime::GIntBig
    bModeKnown::UInt8
    bSizeKnown::UInt8
    bMTimeKnown::UInt8
    papszExtra::Ptr{Cstring}
end

"Return information about a handle"
const VSIFilesystemPluginStatCallback = Ptr{Cvoid}

"Remove handle by name"
const VSIFilesystemPluginUnlinkCallback = Ptr{Cvoid}

"Rename handle"
const VSIFilesystemPluginRenameCallback = Ptr{Cvoid}

"Create Directory"
const VSIFilesystemPluginMkdirCallback = Ptr{Cvoid}

"Delete Directory"
const VSIFilesystemPluginRmdirCallback = Ptr{Cvoid}

"List directory content"
const VSIFilesystemPluginReadDirCallback = Ptr{Cvoid}

"Open a handle"
const VSIFilesystemPluginOpenCallback = Ptr{Cvoid}

"Return current position in handle"
const VSIFilesystemPluginTellCallback = Ptr{Cvoid}

"Seek to position in handle"
const VSIFilesystemPluginSeekCallback = Ptr{Cvoid}

"Read data from current position, returns the number of blocks correctly read"
const VSIFilesystemPluginReadCallback = Ptr{Cvoid}

"Read from multiple offsets"
const VSIFilesystemPluginReadMultiRangeCallback = Ptr{Cvoid}

"Get empty ranges"
const VSIFilesystemPluginGetRangeStatusCallback = Ptr{Cvoid}

"Has end of file been reached"
const VSIFilesystemPluginEofCallback = Ptr{Cvoid}

"Write bytes at current offset"
const VSIFilesystemPluginWriteCallback = Ptr{Cvoid}

"Sync written bytes"
const VSIFilesystemPluginFlushCallback = Ptr{Cvoid}

"Truncate handle"
const VSIFilesystemPluginTruncateCallback = Ptr{Cvoid}

"Close file handle"
const VSIFilesystemPluginCloseCallback = Ptr{Cvoid}

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
end

const tm = Cvoid

const RASTERIO_EXTRA_ARG_CURRENT_VERSION = 1

"Metadata item for dataset that indicates the spatial interpretation of a pixel"
const GDALMD_AREA_OR_POINT = "AREA_OR_POINT"

"Value for GDALMD_AREA_OR_POINT that indicates that a pixel represents an area"
const GDALMD_AOP_AREA = "Area"

"Value for GDALMD_AREA_OR_POINT that indicates that a pixel represents a point"
const GDALMD_AOP_POINT = "Point"

"Long name of the driver"
const GDAL_DMD_LONGNAME = "DMD_LONGNAME"

"URL (relative to http://gdal.org/) to the help page of the driver"
const GDAL_DMD_HELPTOPIC = "DMD_HELPTOPIC"

"MIME type handled by the driver"
const GDAL_DMD_MIMETYPE = "DMD_MIMETYPE"

"Extension handled by the driver"
const GDAL_DMD_EXTENSION = "DMD_EXTENSION"

"Connection prefix to provide as the file name of the open function"
const GDAL_DMD_CONNECTION_PREFIX = "DMD_CONNECTION_PREFIX"

"List of (space separated) extensions handled by the driver"
const GDAL_DMD_EXTENSIONS = "DMD_EXTENSIONS"

"XML snippet with creation options"
const GDAL_DMD_CREATIONOPTIONLIST = "DMD_CREATIONOPTIONLIST"

"XML snippet with open options"
const GDAL_DMD_OPENOPTIONLIST = "DMD_OPENOPTIONLIST"

"List of (space separated) raster data types support by the Create()/CreateCopy() API"
const GDAL_DMD_CREATIONDATATYPES = "DMD_CREATIONDATATYPES"

"List of (space separated) vector field types support by the CreateField() API"
const GDAL_DMD_CREATIONFIELDDATATYPES = "DMD_CREATIONFIELDDATATYPES"

"List of (space separated) vector field sub-types support by the CreateField() API"
const GDAL_DMD_CREATIONFIELDDATASUBTYPES = "DMD_CREATIONFIELDDATASUBTYPES"

"Capability set by a driver that exposes Subdatasets"
const GDAL_DMD_SUBDATASETS = "DMD_SUBDATASETS"

"Capability set by a driver that implements the Open() API"
const GDAL_DCAP_OPEN = "DCAP_OPEN"

"Capability set by a driver that implements the Create() API"
const GDAL_DCAP_CREATE = "DCAP_CREATE"

"Capability set by a driver that implements the CreateCopy() API"
const GDAL_DCAP_CREATECOPY = "DCAP_CREATECOPY"

"Capability set by a driver that can copy over subdatasets"
const GDAL_DCAP_SUBCREATECOPY = "DCAP_SUBCREATECOPY"

"Capability set by a driver that can read/create datasets through the VSI*L API"
const GDAL_DCAP_VIRTUALIO = "DCAP_VIRTUALIO"

"Capability set by a driver having raster capability"
const GDAL_DCAP_RASTER = "DCAP_RASTER"

"Capability set by a driver having vector capability"
const GDAL_DCAP_VECTOR = "DCAP_VECTOR"

"Capability set by a driver having geographical network model capability"
const GDAL_DCAP_GNM = "DCAP_GNM"

"Capability set by a driver that can create fields with NOT NULL constraint"
const GDAL_DCAP_NOTNULL_FIELDS = "DCAP_NOTNULL_FIELDS"

"Capability set by a driver that can create fields with DEFAULT values"
const GDAL_DCAP_DEFAULT_FIELDS = "DCAP_DEFAULT_FIELDS"

"Capability set by a driver that can create geometry fields with NOT NULL constraint"
const GDAL_DCAP_NOTNULL_GEOMFIELDS = "DCAP_NOTNULL_GEOMFIELDS"

"Capability set by a non-spatial driver having no support for geometries"
const GDAL_DCAP_NONSPATIAL = "DCAP_NONSPATIAL"

"Capability set by drivers which support feature styles"
const GDAL_DCAP_FEATURE_STYLES = "DCAP_FEATURE_STYLES"

"Open in read-only mode"
const GDAL_OF_READONLY = 0x00

"Open in update mode"
const GDAL_OF_UPDATE = 0x01

"Allow raster and vector drivers to be used"
const GDAL_OF_ALL = 0x00

"Allow raster drivers to be used"
const GDAL_OF_RASTER = 0x02

"Allow vector drivers to be used"
const GDAL_OF_VECTOR = 0x04

"Allow gnm drivers to be used"
const GDAL_OF_GNM = 0x08

const GDAL_OF_KIND_MASK = 0x1e

"Open in shared mode"
const GDAL_OF_SHARED = 0x20

"Emit error message in case of failed open"
const GDAL_OF_VERBOSE_ERROR = 0x40

"Open as internal dataset"
const GDAL_OF_INTERNAL = 0x80

"Let GDAL decide if a array-based or hashset-based storage strategy for cached blocks must be used"
const GDAL_OF_DEFAULT_BLOCK_ACCESS = 0

"Use a array-based storage strategy for cached blocks"
const GDAL_OF_ARRAY_BLOCK_ACCESS = 0x0100

"Use a hashset-based storage strategy for cached blocks"
const GDAL_OF_HASHSET_BLOCK_ACCESS = 0x0200

const GDAL_OF_RESERVED_1 = 0x0300

const GDAL_OF_BLOCK_ACCESS_MASK = 0x0300

"Name of driver metadata item for layer creation option list"
const GDAL_DS_LAYER_CREATIONOPTIONLIST = "DS_LAYER_CREATIONOPTIONLIST"

"Flag returned by GDALGetMaskFlags() to indicate that all pixels are valid"
const GMF_ALL_VALID = 0x01

"Flag returned by GDALGetMaskFlags() to indicate that the mask band is valid for all bands"
const GMF_PER_DATASET = 0x02

"Flag returned by GDALGetMaskFlags() to indicate that the mask band is an alpha band"
const GMF_ALPHA = 0x04

"Flag returned by GDALGetMaskFlags() to indicate that the mask band is computed from nodata values"
const GMF_NODATA = 0x08

"Flag returned by GDALGetDataCoverageStatus() when the driver does not implement GetDataCoverageStatus()"
const GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED = 0x01

"Flag returned by GDALGetDataCoverageStatus() when there is (potentially) data in the queried window"
const GDAL_DATA_COVERAGE_STATUS_DATA = 0x02

"Flag returned by GDALGetDataCoverageStatus() when there is nodata in the queried window"
const GDAL_DATA_COVERAGE_STATUS_EMPTY = 0x04

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

"status of the asynchronous stream"
@cenum GDALAsyncStatusType::UInt32 begin
        GARIO_PENDING = 0
        GARIO_UPDATE = 1
        GARIO_ERROR = 2
        GARIO_COMPLETE = 3
        GARIO_TypeCount = 4
    end

@cenum GDALAccess::UInt32 begin
        GA_ReadOnly = 0
        GA_Update = 1
    end

@cenum GDALRWFlag::UInt32 begin
        GF_Read = 0
        GF_Write = 1
    end

"RasterIO() resampling method"
@cenum GDALRIOResampleAlg::UInt32 begin
        GRIORA_NearestNeighbour = 0
        GRIORA_Bilinear = 1
        GRIORA_Cubic = 2
        GRIORA_CubicSpline = 3
        GRIORA_Lanczos = 4
        GRIORA_Average = 5
        GRIORA_Mode = 6
        GRIORA_Gauss = 7
    end

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

@cenum GDALPaletteInterp::UInt32 begin
        GPI_Gray = 0
        GPI_RGB = 1
        GPI_CMYK = 2
        GPI_HLS = 3
    end

"Opaque type used for the C bindings of the C++ GDALMajorObject class"
const GDALMajorObjectH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALDataset class"
const GDALDatasetH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALRasterBand class"
const GDALRasterBandH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALDriver class"
const GDALDriverH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALColorTable class"
const GDALColorTableH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALRasterAttributeTable class"
const GDALRasterAttributeTableH = Ptr{Cvoid}

"Opaque type used for the C bindings of the C++ GDALAsyncReader class"
const GDALAsyncReaderH = Ptr{Cvoid}

"Type to express pixel, line or band spacing"
const GSpacing = GIntBig

struct GDAL_GCP
    pszId::Cstring
    pszInfo::Cstring
    dfGCPPixel::Cdouble
    dfGCPLine::Cdouble
    dfGCPX::Cdouble
    dfGCPY::Cdouble
    dfGCPZ::Cdouble
end

"Type of functions to pass to GDALAddDerivedBandPixelFunc"
const GDALDerivedPixelFunc = Ptr{Cvoid}

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

struct GDALColorEntry
    c1::Int16
    c2::Int16
    c3::Int16
    c4::Int16
end

"Field type of raster attribute table"
@cenum GDALRATFieldType::UInt32 begin
        GFT_Integer = 0
        GFT_Real = 1
        GFT_String = 2
    end

"Field usage of raster attribute table"
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

"RAT table type (thematic or athematic)"
@cenum GDALRATTableType::UInt32 begin
        GRTT_THEMATIC = 0
        GRTT_ATHEMATIC = 1
    end

"! Enumeration to describe the tile organization"
@cenum GDALTileOrganization::UInt32 begin
        GTO_TIP = 0
        GTO_BIT = 1
        GTO_BSQ = 2
    end

const GDAL_GTI2_SIGNATURE = "GTI2"

const GDALTransformerFunc = Ptr{Cvoid}

struct GDALTransformerInfo
    abySignature::NTuple{4, GByte}
    pszClassName::Cstring
    pfnTransform::GDALTransformerFunc
    pfnCleanup::Ptr{Cvoid}
    pfnSerialize::Ptr{Cvoid}
    pfnCreateSimilar::Ptr{Cvoid}
end

"Contour writer callback type"
const GDALContourWriter = Ptr{Cvoid}

"Contour generator opaque type"
const GDALContourGeneratorH = Ptr{Cvoid}

struct OGRContourWriterInfo
    hLayer::Ptr{Cvoid}
    adfGeoTransform::NTuple{6, Cdouble}
    nElevField::Cint
    nElevFieldMin::Cint
    nElevFieldMax::Cint
    nIDField::Cint
    nNextID::Cint
end

"Gridding Algorithms"
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

struct GDALGridInverseDistanceToAPowerNearestNeighborOptions
    dfPower::Cdouble
    dfRadius::Cdouble
    dfSmoothing::Cdouble
    nMaxPoints::GUInt32
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

struct GDALGridMovingAverageOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

struct GDALGridNearestNeighborOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    dfNoDataValue::Cdouble
end

struct GDALGridDataMetricsOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

struct GDALGridLinearOptions
    dfRadius::Cdouble
    dfNoDataValue::Cdouble
end

"Grid context opaque type"
const GDALGridContext = Cvoid

struct GDALTriFacet
    anVertexIdx::NTuple{3, Cint}
    anNeighborIdx::NTuple{3, Cint}
end

struct GDALTriBarycentricCoefficients
    dfMul1X::Cdouble
    dfMul1Y::Cdouble
    dfMul2X::Cdouble
    dfMul2Y::Cdouble
    dfCstX::Cdouble
    dfCstY::Cdouble
end

struct GDALTriangulation
    nFacets::Cint
    pasFacets::Ptr{GDALTriFacet}
    pasFacetCoefficients::Ptr{GDALTriBarycentricCoefficients}
end

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
    end

@cenum GWKAverageOrModeAlg::UInt32 begin
        GWKAOM_Average = 1
        GWKAOM_Fmode = 2
        GWKAOM_Imode = 3
        GWKAOM_Max = 4
        GWKAOM_Min = 5
        GWKAOM_Quant = 6
    end

const GDALMaskFunc = Ptr{Cvoid}

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

"Opaque type representing a GDALWarpOperation object"
const GDALWarpOperationH = Ptr{Cvoid}

const FilterFuncType = Ptr{Cvoid}

const FilterFunc4ValuesType = Ptr{Cvoid}

"Special value to indicate that nodata is not set"
const VRT_NODATA_UNSET = -1234.56

"Type for a function that returns the pixel data in a provided window"
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

"Opaque type for a VRT dataset"
const VRTDatasetH = Ptr{Cvoid}

"Opaque type for a VRT sourced raster band"
const VRTSourcedRasterBandH = Ptr{Cvoid}

const GDALInfoOptions = Cvoid

"Opaque type"
const GDALInfoOptionsForBinary = Cvoid

const GDALTranslateOptions = Cvoid

"Opaque type"
const GDALTranslateOptionsForBinary = Cvoid

const GDALWarpAppOptions = Cvoid

"Opaque type"
const GDALWarpAppOptionsForBinary = Cvoid

const GDALVectorTranslateOptions = Cvoid

"Opaque type"
const GDALVectorTranslateOptionsForBinary = Cvoid

const GDALDEMProcessingOptions = Cvoid

"Opaque type"
const GDALDEMProcessingOptionsForBinary = Cvoid

const GDALNearblackOptions = Cvoid

"Opaque type"
const GDALNearblackOptionsForBinary = Cvoid

const GDALGridOptions = Cvoid

"Opaque type"
const GDALGridOptionsForBinary = Cvoid

"""
    GDALRasterizeOptions(char ** papszOptions,
                         int * pbAllTouched,
                         GDALBurnValueSrc * peBurnValueSource,
                         GDALRasterMergeAlg * peMergeAlg,
                         GDALRasterizeOptim * peOptim) -> CPLErr
"""
const GDALRasterizeOptions = Cvoid

"Opaque type"
const GDALRasterizeOptionsForBinary = Cvoid

const GDALBuildVRTOptions = Cvoid

"Opaque type"
const GDALBuildVRTOptionsForBinary = Cvoid

"Opaque type for a geometry"
const OGRGeometryH = Ptr{Cvoid}

"Opaque type for a spatial reference system"
const OGRSpatialReferenceH = Ptr{Cvoid}

"Opaque type for a coordinate transformation object"
const OGRCoordinateTransformationH = Ptr{Cvoid}

const _CPLXMLNode = Cvoid

"Opaque type for a field definition (OGRFieldDefn)"
const OGRFieldDefnH = Ptr{Cvoid}

"Opaque type for a feature definition (OGRFeatureDefn)"
const OGRFeatureDefnH = Ptr{Cvoid}

"Opaque type for a feature (OGRFeature)"
const OGRFeatureH = Ptr{Cvoid}

"Opaque type for a style table (OGRStyleTable)"
const OGRStyleTableH = Ptr{Cvoid}

const OGRGeomFieldDefnHS = Cvoid

"Opaque type for a geometry field definition (OGRGeomFieldDefn)"
const OGRGeomFieldDefnH = Ptr{OGRGeomFieldDefnHS}

"Opaque type for a layer (OGRLayer)"
const OGRLayerH = Ptr{Cvoid}

"Opaque type for a OGR datasource (OGRDataSource)"
const OGRDataSourceH = Ptr{Cvoid}

"Opaque type for a OGR driver (OGRSFDriver)"
const OGRSFDriverH = Ptr{Cvoid}

"Style manager opaque type"
const OGRStyleMgrH = Ptr{Cvoid}

"Style tool opaque type"
const OGRStyleToolH = Ptr{Cvoid}

"Success"
const OGRERR_NONE = 0

"Not enough data to deserialize"
const OGRERR_NOT_ENOUGH_DATA = 1

"Not enough memory"
const OGRERR_NOT_ENOUGH_MEMORY = 2

"Unsupported geometry type"
const OGRERR_UNSUPPORTED_GEOMETRY_TYPE = 3

"Unsupported operation"
const OGRERR_UNSUPPORTED_OPERATION = 4

"Corrupt data"
const OGRERR_CORRUPT_DATA = 5

"Failure"
const OGRERR_FAILURE = 6

"Unsupported SRS"
const OGRERR_UNSUPPORTED_SRS = 7

"Invalid handle"
const OGRERR_INVALID_HANDLE = 8

"Non existing feature"
const OGRERR_NON_EXISTING_FEATURE = 9

const wkb25DBit = 0x80000000

const ogrZMarker = 0x21125711

"Alter field name"
const ALTER_NAME_FLAG = 0x01

"Alter field type"
const ALTER_TYPE_FLAG = 0x02

"Alter field width and precision"
const ALTER_WIDTH_PRECISION_FLAG = 0x04

"Alter field NOT NULL constraint"
const ALTER_NULLABLE_FLAG = 0x08

"Alter field DEFAULT value"
const ALTER_DEFAULT_FLAG = 0x10

"Alter all parameters of field definition"
const ALTER_ALL_FLAG = (((ALTER_NAME_FLAG | ALTER_TYPE_FLAG) | ALTER_WIDTH_PRECISION_FLAG) | ALTER_NULLABLE_FLAG) | ALTER_DEFAULT_FLAG

"Validate that fields respect not-null constraints"
const OGR_F_VAL_NULL = 0x00000001

"Validate that geometries respect geometry column type"
const OGR_F_VAL_GEOM_TYPE = 0x00000002

"Validate that (string) fields respect field width"
const OGR_F_VAL_WIDTH = 0x00000004

"Allow fields that are null when there's an associated default value"
const OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT = 0x00000008

"Allow geometry fields to have a different coordinate dimension that their geometry column type"
const OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM = 0x00000010

"Special value for a unset FID"
const OGRNullFID = -1

"Special value set in OGRField.Set.nMarker1, nMarker2 and nMarker3 for a unset field"
const OGRUnsetMarker = -21121

"Special value set in OGRField.Set.nMarker1, nMarker2 and nMarker3 for a null field"
const OGRNullMarker = -21122

"Layer capability for random read"
const OLCRandomRead = "RandomRead"

"Layer capability for sequential write"
const OLCSequentialWrite = "SequentialWrite"

"Layer capability for random write"
const OLCRandomWrite = "RandomWrite"

"Layer capability for fast spatial filter"
const OLCFastSpatialFilter = "FastSpatialFilter"

"Layer capability for fast feature count retrieval"
const OLCFastFeatureCount = "FastFeatureCount"

"Layer capability for fast extent retrieval"
const OLCFastGetExtent = "FastGetExtent"

"Layer capability for field creation"
const OLCCreateField = "CreateField"

"Layer capability for field deletion"
const OLCDeleteField = "DeleteField"

"Layer capability for field reordering"
const OLCReorderFields = "ReorderFields"

"Layer capability for field alteration"
const OLCAlterFieldDefn = "AlterFieldDefn"

"Layer capability for transactions"
const OLCTransactions = "Transactions"

"Layer capability for feature deletion"
const OLCDeleteFeature = "DeleteFeature"

"Layer capability for setting next feature index"
const OLCFastSetNextByIndex = "FastSetNextByIndex"

"Layer capability for strings returned with UTF-8 encoding"
const OLCStringsAsUTF8 = "StringsAsUTF8"

"Layer capability for field ignoring"
const OLCIgnoreFields = "IgnoreFields"

"Layer capability for geometry field creation"
const OLCCreateGeomField = "CreateGeomField"

"Layer capability for curve geometries support"
const OLCCurveGeometries = "CurveGeometries"

"Layer capability for measured geometries support"
const OLCMeasuredGeometries = "MeasuredGeometries"

"Dataset capability for layer creation"
const ODsCCreateLayer = "CreateLayer"

"Dataset capability for layer deletion"
const ODsCDeleteLayer = "DeleteLayer"

"Dataset capability for geometry field creation support"
const ODsCCreateGeomFieldAfterCreateLayer = "CreateGeomFieldAfterCreateLayer"

"Dataset capability for curve geometries support"
const ODsCCurveGeometries = "CurveGeometries"

"Dataset capability for dataset transcations"
const ODsCTransactions = "Transactions"

"Dataset capability for emulated dataset transactions"
const ODsCEmulatedTransactions = "EmulatedTransactions"

"Dataset capability for measured geometries support"
const ODsCMeasuredGeometries = "MeasuredGeometries"

"Dataset capability for GetNextFeature() returning features from random layers"
const ODsCRandomLayerRead = "RandomLayerRead"

"Dataset capability for supporting CreateFeature on layer in random order"
const ODsCRandomLayerWrite = "RandomLayerWrite "

"Driver capability for datasource creation"
const ODrCCreateDataSource = "CreateDataSource"

"Driver capability for datasource deletion"
const ODrCDeleteDataSource = "DeleteDataSource"

"Capability set to YES as metadata on a layer that has features with 64 bit identifiers"
const OLMD_FID64 = "OLMD_FID64"

struct OGREnvelope
    MinX::Cdouble
    MaxX::Cdouble
    MinY::Cdouble
    MaxY::Cdouble
end

struct OGREnvelope3D
    MinX::Cdouble
    MaxX::Cdouble
    MinY::Cdouble
    MaxY::Cdouble
    MinZ::Cdouble
    MaxZ::Cdouble
end

"Simple container for a bounding region"
const OGRErr = Cint

"Type for a OGR boolean"
const OGRBoolean = Cint

"List of well known binary geometry types"
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
        wkbPoint25D = 2147483649
        wkbLineString25D = 2147483650
        wkbPolygon25D = 2147483651
        wkbMultiPoint25D = 2147483652
        wkbMultiLineString25D = 2147483653
        wkbMultiPolygon25D = 2147483654
        wkbGeometryCollection25D = 2147483655
    end

"Output variants of WKB we support"
@cenum OGRwkbVariant::UInt32 begin
        wkbVariantOldOgc = 0
        wkbVariantIso = 1
        wkbVariantPostGIS1 = 2
    end

"Enumeration to describe byte order"
@cenum OGRwkbByteOrder::UInt32 begin
        wkbXDR = 0
        wkbNDR = 1
    end

"List of feature field types"
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

"List of field subtypes"
@cenum OGRFieldSubType::UInt32 begin
        OFSTNone = 0
        OFSTBoolean = 1
        OFSTInt16 = 2
        OFSTFloat32 = 3
        OFSTJSON = 4
        OFSTMaxSubType = 4
    end

"Display justification for field values"
@cenum OGRJustification::UInt32 begin
        OJUndefined = 0
        OJLeft = 1
        OJRight = 2
    end

struct ANONYMOUS1_IntegerList
    nCount::Cint
    paList::Ptr{Cint}
end

struct OGRField
    IntegerList::ANONYMOUS1_IntegerList
end

"OGRStyleTool derived class types (returned by GetType())"
@cenum ogr_style_tool_class_id::UInt32 begin
        OGRSTCNone = 0
        OGRSTCPen = 1
        OGRSTCBrush = 2
        OGRSTCSymbol = 3
        OGRSTCLabel = 4
        OGRSTCVector = 5
    end

"OGRStyleTool derived class types (returned by GetType())"
const OGRSTClassId = ogr_style_tool_class_id

"List of units supported by OGRStyleTools"
@cenum ogr_style_tool_units_id::UInt32 begin
        OGRSTUGround = 0
        OGRSTUPixel = 1
        OGRSTUPoints = 2
        OGRSTUMM = 3
        OGRSTUCM = 4
        OGRSTUInches = 5
    end

"List of units supported by OGRStyleTools"
const OGRSTUnitId = ogr_style_tool_units_id

"List of parameters for use with OGRStylePen"
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

"List of parameters for use with OGRStylePen"
const OGRSTPenParam = ogr_style_tool_param_pen_id

"List of parameters for use with OGRStyleBrush"
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

"List of parameters for use with OGRStyleBrush"
const OGRSTBrushParam = ogr_style_tool_param_brush_id

"List of parameters for use with OGRStyleSymbol"
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

"List of parameters for use with OGRStyleSymbol"
const OGRSTSymbolParam = ogr_style_tool_param_symbol_id

"List of parameters for use with OGRStyleLabel"
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

"List of parameters for use with OGRStyleLabel"
const OGRSTLabelParam = ogr_style_tool_param_label_id

"WGS 84 geodetic (lat/long) WKT / EPSG:4326 with lat,long ordering"
const SRS_WKT_WGS84_LAT_LONG = "GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\",SPHEROID[\"WGS 84\",6378137,298.257223563,AUTHORITY[\"EPSG\",\"7030\"]],AUTHORITY[\"EPSG\",\"6326\"]],PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],UNIT[\"degree\",0.0174532925199433,AUTHORITY[\"EPSG\",\"9122\"]],AXIS[\"Latitude\",NORTH],AXIS[\"Longitude\",EAST],AUTHORITY[\"EPSG\",\"4326\"]]"

"Albers_Conic_Equal_Area projection"
const SRS_PT_ALBERS_CONIC_EQUAL_AREA = "Albers_Conic_Equal_Area"

"Azimuthal_Equidistant projection"
const SRS_PT_AZIMUTHAL_EQUIDISTANT = "Azimuthal_Equidistant"

"Cassini_Soldner projection"
const SRS_PT_CASSINI_SOLDNER = "Cassini_Soldner"

"Cylindrical_Equal_Area projection"
const SRS_PT_CYLINDRICAL_EQUAL_AREA = "Cylindrical_Equal_Area"

"Cylindrical_Equal_Area projection"
const SRS_PT_BONNE = "Bonne"

"Eckert_I projection"
const SRS_PT_ECKERT_I = "Eckert_I"

"Eckert_II projection"
const SRS_PT_ECKERT_II = "Eckert_II"

"Eckert_III projection"
const SRS_PT_ECKERT_III = "Eckert_III"

"Eckert_IV projection"
const SRS_PT_ECKERT_IV = "Eckert_IV"

"Eckert_V projection"
const SRS_PT_ECKERT_V = "Eckert_V"

"Eckert_VI projection"
const SRS_PT_ECKERT_VI = "Eckert_VI"

"Equidistant_Conic projection"
const SRS_PT_EQUIDISTANT_CONIC = "Equidistant_Conic"

"Equirectangular projection"
const SRS_PT_EQUIRECTANGULAR = "Equirectangular"

"Gall_Stereographic projection"
const SRS_PT_GALL_STEREOGRAPHIC = "Gall_Stereographic"

"Gauss_Schreiber_Transverse_Mercator projection"
const SRS_PT_GAUSSSCHREIBERTMERCATOR = "Gauss_Schreiber_Transverse_Mercator"

"Geostationary_Satellite projection"
const SRS_PT_GEOSTATIONARY_SATELLITE = "Geostationary_Satellite"

"Goode_Homolosine projection"
const SRS_PT_GOODE_HOMOLOSINE = "Goode_Homolosine"

"Interrupted_Goode_Homolosine projection"
const SRS_PT_IGH = "Interrupted_Goode_Homolosine"

"Gnomonic projection"
const SRS_PT_GNOMONIC = "Gnomonic"

"Hotine_Oblique_Mercator_Azimuth_Center projection"
const SRS_PT_HOTINE_OBLIQUE_MERCATOR_AZIMUTH_CENTER = "Hotine_Oblique_Mercator_Azimuth_Center"

"Hotine_Oblique_Mercator projection"
const SRS_PT_HOTINE_OBLIQUE_MERCATOR = "Hotine_Oblique_Mercator"

"Hotine_Oblique_Mercator_Two_Point_Natural_Origin projection"
const SRS_PT_HOTINE_OBLIQUE_MERCATOR_TWO_POINT_NATURAL_ORIGIN = "Hotine_Oblique_Mercator_Two_Point_Natural_Origin"

"Laborde_Oblique_Mercator projection"
const SRS_PT_LABORDE_OBLIQUE_MERCATOR = "Laborde_Oblique_Mercator"

"Lambert_Conformal_Conic_1SP projection"
const SRS_PT_LAMBERT_CONFORMAL_CONIC_1SP = "Lambert_Conformal_Conic_1SP"

"Lambert_Conformal_Conic_2SP projection"
const SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP = "Lambert_Conformal_Conic_2SP"

"Lambert_Conformal_Conic_2SP_Belgium projection"
const SRS_PT_LAMBERT_CONFORMAL_CONIC_2SP_BELGIUM = "Lambert_Conformal_Conic_2SP_Belgium"

"Lambert_Azimuthal_Equal_Area projection"
const SRS_PT_LAMBERT_AZIMUTHAL_EQUAL_AREA = "Lambert_Azimuthal_Equal_Area"

"Mercator_1SP projection"
const SRS_PT_MERCATOR_1SP = "Mercator_1SP"

"Mercator_2SP projection"
const SRS_PT_MERCATOR_2SP = "Mercator_2SP"

"Mercator_Auxiliary_Sphere is used used by ESRI to mean EPSG:3875"
const SRS_PT_MERCATOR_AUXILIARY_SPHERE = "Mercator_Auxiliary_Sphere"

"Miller_Cylindrical projection"
const SRS_PT_MILLER_CYLINDRICAL = "Miller_Cylindrical"

"Mollweide projection"
const SRS_PT_MOLLWEIDE = "Mollweide"

"New_Zealand_Map_Grid projection"
const SRS_PT_NEW_ZEALAND_MAP_GRID = "New_Zealand_Map_Grid"

"Oblique_Stereographic projection"
const SRS_PT_OBLIQUE_STEREOGRAPHIC = "Oblique_Stereographic"

"Orthographic projection"
const SRS_PT_ORTHOGRAPHIC = "Orthographic"

"Polar_Stereographic projection"
const SRS_PT_POLAR_STEREOGRAPHIC = "Polar_Stereographic"

"Polyconic projection"
const SRS_PT_POLYCONIC = "Polyconic"

"Robinson projection"
const SRS_PT_ROBINSON = "Robinson"

"Sinusoidal projection"
const SRS_PT_SINUSOIDAL = "Sinusoidal"

"Stereographic projection"
const SRS_PT_STEREOGRAPHIC = "Stereographic"

"Swiss_Oblique_Cylindrical projection"
const SRS_PT_SWISS_OBLIQUE_CYLINDRICAL = "Swiss_Oblique_Cylindrical"

"Transverse_Mercator projection"
const SRS_PT_TRANSVERSE_MERCATOR = "Transverse_Mercator"

"Transverse_Mercator_South_Orientated projection"
const SRS_PT_TRANSVERSE_MERCATOR_SOUTH_ORIENTED = "Transverse_Mercator_South_Orientated"

"Transverse_Mercator_MapInfo_21 projection"
const SRS_PT_TRANSVERSE_MERCATOR_MI_21 = "Transverse_Mercator_MapInfo_21"

"Transverse_Mercator_MapInfo_22 projection"
const SRS_PT_TRANSVERSE_MERCATOR_MI_22 = "Transverse_Mercator_MapInfo_22"

"Transverse_Mercator_MapInfo_23 projection"
const SRS_PT_TRANSVERSE_MERCATOR_MI_23 = "Transverse_Mercator_MapInfo_23"

"Transverse_Mercator_MapInfo_24 projection"
const SRS_PT_TRANSVERSE_MERCATOR_MI_24 = "Transverse_Mercator_MapInfo_24"

"Transverse_Mercator_MapInfo_25 projection"
const SRS_PT_TRANSVERSE_MERCATOR_MI_25 = "Transverse_Mercator_MapInfo_25"

"Tunisia_Mining_Grid projection"
const SRS_PT_TUNISIA_MINING_GRID = "Tunisia_Mining_Grid"

"Two_Point_Equidistant projection"
const SRS_PT_TWO_POINT_EQUIDISTANT = "Two_Point_Equidistant"

"VanDerGrinten projection"
const SRS_PT_VANDERGRINTEN = "VanDerGrinten"

"Krovak projection"
const SRS_PT_KROVAK = "Krovak"

"International_Map_of_the_World_Polyconic projection"
const SRS_PT_IMW_POLYCONIC = "International_Map_of_the_World_Polyconic"

"Wagner_I projection"
const SRS_PT_WAGNER_I = "Wagner_I"

"Wagner_II projection"
const SRS_PT_WAGNER_II = "Wagner_II"

"Wagner_III projection"
const SRS_PT_WAGNER_III = "Wagner_III"

"Wagner_IV projection"
const SRS_PT_WAGNER_IV = "Wagner_IV"

"Wagner_V projection"
const SRS_PT_WAGNER_V = "Wagner_V"

"Wagner_VI projection"
const SRS_PT_WAGNER_VI = "Wagner_VI"

"Wagner_VII projection"
const SRS_PT_WAGNER_VII = "Wagner_VII"

"Quadrilateralized_Spherical_Cube projection"
const SRS_PT_QSC = "Quadrilateralized_Spherical_Cube"

"Aitoff projection"
const SRS_PT_AITOFF = "Aitoff"

"Winkel_I projection"
const SRS_PT_WINKEL_I = "Winkel_I"

"Winkel_II projection"
const SRS_PT_WINKEL_II = "Winkel_II"

"Winkel_Tripel projection"
const SRS_PT_WINKEL_TRIPEL = "Winkel_Tripel"

"Craster_Parabolic projection"
const SRS_PT_CRASTER_PARABOLIC = "Craster_Parabolic"

"Loximuthal projection"
const SRS_PT_LOXIMUTHAL = "Loximuthal"

"Quartic_Authalic projection"
const SRS_PT_QUARTIC_AUTHALIC = "Quartic_Authalic"

"Spherical_Cross_Track_Height projection"
const SRS_PT_SCH = "Spherical_Cross_Track_Height"

"central_meridian projection parameter"
const SRS_PP_CENTRAL_MERIDIAN = "central_meridian"

"scale_factor projection parameter"
const SRS_PP_SCALE_FACTOR = "scale_factor"

"standard_parallel_1 projection parameter"
const SRS_PP_STANDARD_PARALLEL_1 = "standard_parallel_1"

"standard_parallel_2 projection parameter"
const SRS_PP_STANDARD_PARALLEL_2 = "standard_parallel_2"

"pseudo_standard_parallel_1 projection parameter"
const SRS_PP_PSEUDO_STD_PARALLEL_1 = "pseudo_standard_parallel_1"

"longitude_of_center projection parameter"
const SRS_PP_LONGITUDE_OF_CENTER = "longitude_of_center"

"latitude_of_center projection parameter"
const SRS_PP_LATITUDE_OF_CENTER = "latitude_of_center"

"longitude_of_origin projection parameter"
const SRS_PP_LONGITUDE_OF_ORIGIN = "longitude_of_origin"

"latitude_of_origin projection parameter"
const SRS_PP_LATITUDE_OF_ORIGIN = "latitude_of_origin"

"false_easting projection parameter"
const SRS_PP_FALSE_EASTING = "false_easting"

"false_northing projection parameter"
const SRS_PP_FALSE_NORTHING = "false_northing"

"azimuth projection parameter"
const SRS_PP_AZIMUTH = "azimuth"

"longitude_of_point_1 projection parameter"
const SRS_PP_LONGITUDE_OF_POINT_1 = "longitude_of_point_1"

"latitude_of_point_1 projection parameter"
const SRS_PP_LATITUDE_OF_POINT_1 = "latitude_of_point_1"

"longitude_of_point_2 projection parameter"
const SRS_PP_LONGITUDE_OF_POINT_2 = "longitude_of_point_2"

"latitude_of_point_2 projection parameter"
const SRS_PP_LATITUDE_OF_POINT_2 = "latitude_of_point_2"

"longitude_of_point_3 projection parameter"
const SRS_PP_LONGITUDE_OF_POINT_3 = "longitude_of_point_3"

"latitude_of_point_3 projection parameter"
const SRS_PP_LATITUDE_OF_POINT_3 = "latitude_of_point_3"

"rectified_grid_angle projection parameter"
const SRS_PP_RECTIFIED_GRID_ANGLE = "rectified_grid_angle"

"landsat_number projection parameter"
const SRS_PP_LANDSAT_NUMBER = "landsat_number"

"path_number projection parameter"
const SRS_PP_PATH_NUMBER = "path_number"

"perspective_point_height projection parameter"
const SRS_PP_PERSPECTIVE_POINT_HEIGHT = "perspective_point_height"

"satellite_height projection parameter"
const SRS_PP_SATELLITE_HEIGHT = "satellite_height"

"fipszone projection parameter"
const SRS_PP_FIPSZONE = "fipszone"

"zone projection parameter"
const SRS_PP_ZONE = "zone"

"Latitude_Of_1st_Point projection parameter"
const SRS_PP_LATITUDE_OF_1ST_POINT = "Latitude_Of_1st_Point"

"Longitude_Of_1st_Point projection parameter"
const SRS_PP_LONGITUDE_OF_1ST_POINT = "Longitude_Of_1st_Point"

"Latitude_Of_2nd_Point projection parameter"
const SRS_PP_LATITUDE_OF_2ND_POINT = "Latitude_Of_2nd_Point"

"Longitude_Of_2nd_Point projection parameter"
const SRS_PP_LONGITUDE_OF_2ND_POINT = "Longitude_Of_2nd_Point"

"peg_point_latitude projection parameter"
const SRS_PP_PEG_POINT_LATITUDE = "peg_point_latitude"

"peg_point_longitude projection parameter"
const SRS_PP_PEG_POINT_LONGITUDE = "peg_point_longitude"

"peg_point_heading projection parameter"
const SRS_PP_PEG_POINT_HEADING = "peg_point_heading"

"peg_point_height projection parameter"
const SRS_PP_PEG_POINT_HEIGHT = "peg_point_height"

"Linear unit Meter"
const SRS_UL_METER = "Meter"

"Linear unit Foot (International)"
const SRS_UL_FOOT = "Foot (International)"

"Linear unit Foot (International) conversion factor to meter"
const SRS_UL_FOOT_CONV = "0.3048"

"Linear unit Foot"
const SRS_UL_US_FOOT = "Foot_US"

"Linear unit Foot conversion factor to meter"
const SRS_UL_US_FOOT_CONV = "0.3048006096012192"

"Linear unit Nautical Mile"
const SRS_UL_NAUTICAL_MILE = "Nautical Mile"

"Linear unit Nautical Mile conversion factor to meter"
const SRS_UL_NAUTICAL_MILE_CONV = "1852.0"

"Linear unit Link"
const SRS_UL_LINK = "Link"

"Linear unit Link conversion factor to meter"
const SRS_UL_LINK_CONV = "0.20116684023368047"

"Linear unit Chain"
const SRS_UL_CHAIN = "Chain"

"Linear unit Chain conversion factor to meter"
const SRS_UL_CHAIN_CONV = "20.116684023368047"

"Linear unit Rod"
const SRS_UL_ROD = "Rod"

"Linear unit Rod conversion factor to meter"
const SRS_UL_ROD_CONV = "5.02921005842012"

"Linear unit Link_Clarke"
const SRS_UL_LINK_Clarke = "Link_Clarke"

"Linear unit Link_Clarke conversion factor to meter"
const SRS_UL_LINK_Clarke_CONV = "0.2011661949"

"Linear unit Kilometer"
const SRS_UL_KILOMETER = "Kilometer"

"Linear unit Kilometer conversion factor to meter"
const SRS_UL_KILOMETER_CONV = "1000."

"Linear unit Decimeter"
const SRS_UL_DECIMETER = "Decimeter"

"Linear unit Decimeter conversion factor to meter"
const SRS_UL_DECIMETER_CONV = "0.1"

"Linear unit Decimeter"
const SRS_UL_CENTIMETER = "Centimeter"

"Linear unit Decimeter conversion factor to meter"
const SRS_UL_CENTIMETER_CONV = "0.01"

"Linear unit Millimeter"
const SRS_UL_MILLIMETER = "Millimeter"

"Linear unit Millimeter conversion factor to meter"
const SRS_UL_MILLIMETER_CONV = "0.001"

"Linear unit Nautical_Mile_International"
const SRS_UL_INTL_NAUT_MILE = "Nautical_Mile_International"

"Linear unit Nautical_Mile_International conversion factor to meter"
const SRS_UL_INTL_NAUT_MILE_CONV = "1852.0"

"Linear unit Inch_International"
const SRS_UL_INTL_INCH = "Inch_International"

"Linear unit Inch_International conversion factor to meter"
const SRS_UL_INTL_INCH_CONV = "0.0254"

"Linear unit Foot_International"
const SRS_UL_INTL_FOOT = "Foot_International"

"Linear unit Foot_International conversion factor to meter"
const SRS_UL_INTL_FOOT_CONV = "0.3048"

"Linear unit Yard_International"
const SRS_UL_INTL_YARD = "Yard_International"

"Linear unit Yard_International conversion factor to meter"
const SRS_UL_INTL_YARD_CONV = "0.9144"

"Linear unit Statute_Mile_International"
const SRS_UL_INTL_STAT_MILE = "Statute_Mile_International"

"Linear unit Statute_Mile_Internationalconversion factor to meter"
const SRS_UL_INTL_STAT_MILE_CONV = "1609.344"

"Linear unit Fathom_International"
const SRS_UL_INTL_FATHOM = "Fathom_International"

"Linear unit Fathom_International conversion factor to meter"
const SRS_UL_INTL_FATHOM_CONV = "1.8288"

"Linear unit Chain_International"
const SRS_UL_INTL_CHAIN = "Chain_International"

"Linear unit Chain_International conversion factor to meter"
const SRS_UL_INTL_CHAIN_CONV = "20.1168"

"Linear unit Link_International"
const SRS_UL_INTL_LINK = "Link_International"

"Linear unit Link_International conversion factor to meter"
const SRS_UL_INTL_LINK_CONV = "0.201168"

"Linear unit Inch_US_Surveyor"
const SRS_UL_US_INCH = "Inch_US_Surveyor"

"Linear unit Inch_US_Surveyor conversion factor to meter"
const SRS_UL_US_INCH_CONV = "0.025400050800101603"

"Linear unit Yard_US_Surveyor"
const SRS_UL_US_YARD = "Yard_US_Surveyor"

"Linear unit Yard_US_Surveyor conversion factor to meter"
const SRS_UL_US_YARD_CONV = "0.914401828803658"

"Linear unit Chain_US_Surveyor"
const SRS_UL_US_CHAIN = "Chain_US_Surveyor"

"Linear unit Chain_US_Surveyor conversion factor to meter"
const SRS_UL_US_CHAIN_CONV = "20.11684023368047"

"Linear unit Statute_Mile_US_Surveyor"
const SRS_UL_US_STAT_MILE = "Statute_Mile_US_Surveyor"

"Linear unit Statute_Mile_US_Surveyor conversion factor to meter"
const SRS_UL_US_STAT_MILE_CONV = "1609.347218694437"

"Linear unit Yard_Indian"
const SRS_UL_INDIAN_YARD = "Yard_Indian"

"Linear unit Yard_Indian conversion factor to meter"
const SRS_UL_INDIAN_YARD_CONV = "0.91439523"

"Linear unit Foot_Indian"
const SRS_UL_INDIAN_FOOT = "Foot_Indian"

"Linear unit Foot_Indian conversion factor to meter"
const SRS_UL_INDIAN_FOOT_CONV = "0.30479841"

"Linear unit Chain_Indian"
const SRS_UL_INDIAN_CHAIN = "Chain_Indian"

"Linear unit Chain_Indian conversion factor to meter"
const SRS_UL_INDIAN_CHAIN_CONV = "20.11669506"

"Angular unit degree"
const SRS_UA_DEGREE = "degree"

"Angular unit degree conversion factor to radians"
const SRS_UA_DEGREE_CONV = "0.0174532925199433"

"Angular unit radian"
const SRS_UA_RADIAN = "radian"

"Prime meridian Greenwich"
const SRS_PM_GREENWICH = "Greenwich"

"North_American_Datum_1927 datum name"
const SRS_DN_NAD27 = "North_American_Datum_1927"

"North_American_Datum_1983 datum name"
const SRS_DN_NAD83 = "North_American_Datum_1983"

"WGS_1972 datum name"
const SRS_DN_WGS72 = "WGS_1972"

"WGS_1984 datum name"
const SRS_DN_WGS84 = "WGS_1984"

"Semi-major axis of the WGS84 ellipsoid"
const SRS_WGS84_SEMIMAJOR = 6.378137e6

"Inverse flattening of the WGS84 ellipsoid"
const SRS_WGS84_INVFLATTENING = 298.257223563

"Axis orientations (corresponds to CS_AxisOrientationEnum)"
@cenum OGRAxisOrientation::UInt32 begin
        OAO_Other = 0
        OAO_North = 1
        OAO_South = 2
        OAO_East = 3
        OAO_West = 4
        OAO_Up = 5
        OAO_Down = 6
    end

"Data axis to CRS axis mapping strategy"
@cenum OSRAxisMappingStrategy::UInt32 begin
        OAMS_TRADITIONAL_GIS_ORDER = 0
        OAMS_AUTHORITY_COMPLIANT = 1
        OAMS_CUSTOM = 2
    end

"Type of Coordinate Reference System (CRS)"
@cenum OSRCRSType::UInt32 begin
        OSR_CRS_TYPE_GEOGRAPHIC_2D = 0
        OSR_CRS_TYPE_GEOGRAPHIC_3D = 1
        OSR_CRS_TYPE_GEOCENTRIC = 2
        OSR_CRS_TYPE_PROJECTED = 3
        OSR_CRS_TYPE_VERTICAL = 4
        OSR_CRS_TYPE_COMPOUND = 5
        OSR_CRS_TYPE_OTHER = 6
    end

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

"Structure to describe optional parameters to OSRGetCRSInfoListFromDatabase()"
const OSRCRSListParameters = Cvoid

"""
    OGRCoordinateTransformationOptions() -> 

Constructs a new OGRCoordinateTransformationOptions.
"""
const OGRCoordinateTransformationOptions = Cvoid

"Coordinate transformation options"
const OGRCoordinateTransformationOptionsH = Ptr{OGRCoordinateTransformationOptions}
