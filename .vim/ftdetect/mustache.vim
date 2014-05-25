if has("autocmd")
    au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hulk,*.hogan,*.hjs set filetype=html syntax=mustache
endif
