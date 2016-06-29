using BinDeps
using Conda

@BinDeps.setup

libgdal = library_dependency("libgdal", aliases=["gdal","gdal201",
                                                 "gdal_w32","gdal_w64","libgdal-20"])

@windows_only begin
    using WinRPM
    push!(WinRPM.sources, "http://download.opensuse.org/repositories/home:yeesian/openSUSE_13.2")
    WinRPM.update()
    provides(WinRPM.RPM, "gdal", [libgdal], os = :Windows)
end
@unix_only provides(Conda.Manager, "libgdal", libgdal)

@BinDeps.install Dict(:libgdal => :libgdal)
