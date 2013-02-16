set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set expandtab
set colorcolumn=81
set makeprg=perl\ -c\ %\ $*
set errorformat=%f:%l:%m
let perl_include_pod=1
let perl_extended_vars=1
let perl_sync_dist=250
vnoremap ,tid :!perltidy<CR>
nnoremap ,tid :%!perltidy<CR>
