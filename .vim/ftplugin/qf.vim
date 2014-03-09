setlocal winheight=3
setlocal wrap
setlocal norelativenumber number
setlocal linebreak
setlocal nolist
wincmd J

" Stay in the quickfix list after hitting enter.
nnoremap <buffer> <CR> <CR><C-w>p
