"-------------------------------------------------------------------"
"  File:   .vimrc                                                   "
"  Author: Akshay Hegde                                             "
"  Date:   Jan 3, 2013                                              "
"  Version: 1.0                                                     "
"                                                                   "
"  Note: Not compatible with Vim < 7, but then again, this is 2013. "
"-------------------------------------------------------------------"

" Don't be compatible with vi
set nocompatible
"Required before vundle
filetype off

" Vundle runtime path {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"}}}

" Installed plugins {{{
Bundle 'c9s/perlomni.vim'
Bundle 'msanders/cocoa.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-pasta'
Bundle 'SirVer/ultisnips'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-perl/vim-perl'
Bundle 'xolox/vim-easytags'

" Useful Colorschemes
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'

" Vim-scripts repo
Bundle 'a.vim'
Bundle 'python.vim'
Bundle 'YankRing.vim'
"}}}

" General settings {{{
set number
set ruler
set showcmd
set modelines=0
set showmode
set timeoutlen=500
set nofoldenable                " Don't fold automatically
set foldmethod=syntax
set foldopen=block,insert,jump,mark,quickfix,search,undo
set mouse=a
set scrolloff=8
set lazyredraw
set magic
set clipboard+=unnamed
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
"}}} 

" Search settings {{{
nnoremap / /\v
vnoremap / /\v
set incsearch
set ignorecase
set showmatch
set matchtime=3
set hlsearch     " highlight matches
set wrapscan     " wrap search to top
"}}}

" Tab settings {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
"}}}

" Indent settings {{{
set autoindent
set cindent
set preserveindent
set copyindent
set shiftround
set textwidth=80
set nowrap
"}}}

