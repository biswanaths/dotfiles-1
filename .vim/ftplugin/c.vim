" Compiler settings
compiler clang
let b:dispatch = 'clang %'
setlocal makeprg=clang\ %

" General
setlocal commentstring=//\ %s
setlocal textwidth=80
setlocal equalprg=astyle\ --mode=c
command! -nargs=0 Format call self#AStyleFormat()
