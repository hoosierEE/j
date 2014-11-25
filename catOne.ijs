#!/usr/bin/jc
NB. Read contents of one of the ijs files in this directory into a string and echo the result.
NB. scriptName =.  1!:1 {.{. 1!:0 '*.ijs' NB. One-liner


NB. all =. 1!:0 '*.ijs'     NB. Directory (e.g. `dir` in Windows)
NB. scriptName =. {.^:2 all NB. a single script's name

scriptName =. <'catOne.ijs' NB. Makes this script a quine.
str =. 1!:1 scriptName NB. read the script into a string
echo ;:< str

exit '' NB. when calling this script from a J session, the 'exit' will stop the session, FYI.

