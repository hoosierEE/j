NB. Subset Sum Problem (NP-Complete)
NB. Sum first k elements of the xth anagram of `pops` (sorted descending)
NB. until sum equals target value.  If found, print and exit.
NB. If target < +/k, increment x by !(k -~ #pops) and repeat until x >: !#y.
clear''
pips =: 5 4 2 0 1
pops =: 18897109 12828837 9461105 6371773 5965343 5946800 5582170 5564635 5268860 4552402 4335391 4296250 4224851 4192887 3439809 3279833 3095313 2812896 2783243 2710489 2543482 2356285 2226009 2149127 2142508 2134411 NB. sorted descending

sum =: 4 : 0 NB. x is subset sum of y?
    assert. *./(x<:+/y),(x>0),(x>:<./y),(0&=#@$x) NB. fail fast
    aicur =: <:!#x:y NB. anagram index current
    sorty =: \:~y NB. descending

    while. aicur >: 0 do. NB. exhaustive search
        z =: (x:aicur) A. sorty
        if. x e. +/\ z do.
            ({.>:I.(x =+/\z)) {. z
            return.
        end.
        NB. decrement current anagram index by !(length of list - overshoot index)
        aicur =: aicur - !(#x:sorty) - {.I.-.1e8>+/\z
    end.
    'none found'
)

NB. (+/\pips);(10=+/\pips);(I.10>+/\pips) maybe...
tester =: 4 : 'x;x sum y'
tests =: 3 : 0
    echo 2  tester pips
    echo 3  tester pips
    echo 6  tester pips
    echo 8  tester pips
    echo 10 tester pips
    echo 11 tester pips
    echo 13 tester pips
    echo 'known subset of pops: ',(":ssp =: +/}.16{.pops)
    echo ssp tester pops
)
NB. tests''

NB. https://opengarden.com/jobs
NB. The 2010 Census puts populations of 26 largest US metro areas at
NB. 18897109, 12828837, 9461105, 6371773, 5965343, 5946800, 5582170,
NB. 5564635, 5268860, 4552402, 4335391, 4296250, 4224851, 4192887,
NB. 3439809, 3279833, 3095313, 2812896, 2783243, 2710489, 2543482,
NB. 2356285, 2226009, 2149127, 2142508, and 2134411.
NB. Can you find a subset of these areas where a total of
NB. exactly 100,000,000 people live, assuming the census estimates
NB. are exactly right? Provide the answer and code or reasoning used.
