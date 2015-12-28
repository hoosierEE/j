Note 'find.ijs'
verbs to query already-loaded names
examples:
find ''   NB. display ALL loaded names next to their locale
find 'fo' NB. display names which contain the substring 'fo'
find 'JV' NB. display names which contain the substring 'JV'
)

locales =: conl''  NB. all named locales

ename =: 3 :0
    NB. execute nl on each named locale
    (".@:]'nl_',],'_ y'"_) each locales
)

find =: 3 :0
    NB. Using all parts of speech:
    NB. display loaded names (and their locales) which match y
    '' find y
:
    NB. all names for the given parts of speech (noun, verb, 0, 3, etc.)
    if. 0=#y do. locales,.ename x return. end.
    NB. only names which match substring y
    (ename x) (4 : 'locales,.x {~ each I.L:0(a:~:L:1 y ss L:0]) x') y
)



NB. relatively easy to split a J script into J tokens, perhaps this could
NB. be the basis of syntax highlighting somehow...
NB. |:;"1 (],:(type each)) ;:&.>cutLF 1!:1<'help.ijs'

