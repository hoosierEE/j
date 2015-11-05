# Is Python unique in this "comments in a zipfile" thing?
# I'll have to check that out.
import zipfile

f = open('a.txt','w') # we'll put the comments in here

def follow(zfn):
    """
    recursively follow each node, spitting out zipfile comments
    (as a side effect) to a text file.
    """
    print>>f,zfn.getinfo(zfn + '.txt').comment
    follow(zfn.open(zfn + '.txt').read().split()[-1])

follow('90052') # get this party started
