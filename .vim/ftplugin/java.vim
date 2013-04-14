" General settings
setlocal tabstop=3
setlocal softtabstop=3
setlocal shiftwidth=3
setlocal expandtab
setlocal textwidth=80
setlocal formatoptions=crq
setlocal autoindent
setlocal foldmethod=marker
setlocal foldlevel=0
setlocal foldmarker=//{,//}
setlocal cinoptions+=j1      " For java inner classes.

" Turn on some syntax highlighting
let java_allow_cpp_keywords=1
let java_highlight_functions="style"
let java_highlight_java_lang_ids=1
let java_highlight_java_io=1
let java_highlight_debug=1
let java_highlight_all=1
let java_minlines=150

"Tags 
setlocal tags+=~/.vim/tags/java_io
setlocal tags+=~/.vim/tags/java_util
setlocal tags+=~/.vim/tags/java_lang

" Tagbar Settings
let g:tagbar_width=45
autocmd VimEnter * nested :TagbarOpen
