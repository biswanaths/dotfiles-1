"---------------------------------"
"        _                        "
" __   _(_)_ __ ___  _ __ ___     "
" \ \ / / | '_ ` _ \| '__/ __|    "
"  \ V /| | | | | | | | | (__     "
" (_)_/ |_|_| |_| |_|_|  \___|    "
"                                 "
"---------------------------------"
" File: ~/.vimrc                  "
" Author: ajh17                   "
" Updated: March 2, 2013          "
"---------------------------------"
" Pathogen Settings {{{
silent! call pathogen#infect('bundle.remote/{}')
silent! call pathogen#helptags()
" }}}
" General Settings {{{
set relativenumber              " 'Tis the age of relative numbering
set showcmd                     " Show the current command below the status
set cmdheight=2                 " Statusline height
set showmode                    " Show the mode we are in
set nohidden                    " Allow hidden buffers
set mouse=a                     " Turn on mouse for everything
set scrolloff=4                 " Scroll when cursor is 4 off the top or bottom
set nrformats-=octal            " Prevents (in|de)crementing a 0 padded number to octal
set clipboard^=unnamed          " System clipboard support!
set virtualedit=block           " Allow editing in visual block mode
set laststatus=2                " Always show the statusline
set backspace=indent,eol,start  " Vim likes to think this is the 1970s sometimes and won't backspace
set ttyfast                     " Fast terminal connection
set cpoptions+=$                " Shows a dollar sign when changing text
set lazyredraw                  " Don't redraw while executing macros
set fileformats=unix
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=1
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:·,trail:·
set autoread                    " Detect when a file has been changed externally
set autochdir                   " Automatically change the cwd when editing a file, switching, etc
set spellfile=~/.vim/custom-dictionary.utf-8.add
set ttymouse=xterm2             " Recognize the mouse inside tmux
if &term =~ '^screen-.*-bce$'   " Background color erase support!
    set t_ut=y
endif
let mapleader=','               " Let leader key be , instead of \
set splitbelow splitright       " Split below or right to the current buffer for sp and vsp respectively
set timeout timeoutlen=1000 ttimeoutlen=100

"}}}
" Colorscheme / Syntax / Filetype {{{
syntax on
filetype plugin indent on
set t_Co=256
set background=dark
let g:hybrid_use_Xresources=1
colorscheme hybrid

" Hybrid Colorscheme better settings {{{2
if (g:colors_name == "hybrid")
    hi! Pmenu ctermfg=137 ctermbg=233 cterm=none
    hi! PmenuSel ctermfg=196 ctermbg=234 cterm=bold
    hi! PmenuSbar ctermfg=000 ctermbg=233 cterm=none
    hi! PmenuThumb ctermfg=137 ctermbg=235 cterm=none
    hi! StatusLine ctermfg=234 ctermbg=136 guifg=#1c1c1c guibg=#af8700
    hi! StatusLineNC ctermfg=234 ctermbg=100 guifg=#1c1c1c guibg=#878700
    hi! MatchParen ctermfg=196 ctermbg=234 cterm=bold
endif
""}}}2

