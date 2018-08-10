# GDAL.jl
[![Build Status](https://travis-ci.org/JuliaGeo/GDAL.jl.svg?branch=master)](https://travis-ci.org/JuliaGeo/GDAL.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/github/JuliaGeo/GDAL.jl?svg=true&branch=master)](https://ci.appveyor.com/project/JuliaGeo/gdal-jl/branch/master)

Julia wrapper for [GDAL - Geospatial Data Abstraction Library](http://gdal.org/).
This package is a binding to the C API of GDAL/OGR. It provides only a C style usage, where resources must be closed manually, and datasets are pointers. *Note: this also means that before being able to use any drivers (for input/output of different formats), they must be registered first using `GDAL.allregister()`.*

Other packages can build on top of this to provide a more Julian user experience. See for example [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl).

## Installation
This package is registered, so add it using `Pkg`. This will also download GDAL binaries created by [GDALBuilder](https://github.com/JuliaGeo/GDALBuilder).
```
pkg> add GDAL
```
To test if it is installed correctly, use:
```
pkg> test GDAL
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
