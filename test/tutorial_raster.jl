# Tests based on the Raster API tutorial found at http://gdal.org/gdal_tutorial.html

using GDAL

# needed to actually load tifs
GDAL.allregister()

# Opening the File
dataset = GDAL.open("data/utmsmall.tif", GDAL.GA_ReadOnly) # file from GDAL SVN


# Getting Dataset Information
driver = GDAL.getdriverbyname("GTiff")
@test GDAL.getdrivershortname(driver) == "GTiff"
@test GDAL.getdriverlongname(driver) == "GeoTIFF"

@test GDAL.getrasterxsize(dataset) == 100
@test GDAL.getrasterysize(dataset) == 100
@test GDAL.getrastercount(dataset) == 1
nad27_prefix = "PROJCS[\"NAD27 / UTM zone 11N\",GEOGCS[\"NAD27\",DATUM[\"North_American_Datum_1927\","
@test startswith(GDAL.getprojectionref(dataset), nad27_prefix)

geotransform = fill(0.0, 6)
GDAL.getgeotransform(dataset, geotransform)
@test geotransform == [440720.0,60.0,0.0,3.75132e6,0.0,-60.0]


# Fetching a Raster Band
band = GDAL.getrasterband(dataset, 1)

blockxsize, blockysize = Ref(Cint(-1)), Ref(Cint(-1))
GDAL.getblocksize(band, blockxsize, blockysize)
@test blockxsize[] == 100
@test blockysize[] == 81

@test GDAL.getdatatypename(GDAL.getrasterdatatype(band)) == "Byte"
@test GDAL.getcolorinterpretationname(GDAL.getrastercolorinterpretation(band)) == "Gray"

gotmin, gotmax = Ref(Cint(-1)), Ref(Cint(-1))
@test GDAL.getrasterminimum(band, gotmin) == 0.0
@test GDAL.getrastermaximum(band, gotmax) == 255.0
@test gotmin[] == gotmax[] == 0

@test GDAL.getoverviewcount(band) == 0
# note that if there is no raster color table, no error (C_None) is set by GDAL
# so there is no GDALError thrown here
@test GDAL.getrastercolortable(band) == C_NULL


# Reading Raster Data
xsize = GDAL.getrasterbandxsize(band)
@test xsize == 100
scanline = fill(0.0f0, xsize)
GDAL.rasterio(band, GDAL.GF_Read, 0, 0, xsize, 1,
              scanline, xsize, 1, GDAL.GDT_Float32, 0, 0)
@test scanline == Float32[107.0f0,123.0f0,132.0f0,115.0f0,132.0f0,132.0f0,140.0f0,132.0f0,132.0f0,132.0f0,107.0f0,132.0f0,107.0f0,132.0f0,132.0f0,107.0f0,123.0f0,115.0f0,156.0f0,148.0f0,107.0f0,132.0f0,107.0f0,115.0f0,99.0f0,123.0f0,99.0f0,74.0f0,115.0f0,82.0f0,115.0f0,115.0f0,107.0f0,123.0f0,123.0f0,99.0f0,123.0f0,123.0f0,115.0f0,115.0f0,107.0f0,90.0f0,99.0f0,107.0f0,107.0f0,99.0f0,123.0f0,107.0f0,140.0f0,123.0f0,123.0f0,115.0f0,99.0f0,132.0f0,123.0f0,115.0f0,115.0f0,123.0f0,132.0f0,115.0f0,123.0f0,132.0f0,214.0f0,156.0f0,165.0f0,148.0f0,115.0f0,148.0f0,156.0f0,148.0f0,140.0f0,165.0f0,156.0f0,197.0f0,156.0f0,197.0f0,140.0f0,173.0f0,156.0f0,165.0f0,148.0f0,156.0f0,206.0f0,214.0f0,181.0f0,206.0f0,173.0f0,222.0f0,206.0f0,255.0f0,214.0f0,173.0f0,214.0f0,255.0f0,214.0f0,247.0f0,255.0f0,230.0f0,206.0f0,197.0f0]


# Closing the Dataset
GDAL.close(dataset)


# Techniques for Creating Files
@test GDAL.getmetadataitem(driver, "DCAP_CREATE", "") == "YES"
@test GDAL.getmetadataitem(driver, "DCAP_CREATECOPY", "") == "YES"


# Using CreateCopy()
ds_src = GDAL.open("data/utmsmall.tif", GDAL.GA_ReadOnly)

progressfunc = convert(Ptr{GDAL.GDALProgressFunc}, C_NULL)

ds_dst = GDAL.createcopy(driver, "tmp/utmsmall.tif", ds_src, 0,
                         C_NULL, progressfunc, C_NULL)
GDAL.close(ds_dst)
GDAL.close(ds_src)

rm("tmp/utmsmall.tif")

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
