#!/usr/bin/env julia

using Clang

gdalpath = "/usr/local/include"
includedirs = [gdalpath]

headerfiles = ["gdal.h", "ogr_api.h"]
headerpaths = [joinpath(gdalpath, h) for h in headerfiles]

"header_wrapped: arguments: (headerfile, cursorname) pair, returns Bool
if/not the pair should be wrapped [default: true]"
function header_wrapped(headerfile, cursorname)
    # @show headerfile cursorname
    # without this the stdout etc also got wrapped
    # contains(cursorname, "/usr/local/include/") # wrap only included files from gdal
    headerfile == cursorname # wrap no included files
end

context=wrap_c.init(headers=headerpaths,
                    output_dir="src/clang",
                    common_file="common.jl",
                    clang_includes=includedirs,
                    header_wrapped=header_wrapped,
                    header_library=x->"libgdal")

run(context)

# headerfile == cursorname # wrap no included files
# gdal 872
# ogr 1368
# common 403

# contains(cursorname, "/usr/local/include/") # wrap only included files from gdal
# gdal 2824
# ogr 1548
# common 1181
