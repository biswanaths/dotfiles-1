"---------------------------------"
"        _                        " 
" __   _(_)_ __ ___  _ __ ___     "
" \ \ / / | '_ ` _ \| '__/ __|    "
"  \ V /| | | | | | | | | (__     " 
" (_)_/ |_|_| |_| |_|_|  \___|    "
"                                 "
"---------------------------------"
" File: ~/.vimrc                  "
" Author: Akshay                  "
" Updated: March 2, 2013          "
"---------------------------------"

" Pre-Vundle settings {{{
set nocompatible
filetype off

"}}}
" Vundle Runtime Path {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"}}}
" Installed Plugins {{{
Bundle 'a.vim'
Bundle 'c9s/perlomni.vim'
" Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'Figlet.vim'
Bundle 'godlygeek/tabular'
Bundle 'haskell.vim'
Bundle 'kana/vim-smartinput'
Bundle 'kien/ctrlp.vim'
" Bundle 'klen/python-mode'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/zencoding-vim'
Bundle 'python.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scratch.vim'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-pasta'
Bundle 'SirVer/ultisnips'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-perl/vim-perl'
Bundle 'VisIncr'
Bundle 'xolox/vim-easytags'
Bundle 'YankRing.vim'

" I can't choose a single colorscheme to save my life!
Bundle 'altercation/vim-colors-solarized'
Bundle 'desert256.vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'nanotech/jellybeans.vim'
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'w0ng/vim-hybrid'
Bundle 'xoria256.vim'

"}}}
" General Settings {{{
set relativenumber
set ruler
set showcmd
set cmdheight=2
set modelines=0
set noshowmode
set nofoldenable                " Don't fold automatically
set foldmethod=syntax
set foldopen=block,insert,jump,mark,quickfix,search,undo
set mouse=a
set scrolloff=8
set lazyredraw
set synmaxcol=2048
"This prevents <C-a> & <C-x> from increating a 0 padded number to octal (eg. 007 to 010)
set nrformats-=octal          
set magic
set clipboard=unnamed
set laststatus=2
set backspace=indent,eol,start
set ttyfast
set cpoptions+=$               "Shows a dollar sign when changing text
set fileformats=unix,mac
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set formatoptions-=o          "Doesn't continue the comment after pressing o
set formatoptions-=c
set formatoptions-=r
set virtualedit=block
set visualbell
set autoread                  "Detect when a file has been changed externally
set autowrite
set autochdir
set shell=/usr/local/bin/zsh
set spelllang=en_us
set spellfile=~/.vim/custom-dictionary.utf-8.add
" Lets vim recognize the mouse inside a tmux session
if has('mouse')
    set ttymouse=xterm2
endif
let mapleader=','           " Let leader key be , instead of \
"}}}
" Search Settings {{{
nnoremap / /\v
vnoremap / /\v
set incsearch
set ignorecase
set showmatch
set matchtime=3
set hlsearch     " highlight matches
set wrapscan     " wrap search to top
set gdefault

"}}}
" Tab Settings {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

"}}}
" Indent Settings {{{
set autoindent
set cindent
set preserveindent
set copyindent
set shiftround
set textwidth=80
set nowrap

"}}}
" Completions {{{
set wildmenu
set wildmode=list:longest
set wildchar=<Tab>
set completeopt-=preview
set completeopt+=longest,menuone,menu
set omnifunc=syntaxcomplete#Complete

