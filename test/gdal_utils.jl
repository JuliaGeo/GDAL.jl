ds_small = GDAL.gdalopen("data/utmsmall.tif", GDAL.GA_ReadOnly)
ds_point = GDAL.gdalopenex("data/point.geojson", GDAL.GDAL_OF_VECTOR, C_NULL, C_NULL, C_NULL)

# GDALInfo
options = GDAL.gdalinfooptionsnew(["-checksum"], C_NULL)
infostr = GDAL.gdalinfo(ds_small, options)
@test occursin("Checksum=50054", infostr)
GDAL.gdalinfooptionsfree(options)

# GDALTranslate
# resample to a 5×5 ascii grid
optvec = ["-of","AAIGrid","-r","cubic","-tr","1200","1200"]
options = GDAL.gdaltranslateoptionsnew(optvec, C_NULL)
ds_tiny_asc = GDAL.gdaltranslate("data/utmtiny.asc", ds_small, options, C_NULL)
GDAL.gdaltranslateoptionsfree(options)
GDAL.gdalclose(ds_tiny_asc)
@test replace(read("data/utmtiny.asc", String), "\r" => "") == """
    ncols        5
    nrows        5
    xllcorner    440720.000000000000
    yllcorner    3745320.000000000000
    cellsize     1200.000000000000
     128 126 161 185 193
     171 164 175 206 205
     127 148 177 205 209
     93 114 164 172 181
     83 101 140 128 122
    """
# also create a Byte GeoTIFF version for later use
optvec = ["-r","cubic","-tr","1200","1200","-ot","Byte"]
options = GDAL.gdaltranslateoptionsnew(optvec, C_NULL)
ds_tiny = GDAL.gdaltranslate("data/utmtiny.tif", ds_small, options, C_NULL)
GDAL.gdaltranslateoptionsfree(options)

tinydata = UInt8[
    128 126 161 185 193;
    171 164 175 206 205;
    127 148 177 205 209;
     93 114 164 172 181;
     83 101 140 128 122]

band = GDAL.gdalgetrasterband(ds_tiny, 1)
read_data = zero(tinydata)
GDAL.gdalrasterio(band, GDAL.GF_Read, 0, 0, 5, 5,
              read_data, 5, 5, GDAL.GDT_Byte, 0, 0)
@test read_data' == tinydata


# GDALWarp

# cannot reproject file
# ERROR: LoadError: LoadError: GDALError (Failure, code 6):
#        Unable to load PROJ.4 library (libproj.so), creation of OGRCoordinateTransformation failed.
# when using
# options = GDAL.warpappoptionsnew(["-t_srs","EPSG:4326"], C_NULL)
# should we require PROJ.4 or not?
options = GDAL.gdalwarpappoptionsnew(["-of","MEM"], C_NULL)  # in memory
ds_warped = GDAL.gdalwarp("data/utmsmall.mem", Ptr{GDAL.GDALDatasetH}(C_NULL), 1, [ds_small], options, C_NULL)
GDAL.gdalwarpappoptionsfree(options)
GDAL.gdalclose(ds_warped)


# GDALDEMProcessing
# calculate hillshade
options = GDAL.gdaldemprocessingoptionsnew(["-of","AAIGrid"], C_NULL)
ds_dempr = GDAL.gdaldemprocessing("data/utmtiny-hillshade.asc", ds_tiny, "hillshade", C_NULL, options, C_NULL)
GDAL.gdaldemprocessingoptionsfree(options)
GDAL.gdalclose(ds_dempr)
@test replace(read("data/utmtiny-hillshade.asc", String), "\r" => "") == """
    ncols        5
    nrows        5
    xllcorner    440720.000000000000
    yllcorner    3745320.000000000000
    cellsize     1200.000000000000
    NODATA_value 0
     0 0 0 0 0
     0 183 184 183 0
     0 180 182 181 0
     0 181 181 177 0
     0 0 0 0 0
    """
rm("data/utmtiny-hillshade.asc")
rm("data/utmtiny-hillshade.prj")


