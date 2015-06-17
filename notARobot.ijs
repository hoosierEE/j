
NB. first subset whose sum equals x
NB. Sum the first k elements of the xth anagram of `pops` (sorted descending)
NB. until the sum equals or exceeds `total`.  If equal, print and exit.
NB. Otherwise, increment x by !k and repeat until x >: !#y.

pips =: \:~ >:i.4
pops =: \:~ 18897109 12828837 9461105 6371773 5965343 5946800 5582170 5564635 5268860 4552402 4335391 4296250 4224851 4192887 3439809 3279833 3095313 2812896 2783243 2710489 2543482 2356285 2226009 2149127 2142508 2134411 NB. sorted descending
NB. target =: 1e8
target =: 3
sum =: 4 : 0 NB. x subset sum of y
    ai =: <:!#y NB. same effect as A. y without puking on large y
    idx =: 0
    x < +/\ y
)
NB. playing with this currently:
NB. (+/\pips);(10=+/\pips);(I.10>+/\pips)

echo 6 sum pips

NB. https://opengarden.com/jobs
NB. The 2010 Census puts populations of 26 largest US metro areas at
NB. 18897109, 12828837, 9461105, 6371773, 5965343, 5946800, 5582170,
NB. 5564635, 5268860, 4552402, 4335391, 4296250, 4224851, 4192887,
NB. 3439809, 3279833, 3095313, 2812896, 2783243, 2710489, 2543482,
NB. 2356285, 2226009, 2149127, 2142508, and 2134411.
NB. Can you find a subset of these areas where a total of
NB. exactly 100,000,000 people live, assuming the census estimates
NB. are exactly right? Provide the answer and code or reasoning used.
