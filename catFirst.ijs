#!/usr/bin/jc
NB. Read contents of pwd into a string, echo result.

NB. One-line version:
NB. contentsOfFirst =:  1!:1 {.{. 1!:0 '*.ijs'

all =: 1!:0 '*.ijs'                     NB. read all the .ijs files (output is similar to UNIX ls -l) into a table of boxes
firstFile =: {. all                     NB. get the first file (first row)
firstScriptName =: {. firstFile         NB. get the file name (first entry in the row)

contentsOfFirst =: 1!:1 firstScriptName NB. read (1!:1) the boxed filename (filename is already boxed) 

echo contentsOfFirst NB. display it to stdout with trailing newline added (by echo)

exit''

