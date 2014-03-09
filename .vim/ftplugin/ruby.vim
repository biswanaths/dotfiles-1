setlocal shiftwidth=2
setlocal softtabstop=2
setlocal textwidth=80
inoremap <expr> <tab> self#simpleTabComplete("omni")
let b:dispatch = 'ruby -c %'
