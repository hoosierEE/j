#!/usr/bin/jc

NB. fMRI location
x1=:39.171980
y1=:_86.519936

NB. WFIU guided tower location
x2=:39.141944
y2=:_86.495278

Note 'tunnel distance, from Wikipedia'
the calculation for the chord distance on a spherical earth is:
dx = cos(lat2)cos(lon2) - cos(lat1)cos(lon1)
dy = cos(lat2)sin(lon2) - cos(lat1)sin(lon1)
dz = sin(lat2) - sin(lat1)
Ch = sqrt((dx^2)+(dy^2)+(dz^2))
D = R*Ch NB. where R = earth radius 6371m
)

cos =: 2&o.
sin =: 1&o.

cirDiff =: 3 : 0
dz =. (y&o.x1)*(y&o.x2)
:
dxy =. ((x &o. x2)*(y &o. y2))-((x &o. x1)*(y &o. y1))
)

chord =: 3 :0
R =: 6371 NB. kilometers
dx =: 2 cirDiff 2
dy =: 2 cirDiff 1
dz =: cirDiff 1
ch =: %:(+/)*: dx,dy,dz
d =: R*ch
)

echo chord''
NB. exit''
