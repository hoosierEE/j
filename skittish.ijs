#!/usr/bin/jc

Note 'skittish.ijs'
Reads an integer N from stdin, creates a directory tree N deep with this script at the end.
)

NB. Read contents of one of the ijs files in this directory into a string and echo the result.
NB. scriptName =.  1!:1 {.{. 1!:0 '*.ijs' NB. One-liner

NB. all =. 1!:0 '*.ijs'     NB. Directory (e.g. `dir` in Windows)
NB. scriptName =. {.^:2 all NB. a single script's name


str =: 1!:1 scriptName =: <'skittish.ijs' NB. read name of this script into a string
N =: ".>{:ARGV
NB. ' /'charsub":1+i.N

":\1+i.N
NB. 1
NB. 1 2
NB. 1 2 3
NB. 1 2 3 4
NB. 1 2 3 4 5
NB. 1 2 3 4 5 6
NB. 1 2 3 4 5 6 7
NB. 1 2 3 4 5 6 7 8
NB. 1 2 3 4 5 6 7 8 9
NB. 1 2 3 4 5 6 7 8 9 10
NB. 1 2 3 4 5 6 7 8 9 10 11
NB. 1 2 3 4 5 6 7 8 9 10 11 12

NB.1!:5<dirs
NB. echo dirCount


NB.exit''

