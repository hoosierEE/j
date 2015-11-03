d =: 1!:1<'depickled' NB. read input
NB. make (column 1) copies of (column 0)
copy =: 3 : '(>1{"1 y)#(>0{"1 y)'
NB. given a list of python 2-tuples, turn them into a 2-column boxed J noun
columnize =: 3 : '_2 (".L:0@])\L:1 '','' cut&(''[]()'' -.~ ])L:0 y'
NB. output to console
>copy L:1 columnize cutLF d
