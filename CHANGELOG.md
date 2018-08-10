# Changelog

## [Unreleased]

## [0.2.0] - 2018-08-10
### Fixed
- Now runs without deprecation warnings on julia 0.7 & 1.0
### Changed
- Minimum supported julia version is now 0.7

## [0.1.2] - 2018-08-01
### Fixed
- `GDAL_DATA` is now set correctly for ArchGDAL
### Changed
- `GDALVERSION` and `GDAL_DATA` are now `Ref`, use `GDALVERSION[]` to access the value

## [0.1.1] - 2018-07-24
### Fixed
- `UndefVarError` on julia 0.7
### Changed
- Removed dependency on CodecZlib, Proj4 and LibGEOS (their build.jl is included here)


## [0.1.0] - 2018-06-24
### Added
- Registered the first version of GDAL.jl
