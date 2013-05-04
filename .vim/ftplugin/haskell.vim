set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround

" Syntax
let hs_highlight_delimiters=1
let hs_highlight_boolean=1
let hs_highlight_types=1
let hs_highlight_more_types=1

" Compiler
au! BufEnter *.hs compiler ghc
let g:ghc="/usr/local/bin/ghc"

" Browser for documentation
let g:haddock_docdir="/usr/local/share/doc/ghc/html/"
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
