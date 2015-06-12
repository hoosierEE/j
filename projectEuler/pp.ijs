
divs =: 1+i.10
smallest20 =: verb define
  input =: 20
  sum =: 1
  while. sum do.
    sum =: +/(0&~:divs|])"0] input
    if. sum do. input =: input + 20 end.
  end.
  echo input
)

smallest20''

