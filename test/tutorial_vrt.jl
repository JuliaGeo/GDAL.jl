# Tests based on the VRT format tutorial found at http://www.gdal.org/gdal_vrttut.html

utmsmall = joinpath(@__DIR__, "data/utmsmall.tif")
utmsmall_vrt = joinpath(@__DIR__, "tmp/utmsmall.vrt")

# To create a VRT dataset that is a clone of an existing dataset use the CreateCopy() method.
driver = GDAL.getdriverbyname("VRT")
src_dataset = GDAL.openshared(utmsmall, GDAL.GA_ReadOnly)
progressfunc = convert(Ptr{GDAL.GDALProgressFunc}, C_NULL)
vrt_dataset = GDAL.createcopy(driver, utmsmall_vrt, src_dataset, 0,
                              C_NULL, progressfunc, C_NULL)

GDAL.setmetadataitem(vrt_dataset, "SourceAgency", "JuliaGeo", "")

GDAL.close(src_dataset)
GDAL.close(vrt_dataset)

# checking the contents of the VRT XML
vrt_xml = read(utmsmall_vrt, String)
@test occursin("<VRTDataset rasterXSize=\"100\" rasterYSize=\"100\">", vrt_xml)
@test occursin("<MDI key=\"SourceAgency\">JuliaGeo</MDI>", vrt_xml)
@test occursin("<SourceFilename relativeToVRT=\"0\">$utmsmall</SourceFilename>", vrt_xml)
rm(utmsmall_vrt)
