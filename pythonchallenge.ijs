#!/usr/bin/jc

NB. If you haven't yet done an
NB.    install'all'
NB. then now would be a good time to do that.

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

NB. do over
NB. found a pretty good hint here
NB. http://www.jsoftware.com/jwiki/Vocabulary/adot
firstAmend =: 3 : 0
a =. u:(97+i.26)
b =. (2|.a)
(b,a.) {~ (a,a.) i. y
)
echo 'firstAmend'
echo firstAmend riddleText
echo''

NB. Find rare characters. Too easy in J.
secondRiddle =: 3 : 0
uniques =. 1!:1<'rare.txt'
~. uniques
)
echo 'secondRiddle'
echo secondRiddle''
echo''

NB. one small letters, flanked by EXATLY 3 big bodyguards...
thirdRiddle =: 3 : 0
txt =. 1!:1<'bodyguards.txt'
pat =. '(?<=[a-z])[A-Z]{3}[a-z][A-Z]{3}(?=[a-z])'
3{"1>pat rxall txt
)
echo 'thirdRiddle'
echo thirdRiddle''
echo''

load'web/gethttp'
fourthRiddle =: 3 : 0
str =. 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='
first =. '12345'
reply =. gethttp str,first
res =. >{:;: reply
)

echo 'fourthRiddle'
echo fourthRiddle''
echo''

