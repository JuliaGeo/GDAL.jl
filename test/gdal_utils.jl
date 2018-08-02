ds_small = GDAL.open("data/utmsmall.tif", GDAL.GA_ReadOnly)
ds_point = GDAL.openex("data/point.geojson", GDAL.GDAL_OF_VECTOR, C_NULL, C_NULL, C_NULL)

# GDALInfo
# infooptionsnew checks if the options are valid
@test_throws GDAL.GDALError GDAL.infooptionsnew(["-novalidoption"], C_NULL)
# check not only that a GDALError is thrown, but also its contents
try
    GDAL.infooptionsnew(["-novalidoption"], C_NULL)
catch err
    @test err.class === GDAL.CE_Failure
    @test err.code === Cint(6)
    @test err.msg == "Unknown option name '-novalidoption'"
end

options = GDAL.infooptionsnew(["-checksum"], C_NULL)
infostr = GDAL.info(ds_small, options)
@test occursin("Checksum=50054", infostr)
GDAL.infooptionsfree(options)

# GDALTranslate
# resample to a 5×5 ascii grid
optvec = ["-of","AAIGrid","-r","cubic","-tr","1200","1200"]
options = GDAL.translateoptionsnew(optvec, C_NULL)
ds_tiny_asc = GDAL.translate("data/utmtiny.asc", ds_small, options, C_NULL)
GDAL.translateoptionsfree(options)
GDAL.close(ds_tiny_asc)
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
options = GDAL.translateoptionsnew(optvec, C_NULL)
ds_tiny = GDAL.translate("data/utmtiny.tif", ds_small, options, C_NULL)
GDAL.translateoptionsfree(options)

tinydata = UInt8[
    128 126 161 185 193;
    171 164 175 206 205;
    127 148 177 205 209;
     93 114 164 172 181;
     83 101 140 128 122]

band = GDAL.getrasterband(ds_tiny, 1)
read_data = zero(tinydata)
GDAL.rasterio(band, GDAL.GF_Read, 0, 0, 5, 5,
              read_data, 5, 5, GDAL.GDT_Byte, 0, 0)
@test read_data' == tinydata


# GDALWarp

# cannot reproject file
# ERROR: LoadError: LoadError: GDALError (Failure, code 6):
#        Unable to load PROJ.4 library (libproj.so), creation of OGRCoordinateTransformation failed.
# when using
# options = GDAL.warpappoptionsnew(["-t_srs","EPSG:4326"], C_NULL)
# should we require PROJ.4 or not?
options = GDAL.warpappoptionsnew(["-of","MEM"], C_NULL)  # in memory
ds_warped = GDAL.warp("data/utmsmall.mem", Ptr{GDAL.GDALDatasetH}(C_NULL), 1, [ds_small], options, C_NULL)
GDAL.warpappoptionsfree(options)
GDAL.close(ds_warped)


# GDALDEMProcessing
# calculate hillshade
options = GDAL.demprocessingoptionsnew(["-of","AAIGrid"], C_NULL)
ds_dempr = GDAL.demprocessing("data/utmtiny-hillshade.asc", ds_tiny, "hillshade", C_NULL, options, C_NULL)
GDAL.demprocessingoptionsfree(options)
GDAL.close(ds_dempr)
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
options = GDAL.nearblackoptionsnew(["-of","GTiff","-color","0"], C_NULL)
ds_nearblack = GDAL.nearblack("data/utmtiny-nearblack.tif", Ptr{GDAL.GDALDatasetH}(C_NULL), ds_tiny, options, C_NULL)
GDAL.nearblackoptionsfree(options)
# do rasterio to read result
band = GDAL.getrasterband(ds_nearblack, 1)
read_data = zero(tinydata)
GDAL.rasterio(band, GDAL.GF_Read, 0, 0, 5, 5,
              read_data, 5, 5, GDAL.GDT_Byte, 0, 0)
nbdata = read_data'
# by default the outer two pixels are zeroed
nbexpected = zero(tinydata)
nbexpected[3,3] = tinydata[3,3]
@test nbdata == nbexpected

GDAL.close(ds_nearblack)
rm("data/utmtiny-nearblack.tif")


# GDALGrid
options = GDAL.gridoptionsnew(["-of","MEM","-outsize","3","10","-txe","100","100.3","-tye","0","0.1"], C_NULL)
ds_grid = GDAL.grid("data/point-grid.mem", ds_point, options, C_NULL)
GDAL.gridoptionsfree(options)
geotransform = fill(0.0, 6)
GDAL.getgeotransform(ds_grid, geotransform)
@test geotransform ≈ [100.0,0.1,0.0,0.0,0.0,0.01]
GDAL.close(ds_grid)


# GDALRasterize
options = GDAL.rasterizeoptionsnew(["-of","MEM","-tr","0.05","0.05"], C_NULL)
ds_rasterize = GDAL.rasterize("data/point-rasterize.mem", Ptr{GDAL.GDALDatasetH}(C_NULL), ds_point, options, C_NULL)
GDAL.rasterizeoptionsfree(options)
geotransform = fill(0.0, 6)
GDAL.getgeotransform(ds_rasterize, geotransform)
@test geotransform ≈ [99.975,0.05,0.0,0.1143,0.0,-0.05]
GDAL.close(ds_rasterize)


# GDALBuildVRT
options = GDAL.buildvrtoptionsnew([], C_NULL)
ds_buildvrt = GDAL.buildvrt("data/utmtiny.vrt", 1, [ds_tiny], C_NULL, options, C_NULL)
GDAL.buildvrtoptionsfree(options)
GDAL.close(ds_buildvrt)
@test occursin("<SourceFilename relativeToVRT=\"1\">utmtiny.tif</SourceFilename>", read("data/utmtiny.vrt", String))
rm("data/utmtiny.vrt")


# GDALVectorTranslate
# convert a GeoJSON to CSV with X and Y columns
options = GDAL.vectortranslateoptionsnew(["-f","CSV","-lco","GEOMETRY=AS_XY"], C_NULL)
ds_csv = GDAL.vectortranslate("data/point.csv", Ptr{GDAL.GDALDatasetH}(C_NULL), 1, [ds_point], options, C_NULL)
GDAL.vectortranslateoptionsfree(options)
GDAL.close(ds_csv)
dstcsv = """
    X,Y,FID,pointname
    100,0,2,point-a
    100.2785,0.0893,3,point-b
    100,0,0,a
    100.2785,0.0893,3,b
    """
@test replace(read("data/point.csv", String), "\r" => "") == dstcsv
rm("data/point.csv")


GDAL.close(ds_small)
GDAL.close(ds_tiny)
GDAL.close(ds_point)

rm("data/utmtiny.asc.aux.xml")
rm("data/utmtiny.prj")
rm("data/utmtiny.asc")
rm("data/utmtiny.tif")
