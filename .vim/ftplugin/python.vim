" Tab settings
setlocal tabstop=8
setlocal textwidth=79
setlocal cindent
setlocal previewheight=4
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
setlocal formatoptions=croqlj
let g:SuperTabDefaultCompletionType="<c-x><c-o>"

" Easier way to enter docstrings
nnoremap ,d cc"""<cr>"""<esc>O
