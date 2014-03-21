setlocal makeprg=perl\ -c\ %\ $*
setlocal errorformat=%f:%l:%m
setlocal foldmethod=indent
setlocal foldnestmax=1
vnoremap ,tid my:!perltidy<CR>`y
nnoremap ,tid mt:%!perltidy<CR>`t
