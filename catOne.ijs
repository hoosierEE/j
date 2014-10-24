#!/usr/bin/jc
NB. Read contents of one of the ijs files in this directory into a string and echo the result.

NB. One-line version:
NB. scriptName =.  1!:1 {.{. 1!:0 '*.ijs'

NB. Directory (e.g. `dir` in Windows)
all =. 1!:0 '*.ijs'
NB. a single script's name
scriptName =. {.^:2 all
NB. read the script into a string
str =. 1!:1 scriptName
echo scriptName
echo ''
echo str
exit ''

