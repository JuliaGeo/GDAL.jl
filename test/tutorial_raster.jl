# Tests based on the Raster API tutorial found at http://gdal.org/gdal_tutorial.html

using GDAL

utmsmall = joinpath(@__DIR__, "data/utmsmall.tif")
utmsmall_copy = joinpath(@__DIR__, "tmp/utmsmall.tif")

# needed to actually load tifs
GDAL.gdalallregister()

# Opening the File
dataset = GDAL.gdalopen(utmsmall, GDAL.GA_ReadOnly) # file from GDAL SVN


# Getting Dataset Information
driver = GDAL.gdalgetdriverbyname("GTiff")
@test GDAL.gdalgetdrivershortname(driver) == "GTiff"
@test GDAL.gdalgetdriverlongname(driver) == "GeoTIFF"

@test GDAL.gdalgetrasterxsize(dataset) == 100
@test GDAL.gdalgetrasterysize(dataset) == 100
@test GDAL.gdalgetrastercount(dataset) == 1
nad27_prefix = "PROJCS[\"NAD27 / UTM zone 11N\",GEOGCS[\"NAD27\",DATUM[\"North_American_Datum_1927\","
@test startswith(GDAL.gdalgetprojectionref(dataset), nad27_prefix)

geotransform = fill(0.0, 6)
GDAL.gdalgetgeotransform(dataset, geotransform)
@test geotransform == [440720.0,60.0,0.0,3.75132e6,0.0,-60.0]


# Fetching a Raster Band
band = GDAL.gdalgetrasterband(dataset, 1)

blockxsize, blockysize = Ref(Cint(-1)), Ref(Cint(-1))
GDAL.gdalgetblocksize(band, blockxsize, blockysize)
@test blockxsize[] == 100
@test blockysize[] == 81

@test GDAL.gdalgetdatatypename(GDAL.gdalgetrasterdatatype(band)) == "Byte"
@test GDAL.gdalgetcolorinterpretationname(GDAL.gdalgetrastercolorinterpretation(band)) == "Gray"

gotmin, gotmax = Ref(Cint(-1)), Ref(Cint(-1))
@test GDAL.gdalgetrasterminimum(band, gotmin) == 0.0
@test GDAL.gdalgetrastermaximum(band, gotmax) == 255.0
@test gotmin[] == gotmax[] == 0

@test GDAL.gdalgetoverviewcount(band) == 0
# note that if there is no raster color table, no error (C_None) is set by GDAL
# so there is no GDALError thrown here
@test GDAL.gdalgetrastercolortable(band) == C_NULL


# Reading Raster Data
xsize = GDAL.gdalgetrasterbandxsize(band)
@test xsize == 100
scanline = fill(0.0f0, xsize)
GDAL.gdalrasterio(band, GDAL.GF_Read, 0, 0, xsize, 1,
              scanline, xsize, 1, GDAL.GDT_Float32, 0, 0)
@test scanline == Float32[107.0f0,123.0f0,132.0f0,115.0f0,132.0f0,132.0f0,140.0f0,132.0f0,132.0f0,132.0f0,107.0f0,132.0f0,107.0f0,132.0f0,132.0f0,107.0f0,123.0f0,115.0f0,156.0f0,148.0f0,107.0f0,132.0f0,107.0f0,115.0f0,99.0f0,123.0f0,99.0f0,74.0f0,115.0f0,82.0f0,115.0f0,115.0f0,107.0f0,123.0f0,123.0f0,99.0f0,123.0f0,123.0f0,115.0f0,115.0f0,107.0f0,90.0f0,99.0f0,107.0f0,107.0f0,99.0f0,123.0f0,107.0f0,140.0f0,123.0f0,123.0f0,115.0f0,99.0f0,132.0f0,123.0f0,115.0f0,115.0f0,123.0f0,132.0f0,115.0f0,123.0f0,132.0f0,214.0f0,156.0f0,165.0f0,148.0f0,115.0f0,148.0f0,156.0f0,148.0f0,140.0f0,165.0f0,156.0f0,197.0f0,156.0f0,197.0f0,140.0f0,173.0f0,156.0f0,165.0f0,148.0f0,156.0f0,206.0f0,214.0f0,181.0f0,206.0f0,173.0f0,222.0f0,206.0f0,255.0f0,214.0f0,173.0f0,214.0f0,255.0f0,214.0f0,247.0f0,255.0f0,230.0f0,206.0f0,197.0f0]


# Closing the Dataset
GDAL.gdalclose(dataset)


# Techniques for Creating Files
@test GDAL.gdalgetmetadataitem(driver, "DCAP_CREATE", "") == "YES"
@test GDAL.gdalgetmetadataitem(driver, "DCAP_CREATECOPY", "") == "YES"


# Using CreateCopy()
ds_src = GDAL.gdalopen(utmsmall, GDAL.GA_ReadOnly)

progressfunc = convert(Ptr{GDAL.GDALProgressFunc}, C_NULL)

ds_dst = GDAL.gdalcreatecopy(driver, utmsmall_copy, ds_src, 0,
                         C_NULL, progressfunc, C_NULL)
GDAL.gdalclose(ds_dst)
GDAL.gdalclose(ds_src)

rm(utmsmall_copy)
# rest of the tutorial is skipped, perhaps we should wrap "cpl_string.h"
# to be able to build papszOptions, or write it in julia
# #include "cpl_string.h"
# ...
#     char **papszOptions = NULL;
#
#     papszOptions = CSLSetNameValue( papszOptions, "TILED", "YES" );
#     papszOptions = CSLSetNameValue( papszOptions, "COMPRESS", "PACKBITS" );
#     hDstDS = GDALCreateCopy( hDriver, pszDstFilename, hSrcDS, FALSE,
#                              papszOptions, GDALTermProgres, NULL );
#     /* Once we're done, close properly the dataset */
#     if( hDstDS != NULL )
#         GDALClose( hDstDS );
#     CSLDestroy( papszOptions );
