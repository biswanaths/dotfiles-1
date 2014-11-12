setlocal makeprg=perl\ -c\ %\ $*
setlocal errorformat=%f:%l:%m
setlocal nofoldenable foldmethod=indent foldnestmax=1
vnoremap ,tid my:!perltidy<CR>`y
nnoremap ,tid mt:%!perltidy<CR>`t
