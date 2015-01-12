#!/usr/bin/jc

NB. second riddle
NB. Text:
t =: a.I. 'g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr''q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.'

NB. Rotate by 2:
ans =: 3 : 0
alph =. (97+i.26){a.
mod =. |&122
plus2 =. +&2
plus2 ^: (e.(97+i.26)"0)"0 y
NB. a.{~plus2
)

echo t
echo ans t

exit''
