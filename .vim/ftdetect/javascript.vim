autocmd BufNewFile,BufRead *.js setf javascript
autocmd BufNewFile,BufRead *.jsm setf javascript
autocmd BufNewFile,BufRead Jakefile setf javascript

function! s:SelectJavascript()
    if getline(1) =~# '^#!.*/bin/env\s\+node\>'
        set ft=javascript
    endif
endfun
autocmd BufNewFile,BufRead * call s:SelectJavascript()
