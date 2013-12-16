setlocal cindent
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal expandtab
setlocal comments=sl:/*,mb:\ *,elx:\ */

if (g:colors_name == "hybrid")
    hi! CppClassNamespace ctermfg=139
    hi! CppStlNamespace ctermfg=109
    hi! CppStlContainer ctermfg=109
endif
