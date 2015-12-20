NB. reverse a string (actually, reverse the order of the atoms of any array)
rev =: ({: , $:@}:)`]@.(0 = #)

NB. print every leaf node of a tree (in this case, a boxed structure)
leaves =: echo@$:@]&>`>@.(0: = L.)