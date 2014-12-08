#!/usr/bin/jc

monthlyPayment =: 3 : 0
NB. some assumptions
downPayment =. 6000
monthlyRate =. 0.045 % 12
numPayments  =. 180
houseAmount =. ".>}.}.ARGV NB. get the input arguments
loanAmount  =. houseAmount - downPayment
insurance   =. 75
taxes       =. houseAmount * 0.01 % 12
taxes + insurance + monthlyRate * loanAmount % 1 - (1 + monthlyRate)^(-numPayments)
)

echo monthlyPayment''
exit''
