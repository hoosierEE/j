
NB. first subset whose sum equals x
NB. Sum the first k elements of the xth anagram of `pops` (sorted descending)
NB. until the sum equals or exceeds `total`.  If equal, print and exit.
NB. Otherwise, increment x by !k and repeat until x >: !#y.
clear''

pips =: 5 4 2 1
pops =: 18897109 12828837 9461105 6371773 5965343 5946800 5582170 5564635 5268860 4552402 4335391 4296250 4224851 4192887 3439809 3279833 3095313 2812896 2783243 2710489 2543482 2356285 2226009 2149127 2142508 2134411 NB. sorted descending
NB. target =: 1e8
target =: 7

sum =: 4 : 0 NB. x subset sum of y
    assert. *./(x<:+/y),(x>0),(x>:<./y),(0&=#@$x)
    minterms =: <./>.x%y NB. target sum needs at least this many terms (necessary?)
    aibeg =: 0      NB. starting anagram index
    aiend =: <:!#y  NB. ending anagram index
    sorted =: \:~y  NB. descending
    NB. exhaustive search (exponential)
    while. aibeg <: aiend do.
        z =: aibeg A. sorted
        if. x e. +/\ z do.
            ({.>:I.(x =+/\z)) {. z
            return.
        end.
        aibeg =: >: aibeg
    end.
    'none found'
)

NB. (+/\pips);(10=+/\pips);(I.10>+/\pips) maybe...
tester =: 4 : 'x;x sum y'
tests =: 3 : 0
    echo 2 tester 5 4 3 0 1
    echo 3 tester 5 4 3 0 1
    echo 6 tester 5 4 3 0 1
    echo 8 tester 5 4 3 0 1
    echo 10 tester 5 4 3 0 1
    echo 11 tester 5 4 3 0 1
    echo 13 tester 5 4 3 0 1
)
tests''
NB. (130<:b);(b=:+/\"1 a);(a =: tap \:~19 62 71 72)

NB. https://opengarden.com/jobs
NB. The 2010 Census puts populations of 26 largest US metro areas at
NB. 18897109, 12828837, 9461105, 6371773, 5965343, 5946800, 5582170,
NB. 5564635, 5268860, 4552402, 4335391, 4296250, 4224851, 4192887,
NB. 3439809, 3279833, 3095313, 2812896, 2783243, 2710489, 2543482,
NB. 2356285, 2226009, 2149127, 2142508, and 2134411.
NB. Can you find a subset of these areas where a total of
NB. exactly 100,000,000 people live, assuming the census estimates
NB. are exactly right? Provide the answer and code or reasoning used.
