" Compiler settings
compiler clang
let b:dispatch = 'clang %'
setlocal makeprg=clang\ %
setlocal equalprg=clang-format-3.5

" General
setlocal nofoldenable foldmethod=syntax
command! -nargs=0 Format call functions#general#AStyleFormat()
