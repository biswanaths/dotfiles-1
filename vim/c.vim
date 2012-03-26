"Enable function highlight for C and Cpp files since vim does not do this by default. 
" Highlight Class and Function names
" Credit goes to egastal / Site: http://pastebin.com/f33aeab77 

syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
 
hi def link cCustomFunc  Function
hi def link cCustomClass Function
