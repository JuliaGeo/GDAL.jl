const FILE = Void # not sure if this works
const time_t = Void # not sure if this works

# C functions that take an argument of the type char** can be called
# by using a Ptr{Ptr{UInt8}} type within Julia.
const StringList = Ptr{Ptr{UInt8}}
