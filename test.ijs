#!/usr/bin/jc

Note 'testing'
)

NB. jVerb
= < <. <: > >. >: + +. +: * *. *: - -. -: % %. %: ^ ^. $ $. $: ~. ~: | |. |:
|.!.f
, ,. ,: ; ;: # #. #: ! /: \: [ [: ] { {. {: {:: }. }: ". ": ? ?.
A. c. C. e. E. i. i: I. j. L. o. p. p: q: r. s: u: x:
_9: _8: _7: _6: _5: _4: _3: _2: _1: 0: 1: 2: 3: 4: 5: 6: 7: 8: 9:

NB. jNoun
a. a: _. _:

NB. jConjuction
^: . .. .: :  :. :: ;. !. !: " ` `: @ @. @: & &. &: &.: d. D. D: H. L: S: T.

NB. jAdverb
~ / \ /. \. } b. f. M. t. t:

NB. jCopula
=. =:

m =: monad define
x - y
try. catchd. end.
1 2 3
)

n =. conjunction define
%:*/
)

myVerb =: 3 : 0
  (1 - (3 * (4)) % 20 + y)
  x = 1
  try.
    x + y
  do.
  catchd.
  fcase.
    while. whilst.
  case.
    NB. TODO FIXME XXX inside a comment, these words appear speical.
    select. return.
    label_s. goto_x.
    if. elseif. else. end.
  end.
)

thisisMyNoun =. 0 : 0
  'thisIsMyNoun', 'and', 'it''s', 'awesome'
  10 20 30
  Regular words!
)

Note 'myNote'
this is a note
)

 Note 'myNote'
this is a note preceded by whitespace.
)

something =. %:+/*: 4 Note 'single-line note'

