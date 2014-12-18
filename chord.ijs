#!/usr/bin/jc

NB. avg. earth radius in km
R=:6371
NB. fMRI location
lat1=:39.171980
lon1=:_86.519936
NB. WFIU guided tower location
lat2=:39.141944
lon2=:_86.495278

<<<<<<< HEAD
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

chord =: 3 : 0 Note 'alternative' single-line comment.
dx =. 2 cirDiff 2
dy =. 2 cirDiff 1
dz =. cirDiff 1
%:+/*: dx,dy,dz
)

NB. dist is calculated by http://williams.best.vwh.net/gccalc.htm
dist =. 3.9564750957576016 NB. kilometers
NB. Set print precision to 20 digits.
pps =: 9!:11
pps 2a0

adjustedDist =: 3 : 0
1000 * y - 24 %~ y **: y % R
)

NB. verb
= < <.
NB. noun
_9: 0:
NB. numbers
1 2.3 _1.43j8.9 100x __ _ __a 0 1
1j 1j3 j3 .3j2
0.3 .1 ..4
NB. conj
" .: !:
NB. advb
/ \ b.
NB. name
hallo123_lk
NB. args
x =. 3 :0
x y m n u v (y x u v)
=======
NB. great circle distance
dist =: 3956.4750957576016 NB. meters

pps =: 9!:11
pps 20 NB. 20 places of print precision

adjustedDist =: 3 :0
y-24%~y**:y%R
>>>>>>> 5c6fef2aba1c881d9f8f0fad42b6f2d3694b6b32
)


wavelengths =: 3 :0
<<<<<<< HEAD
c =. 299792458 NB. speed of light (m/s)
NB. Helpful site: http://radiostationnet.com/fm/indiana/WFIU/
NB.
=======
NB. Helpful: http://radiostationnet.com/fm/indiana/WFIU/
NB. f - 103.7MHz = 103700000
NB. λ - v%f where v = speed of light
NB. N - number of wavelengths between here and there: D % λ
c =. 299792458
f =. 103700000
d =. adjustedDist dist
d * c % f
>>>>>>> 5c6fef2aba1c881d9f8f0fad42b6f2d3694b6b32
)

echo wavelengths'' NB. 11254.209646912615426
exit''


