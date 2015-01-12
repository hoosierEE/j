
Note 'a skittish program'
    This program copies itself into a new directory. The directory is N
    levels deep with respect to the current working directory, where N is
    the command line argument given to the program.
)

exit (1!:1[1{A) 1!:2 <] (s,'/',>1{A)[fpathcreate s=:' /'charsub":1+i.".>{:A=:ARGV

