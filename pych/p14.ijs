NB. Lateralus

NB. generate an outwardly increasing spiral by adding y sides to 1
outcw =: 3 : '(|.@|:,~>./@, + 1 + i.@#)^:(y) ,.1'

NB. spiral inward starting at 0
indcw =:  3 : '|."1((*:@>:@-:) y) - (outcw y)'

NB. spiral inward starting at 0, with side length y
norm =: 3 : 0
    max =. >./^:($@#) y
)

NB. given a side length, return its inward-going spiral

