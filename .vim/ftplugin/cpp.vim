setlocal cindent
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal comments=sl:/*,mb:\ *,elx:\ */
setlocal tags+=~/.vim/tags/systags
setlocal ofu=syntaxcomplete#Complete

if (g:colors_name == "hybrid")
    hi! CppClassNamespace ctermfg=139
    hi! CppStlNamespace ctermfg=109
    hi! CppStlContainer ctermfg=109
endif
