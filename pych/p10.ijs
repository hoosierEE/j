Note 'run length encoding'
verb (rle) produces the run-length-encoded version of y,
aka the next number in the look-and-say sequence.
)

load'regex'
rle =: 3 : 0
    sy =. ":y
    nub =. ~.sy
    idxs =. a:
    for_i. nub do.
        idxs =. idxs,<((":i) matchhelper sy)
    end.
    sorted =. /:~;idxs-.a: NB. 2 columns, #":y rows
    ,>":each ((0{"1 sorted){sy);~"0(1{"1 sorted)
)

matchhelper =: 4 : 0
    ,"2(x,'+') rxmatches y
)

NB. a =: 1 11 21 1211 111221 ...
get30th =: 3 : '$rle^:30]1' NB. len(a[30])
