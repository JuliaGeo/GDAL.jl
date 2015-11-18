using BinDeps
using Conda

@BinDeps.setup

libgdal = library_dependency("libgdal", aliases=["gdal", "gdal111"])

# install older gdal on windows
@windows_only provides(Conda.Manager, "libgdal==1.11.2", libgdal)
@unix_only provides(Conda.Manager, "libgdal", libgdal)

@BinDeps.install Dict(:libgdal => :libgdal)
