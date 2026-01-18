"""
    AstroMOID

A Julia package for computing the Minimum Orbit Intersection Distance (MOID) 
for two given confocal, elliptical orbits.
"""
module AstroMOID
    include("wisric_moid.jl")
    export wisric_moid
end
