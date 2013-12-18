"------------------------------
"| ~/.vimrc                   |
"| Last update: Dec 17, 2013  |
"------------------------------
" Vundle Settings {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"}}}
" Plugins {{{
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'itspriddle/vim-jquery'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'lucapette/vim-jquery-doc'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'PeterRincker/vim-argumentative'
Bundle 'RipRip/clang_complete'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplete.vim'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsaleh/vim-matchit'
Bundle 'w0ng/vim-hybrid'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'

" }}}
" General Settings {{{
set number relativenumber
set hidden
set mouse=a
set scrolloff=4
set nrformats-=octal
set clipboard+=unnamed
set virtualedit=block
set laststatus=2
set backspace=indent,eol,start
set lazyredraw
set switchbuf=useopen,usetab
set tags=./tags;/,tags;/
set visualbell
set fileformats=unix,dos,mac
set fileencoding=utf-8
set termencoding=utf-8
set formatoptions+=1
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:·,trail:·
set showbreak=↪
set autoread
set autochdir
set ttymouse=xterm2
if &term =~ '^screen-.*-bce$'
    set t_ut=y
endif
let mapleader=','
set splitbelow splitright
set timeout timeoutlen=1000 ttimeoutlen=100

"}}}
" Colorscheme / Syntax {{{
filetype plugin indent on
syntax on
set synmaxcol=800
let g:hybrid_use_Xresources=1
colorscheme hybrid

" Modificatins to Hybid colorscheme {{{2
if (g:colors_name == "hybrid")
    hi! Pmenu ctermfg=137 ctermbg=233 cterm=none
    hi! PmenuSel ctermfg=196 ctermbg=234 cterm=bold
    hi! PmenuSbar ctermfg=000 ctermbg=233 cterm=none
    hi! PmenuThumb ctermfg=137 ctermbg=235 cterm=none
    hi! StatusLine ctermfg=234 ctermbg=136 guifg=#1c1c1c guibg=#af8700
    hi! StatusLineNC ctermfg=234 ctermbg=100 guifg=#1c1c1c guibg=#878700
    hi! MatchParen ctermfg=196 ctermbg=234 cterm=bold
    hi! Comment cterm=italic
endif
""}}}2

"}}}
" Status Line {{{
set statusline=
set statusline+=%t\ \%{SyntasticStatuslineFlag()}
set statusline+=\ \%#StatusRO#\%R\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W
set statusline+=\ \%#StatusModFlag#\%M\ \ \%{fugitive#statusline()}
set statusline+=\%=\ \%#StatusFTP#\%Y\ \|\ \%{&fenc}\ \|\ \%{&ff}\ \|
set statusline+=\ LN\ \%1.7l\:\%1.7c\ 

"}}}
" Search Settings {{{
nnoremap / /\v
xnoremap / /\v
set incsearch
set smartcase
set ignorecase
set showmatch
set matchtime=2
set hlsearch

"}}}
" Tab, Indent and Folds {{{
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set cindent
set textwidth=80

"}}}
" Completions {{{
set wildmenu
set completeopt=menu,longest
set omnifunc=syntaxcomplete#Complete

