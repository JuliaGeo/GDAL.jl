# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat

typealias OGRGeometryH Ptr{Void}
typealias OGRSpatialReferenceH Ptr{Void}
typealias OGRCoordinateTransformationH Ptr{Void}

type _CPLXMLNode
end

typealias OGRFieldDefnH Ptr{Void}
typealias OGRFeatureDefnH Ptr{Void}
typealias OGRFeatureH Ptr{Void}
typealias OGRStyleTableH Ptr{Void}

type OGRGeomFieldDefnHS
end

typealias OGRGeomFieldDefnH Ptr{OGRGeomFieldDefnHS}
typealias OGRLayerH Ptr{Void}
typealias OGRDataSourceH Ptr{Void}
typealias OGRSFDriverH Ptr{Void}
typealias OGRStyleMgrH Ptr{Void}
typealias OGRStyleToolH Ptr{Void}

const RASTERIO_EXTRA_ARG_CURRENT_VERSION = 1

# Skipping MacroDefinition: INIT_RASTERIO_EXTRA_ARG ( s ) do { ( s ) . nVersion = RASTERIO_EXTRA_ARG_CURRENT_VERSION ; ( s ) . eResampleAlg = GRIORA_NearestNeighbour ; ( s ) . pfnProgress = NULL ; ( s ) . pProgressData = NULL ; ( s ) . bFloatingPointWindowValidity = FALSE ; } while ( 0 )

const GDALMD_AREA_OR_POINT = "AREA_OR_POINT"
const GDALMD_AOP_AREA = "Area"
const GDALMD_AOP_POINT = "Point"
const CPLE_WrongFormat = 200
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
const GDAL_DCAP_NOTNULL_FIELDS = "DCAP_NOTNULL_FIELDS"
const GDAL_DCAP_DEFAULT_FIELDS = "DCAP_DEFAULT_FIELDS"
const GDAL_DCAP_NOTNULL_GEOMFIELDS = "DCAP_NOTNULL_GEOMFIELDS"
const GDAL_OF_READONLY = 0x00
const GDAL_OF_UPDATE = 0x01
const GDAL_OF_ALL = 0x00
const GDAL_OF_RASTER = 0x02
const GDAL_OF_VECTOR = 0x04
const GDAL_OF_KIND_MASK = 0x1e
const GDAL_OF_SHARED = 0x20
const GDAL_OF_VERBOSE_ERROR = 0x40
const GDAL_OF_INTERNAL = 0x80
const GDAL_DS_LAYER_CREATIONOPTIONLIST = "DS_LAYER_CREATIONOPTIONLIST"

# Skipping MacroDefinition: SRCVAL ( papoSource , eSrcType , ii ) ( eSrcType == GDT_Byte ? ( ( GByte * ) papoSource ) [ ii ] : ( eSrcType == GDT_Float32 ? ( ( float * ) papoSource ) [ ii ] : ( eSrcType == GDT_Float64 ? ( ( double * ) papoSource ) [ ii ] : ( eSrcType == GDT_Int32 ? ( ( GInt32 * ) papoSource ) [ ii ] : ( eSrcType == GDT_UInt16 ? ( ( GUInt16 * ) papoSource ) [ ii ] : ( eSrcType == GDT_Int16 ? ( ( GInt16 * ) papoSource ) [ ii ] : ( eSrcType == GDT_UInt32 ? ( ( GUInt32 * ) papoSource ) [ ii ] : ( eSrcType == GDT_CInt16 ? ( ( GInt16 * ) papoSource ) [ ii * 2 ] : ( eSrcType == GDT_CInt32 ? ( ( GInt32 * ) papoSource ) [ ii * 2 ] : ( eSrcType == GDT_CFloat32 ? ( ( float * ) papoSource ) [ ii * 2 ] : ( eSrcType == GDT_CFloat64 ? ( ( double * ) papoSource ) [ ii * 2 ] : 0 ) ) ) ) ) ) ) ) ) ) )

const GMF_ALL_VALID = 0x01
const GMF_PER_DATASET = 0x02
const GMF_ALPHA = 0x04
const GMF_NODATA = 0x08

# begin enum ANONYMOUS_1
typealias ANONYMOUS_1 UInt32
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
# end enum ANONYMOUS_1

# begin enum GDALDataType
typealias GDALDataType UInt32
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
# end enum GDALDataType

# begin enum ANONYMOUS_2
typealias ANONYMOUS_2 UInt32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_2

# begin enum GDALAsyncStatusType
typealias GDALAsyncStatusType UInt32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum GDALAsyncStatusType

# begin enum ANONYMOUS_3
typealias ANONYMOUS_3 UInt32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_3

# begin enum GDALAccess
typealias GDALAccess UInt32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum GDALAccess

# begin enum ANONYMOUS_4
typealias ANONYMOUS_4 UInt32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_4

# begin enum GDALRWFlag
typealias GDALRWFlag UInt32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum GDALRWFlag

