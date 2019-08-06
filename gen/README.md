GDAL.jl generation documentation
================================

### Install Clang.jl
```
pkg> add Clang
```

### Make sure you have the GDAL header files
```
pkg> build GDAL
```

### Prepare the GDAL Doxygen XML
Below are the steps needed to create an XML file from which the documentation is created.

1. Navigate to the folder containing GDAL git, modify the `Doxyfile` configuration file to generate XML by changing
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
