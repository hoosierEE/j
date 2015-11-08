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
