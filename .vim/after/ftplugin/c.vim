" Compiler settings
compiler clang
let b:dispatch = 'clang %'
setlocal makeprg=clang\ %

" General
setlocal nofoldenable foldmethod=syntax
setlocal commentstring=//\ %s
setlocal textwidth=80
command! -nargs=0 Format call functions#general#AStyleFormat()
