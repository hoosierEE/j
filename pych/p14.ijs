NB. some utilities to make and rearrange spirals
NB. generate a spiral (of y rotations), increasing outwardly
spiral =: 3 : '(|.@|:,~>./@, + 1 + i.@#)^:(y) ,.1'
NB. re-indexed to start at 0 and wrap clockwise inward
wraps =:  3 : '|."1((*:@>:@-:) y) - (spiral y)'

NB. given a side length, return its inward-going spiral

