NB. Be precise!
pps =. 9!:11
pps 20 NB. 20 places of print precision

NB. Coordinates. TODO input these as command line parameters
NB. fMRI location
lat1=:39.171980
lon1=:_86.519936
NB. WFIU guided tower location
lat2=:39.141944
lon2=:_86.495278

NB. helper function for sines and cosines
cir =: 3 : 0
y &o. lat2 - y &o. lat1
:
((x &o. lat2) * (y &o. lon2)) - ((x &o. lat1) * (y &o. lon1))
)

NB. nouns
a. a: _. _
NB. adverbs
~ / \ } t. t: t.
NB. Conjunctions
. : .. .: :: :. ;. !. !: " ` @ @. @: &: &. & &.: d. D. D: H. L: S: T.

NB. great circle distance
chord =: 3 : 0
dx =. 2 cir 2
dy =. 2 cir 1
dz =. cir 1
%:@:(+/)@:*: dx,dy,dz
)

wavelengths =: 3 :0
NB. avg. earth radius in km
R=.6371
NB. Helpful: http://radiostationnet.com/fm/indiana/WFIU/
NB. f - 103.7MHz = 103700000
NB. λ - v ÷ f, where v = speed of light
NB. N - number of wavelengths between here and there: D ÷ λ
c =. 299792458 NB. speed of light
f =. 103700000 NB. approx center frequency of WFIU radio station
chord * c % f
)

echo wavelengths'' NB. 11254.209646912615426
exit''

