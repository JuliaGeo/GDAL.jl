# GDAL.jl

[![Build Status](https://api.travis-ci.org/visr/GDAL.jl.svg)](https://travis-ci.org/visr/GDAL.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/github/visr/GDAL.jl?svg=true&branch=master)](https://ci.appveyor.com/project/visr/gdal-jl/branch/master)

Julia wrapper for [GDAL - Geospatial Data Abstraction Library](http://gdal.org/).
This package is a binding to the C API of GDAL/OGR. It provides only a C style usage, where resources must be closed manually, and datasets are pointers.

Other packages can build on top of this to provide a more Julian user experience. See for example [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl).

## Installation
This package is currently unregistered, so add it using `Pkg.clone`, then find or get the GDAL dependencies using `Pkg.build`.
```julia
Pkg.clone("https://github.com/visr/GDAL.jl.git")
Pkg.build("GDAL")
```
`Pkg.build` downloads GDAL binaries created by [GDALBuilder](https://github.com/visr/GDALBuilder). To test if it is installed correctly, use:
```julia
Pkg.test("GDAL")
```

## Documentation
Docstrings are automatically inserted from the GDAL documentation. Note that these are written for the C API, so function names and argument type names will differ.
```
julia> using GDAL

help?> GDAL.creategeometry
  OGR_G_CreateGeometry(OGRwkbGeometryType eGeometryType) -> OGRGeometryH

  Create an empty geometry of desired type.

     Parameters
    ––––––––––––

    •  eGeometryType: the type code of the geometry to be created.

     Returns
    –––––––––

  handle to the newly create geometry or NULL on failure. Should be freed with
  OGR_G_DestroyGeometry() after use.
```

Further usage documentation is not yet available, but the files `test/tutorial_raster.jl` and `test/tutorial_vector.jl` should provide a good hint based on the API tutorials from [GDAL.org](http://gdal.org/).

The bulk of this package is generated automatically by the scripts under `gen/`. For developer documentation regarding this process see `gen/README.md`.

## Low-level and mid-level API
Next to the functions available in the `GDAL` module, there is also a submodule `GDAL.C` available. `GDAL.C` is the low-level wrapping, without any error checking, function renaming or type wrapping. If you know what you are doing and don't want this package to get in your way, use this. Currently the `GDAL.C` module provides a more complete wrapping, though the intention is to make the complete user facing C API available in both modules.