" }}}
" Wildignore {{{
set wildignore+=.hg,.git,.svn
set wildignore+=*.out
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.zip,*.so,*.swp,*/tmp/*
set wildignore+=*.o,*.obj,*.manifest,*.sublime-project,*.sublime-workspace
set wildignore+=*.pyc
set wildignore+=*.spl
set wildignore+=*.DS_Store
set wildignore+=*/Library/*,*/Pictures/*,*/Books/*,*/Public/*
set wildignore+=*.rvm/*,.gem/*,*.cpan/*,.cache/*,.config/*,*.cpan*,*.rbenv/*
set wildignore+=*~,#*#,*.sw?,%*,*=

"}}}
"Backup settings {{{
set noswapfile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set history=1000
set undofile
set undoreload=10000
set undodir=~/.vim/backup
set nohidden

"}}}
" Colorscheme / Syntax / Filetype {{{
syntax on
filetype plugin indent on
set t_Co=256
set background=dark
let g:hybrid_use_Xresources=1
colorscheme hybrid

"}}}
" GUI Settings {{{
" Has anyone looked at Macvim and not vomit explosively?
if has ("gui_running")
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guifont=Inconsolata\ LGC:h12
    colorscheme badwolf
endif

"}}}
" Window Management {{{
" -- Switching between windows
nnoremap <silent> <leader>h <C-W>h
nnoremap <silent> <leader>j <C-W>j
nnoremap <silent> <leader>k <C-W>k
nnoremap <silent> <leader>l <C-W>l
" -- Moving windows
nnoremap <silent> <leader>mh <C-W>H
nnoremap <silent> <leader>mj <C-W>J
nnoremap <silent> <leader>mk <C-W>K
nnoremap <silent> <leader>ml <C-W>L
" -- Closing windows
nnoremap <silent> <leader>cc :close<CR>
nnoremap <silent> <leader>cw :cclose<CR>
nnoremap <silent> <leader>ch :wincmd h<CR>:close<CR>
nnoremap <silent> <leader>cj :wincmd j<CR>:close<CR>
nnoremap <silent> <leader>ck :wincmd k<CR>:close<CR>
nnoremap <silent> <leader>cl :wincmd l<CR>:close<CR>

" }}}
" Plugin Preferences {{{
let python_highlight_all=1
let python_print_as_function=1
let python_slow_sync=1

" -- PowerLine Settings --
"let g:Powerline_symbols='fancy'

" -- YankRing Settings --
let g:yankring_history_dir='~/.vim/backup/'

" -- Tagbar Settings --
let g:tagbar_expand=1
let g:tagbar_compact=1
let g:tagbar_width=30
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" -- Gundo Settings --
let g:gundo_preview_bottom=1
nnoremap <silent> <leader>gun :GundoToggle<CR>

" -- Syntastic Settings --
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_enable_balloons=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = {'mode': 'active',
            \ 'active_filetypes': ['c', 'cpp', 'ruby', 'perl', 'zsh'],
            \ 'passive_filetypes': ['java'] }

" -- Supertab Settings -- 
let g:SuperTabCrMapping=0  " Shuts up supertab's annoying messages.

" -- UltiSnips Settings --
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" -- Python-Mode Settings --
"  I keep it disabled until I need it since it slows vim's startup
"let g:pymode_rope=1
"let g:pymode_doc=1
"let g:pymode_doc_key='K'
"let g:pymode_lint=1
"let g:pymode_lint_checker="pyflakes,pep8"
"let g:pymode_lint_write=1
"let g:pymode_virtualenv=1
"let g:pymode_breakpoint=1
"let g:pymode_breakpoint_key='<leader>b'
"let g:pymode_syntax=1
"let g:pymode_syntax_all=1
"let g:pymode_syntax_indent_errors=g:pymode_syntax_all
"let g:pymode_syntax_space_errors=g:pymode_syntax_all
"let g:pymode_folding=0

" -- ClangComplete Settings --
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_close_preview=1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
let g:clang_complete_patterns=1
let g:clang_complete_macros=1

" -- Alternate settings
autocmd FileType objc let g:alternateExtensions_h="m"
autocmd FileType objc let g:alternateExtensions_m="h"
nnoremap <leader>A :A<CR>
nnoremap <leader>at :AT<CR>
nnoremap <leader>as :AS<CR>

" -- EasyTags Settings --
let g:easytags_always_enabled=1
let g:easytags_include_members=1
" ctrlp keeps lowering updatetime which messes with easytags
let g:easytags_updatetime_autodisable=1
let g:easytags_by_filetype='~/.vim/tags/'

" -- Ctrl-p Settings --
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=10
let g:ctrlp_persistent_input=0
let g:ctrlp_lazy_update=1
let g:ctrlp_follow_symlinks=1
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=1
let g:ctrlp_cache_dir=$HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore={
            \ 'dir'  : '\v[\/]\.(git|hg|svn|dropbox|Trash|subversion|task)$',
            \ 'file' : '\v\.(exe|so|dll)$',
            \ }
let g:ctrlp_max_files=10000
let g:ctrlp_map='<leader>t'
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>mru :CtrlPMRU<CR>
nnoremap <leader>c :CtrlPClearCache<CR>

"}}}
" General Mappings {{{

" Restore reverse for f/F/t/T searched
nnoremap \ ,

" Disable the arrow keys in command mode.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Auto Semicolon insertion
inoremap <C-;> <ESC>maA;<ESC>`aa
nnoremap <leader>; maA;<ESC>`a

" Much faster saving
nnoremap <leader>w <esc>:wa<CR>

" Wtf is this Ex-mode crap?! Sheesh, vim!
nnoremap Q :qa<CR>

" Reselect the line that was last pasted
nnoremap <leader>V V`]

" select the entire line but ignore the indentation
nnoremap vv ^vg_

" Splits a line -- opposite of J (join lines)
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Remap jj to escape from insert mode
inoremap jj <Esc>

" Map jk to move between visual lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" ^ and $ are just hard to type.
nnoremap H ^
nnoremap L $
vnoremap L g_

" Allow emacs-like command-line editing
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" Quickly edit stuff
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>ez :e ~/.zshrc<CR>
nnoremap <silent> <leader>et :e ~/.tmux.conf<CR>
nnoremap <silent> <leader>es :e ~/.slate<CR>

" Reindent entire file and return cursor to the same line
nnoremap <leader>fef ggVG=''

" Toggle hlsearch
nnoremap <silent> <C-L> :set hlsearch!<CR>

" Toggle paste mode
nnoremap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" UpperCase
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
" Cscope Settings {{{
if has('cscope')
    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help

    command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" }}}
" Typos {{{
iabbrev flase false
iabbrev Flase False
iabbrev grammer grammar
iabbrev pbng #!/usr/local/bin/perl
iabbrev teh the
iabbrev treu true
iabbrev Treu True
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
" -- tmux --
aug ft_tmux
    au!
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setlocal filetype=tmux
    setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab 
aug END

" -- Quickfix --
augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap
augroup END

" -- zsh --
augroup ft_zsh
    au!
    au BufNewFile,BufRead zshecl*,prompt_*_setup setlocal filetype=zsh
    setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" Better brace insertion
autocmd Filetype c,cpp,objc,perl,java inoremap {      {}<Left>
autocmd Filetype c,cpp,objc,perl,java inoremap {<CR>  {<CR>}<Esc>O
autocmd Filetype c,cpp,objc,perl,java inoremap {{     {
autocmd Filetype c,cpp,objc,perl,java inoremap {}     {}

"}}}
" Misc Autocommands {{{
" Return vim to the last position when reopening a file
augroup line_return
    au!
    au BufreadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute "normal! g'\"" |
                \ endif
augroup END

" Switch to regular number line when in insert mode.
autocmd! InsertEnter * set number
autocmd! InsertLeave * set relativenumber

"Vim doesn't escape fast enough from visual/insert mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FreakingEscapeAlreadyPlease
        au!
        au InsertLeave * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"}}}
" --------------------------------- End .vimrc --------------------------------
