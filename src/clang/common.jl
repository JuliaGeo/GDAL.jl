# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat

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

const GDAL_GTI2_SIGNATURE = "GTI2"

typealias GDALTransformerFunc Ptr{Void}

immutable Array_4_GByte
    d1::GByte
    d2::GByte
    d3::GByte
    d4::GByte
end

zero(::Type{Array_4_GByte}) = begin  # /home/martijn/.julia/v0.4/Clang/src/wrap_c.jl, line 267:
        Array_4_GByte(fill(zero(GByte),4)...)
    end

type GDALTransformerInfo
    abySignature::Array_4_GByte
    pszClassName::Ptr{UInt8}
    pfnTransform::GDALTransformerFunc
    pfnCleanup::Ptr{Void}
    pfnSerialize::Ptr{Void}
    pfnCreateSimilar::Ptr{Void}
end

typealias GDALContourWriter Ptr{Void}
typealias GDALContourGeneratorH Ptr{Void}

immutable Array_6_Cdouble
    d1::Cdouble
    d2::Cdouble
    d3::Cdouble
    d4::Cdouble
    d5::Cdouble
    d6::Cdouble
end

zero(::Type{Array_6_Cdouble}) = begin  # /home/martijn/.julia/v0.4/Clang/src/wrap_c.jl, line 267:
        Array_6_Cdouble(fill(zero(Cdouble),6)...)
    end

type OGRContourWriterInfo
    hLayer::Ptr{Void}
    adfGeoTransform::Array_6_Cdouble
    nElevField::Cint
    nIDField::Cint
    nNextID::Cint
end

# begin enum ANONYMOUS_11
typealias ANONYMOUS_11 UInt32
const GGA_InverseDistanceToAPower = (UInt32)(1)
const GGA_MovingAverage = (UInt32)(2)
const GGA_NearestNeighbor = (UInt32)(3)
const GGA_MetricMinimum = (UInt32)(4)
const GGA_MetricMaximum = (UInt32)(5)
const GGA_MetricRange = (UInt32)(6)
const GGA_MetricCount = (UInt32)(7)
const GGA_MetricAverageDistance = (UInt32)(8)
const GGA_MetricAverageDistancePts = (UInt32)(9)
# end enum ANONYMOUS_11

# begin enum GDALGridAlgorithm
typealias GDALGridAlgorithm UInt32
const GGA_InverseDistanceToAPower = (UInt32)(1)
const GGA_MovingAverage = (UInt32)(2)
const GGA_NearestNeighbor = (UInt32)(3)
const GGA_MetricMinimum = (UInt32)(4)
const GGA_MetricMaximum = (UInt32)(5)
const GGA_MetricRange = (UInt32)(6)
const GGA_MetricCount = (UInt32)(7)
const GGA_MetricAverageDistance = (UInt32)(8)
const GGA_MetricAverageDistancePts = (UInt32)(9)
# end enum GDALGridAlgorithm

type GDALGridInverseDistanceToAPowerOptions
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

type GDALGridMovingAverageOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

type GDALGridNearestNeighborOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    dfNoDataValue::Cdouble
end

type GDALGridDataMetricsOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

const SRS_WKT_WGS84 = "GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\",SPHEROID[\"WGS 84\",6378137,298.257223563,AUTHORITY[\"EPSG\",\"7030\"]],TOWGS84[0,0,0,0,0,0,0],AUTHORITY[\"EPSG\",\"6326\"]],PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],UNIT[\"degree\",0.0174532925199433,AUTHORITY[\"EPSG\",\"9108\"]],AUTHORITY[\"EPSG\",\"4326\"]]"
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

# begin enum ANONYMOUS_12
typealias ANONYMOUS_12 UInt32
const OAO_Other = (UInt32)(0)
const OAO_North = (UInt32)(1)
const OAO_South = (UInt32)(2)
const OAO_East = (UInt32)(3)
const OAO_West = (UInt32)(4)
const OAO_Up = (UInt32)(5)
const OAO_Down = (UInt32)(6)
# end enum ANONYMOUS_12

# begin enum OGRAxisOrientation
typealias OGRAxisOrientation UInt32
const OAO_Other = (UInt32)(0)
const OAO_North = (UInt32)(1)
const OAO_South = (UInt32)(2)
const OAO_East = (UInt32)(3)
const OAO_West = (UInt32)(4)
const OAO_Up = (UInt32)(5)
const OAO_Down = (UInt32)(6)
# end enum OGRAxisOrientation

# begin enum ANONYMOUS_13
typealias ANONYMOUS_13 UInt32
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
# end enum ANONYMOUS_13

# begin enum OGRDatumType
typealias OGRDatumType UInt32
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
# end enum OGRDatumType
