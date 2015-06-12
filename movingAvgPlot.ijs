NB. Computes the moving average of an audio file
NB. usage:
NB.   jc movingAvg.ijs
NB. where `jc` is an alias for (or symlink to) the J803 `jconsole` app.  Download from the following URL:
NB.   http://www.jsoftware.com/stable.htm

samplesPerSec =: % sampleRate =: 44100

NB. UTILS
NB. Convert Matlab format to J format
datConvert =: 3 : 0
  datFile =. freads y NB. 'Joanne_20150402T170940.dat'
  c =: >(".&>&cut) each b =: cutLF datFile
)

NB. moving average function
NB. get moving average of y, with window size x
NB. usage: [x] avg y
avg =: #%~+/
avg1 =: +/%#

NB. TESTING
ts =: 6!:2, 7!:2@]
dat =: datConvert 'Joanne_20150402T170940.dat'
NB.    ts 'dat =: datConvert ''Joanne_20150402T170940.dat''' NB. 30.1 megabyte file
NB. 6.16866 3.30816e8

NB. Plot moving avg of period y for x samples of the specified file.
plotExample =: 4 : 0
  samples =. |: x {. dat
  smoothed =. y avg1\ "1 samples
  require'plot'
  plot smoothed
)

plotFirstTenth =: 3 : 0
len =. 10 %~# dat
len plotExample y
)

NB. 100000 plotExample 512 1024 2048 4096
NB. plotFirstTenth 10 1024


exit''
