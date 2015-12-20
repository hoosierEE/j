Note 'help.ijs'
verbs to query already-loaded names
examples:
help ''   NB. display ALL loaded names next to their locale
help 'fo' NB. display names which contain the substring 'fo'
help 'JV' NB. display names which contain the substring 'JV'
)

NB. execute nl on each named locale
ename =: 3 :0
    (".@:]'nl_',],'_ y'"_) each (18!:1]0)
)

NB. display loaded names (and their locales) which match y
help =: 3 :0
    '' help y
:
    if. 0=#y do. (18!:1]0),.ename x return. end.
    (ename x) (4 : '(18!:1]0),.x {~each I.L:0(a:~:L:1 y ss L:0]) x') y
)

NB. relatively easy to split a J script into J tokens, perhaps this could
NB. be the basis of syntax highlighting somehow...
NB. |:;"1 (],:(type each)) ;:&.>cutLF 1!:1<'help.ijs'
