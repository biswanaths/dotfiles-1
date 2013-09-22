setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
nnoremap <buffer> <Leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
let g:SuperTabDefaultCompletionType="<c-x><c-o>"
