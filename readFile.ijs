#!/usr/bin/jc

NB. Read contents of pwd into a string, echo result.

first =:  1!:1 {.{. 1!:0 '*.ijs' NB. first J script

echo first NB. display it to stdout with trailing newline added (by echo)

exit''
