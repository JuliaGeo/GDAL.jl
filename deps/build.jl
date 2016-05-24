using BinDeps
using Conda

@BinDeps.setup

libgdal = library_dependency("libgdal", aliases=["gdal","gdal111","gdal200","gdal201",
                                                 "gdal_w32","gdal_w64"])

@windows_only provides(Conda.Manager, "libgdal", libgdal)
@unix_only provides(Conda.Manager, "libgdal", libgdal)

@BinDeps.install Dict(:libgdal => :libgdal)
