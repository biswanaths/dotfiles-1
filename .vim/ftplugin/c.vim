" Compiler settings
compiler clang
let b:dispatch = 'clang %'
setlocal makeprg=clang\ %

" General
setlocal nofoldenable foldmethod=syntax
command! -nargs=0 Format call functions#general#AStyleFormat()
