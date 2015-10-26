NB. Calculate parallel resistance:
NB. 1. take reciprocal of y (% y)
NB. 2. sum (+/ y)
NB. 3. take reciprocal of that (% y)
parallel =: %@:(+/)@:%

NB. notice that we did the reciprocal at the beginning, and then un-did it at the end.
NB. In J, there is a conjunction for this called "Under" and spelled &. or &:
parallel2 =: +/&:% NB. note use of &: instead of &. because rank of % is _
parallel2x =: x:parallel2 NB. extended precision: result as a rational number.

NB. all of the above operate on columns of y