# GDALNearblack
# not ascii because it doesn't support `create`
options = GDAL.gdalnearblackoptionsnew(["-of","GTiff","-color","0"], C_NULL)
ds_nearblack = GDAL.gdalnearblack("data/utmtiny-nearblack.tif", Ptr{GDAL.GDALDatasetH}(C_NULL), ds_tiny, options, C_NULL)
GDAL.gdalnearblackoptionsfree(options)
# do rasterio to read result
band = GDAL.gdalgetrasterband(ds_nearblack, 1)
read_data = zero(tinydata)
GDAL.gdalrasterio(band, GDAL.GF_Read, 0, 0, 5, 5,
              read_data, 5, 5, GDAL.GDT_Byte, 0, 0)
nbdata = read_data'
# by default the outer two pixels are zeroed
nbexpected = zero(tinydata)
nbexpected[3,3] = tinydata[3,3]
@test nbdata == nbexpected

GDAL.gdalclose(ds_nearblack)
rm("data/utmtiny-nearblack.tif")


# GDALGrid
options = GDAL.gdalgridoptionsnew(["-of","MEM","-outsize","3","10","-txe","100","100.3","-tye","0","0.1"], C_NULL)
ds_grid = GDAL.gdalgrid("data/point-grid.mem", ds_point, options, C_NULL)
GDAL.gdalgridoptionsfree(options)
geotransform = fill(0.0, 6)
GDAL.gdalgetgeotransform(ds_grid, geotransform)
@test geotransform ≈ [100.0,0.1,0.0,0.0,0.0,0.01]
GDAL.gdalclose(ds_grid)


# GDALRasterize
options = GDAL.gdalrasterizeoptionsnew(["-of","MEM","-tr","0.05","0.05"], C_NULL)
ds_rasterize = GDAL.gdalrasterize("data/point-rasterize.mem", Ptr{GDAL.GDALDatasetH}(C_NULL), ds_point, options, C_NULL)
GDAL.gdalrasterizeoptionsfree(options)
geotransform = fill(0.0, 6)
GDAL.gdalgetgeotransform(ds_rasterize, geotransform)
@test geotransform ≈ [99.975,0.05,0.0,0.1143,0.0,-0.05]
GDAL.gdalclose(ds_rasterize)


# GDALBuildVRT
options = GDAL.gdalbuildvrtoptionsnew([], C_NULL)
ds_buildvrt = GDAL.gdalbuildvrt("data/utmtiny.vrt", 1, [ds_tiny], C_NULL, options, C_NULL)
GDAL.gdalbuildvrtoptionsfree(options)
GDAL.gdalclose(ds_buildvrt)
@test occursin("<SourceFilename relativeToVRT=\"1\">utmtiny.tif</SourceFilename>", read("data/utmtiny.vrt", String))
rm("data/utmtiny.vrt")


# GDALVectorTranslate
# convert a GeoJSON to CSV with X and Y columns
options = GDAL.gdalvectortranslateoptionsnew(["-f","CSV","-lco","GEOMETRY=AS_XY"], C_NULL)
ds_csv = GDAL.gdalvectortranslate("data/point.csv", Ptr{GDAL.GDALDatasetH}(C_NULL), 1, [ds_point], options, C_NULL)
GDAL.gdalvectortranslateoptionsfree(options)
GDAL.gdalclose(ds_csv)
dstcsv = """
    X,Y,FID,pointname
    100,0,2,point-a
    100.2785,0.0893,3,point-b
    100,0,0,a
    100.2785,0.0893,3,b
    """
@test replace(read("data/point.csv", String), "\r" => "") == dstcsv
rm("data/point.csv")


GDAL.gdalclose(ds_small)
GDAL.gdalclose(ds_tiny)
GDAL.gdalclose(ds_point)

rm("data/utmtiny.asc.aux.xml")
rm("data/utmtiny.prj")
rm("data/utmtiny.asc")
rm("data/utmtiny.tif")
