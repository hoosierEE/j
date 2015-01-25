# Is Python unique in this "comments in a zipfile" thing?
# I'll have to check that out.
import zipfile

f = open('a.txt','w') # we'll put the comments in here

def follow(zfn):
    """
    recursively follow each node, spitting out zipfile comments
    (as a side effect) to a text file.
    """
    print>>f,z.getinfo(zfn + '.txt').comment
    follow(z.open(zfn + '.txt').read().split()[-1])

follow('90052') # get this party started
