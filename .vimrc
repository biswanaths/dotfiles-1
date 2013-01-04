"-------------------------------"
"  File:   .vimrc               "
"  Author: Akshay Hegde         "
"  Date:   Jan 3, 2013          "
"-------------------------------"
set nocompatible
filetype off

" Vundle runtime path
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Installed plugins
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'kien/tabman.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tomasr/molokai'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'
Bundle 'wincent/Command-T'
Bundle 'sjl/gundo.vim'
Bundle 'godlygeek/tabular'
Bundle 'sjl/badwolf'
Bundle 'xolox/vim-easytags'
Bundle 'YankRing.vim'
Bundle 'a.vim'

" Misc settings
syntax on
filetype plugin indent on
set number
set showcmd
set showmode
set foldmethod=marker
set mouse=a
set laststatus=2
set backspace=indent,eol,start
set ttyfast
set cpoptions+=$               "Shows a dollar sign when changing text
set fileformats=unix,mac
set encoding=utf-8
set history=1000
set formatoptions-=o          "Doesn't continue the comment after pressing o
set visualbell
set ruler
set autoread                  "Detect when a file has been changed externally
set shell=/usr/local/bin/zsh

" Search settings
set incsearch
set ignorecase
set showmatch
set hlsearch

" Tab and indent settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent
set preserveindent
set copyindent
set textwidth=80

"Backup settings
set noswapfile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set undofile
set undolevels=300
set undodir=~/.vim/tmp

"Better buffer management
set nohidden

"Color scheme
set background=dark
set t_Co=256                 " 256 Colors
"colorscheme molokai
colorscheme badwolf
"colorscheme solarized

" Remove gui nastiness like the scrollbar, toolbar. 
" Set the gui font to look nice
if has ("gui_running")
        set guioptions-=T
        set guioptions-=r
        set guioptions-=R
        set guioptions-=l
        set guioptions-=L
        set guifont=Inconsolata\ LGC:h12
endif

" Disable the arrow keys in command mode.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Remap jj to escape from insert mode
inoremap jj <Esc>

" Map jk to move between visual lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Change the map leader to ,
let mapleader=","

" Reindent entire file
nmap ,fef ggVG=

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

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
nnoremap <silent> ,nt :NERDTreeToggle<CR>

" -- Tagbar Settings -- 
let g:tagbar_expand=1
let g:tagbar_compact=1
let g:tagbar_width=30
nnoremap <silent> ,tb :TagbarToggle<CR>

" -- Gundo Settings -- 
let g:gundo_preiew_height=1
let g:gundo_right=1
let g:gundo_width=30
nnoremap <silent> ,gun ::GundoToggle<CR>

" -- Syntastic Settings -- 
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0

" -- ClangComplete Settings -- 
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_close_preview=1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
let g:clang_complete_patterns=1
let g:clang_complete_macros=1

" -- EasyTags Settings -- 
let g:easytags_always_enabled=0
let g:easytags_updatetime_autodisable=1
let g:easytags_file='~/.vim/tags/tags'
let g:tasytags_include_members=1

" --------------------------------- End .vimrc --------------------------------
