#!/usr/bin/jc

NB. second riddle
NB. Text:

NB. Rotate by 2:
firstRiddle =: 3 : 0
riddleText =. a.I. 'g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr''q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.'
a.{~(-&26)^:(122<])"0](2+])^:(e.(97+i.26)"0)"0 riddleText
)
echo 'first riddle'
echo firstRiddle''
echo''

NB. Find rare characters. Too easy in J.
secondRiddle =: 3 : 0
uniques =. 1!:1<'rare.txt'
~. uniques
)
echo 'second riddle'
echo secondRiddle''
echo''

thirdRiddle =: 3 : 0
)
echo 'third riddle'
echo thirdRiddle''
echo''

exit''

