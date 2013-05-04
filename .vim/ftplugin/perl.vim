setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal expandtab
setlocal makeprg=perl\ -c\ %\ $*
setlocal errorformat=%f:%l:%m
setlocal foldmethod=indent
setlocal foldnestmax=1
let perl_include_pod=1
let perl_extended_vars=1
let perl_sync_dist=250
vnoremap ,tid :!perltidy<CR>
nnoremap ,tid :%!perltidy<CR>

let g:SuperTabDefaultCompletionType="<c-x><c-o>"
