using PROJ_jll
using NetworkOptions

const stat = Cvoid

const _stat64 = Cvoid

const tm = Libc.TmStruct

const time_t = Int

CPL_STATIC_CAST(type, value) = value % type

GDAL_COMPUTE_VERSION(maj, min, rev) = ((maj) * 1000000 + (min) * 10000 + (rev) * 100)
