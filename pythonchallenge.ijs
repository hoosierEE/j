#!/usr/bin/jc

NB. second riddle
NB. Text:

riddleText =: 'g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr''q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.'

NB. Rotate by 2:
firstRiddle =: 3 : 0
a.{~(-&26)^:(122<])"0](2+])^:(e.(97+i.26)"0)"0 a.I. y
)
echo 'firstRiddle'
echo firstRiddle riddleText
echo''

NB. Find rare characters. Too easy in J.
secondRiddle =: 3 : 0
uniques =. 1!:1<'rare.txt'
~. uniques
)
echo 'secondRiddle'
echo secondRiddle''
echo''

thirdRiddle =: 3 : 0
a=:y
)
echo 'thirdRiddle'
echo thirdRiddle''
echo''

NB.exit''

