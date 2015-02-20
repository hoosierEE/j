#!/usr/bin/jc

NB. If you haven't yet done an
NB.    install'all'
NB. then now would be a good time. Go ahead now. We'll wait for ya.

NB. second riddle text:
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
NB. a =. u:(97+i.26)
NB. b =. (2|.a)
((2|.a),a.) {~ ((a=.u:(97+i.26)),a.) i. y
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

NB. one small letter, flanked by EXATLY 3 big bodyguards...
FHS_jregex_=:1 NB. add this line on ARM so that regex libraries will load.
load 'regex'
NB. Perhaps instead use:
NB.   require'regex'
NB. Not really sure...
thirdRiddle =: 3 : 0
txt =. 1!:1<'bodyguards.txt'
pat =. '(?<=[a-z])[A-Z]{3}[a-z][A-Z]{3}(?=[a-z])'
3{"1>pat rxall txt NB. take third letter of each result
)
echo 'thirdRiddle'
echo thirdRiddle''
echo''

NB. "follow the chain"
NB. page source says:
NB.   urllib may help. DON'T TRY ALL NOTHINGS, since it will never
NB.   end. 400 times is more than enough.
NB. Build two lists. First, with the raw response "and the next nothing is XXXXX"
NB. Second, a list of the nodes. When one of these lists repeats, assume we wrapped
NB. around to the start of the list again.
load'web/gethttp'
fourthRiddle =: 3 : 0
str =. 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=' NB. constant for this challenge
log =. node =. '12345' NB. start value
NB.log =. node =. '8022' NB. after divide by two prompt
NB. Some helpers
next =. 3 : '>{:;: y' NB. extract next node from http response
while. (# log) = (+/~: log) do.
  node =. next reply =. gethttp str,node
  log =. node;log
  echo reply
end.
)

echo 'fourthRiddle'
echo fourthRiddle''
echo''

echo 'to exit the J terminal and return to the shell, type the letters exactly as you see them below:'
echo '   exit'''''

