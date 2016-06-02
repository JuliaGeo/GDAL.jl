using BinDeps
using Conda

@BinDeps.setup

function isgdal2(name, handle)
    fptr = Libdl.dlsym(handle, :GDALVersionInfo)
    versionptr = ccall(fptr,Cstring,(Cstring,),"RELEASE_NAME")
    versionstring = bytestring(versionptr)
    gdalversion = convert(VersionNumber, versionstring)
    gdalversion >= v"2.0.0"
end

libgdal = library_dependency("libgdal",
                             aliases=["gdal","gdal201","gdal200",
                                      "gdal_w32","gdal_w64"],
                             validate=isgdal2)

# conda-forge has a well maintained gdal recipe
# https://github.com/conda-forge/gdal-feedstock
Conda.add_channel("conda-forge")
provides(Conda.Manager, "gdal", libgdal)

@BinDeps.install Dict(:libgdal => :libgdal)
