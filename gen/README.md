GDAL.jl generation documentation
================================

### Install Clang.jl
Because a few tricks are used to be able to properly write documentation,
this fork of Clang.jl is used: https://github.com/visr/Clang.jl (branch gdal)
For the generation process `visr/julia-0.6+` is used, since it includes `0d95a1f`,
which fixes printing `<:MyType`, which is at time of writing only on master.

### Make sure you have the GDAL header files
The `wrap_gdal.jl` script finds them in the directory set in the `gdalpath` variable.

### Prepare the GDAL Doxygen XML
Below are the steps needed to create an XML file from which the documentation is created. Alternatively the first two steps can be skipped by downloading the [prepared XML](https://s3.eu-central-1.amazonaws.com/visr/julia/gdal/doxygen.xml), though this file may become outdated.

1. Navigate to the folder containing GDAL SVN, modify the `Doxyfile` configuration file to generate XML by changing
   ```
   GENERATE_XML           = NO
   ```
   to
   ```
   GENERATE_XML           = YES
   ```
   before running Doxygen using the command
   ```
   $ doxygen Doxyfile
   ```

   This should create an `xml` folder, with the xml output of the gdal documentation.

2. Follow the instructions in `combine_gdal_doxygen_xml.py`
3. Copy the result to `GDAL.jl/gen/doxygen.xml`

### Run the wrapping scripts
1. Run `julia gen/wrap_gdal.jl` to generate the low level wrapping (GDAL + documentation)
2. Run `julia gen/rewriter.jl` to generate the higher level wrapping from the low level wrapping (GDAL + documentation)
