#!/usr/bin/env jc

About =: 0 : 0
Command-line utility to calculate compound interest.
)

Help =: 0 :0
Usage: 

compint [rate years startingAmount [monthlyContribution]]

If no arguments given, display this help message.
Otherwise provide APR, number of years, and a starting amount in the account.
Optionally provide a monthly contribution amount.  Default value is zero.

)

NB. script handling
handleArgs =: 3 : 0
    if. #ARGV = 0 do.
        echo Help
    end.
)

