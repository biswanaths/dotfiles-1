" Dispatch
let b:dispatch = 'clang %'
setlocal commentstring=//\ %s
setlocal textwidth=80
command! -nargs=0 Format call self#AStyleFormat()
