" General settings
setlocal tabstop=3
setlocal softtabstop=3
setlocal shiftwidth=3
setlocal expandtab
setlocal textwidth=80
setlocal colorcolumn=+1
setlocal formatoptions=crq
setlocal autoindent
setlocal foldmethod=marker
setlocal foldlevel=0
setlocal foldmarker=//{,//}

" Turn on some syntax highlighting
let java_allow_cpp_keywords=1
let java_highlight_functions=1

"Tags 
setlocal tags+=~/.vim/tags/java_io
setlocal tags+=~/.vim/tags/java_util
setlocal tags+=~/.vim/tags/java_lang

" Tagbar Settings
let g:tagbar_width=45
autocmd VimEnter * nested :TagbarOpen
