Note 'taken from https://opengarden.com/jobs'
The 2010 Census puts populations of 26 largest US metro areas at
18897109, 12828837, 9461105, 6371773, 5965343, 5946800, 5582170,
5564635, 5268860, 4552402, 4335391, 4296250, 4224851, 4192887,
3439809, 3279833, 3095313, 2812896, 2783243, 2710489, 2543482,
2356285, 2226009, 2149127, 2142508, and 2134411.

Can you find a subset of these areas where a total of
exactly 100,000,000 people live, assuming the census estimates
are exactly right? Provide the answer and code or reasoning used.
)

pops =: 18897109 12828837 9461105 6371773 5965343 5946800 5582170 5564635 5268860 4552402 4335391 4296250 4224851 4192887 3439809 3279833 3095313 2812896 2783243 2710489 2543482 2356285 2226009 2149127 2142508 2134411
pips =: i.5

alg =: 3 : 0
    NB. similar to the knapsack problem
    a =: x:!#pips
    'min max' =: ({.,{:)>.1e8%pops
    while. a =: <:a do.
        for_b. min+i.max-min do. NB. numbers of combinations
            if. 1e8=+/b{.(a A.pops) do.
                echo b{.(a A.pops)
                goto_done.
            end.
        end.
    end.
    label_done.
)
alg''

NB. alg =: 3 : 0
    NB.     NB. exponential time complexity
    NB.     for_a. x:!#pops do.
    NB.         for_b. #pops do.
    NB.             NB. given anagram index a, return sum = 1e8 or nothing
    NB.             if. 1e8 e. (a A. pops) do.
    NB.                 echo a,b
    NB.             end.
    NB.         end.
    NB.     end.
    NB. )
    NB. alg''
