GDAL.jl generation documentation
================================

### Install Clang.jl
Because a few tricks are used to be able to properly write documentation,
this fork of Clang.jl is used: https://github.com/visr/Clang.jl (branch gdal)

### Make sure you have the GDAL header files
The `wrap_gdal.jl` script looks in `/usr/local/include` by default.

### Prepare the GDAL Doxygen XML
1. In the GDAL SVN, run Doxygen with `GENERATE_XML = YES`
2. In the `xml` output dir, run `combine.xslt` to combine all documentation in one XML
3. Copy this file to `GDAL.jl/gen/all.xml`

### Run the wrapping scripts
1. Run `julia gen/wrap_gdal.jl` to generate the low level wrapping (GDAL + documentation)
2. Run `julia gen/rewriter.jl` to generate the higher level wrapping from the low level wrapping (GDAL + documentation)
