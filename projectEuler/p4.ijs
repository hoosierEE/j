Note'p3'
Find the largest palindrome that is the product of two 3-digit numbers.
)

Note'my strategy'
Make a function that finds palindrome numbers.
Apply that function to a 3-digit number multiplication table.
)

prods =: */~  900 $ (-i.)999
vals =: (,~.) prods

NB.  Since our array is in descending order, just find the first palindrome.
pal =: (+/=#)&(|.=])

(I. (pal&":"0) vals) { vals

