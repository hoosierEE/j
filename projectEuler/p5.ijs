NB. div10 =: 1+i.10
NB. 2520 is smallest int evenly divisible by each of div10
NB. +/(0&~:div10|])"0] 2520 NB. sum equals 0

NB. find smallest int evenly divisible by each of 1+i.20
divs =: 11+i.10
smallest20 =: verb define
  input =: 2520
  sum =: 1
  while. sum do.
    sum =: +/(0&~:divs|])"0] input
    if. sum do. input =: 20 + input end.
  end.
  echo input
)

smallest20''