"}}}
" Status Line {{{
set statusline=\ \%{&ff}\ \%{&fenc}\ buf\:\%1.3n\ \%{tagbar#currenttag('[%s]','')}
set statusline+=\ \%#StatusRO#\%R\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W
set statusline+=\ \%#StatusModFlag#\%M\ \ \%{fugitive#statusline()}
set statusline+=\%=\ \%#StatusLine#\%f\ \|\ \%#StatusFTP#\%Y\ \|\ \%p%%\ \|
set statusline+=\ LN\ \%1.7l\:\%1.7c\ 

"}}}
" Search Settings {{{
nnoremap / /\v
xnoremap / /\v
set incsearch
set smartcase
set ignorecase
set showmatch
set matchtime=2  " 2 tenths of a second to show the matching paren (instead of 5)
set hlsearch     " highlight matches

"}}}
" Tab, Indent and Folds {{{
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set shiftround
set textwidth=80
set nofoldenable                " Don't fold automatically
set foldmethod=indent           " Folds are based on indent

"}}}
" Completions {{{
set wildmenu
set wildmode=full
set wildchar=<Tab>
set completeopt+=longest
set previewheight=4
set omnifunc=syntaxcomplete#Complete

" }}}
" Wildignore {{{
set wildignorecase
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.out,*.DS_Store
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.zip,*.so,*.swp,*/tmp/*
set wildignore+=*.o,*.obj,*.manifest,*~,#*#,*.sw?,%*,*=

"}}}
"Backup settings {{{
set noswapfile
set history=1000
set backup
set backupdir=~/.vim/backup/
set undofile
set undodir=~/.vim/backup/undo/
set undolevels=1000

"}}}
" GUI Settings {{{
if has("gui_running")
    autocmd! FocusLost * :wa
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guifont=Anonymous\ Pro:h14
endif

"}}}
" Window Management {{{
" -- Switching between windows
nnoremap <silent> <leader>mh <C-w><C-h>
nnoremap <silent> <leader>mj <C-w><C-j>
nnoremap <silent> <leader>mk <C-w><C-k>
nnoremap <silent> <leader>ml <C-w><C-l>
" -- Moving windows
nnoremap <silent> <leader>sh <C-W>H
nnoremap <silent> <leader>sj <C-W>J
nnoremap <silent> <leader>sk <C-W>K
nnoremap <silent> <leader>sl <C-W>L
" -- Closing windows
nnoremap <silent> <leader>cc :close<CR>
nnoremap <silent> <leader>cq :cclose<CR>
nnoremap <silent> <leader>ch :wincmd h<CR>:close<CR>
nnoremap <silent> <leader>cj :wincmd j<CR>:close<CR>
nnoremap <silent> <leader>ck :wincmd k<CR>:close<CR>
nnoremap <silent> <leader>cl :wincmd l<CR>:close<CR>

" Automatically resize vertical splits
au! WinEnter * setlocal winfixheight
au! WinEnter * wincmd =

" }}}
" Plugin Preferences and Mappings {{{

" -- Ultisnips Settings --
let g:UltiSnipsListSnippets="<leader>L"
let g:UltiSnipsNoPythonWarning = 1 " Shut up ultisnips!

" -- haskellmode Settings --
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" -- Tagbar Settings --
let g:tagbar_expand=1
let g:tagbar_compact=1
let g:tagbar_width=35
nnoremap <silent> <F1> :TagbarToggle<CR>

" -- Syntastic Settings --
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=4
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = {'mode': 'active',
            \ 'active_filetypes': ['c', 'cpp', 'java', 'ruby', 'perl', 'haskell'],
            \ 'passive_filetypes': ['python'] }

" -- Supertab Settings --
let g:SuperTabCrMapping=0
let g:SuperTabClosePreviewOnPopupClose=1

" -- UltiSnips Settings --
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" -- Python-Mode Settings --
let g:pymode_doc=1
let g:pymode_doc_key='K'
let g:pymode_lint=1
let g:pymode_lint_checker="pyflakes,pep8"
let g:pymode_lint_write=1
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_folding=0
let g:python_run_key='<leader>R'
let g:pymode_lint_message=1

" -- ClangComplete Settings --
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_close_preview=1
let g:clang_complete_patterns=1
let g:clang_complete_macros=1

" -- Tabular Settings --
xnoremap <leader>t :Tabular<space>/

" -- Ctrl-p Settings --
nnoremap <leader>F :CtrlP<CR>
nnoremap <leader>f :CtrlPCurWD<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>r :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>T :CtrlPBufTag<CR>
nnoremap <leader>w :CtrlPLine<CR>
let g:ctrlp_extensions = ['tag', 'line']
let g:ctrlp_map='<F3>'
let g:ctrlp_mruf_max=25
let g:ctrlp_max_files=10000
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir='~/.cache/ctrlp'
let g:ctrlp_show_hidden=1
let g:ctrlp_follow_symlinks=1
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_root_markers = ['tags']

"}}}
" Vim Niceties {{{

" Reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" Open folds when searching, always centering the cursor.
nnoremap n nzzzv
nnoremap N Nzzzv

" Force save files requiring root permissions
cmap w!! %!sudo tee > /dev/null %

" Select the line that was last pasted
nnoremap <leader>V V`]

" select the entire line but ignore the indentation
nnoremap vv ^vg_

" Splits a line -- opposite of J (join lines)
nnoremap ,sp i<cr><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Map jk to move between visual lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Keep search pattern at the center of the screen
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Reformat a C/C++/Obj-C file with astyle (Uses .astylerc for 1TBS)
command! -nargs=0 Format call AStyleFormat()
function! AStyleFormat()
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'objc'
        :%!astyle
    endif
endfunction

" Haskell syntax
let hs_highlight_boolean=1
let hs_highlight_types=1
let hs_highlight_more_types=1
let hs_highlight_debug=1
let hs_allow_hash_operator=1

" C Syntas
let c_space_errors = 1
let c_comment_strings = 1

" Java syntax 
let java_highlight_java_lang_ids=1
let java_highlight_java_io=1
let java_highlight_util=1
let java_highlight_java=1
let java_highlight_debug=1
let java_allow_cpp_keywords=1

" Python sytax
let python_highlight_builtins=1
let python_highlight_exceptions=1
let python_highlight_space_errors=1

" Perl folding
let perl_extended_vars=1
let perl_fold=1

" }}}
" General Mappings {{{

" Restore , for searching with f/F/t/T
nnoremap \ ,

" Use the arrow keys to move around quickfix list keeping the cursor in the
" middle.
nnoremap <up> :lprev<CR>zvzz
nnoremap <down> :lnext<CR>zvzz
nnoremap <left> :cprev<CR>zvzz
nnoremap <right> :cnext<CR>zvzz
inoremap <up> <Esc>
inoremap <down> <Esc>
inoremap <left> <Esc>
inoremap <right> <Esc>

" Screw Ex-mode
nnoremap Q gq

" Readline-line movement for command mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" Quickly edit stuff
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>ez :e ~/.zshrc<CR>
nnoremap <silent> <leader>et :e ~/.tmux.conf<CR>

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef maggVG=`a

" Never felt the need to use H or L
nnoremap H ^
nnoremap L $

" UpperCase in insert mode
inoremap <C-u> <esc>mzgUiw`z

" Remove trailing whitespace
nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Use space to toggle folds
nnoremap <Space> za

" Yank to the end of the line
nnoremap Y y$

" Focus only on fold that is on the cursor position
nnoremap <leader>z zMzvzz

"}}}
" Tmux Cursor Bullcrap {{{
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"}}}
" Quick Filetype Settings {{{

" Haskell compiler
augroup haskell
    au!
    au BufEnter *.hs compiler ghc
    au BufEnter *.hs setlocal cmdheight=2
augroup END

" Better CR expansion
autocmd FileType c,cpp,objc,perl,java,javascript inoremap {<CR> {<CR>}<Esc>O
autocmd FileType * inoremap (<CR>  (<CR>)<ESC>O

"}}}
" Misc Autocommands {{{
augroup line_return  " Return vim to the last known position
    au!
    au BufreadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute "normal! g'\"" |
                \ endif
augroup END
    
"}}}
" --------------------------------- End .vimrc ------------------------------
