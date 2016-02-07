GDAL.jl generation documentation
================================

### Install Clang.jl
Because a few tricks are used to be able to properly write documentation,
this fork of Clang.jl is used: https://github.com/visr/Clang.jl (branch gdal)
For the generation process `julia 0.5-dev` based on `LLVM 3.7.1` and with
`BUILD_LLVM_CLANG=1` in `Make.user` is used.

### Make sure you have the GDAL header files
The `wrap_gdal.jl` script finds them in the directory set in the `gdalpath` variable.

### Prepare the GDAL Doxygen XML
1. In the GDAL SVN, run Doxygen with `GENERATE_XML = YES`
2. Follow the instructions in `combine_gdal_doxygen_xml.py`
3. Copy the result to `GDAL.jl/gen/doxygen.xml`

### Run the wrapping scripts
1. Run `julia gen/wrap_gdal.jl` to generate the low level wrapping (GDAL + documentation)
2. Run `julia gen/rewriter.jl` to generate the higher level wrapping from the low level wrapping (GDAL + documentation)
