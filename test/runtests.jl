using GDAL
using Base.Test

info(bytestring(GDAL.C.GDALVersionInfo(pointer("--version"))))

# drivers
info(GDAL.C.GDALGetDriverCount(), " GDAL drivers found")
info(GDAL.C.OGRGetDriverCount(), " OGR drivers found")
@test GDAL.C.GDALGetDriverCount() > 0
@test GDAL.C.OGRGetDriverCount() > 0

# throw errors on non existing files
@test_throws GDAL.GDALError GDAL.C.GDALOpen(pointer("NonExistent"), GDAL.C.GA_ReadOnly)
# if a driver is not found, the C API returns a null
@test GDAL.C.GDALGetDriverByName(pointer("NonExistent")) == C_NULL

cd(dirname(@__FILE__)) do
    # write a raster from scratch
    driver = GDAL.C.GDALGetDriverByName(pointer("GTiff"))

    # get metadata and load into dict
    mdptr = GDAL.C.GDALGetMetadata(driver, pointer(""))
    cnt = 1
    ptr = unsafe_load(mdptr, cnt)
    metadata = Dict{UTF8String,UTF8String}()
    while(ptr != C_NULL)
        key, value = split(bytestring(ptr), '=', limit=2)
        metadata[key] = value
        cnt += 1
        ptr = unsafe_load(mdptr, cnt)
    end
    #= commented out because I'm not able to create a good final argument to GDAL.C.GDALCreate
    if get(metadata, "DCAP_CREATE", "NO") == "YES"
        emptyarg = convert(Ptr{Ptr{UInt8}}, pointer(bytestring("COMPRESS=DEFLATE\0")))
        @show emptyarg
        ds = GDAL.C.GDALCreate(driver, pointer("test.tif"), Cint(100), Cint(100), Cint(1), GDAL.C.GDT_Float64, emptyarg)
        buf = rand(100, 100)
        GDAL.C.GDALDatasetRasterIOEx(ds, GDAL.C.GF_Write, 0, 0, 100, 100,
            Ptr{Void}(pointer(buf)), size(buf, 2), size(buf, 1), GDAL.C.GDT_Float64,
            1, Int32[1], 0, 0, 0,
            Ref(GDAL.C.GDALRasterIOExtraArg(1, GDAL.C.GRIORA_NearestNeighbour, C_NULL, C_NULL,
                0, 0.0, 0.0, 0.0, 0.0)))
        GDAL.C.GDALClose(ds)
    end
    =#
end
