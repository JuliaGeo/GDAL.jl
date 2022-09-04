Do not merge.

# GDAL.jl
[![CI](https://github.com/JuliaGeo/GDAL.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/JuliaGeo/GDAL.jl/actions/workflows/CI.yml)


Julia wrapper for [GDAL - Geospatial Data Abstraction Library](http://gdal.org/). This
package is a binding to the C API of GDAL/OGR. It provides only a C style usage, where
resources must be closed manually, and datasets are pointers.

Other packages can build on top of this to provide a more Julian user experience. See for
example [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl).

*Most users will want to use [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) instead
of using GDAL.jl directly.*

## Installation
This package is registered, so add it using `Pkg`. This will also download GDAL binaries
created in [Yggdrasil](https://github.com/JuliaPackaging/Yggdrasil/tree/master/G/GDAL).
```
pkg> add GDAL
```
To check if it is installed correctly, you could run the test suite with:
```
pkg> test GDAL
```

## Documentation
Docstrings are automatically inserted from the GDAL documentation. Note that these are
written for the C API, so function names and argument type names will differ.
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

Further usage documentation is not yet available, but the files
[`test/tutorial_raster.jl`](https://github.com/JuliaGeo/GDAL.jl/blob/master/test/tutorial_raster.jl)
and
[`test/tutorial_vector.jl`](https://github.com/JuliaGeo/GDAL.jl/blob/master/test/tutorial_vector.jl)
should provide a good hint based on the API tutorials from [GDAL.org](http://gdal.org/).

The bulk of this package is generated automatically by the scripts under
[`gen/`](https://github.com/JuliaGeo/GDAL.jl/tree/master/gen).

## Using the GDAL and OGR utilities

The provided GDAL installation also contains the commonly used utilities such as
`gdal_translate` and `ogr2ogr`. They can be called from Julia like so:
```julia
using GDAL

# list information about a raster dataset
GDAL.gdalinfo_path() do gdalinfo
    run(`$gdalinfo path/to/raster-file`)
end

# convert raster data between different formats
GDAL.gdal_translate_path() do gdal_translate
    run(`$gdal_translate -of COG input.asc output.tif`)
end

# list information about an OGR-supported data source
GDAL.ogrinfo_path() do ogrinfo
    run(`$ogrinfo path/to/vector-file`)
end

# convert simple features data between file formats
GDAL.ogr2ogr_path() do ogr2ogr
    run(`$ogr2ogr -f FlatGeobuf output.fgb input.shp`)
end
```

The `GDAL.<util>_path` are defined in the
[`GDAL_jll`](https://github.com/JuliaBinaryWrappers/GDAL_jll.jl) package. If you only wish
to run the utilities, that package will have all you need. A list of the available utilities
can be found [here](https://github.com/JuliaBinaryWrappers/GDAL_jll.jl#products).
Documentation for them is available on
[gdal.org/programs](https://gdal.org/programs/index.html). Note that programs implemented in
python (ending in .py) are not available, since those would require a python installations.

Since GDAL 2.1's [RFC59.1](https://trac.osgeo.org/gdal/wiki/rfc59.1_utilities_as_a_library)
most utilities are also available as functions in the library, they are implemented
[here](https://github.com/JuliaGeo/GDAL.jl/blob/master/src/gdal_utils.jl) and tested
[here](https://github.com/JuliaGeo/GDAL.jl/blob/master/test/gdal_utils.jl). If these are
used you can avoid the need for calling the binaries.

If you want to use these utilities from outside julia, note that this will not work unless
you set two things:
1. The environment variable `GDAL_DATA` must be set to the value returned in julia by
   `GDAL.GDAL_DATA[]`.
2. Julia's `Sys.BINDIR` must be in your path.

Inside of julia (2) is always the case, and (1) happens on loading the `GDAL` module, in its
`__init__` function.

## Missing driver to support a format

If you get an error such as the one below:
```
GDALError (CE_Failure, code 6):
    The <...> driver needs to be compiled to support <...>
```

This means that the GDAL binaries you are using, which normally come from the [Yggdrasil
community build tree](https://github.com/JuliaPackaging/Yggdrasil/tree/master/G/GDAL), are
not compiled with support for the format or feature you need. GDAL is a large library with
many optional dependencies which allow support for more formats. Currently the amount of
formats supported is still limited, but will grow over time. Lists of available formats can
be found [here](https://gdal.org/drivers/raster/index.html) for rasters and
[here](https://gdal.org/drivers/vector/index.html) for vectors. If you need support for
another format, consider making an issue in this repository. Many formats need external
libraries as added dependencies. This means an Yggdrasil build also needs to be available
for that library, and added as a dependency. See [issue
#65](https://github.com/JuliaGeo/GDAL.jl/issues/65) for a discussion on which new drivers
should be prioritized.
