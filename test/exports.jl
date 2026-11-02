@testset "libgdal exports every wrapped function" begin
    src = read(joinpath(pkgdir(GDAL), "src", "libgdal.jl"), String)
    symbols = unique(
        Symbol(m.captures[1]) for m in eachmatch(r"ccall\(\s*\(:(\w+),\s*libgdal\)", src)
    )
    @test length(symbols) > 1000
    lib = dlopen(GDAL.libgdal)
    @test isempty(filter(s -> dlsym(lib, s; throw_error = false) === nothing, symbols))
end
