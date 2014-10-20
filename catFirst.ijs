#!/usr/bin/jc
NB. Read contents of pwd into a string, echo result.

NB. One-liner:
NB. first =:  1!:1 {.{. 1!:0 '*.ijs'

all =: 1!:0 '*.ijs'
firstFile =: {. all
firstScriptName =: {. firstFile

contentsOfFirst =: 1!:1 firstScriptName

echo contentsOfFirst NB. display it to stdout with trailing newline added (by echo)

exit''

