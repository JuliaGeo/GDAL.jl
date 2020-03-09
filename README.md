# GDAL.jl
[![Build Status](https://travis-ci.org/JuliaGeo/GDAL.jl.svg?branch=master)](https://travis-ci.org/JuliaGeo/GDAL.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/github/JuliaGeo/GDAL.jl?svg=true&branch=master)](https://ci.appveyor.com/project/JuliaGeo/gdal-jl/branch/master)

Julia wrapper for [GDAL - Geospatial Data Abstraction Library](http://gdal.org/).
This package is a binding to the C API of GDAL/OGR. It provides only a C style usage, where resources must be closed manually, and datasets are pointers. *Note: this also means that before being able to use any drivers (for input/output of different formats), they must be registered first using `GDAL.gdalallregister()`.*

Other packages can build on top of this to provide a more Julian user experience. See for example [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl).

## Installation
This package is registered, so add it using `Pkg`. This will also download GDAL binaries created by  [Yggdrasil](https://github.com/JuliaPackaging/Yggdrasil/tree/master/G/GDAL).
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

help?> GDAL.ogr_g_creategeometry
  OGR_G_CreateGeometry(OGRwkbGeometryType eGeometryType) -> OGRGeometryH

  Create an empty geometry of desired type.

  Parameters
  ––––––––––––

    •    eGeometryType: the type code of the geometry to be created.

  Returns
  –––––––––

  handle to the newly create geometry or NULL on failure. Should be freed with OGRGDestroyGeometry() after use.
```

Further usage documentation is not yet available, but the files `test/tutorial_raster.jl` and `test/tutorial_vector.jl` should provide a good hint based on the API tutorials from [GDAL.org](http://gdal.org/).

The bulk of this package is generated automatically by the scripts under `gen/`. For developer documentation regarding this process see `gen/README.md`.

## Changelog

Since GDAL.jl v0.2.0 the package has changed considerably. The GDAL C function names are no longer being shortened. This brought many complications forcing us to simulate GDAL's types to disambiguate methods. As an example, the old `GDAL.open` now has to be made explicit: use `GDAL.gdalopen`, `ogr_dr_open`, or `ogropen`. Other options are simpler, `GDAL.allregister` can only become `GDAL.gdalallregister`. To help with updating old code in a semi automatic fashion, look at [this script](https://gist.github.com/visr/0a2ad3fe92073345c93c2ca42f5f58a0#file-renamer-jl) which uses [MacroTools.jl](https://mikeinnes.github.io/MacroTools.jl/stable/sourcewalk/) to do function renaming.

The `GDAL.C` submodule no longer exists. All functions that were there and not in the main `GDAL` module, have now been moved over.

## Troubleshooting

### Missing driver to support a format

If you get an error such as the one below:
```
GDALError (CE_Failure, code 6):
    The SQLite driver needs to be compiled to support the SQLite SQL dialect
```

This means that the GDAL binaries you are using, which normally come from the [GDALBuilder](https://github.com/JuliaGeo/GDALBuilder), are not compiled with support for the format or feature you need. GDAL is a large library with many optional dependencies which allow support for more formats. Currently the amount of formats supported is still limited, but will grow over time. Lists of available formats can be found [here](https://gdal.org/drivers/raster/index.html) for rasters and [here](https://gdal.org/drivers/vector/index.html) for vectors. If you need support for another format, consider making an issue or PR at the GDALBuilder repository. Many formats need external libraries as added dependencies. This means a BinaryBuilder repository also needs to be available for that library, and added as a dependency.

### Using the GDAL and OGR utilities

The provided GDAL installation also contains the commonly used utilities such as `gdal_translate` and `ogr2ogr`. They can be called from Julia like so:
```julia
using GDAL
run(`$(GDAL.gdalinfo_path) dem.tif`)
```
The `GDAL.<util>_path` are defined in the `deps.jl` file after installation.

Since GDAL 2.1's [RFC59.1](https://trac.osgeo.org/gdal/wiki/rfc59.1_utilities_as_a_library) most utilities are also available as functions in the library, they are implemented [here](https://github.com/JuliaGeo/GDAL.jl/blob/master/src/gdal_utils.jl) and tested [here](https://github.com/JuliaGeo/GDAL.jl/blob/master/test/gdal_utils.jl). If these are used you can avoid the need for calling the binaries.

All executables listed below are included, except for the Python scripts. The Python scripts are a bit more complicated because it would require Python as a dependency. If we can optionally support them however that would be great.

- https://www.gdal.org/gdal_utilities.html
- https://www.gdal.org/ogr_utilities.html

If you want to use these utilities from outside julia, note that this will not work unless you set two things:
1. The environment variable `GDAL_DATA` must be set to the value returned in julia by `GDAL.GDAL_DATA[]`.
2. Julia's `Sys.BINDIR` must be in your path.

Inside of julia (2) is always the case, and (1) happens on loading the `GDAL` module, in its `__init__` function.