" Vim Completions and Wildmenu {{{
set wildmenu
set wildmode=list:longest
set wildchar=<Tab>
set completeopt=longest,menuone,preview
set ofu=syntaxcomplete#Complete
" Ignore these files when completing
set wildignore+=.hg,.git,.svn
set wildignore+=*.out
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp
set wildignore+=*.o,*.obj,*.manifest,*.sublime-project,*.sublime-workspace
set wildignore+=*.pyc
set wildignore+=*.spl
set wildignore+=*.DS_Store
set wildignore+=*/Library/*
set wildignore+=*/Pictures/*
set wildignore+=*/Books/*
set wildignore+=Public/*
set wildignore+=*.rvm/*,.gem/*,.cpan/*,.cache/*,.config/*
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
colorscheme solarized
"colorscheme Tomorrow-Night
"colorscheme molokai
"colorscheme badwolf
"}}}

" Macvim Settings {{{
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

" Tab Management {{{
map ,tt :tabnew<CR>
map ,tc :tabclose<CR>
noremap ,tn :tabnext<CR>
noremap ,tp :tabprevious<CR>
"}}}

" Window Management {{{
" -- Switching between windows
noremap <silent> ,h <C-W>h
noremap <silent> ,j <C-W>j
noremap <silent> ,k <C-W>k
noremap <silent> ,l <C-W>l
" -- Moving windows
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> ,mk <C-W>K
noremap <silent> ,ml <C-W>L
" -- Closing windows
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
" }}}

" Settings for Installed Plugins {{{
" -- PowerLine Settings --
let g:Powerline_symbols='fancy'

" -- YankRing Settings --
let g:yankring_history_dir='~/.vim/backup/'

" -- NerdTree Settings --
let NerdTreeShowBookMarks=1
let g:NERDTreeBookMarksFile='~/.vim/backup/'
let NERDTreeMinimalUI=1
let NERDTreeWinSize=30
let NERDTreeDirArrows=1
nnoremap <silent> ,ntr :NERDTreeToggle<CR>

" -- Tagbar Settings --
let g:tagbar_expand=1
let g:tagbar_compact=1
let g:tagbar_width=30
nnoremap <silent> ,tb :TagbarToggle<CR>

" -- Gundo Settings --
let g:gundo_preview_bottom=1
nnoremap <silent> ,gun :GundoToggle<CR>

" -- Syntastic Settings --
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_disabled_filetypes=['python']
let g:syntastic_enable_balloons=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" -- Python-Mode Settings --
let g:pymode_rope=1
let g:pymode_doc=1
let g:pymode_doc_key='K'
let g:pymode_lint=1
let g:pymode_lint_checker="pyflakes,pep8"
let g:pymode_lint_write=1
let g:pymode_virtualenv=1
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key=',b'
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_folding=0

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
nnoremap ,,a :A<CR>
nnoremap ,at :AT<CR>
nnoremap ,as :AS<CR>

" -- Fugitive settings
nnoremap ,gd :Gdiff<CR>
nnoremap ,gs :Gstatus<CR>
nnoremap ,ga :Gwrite<CR>
nnoremap ,gb :Gblame<CR>
nnoremap ,gco :Gcheckout<CR>
nnoremap ,gci :Gcommit<CR>

" -- EasyTags Settings --
let g:easytags_always_enabled=1
let g:easytags_file='~/.vim/tags/tags'
let g:easytags_include_members=1
" Freaking stop updating so fast please
let g:easytags_updatetime_autodisable=1

" -- Indent Guides --
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=1
let g:indent_guides_guide_size=1

" -- Ctrl-p Settings --
let g:ctrlp_working_path_mode=2
let g:ctrlp_root_markers=['.git']
let g:ctrlp_max_height=10
let g:ctrlp_persistent_input=0
let g:ctrlp_lazy_update=1
let g:ctrlp_follow_symlinks=1
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=1
let g:ctrlp_cache_dir=$HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore={
            \ 'dir'  : '\v[\/]\.(git|hg|svn|config|rvm|gem|cache|dropbox|Trash|subversion|task|cpan)$',
            \ 'file' : '\v\.(exe|so|dll)$',
            \ }
let g:ctrlp_max_files=10000
let g:ctrlp_map=',t'
nnoremap ,b :CtrlPBuffer<CR>
nnoremap ,mru :CtrlPMRU<CR>
nnoremap ,c :CtrlPClearCache<CR>
"}}}

" Control and leader mappings {{{
" Change the map leader to ,
let mapleader=","

" Disable the arrow keys in command mode.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Much faster saving
noremap ,w <esc>:wa<CR>

" Wtf is this Ex-mode crap?! Sheesh, vim!
nnoremap Q :q<CR>

" Reselect the line that was last pasted
nnoremap ,V V`]

" select the entire line but ignore the indentation
nnoremap vv ^vg_

" Splits a line -- oposite of J (join lines)
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Remap jj to escape from insert mode
inoremap jj <Esc>

" Map jk to move between visual lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" ^ and $ are just hard to type.
nnoremap H ^
nnoremap L $
vnoremap L g_

" Allow emacs-like command-line editing
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" Quickly edit and source ~/.vimrc
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Quickly edit ~/.tmux.conf
nmap <silent> ,et :e ~/.tmux.conf

" Reindent entire file and return cursor to the same line
nmap ,fef ggVG=''

" Toggle hlsearch
nmap <silent> ,/ :set hlsearch!<CR>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" UpperCase
inoremap <C-u> <esc>mzgUiw`z

" Send selection to a private gist.
vnoremap ,GI :w !gist -p -t %:e \| pbcopy<CR>
nnoremap ,UG :w !gist -p \| pbcopy<CR>

" Remove trailing whitespace
nnoremap ,W mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Use space to toggle folds
nnoremap <Space> za
nnoremap <Space> za

" Focus only on fold that is on the cursor position
nnoremap ,z zMzvzz
"}}}

" Corrections/Typos {{{
iabbrev teh the
iabbrev treu true
iabbrev flase false
iabbrev Treu True
iabbrev Flase False
iabbrev psbng #!/usr/local/bin/perl -w
"}}}

" Fix Tmux cursor bullcrap {{{
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
    setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent
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

" Misc autocommands {{{
" Return vim to the last position when reopening a file
augroup line_return
    au!
    au BufreadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute "normal! g'\"" |
                \ endif
augroup END
"}}}
" --------------------------------- End .vimrc --------------------------------
