#!/usr/bin/jc

NB. jVerb
= < <. <: > >. >: _: + +. +: * *. *: - -. -: % %. %: ^ ^!.p ^. $ $. $: ~. ~:
| |. |.!.f |.!.f |: , ,. ,: ; ;: # #. #: ! /: \: [ [: ] { {. {: {:: }. }: ". ": ? ?.
A. C. C.!.2 e. E. i. i: j. L. o. p. p.. p: q: r. s: u: x:
_9: _8: _7: _6: _5: _4: _3: _2: _1: 0: 1: 2: 3: 4: 5: 6: 7: 8: 9:
NB. Constants
1.3 _8
NB. jNoun
a. a: _.
NB. jConjuction
^: . .. .: :  :. :: ;. !. !: " ` `: @ @. @: & &. &: &.: d. D. D: H. L: S: T.
NB. jAdverb
~ / \ /. \. } b. f. M. t. t:
NB. jCopula
=. =:
NB. jControl
theseAllMustBeInsideAnExplicitDefinition 3 : 0
assert. break. case. catch. catchd. catcht. continue.
do. else. elseif. end. fcase. for_name. goto_name. if. label_name.
return. select. throw. try. while. whilst.
)

m =: monad define
(((((x)))) - y)
x, y
)
x =. 'hi world'

NB. Numbers
1.4e8j3

w =. conjunction define
%:*/
)

myVerb =: 3 : 0
(1 - (3 * (4)) % 20 + y)
x = 1
)

thisisMyNoun =. 0 : 0
NB. a comment can go here.
'thisIsMyNoun', 'and', 'it''s', 'awesome'
10 20 30
Regular words!
)

Note 'myNote'
this is a note
)
'this should look like a string'

Note 'myNote'
this is a note preceded by whitespace.
)
'this should look like a string'

something =. %:+/*: 4 Note 'single-line note'
'this should look like a string'

