Note 'taken from https://opengarden.com/jobs'

The 2010 Census puts populations of 26 largest US metro areas at 18897109, 12828837, 9461105, 6371773, 5965343, 5946800, 5582170, 5564635, 5268860, 4552402, 4335391, 4296250, 4224851, 4192887, 3439809, 3279833, 3095313, 2812896, 2783243, 2710489, 2543482, 2356285, 2226009, 2149127, 2142508, and 2134411.

Can you find a subset of these areas where a total of exactly 100,000,000 people live, assuming the census estimates are exactly right? Provide the answer and code or reasoning used.
)

NB. Convert sentence to J array:
pops =: 18897109 12828837 9461105 6371773 5965343 5946800 5582170 5564635 5268860 4552402 4335391 4296250 4224851 4192887 3439809 3279833 3095313 2812896 2783243 2710489 2543482 2356285 2226009 2149127 2142508 2134411

le =: 3 : '1e8<:+/y'
ex =: 3 : '1e8&=+/ y'
lt =: 3 : '1e8<+/ y'

NB. for permutations of pops, does sum of a subset equal 1e8?
sumpop =: 3 : 0
    iter =: 2 NB. !#pops
    for_ii. iter do. 
        echo ii
        if. 1e8>:+/\"1 A. pops do.
            echo ii
        end.
        iter =: <:iter
    end.
)
sumpop''



NB. example: find the sum of the first 2 items of the row of this anagram index
NB. +/"1] 0 1{"1 (i.!3)A.i.3

NB. find permutation(s) whose sum = 100 million.
