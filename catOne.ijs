#!/usr/bin/jc
NB. Read contents of one of the ijs files in this directory into a string and echo the result.
NB. scriptName =.  1!:1 {.{. 1!:0 '*.ijs' NB. One-liner


all =. 1!:0 '*.ijs'     NB. Directory (e.g. `dir` in Windows)
scriptName =. {.^:2 all NB. a single script's name


str =. 1!:1 scriptName NB. read the script into a string
echo scriptName
echo ''
echo str
NB.exit '' NB. when calling this script from a J session, the 'exit' will stop the session, FYI.