# begin enum ANONYMOUS_5
typealias ANONYMOUS_5 UInt32
const GRIORA_NearestNeighbour = (UInt32)(0)
const GRIORA_Bilinear = (UInt32)(1)
const GRIORA_Cubic = (UInt32)(2)
const GRIORA_CubicSpline = (UInt32)(3)
const GRIORA_Lanczos = (UInt32)(4)
const GRIORA_Average = (UInt32)(5)
const GRIORA_Mode = (UInt32)(6)
const GRIORA_Gauss = (UInt32)(7)
# end enum ANONYMOUS_5

# begin enum GDALRIOResampleAlg
typealias GDALRIOResampleAlg UInt32
const GRIORA_NearestNeighbour = (UInt32)(0)
const GRIORA_Bilinear = (UInt32)(1)
const GRIORA_Cubic = (UInt32)(2)
const GRIORA_CubicSpline = (UInt32)(3)
const GRIORA_Lanczos = (UInt32)(4)
const GRIORA_Average = (UInt32)(5)
const GRIORA_Mode = (UInt32)(6)
const GRIORA_Gauss = (UInt32)(7)
# end enum GDALRIOResampleAlg

type GDALRasterIOExtraArg
    nVersion::Cint
    eResampleAlg::GDALRIOResampleAlg
    pfnProgress::GDALProgressFunc
    pProgressData::Ptr{Void}
    bFloatingPointWindowValidity::Cint
    dfXOff::Cdouble
    dfYOff::Cdouble
    dfXSize::Cdouble
    dfYSize::Cdouble
end

# begin enum ANONYMOUS_6
typealias ANONYMOUS_6 UInt32
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
# end enum ANONYMOUS_6

# begin enum GDALColorInterp
typealias GDALColorInterp UInt32
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
# end enum GDALColorInterp

# begin enum ANONYMOUS_7
typealias ANONYMOUS_7 UInt32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_7

# begin enum GDALPaletteInterp
typealias GDALPaletteInterp UInt32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum GDALPaletteInterp

typealias GDALMajorObjectH Ptr{Void}
typealias GDALDatasetH Ptr{Void}
typealias GDALRasterBandH Ptr{Void}
typealias GDALDriverH Ptr{Void}
typealias GDALColorTableH Ptr{Void}
typealias GDALRasterAttributeTableH Ptr{Void}
typealias GDALAsyncReaderH Ptr{Void}
typealias GSpacing GIntBig

type GDAL_GCP
    pszId::Ptr{UInt8}
    pszInfo::Ptr{UInt8}
    dfGCPPixel::Cdouble
    dfGCPLine::Cdouble
    dfGCPX::Cdouble
    dfGCPY::Cdouble
    dfGCPZ::Cdouble
end

typealias GDALDerivedPixelFunc Ptr{Void}

immutable Array_2_Cdouble
    d1::Cdouble
    d2::Cdouble
end

zero(::Type{Array_2_Cdouble}) = begin  # /home/martijn/.julia/v0.4/Clang/src/wrap_c.jl, line 267:
        Array_2_Cdouble(fill(zero(Cdouble),2)...)
    end

immutable Array_20_Cdouble
    d1::Cdouble
    d2::Cdouble
    d3::Cdouble
    d4::Cdouble
    d5::Cdouble
    d6::Cdouble
    d7::Cdouble
    d8::Cdouble
    d9::Cdouble
    d10::Cdouble
    d11::Cdouble
    d12::Cdouble
    d13::Cdouble
    d14::Cdouble
    d15::Cdouble
    d16::Cdouble
    d17::Cdouble
    d18::Cdouble
    d19::Cdouble
    d20::Cdouble
end

zero(::Type{Array_20_Cdouble}) = begin  # /home/martijn/.julia/v0.4/Clang/src/wrap_c.jl, line 267:
        Array_20_Cdouble(fill(zero(Cdouble),20)...)
    end

type GDALRPCInfo
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
    adfLINE_NUM_COEFF::Array_20_Cdouble
    adfLINE_DEN_COEFF::Array_20_Cdouble
    adfSAMP_NUM_COEFF::Array_20_Cdouble
    adfSAMP_DEN_COEFF::Array_20_Cdouble
    dfMIN_LONG::Cdouble
    dfMIN_LAT::Cdouble
    dfMAX_LONG::Cdouble
    dfMAX_LAT::Cdouble
end

type GDALColorEntry
    c1::Int16
    c2::Int16
    c3::Int16
    c4::Int16
end

# begin enum ANONYMOUS_8
typealias ANONYMOUS_8 UInt32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_8

# begin enum GDALRATFieldType
typealias GDALRATFieldType UInt32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum GDALRATFieldType

# begin enum ANONYMOUS_9
typealias ANONYMOUS_9 UInt32
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
# end enum ANONYMOUS_9

# begin enum GDALRATFieldUsage
typealias GDALRATFieldUsage UInt32
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
# end enum GDALRATFieldUsage

# begin enum ANONYMOUS_10
typealias ANONYMOUS_10 UInt32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_10

# begin enum GDALTileOrganization
typealias GDALTileOrganization UInt32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum GDALTileOrganization
