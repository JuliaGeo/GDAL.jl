# Tests based on the VRT format tutorial found at http://www.gdal.org/gdal_vrttut.html

# To create a VRT dataset that is a clone of an existing dataset use the CreateCopy() method.
driver = GDAL.getdriverbyname("VRT")
src_dataset = GDAL.openshared("data/utmsmall.tif", GDAL.GA_ReadOnly)
vrt_dataset = GDAL.createcopy(driver, "tmp/utmsmall.vrt", src_dataset, 0,
                              C_NULL, progressfunc, C_NULL)

GDAL.setmetadataitem(vrt_dataset, "SourceAgency", "JuliaGeo", "")

GDAL.close(src_dataset)
GDAL.close(vrt_dataset)

# checking the contents of the VRT XML
vrt_xml = read("tmp/utmsmall.vrt", String)
@test occursin("<VRTDataset rasterXSize=\"100\" rasterYSize=\"100\">", vrt_xml)
@test occursin("<MDI key=\"SourceAgency\">JuliaGeo</MDI>", vrt_xml)
@test occursin("<SourceFilename relativeToVRT=\"0\">data/utmsmall.tif</SourceFilename>", vrt_xml)
rm("tmp/utmsmall.vrt")
