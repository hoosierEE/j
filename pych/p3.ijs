NB. One small letter, flanked by EXATLY 3 big bodyguards...
NB. So there's some oddity with FHS on ARM, so using regex 
NB. (which should be loaded by the default profile anyway) requires 2 extra steps:
NB. 1. FHS_jregex_ =: 1 NB. alter this value prior to...
NB. 2. load'regex' NB. ...so that regex sees the correct setting
NB. If this bug is fixed, then neither of these steps would be requied
load 'regex' NB. can't use require'regex' because it's already loaded
thirdRiddle =: 3 : 0
txt =. 1!:1<'bodyguards.txt'
pat =. '(?<=[a-z])[A-Z]{3}[a-z][A-Z]{3}(?=[a-z])'
3{"1>pat rxall txt NB. take third letter of each result
)

