#!/usr/bin/jc

monthlyPayment =: 3 : 0
NB. some assumptions
downPayment =. 6000
monthlyRate =. 0.03125 % 12
numPayments  =. 180
houseAmount =. y NB. ".>}.}.ARGV NB. get the input arguments
loanAmount  =. houseAmount - downPayment
NB. the following are in units of dollars per month
insurance   =. 75
taxes       =. houseAmount * 0.01 % 12
taxes + insurance + monthlyRate * loanAmount % 1 - (1 + monthlyRate)^(-numPayments)
)

echo monthlyPayment ".>}.}.ARGV NB. input args: house value(s)
exit''
