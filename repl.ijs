NB. demo showing how to make a simple repl in j.

readln =: [: (1!:01) 1:
donext =: [: (9!:29) 1: [ 9!:27

NB. uncomment for repl
NB. main =: verb define
NB.   echo ''
NB.   echo 'main loop. type ''bye'' to exit.'
NB.   echo '--------------------------------'
NB.   while. (s:'`bye') ~: s:<input=:readln'' do.
NB.     echo ".input
NB.   end.
NB.   echo '--------------------------------'
NB.   echo 'loop complete. returning to j.'
NB.   NB. or put (  exit'' ) here to exit j.
NB. )
NB. donext 'main _'

oneline =: verb define
  echo ''
  echo 'process a single line of input:'
  echo '-------------------------------'
  (s:'`CRLF') ~: s:<input=:readln''
  NB. do something with the input
  echo ".input
  echo '--------------------------------'
  NB. or put (  exit'' ) here to exit j.
)

donext 'oneline _'

