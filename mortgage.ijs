Note 'mortgage'
Make a symlink to this, then call via the command line
with house price as the argument.
  Example:
    $ mortgage 150000
    1185.8
)

NB. TODO: split input args into house [tax, deposit] based on percentage of house.

monthlyPayment =: 3 :0

NB. some assumptions
downPayment =. 7500
monthlyRate =. 0.03625%12 Note 'a comment?'
numPayments =. 12*30
houseAmount =. y
loanAmount  =. houseAmount-downPayment

NB. the following are in units of dollars per month
insurance   =. 75
taxes       =. 1193.92 % 12 NB.      =. houseAmount * 0.01 % 12
taxes+insurance+monthlyRate*loanAmount%1-(1+monthlyRate)^(-numPayments)
)

echo monthlyPayment ".>}.}.ARGV NB. input args: house value
exit''

