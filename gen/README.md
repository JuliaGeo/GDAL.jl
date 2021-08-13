GDAL.jl generation documentation
================================

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
1. Run `julia --project` in this directory and `pkg> instantiate` the dependencies.
2. Run `include("wrap.jl")` to generate the wrapping (GDAL + documentation).
