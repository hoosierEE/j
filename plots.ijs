require 'plot'
data=: 15 ?@$ 50

pd 'reset'
pd"1 ,.data ; 2 4 12(+/ % #)\ data
pd 'show'
exit''
