#!/usr/bin/jc

Note 'skittish.ijs'
Reads an integer N from stdin, creates a directory tree N deep with this script at the end.
)

str =: 1!:1 scriptName =: <'skittish.ijs' NB. read name of this script into a string
N =: ".>{:ARGV NB. this many levels in the tree
NB. ' /'charsub":1+i.N NB. swap space for forward slash

(fpathcreate @:]' /'charsub":)\+&1^:1+i.N

NB. ":\1+i.N NB. default format between integers of N
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
NB.
NB. (1!:5<":)N
NB. (+&1)^:(]<N)1
