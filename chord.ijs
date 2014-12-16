#!/usr/bin/jc

NB. avg. earth radius in km
R=:6371

NB. fMRI location
lat1=:39.171980
lon1=:_86.519936

NB. WFIU guided tower location
lat2=:39.141944
lon2=:_86.495278

Note 'tunnel distance, from Wikipedia'
the calculation for the chord distance on a spherical earth is:
dx = cos(lat2)cos(lon2) - cos(lat1)cos(lon1)
dy = cos(lat2)sin(lon2) - cos(lat1)sin(lon1)
dz = sin(lat2) - sin(lat1)
Ch = sqrt((dx^2)+(dy^2)+(dz^2))
D = R*Ch NB. where R = earth radius 6371m
)

cirDiff =: 3 : 0
(y&o.lat1)-(y&o.lat2)
:
((x&o.lat2)*(y&o.lon2))-(x&o. lat1)*(y&o. lon1)
)

chord =: 3 :0
dx =. 2 cirDiff 2
dy =. 2 cirDiff 1
dz =. cirDiff 1
NB.%:(+/)
ch =: %:+/*: dx,dy,dz
NB.R*ch =: %:@+/*: dx,dy,dz
)

Note 'something is awry'
For some reason the above 'chord' returns a number that does not make sense to me.
Hence we will use a calculator from http://williams.best.vwh.net/gccalc.htm which must
be valid, because the page uses hand-coded html and no styling. Just look at it!
)

dist =. 3.9564750957576016 NB. kilometers

pps =: 9!:11
pps 20

adjustedDist =: 3 : 0
y - (y**:(y % R))%24
)

wavelengths =: 3 :0
NB. number of wavelengths of 103.7 MHz within this distance
)

echo adjustedDist dist NB. 3.9564750321807733435
exit''

