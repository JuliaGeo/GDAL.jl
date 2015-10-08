using Clang

gdalpath = "/usr/local/include"
includedirs = [gdalpath]

headerfiles = ["cpl_minixml.h",
               "cpl_port.h",
               "cpl_progress.h",
               "gdal.h",
               "gdal_alg.h",
               "gdalwarper.h",
               "ogr_api.h",
               "ogr_core.h",
               "ogr_srs_api.h"]

headerpaths = [joinpath(gdalpath, h) for h in headerfiles]

# indicates if/not the pair should be wrapped
function header_wrapped(headerfile, cursorname)
    # don't wrap included files
    headerfile == cursorname
end

context=wrap_c.init(headers=headerpaths,
                    output_dir="src/clang",
                    common_file="common.jl",
                    clang_includes=includedirs,
                    header_wrapped=header_wrapped,
                    header_library=x->"libgdal")

run(context)
