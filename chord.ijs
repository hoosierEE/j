#!/usr/bin/jc

Note 'about this script'
Calculates the chord distance between two latitude/longitude pairs.
)

NB. fMRI location
x1=:39.171980
y1=:_86.519936
fMRI =: x1 j.y1
NB. WFIU guided tower location
x2=:39.141944
y2=:_86.495278
WFIU =: x2 j.y2

Note 'from Wikipedia'
the calculation for the chord distance on a spherical earth is:
dx = cos(lat2)cos(lon2) - cos(lat1)cos(lon1)
dy = cos(lat2)sin(lon2) - cos(lat1)sin(lon1)
dz = sin(lat2) - sin(lat1)
Ch = sqrt((dx^2)+(dy^2)+(dz^2))
D = R*Ch where R = earth radius (6371m)
"For short distances (D<<R), this underestimates the great circle distance by D((D/R)^2)/24."
)

chord =: 3 :0
R =: 6371 NB. kilometers
c =: -/*/2&o.
dx =: x2,y2 x1,y1
)

NB.mag =: 3 :0
NB.| fMRI - WFIU
NB.)

echo chord''
exit''
