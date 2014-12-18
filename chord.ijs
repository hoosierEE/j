#!/usr/bin/jc

NB. Be precise!
pps =: 9!:11
pps 20 NB. 20 places of print precision

NB. avg. earth radius in km
R=:6371

NB. Coordinates. TODO: give them as command line parameters instead!
NB. fMRI location
lat1=:39.171980
lon1=:_86.519936
NB. WFIU guided tower location
lat2=:39.141944
lon2=:_86.495278

NB. this number was calculated using a different program.
NB. TODO: calculate using this program.
dist =: 3956.4750957576016 NB. meters

NB. helper function
cir =: 3 : 0
y &o. lat2 - y &o. lat1
:
((x &o. lat2) * (y &o. lon2)) - ((x &o. lat1) * (y &o. lon1))
)

NB. great circle distance
chord =: 3 : 0
dx =: 2 cir 2
dy =: 2 cir 1
dz =: cir 1
C =. %:(+/)*: dx,dy,dz
)
echo chord''

adjustedDist =: 3 :0
y-24%~y**:y%R
)

wavelengths =: 3 :0
NB. Helpful: http://radiostationnet.com/fm/indiana/WFIU/
NB. f - 103.7MHz = 103700000
NB. λ - v÷f where v = speed of light
NB. N - number of wavelengths between here and there: D % λ
c =. 299792458
f =. 103700000
d =. adjustedDist dist
d * c % f
)

echo wavelengths'' NB. 11254.209646912615426
exit''

NB. ./chord.ijs >> chord.ijs
NB. 0.030160892133817885502
NB. 11254.209646912615426
