#!/usr/bin/jc

NB. display the contents of all the *.sh files in this directory
NB.
NB. echo 'hello world'

rd =: 1!:1&<

rd '*.sh' NB. read the *.sh files, displaying on stdout

exit''
