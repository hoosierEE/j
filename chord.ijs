#!/usr/bin/jc

NB. avg. earth radius in km
R=:6371

NB. fMRI location
lat1=:39.171980
lon1=:_86.519936
NB. WFIU guided tower location
lat2=:39.141944
lon2=:_86.495278

NB. great circle distance
dist =: 3956.4750957576016 NB. meters
pps =: 9!:11
pps 20 NB. 20 places of print precision

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


