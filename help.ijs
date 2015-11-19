NB. verbs to query already-loaded names
NB. examples:
NB. help'' NB. display all loaded names next to their locale
NB. help 'fo' NB. display names which contain the substring 'fo'
NB. help 'JV' NB. display names which contain the substring 'JV'

ename =: 3 :0
  (".@:]'nl_',],'_ y'"_) each (18!:1]0)
)
  
help =: 3 :0
  NB. display loaded names (and their locales) which match y
  libs =: 18!:1]0
  lst =: ename ''
  token =: y
  token (4 : 'libs,.lst {~each I.L:0(a:~:L:1 x ss L:0]) y') lst
)