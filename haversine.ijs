#!/usr/bin/jc

Note 'haversine.ijs'
This script calculates both the 'great circle' distance, as well as the absolute
distance (i.e. going in a straight line through dirt and bedrock) of two latitude and longitude points.
TODOs
1. pretty print
2. accept argument list
3. output wavelengths

for more info on the haversine calculation, check out here:
http://www.movable-type.co.uk/scripts/latlong.html
)

NB. fMRI location
x1=:39.171980
y1=:_86.519936
fMRI =: x1 j. y1
NB. WFIU guided tower location
x2=:39.141944
y2=:_86.495278
WFIU =: x2 j. y2

hav =: 3 :0
earthRadius =. 6371
)

mag =: 3 :0
| fMRI - WFIU
)

echo mag''
exit''