" }}}
" Wildignore {{{
set wildignorecase
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.out,*.DS_Store,*.class
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.zip,*.so,*.swp,*/tmp/*
set wildignore+=*.o,*.obj,*.manifest,*~,#*#,*.sw?,%*,*=

"}}}
"Backup settings {{{
set noswapfile
set history=1000
set backup
set undofile
set backupdir=~/.vim/backup/
set undodir=~/.vim/backup/undo/

"}}}
" GUI Settings {{{
if has("gui_running")
    autocmd! FocusLost * :wa
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guifont=Inconsolata-g:h14
    set lines=40
    set columns=140
endif

"}}}
" Window Management {{{
" -- Switching between windows
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
" -- Moving windows
nnoremap <silent> <leader>mh <C-W>H
nnoremap <silent> <leader>mj <C-W>J
nnoremap <silent> <leader>mk <C-W>K
nnoremap <silent> <leader>ml <C-W>L
" -- Closing windows
nnoremap <silent> <leader>cc :close<CR>
nnoremap <silent> <leader>cq :cclose<CR>
nnoremap <silent> <leader>ch :wincmd h<CR>:close<CR>
nnoremap <silent> <leader>cj :wincmd j<CR>:close<CR>
nnoremap <silent> <leader>ck :wincmd k<CR>:close<CR>
nnoremap <silent> <leader>cl :wincmd l<CR>:close<CR>

" }}}
" Plugin Preferences and Mappings {{{
" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" DelimitMate
let delimitMate_expand_cr = 1

" Supertab (Why would you go backwards?!)
let g:SuperTabDefaultCompletionType = "<c-n>"

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#data_directory = '~/.cache/neocomplete'
if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
  endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Notes
let g:notes_directories = ['~/Dropbox/Notes']

" Haskellmode
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" Syntastic
let g:syntastic_loc_list_height=4
let g:syntastic_javascript_checkers=['jslint']
let g:syntastic_mode_map = {'mode': 'active',
            \ 'active_filetypes': ['c', 'cpp', 'ruby', 'python', 'perl', 'haskell', 'javascript'],
            \ 'passive_filetypes': ['objc', 'objcpp', 'go', 'java'] }

" Clang_Complete
let g:clang_auto_select=1
let g:clang_close_preview=1
let g:clang_complete_patterns=1
let g:clang_complete_macros=1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" Tabular
xnoremap <leader>t :Tabular<space>/

" Ctrlp
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :CtrlPCurWD<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>r :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>T :CtrlPBufTag<CR>
nnoremap <leader>w :CtrlPLine<CR>
let g:ctrlp_extensions = ['tag', 'line']
let g:ctrlp_map='<F3>'
let g:ctrlp_mruf_max=50
let g:ctrlp_cache_dir='~/.cache/ctrlp'
let g:ctrlp_show_hidden=1
let g:ctrlp_follow_symlinks=1
let g:ctrlp_root_markers = ['tags']

" jQuery-doc
let g:jquery_doc_command='open'
let g:jquery_doc_mapping='KK'
nnoremap <leader>j :JQueryDoc 

"}}}
" Vim Niceties {{{
" Add a color column but only highlight over 80 columns
call matchadd('ColorColumn', '\%81v', 100)

" Reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" Quicker buffer navigation
nnoremap gb :buffers<CR>:sb<Space>

" Open folds when searching, always centering the cursor.
nnoremap n nzzzv
nnoremap N Nzzzv

" Select the line that was last pasted
nnoremap <leader>V V`]

" select the entire line but ignore the indentation
nnoremap vv ^vg_

" Splits a line -- opposite of J (join lines)
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Map jk to move between visual lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Keep search pattern at the center of the screen
" Also prevents going to the next match automatically
nnoremap <silent> * *Nzz
nnoremap <silent> # #Nzz
nnoremap <silent> g* g*Nzz

" Center screen when jumping around the changelist
nnoremap g; g;zz
nnoremap g, g,zz

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

" HTML indenting
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div,script"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" Java syntax 
let java_highlight_java_lang_ids=1
let java_highlight_java_io=1
let java_highlight_util=1
let java_highlight_java=1
let java_highlight_debug=1
let java_allow_cpp_keywords=1

" Python sytax
let python_highlight_all = 1

" }}}
" General Mappings {{{
" Restore , for searching with f/F/t/T
nnoremap \ ,

" Don't need arrow keys
nnoremap <up> :lprev<CR>zvzz
nnoremap <down> :lnext<CR>zvzz
nnoremap <left> :cprev<CR>zvzz
nnoremap <right> :cnext<CR>zvzz
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Easier way to escape
inoremap jk <Esc>

" Format paragraph
nnoremap Q gq

" Tab is easier to type than %
nnoremap <tab> %

" Turn on listchars
nnoremap <leader>l :set list!<CR>

" Readline-line movement for command mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" Quickly edit files
nnoremap <silent> <leader>ev :vsp $MYVIMRC<CR>
nnoremap <silent> <leader>sv :vsp $MYVIMRC<CR>
nnoremap <silent> <leader>ez :vsp ~/.zshrc<CR>
nnoremap <silent> <leader>et :vsp ~/.tmux.conf<CR>

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef mfggVG=`fzz

" Never felt the need to use H or L
nnoremap H ^
nnoremap L $

" Toggle paste mode
nnoremap <silent> <leader>p :set paste!<CR>:setl paste?<CR>

" Remove trailing whitespace
nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Use space to toggle folds
nnoremap <Space> za

" Yank to the end of the line
nnoremap Y y$

" Focus only on fold that is on the cursor position
nnoremap <leader>z zMzvzz

"}}}
" Cursor shapes in Tmux {{{
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"}}}
" Typos {{{
iabbrev shoudl should
iabbrev Shoudl Should
iabbrev treu true
iabbrev Treu True
iabbrev teh the
iabbrev flase false
iabbrev Flase False

"}}}
" Misc Autocommands {{{
" Return vim to the last known position
augroup line_return
    au!
    au BufreadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute "normal! g'\"" |
                \ endif
augroup END
"}}}
