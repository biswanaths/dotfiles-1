setlocal shiftwidth=2
setlocal softtabstop=2
setlocal textwidth=80
inoremap <expr> <tab> self#simpleTabComplete("complete")
let b:dispatch = 'rspec %'
