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
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Rip-Rip/clang_complete'
Bundle 'c9s/perlomni.vim'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/csapprox'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kien/tabman.vim'
Bundle 'klen/python-mode'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-pasta'
Bundle 'sjl/badwolf'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-perl/vim-perl'
Bundle 'xolox/vim-easytags'

" Useful Colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'

" Vim-scripts repo
Bundle 'YankRing.vim'
Bundle 'a.vim'
Bundle 'python.vim'

" Misc settings
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
set fileencoding=utf-8
set termencoding=utf8
set history=1000
set formatoptions-=o          "Doesn't continue the comment after pressing o
set formatoptions-=c
set formatoptions-=r
set visualbell
set ruler
set autoread                  "Detect when a file has been changed externally
set shell=/usr/local/bin/zsh
set spelllang=en_us

" Let's vim recognize the mouse even inside a tmux session
if has('mouse')
    set ttymouse=xterm2
endif

" Search settings
nnoremap / /\v
vnoremap / /\v
set incsearch
set ignorecase
set showmatch
set matchtime=3
set hlsearch     " highlight matches
set wrapscan     " wrap search to top

" Tab and indent settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set cindent
set preserveindent
set copyindent
set shiftround
set nowrap
set textwidth=80

" Vim Completions
set wildmenu
set wildchar=<Tab>
set completeopt=longest,menu,preview
set ofu=syntaxcomplete#Complete
set wildmode=list:longest,list:full

" Ignore these files when completing
set wildignore+=.hg,.git,.svn
set wildignore+=*.out
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp
set wildignore+=*.o,*.obj,*.manifest,*.sublime-project,*.sublime-workspace
set wildignore+=*.pyc
set wildignore+=*.spl
set wildignore+=*.DS_Store
set wildignore+=*~,#*#,*.sw?,%*,*=

"Backup settings
set noswapfile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set undofile
set undolevels=1000
set undodir=~/.vim/backup

"Better buffer management
set nohidden

" Colorscheme / Syntax / Filetype
syntax enable
filetype on
filetype plugin on
filetype indent on
set t_Co=256
set background=dark
colorscheme solarized
"colorscheme Tomorrow-Night
"colorscheme molokai
"colorscheme badwolf

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

" Language Settings

" Perl settings {{{
let perl_include_pod=1
let perl_extended_vars=1
let perl_sync_dist=250
vmap ,tid :!perltidy<CR>
nmap ,tid :%!perltidy<CR>
" End Perl settings }}}

" Change the map leader to ,
let mapleader=","

" Tab management
map ,tt :tabnew<CR>
map ,tc :tabclose<CR>
noremap ,tn :tabnext<CR>
noremap ,tp :tabprevious<CR>

" Reindent entire file and return cursor to the same line
nmap ,fef ggVG=''

" Toggle hlsearch
nmap <silent> ,hs :set hlsearch!<CR>

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

" -- ClangComplete Settings --
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_close_preview=1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
let g:clang_complete_patterns=1
let g:clang_complete_macros=1

" -- EasyTags Settings --
let g:easytags_always_enabled=1
let g:easytags_file='~/.vim/tags/tags'
let g:easytags_include_members=1

" -- Indent Guides --
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=1
let g:indent_guides_guide_size=1

" -- Ctrl-p Settings --
let g:ctrlp_max_height=10
let g:ctrlp_persistent_input=0
let g:ctrlp_map=',t'
let g:ctrlp_lazy_update=1
let g:ctrlp_follow_symlinks=1
let g:ctrlp_custom_ignore='\.git$\|\.hg$\|\.svn$'
nnoremap ,b :CtrlPBuffer<CR>
nnoremap ,mru :CtrlPMRU<CR>
nnoremap ,c :CtrlPClearCache<CR>

" Corrections/Typos
iab teh the
iab treu true
iab flase false
iab Treu True
iab Flase False
iab psbng #!/usr/local/bin/perl -w

" Fix Tmux cursor bullcrap
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Filetype Settings {{{
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

" -- c --
augroup ft_c
    au!
    au FileType c
                \ setlocal
                \ tabstop=4
                \ softtabstop=4
                \ shiftwidth=4
                \ textwidth=79
                \ expandtab
                \ colorcolumn=80
                \ comments=sl:/*,mb:\ *,elx:\ */
augroup END

" -- cpp --
augroup ft_cpp
    au!
    au FileType cpp
                \ setlocal
                \ tabstop=4
                \ softtabstop=4
                \ shiftwidth=4
                \ textwidth=79
                \ expandtab
                \ colorcolumn=80
augroup END

" -- ObjectiveC --
augroup ft_objc
    au!
    au FileType objc
                \ setlocal
                \ tabstop=4
                \ softtabstop=4
                \ shiftwidth=4
                \ textwidth=79
                \ expandtab
                \ colorcolumn=80
augroup END

"" -- vim --
augroup ft_vim
    au!
    au FileType vim,help setlocal textwidth=78
    au FileType vim setlocal foldmethod=marker colorcolumn=79 tabstop=4
                \ expandtab
                \ softtabstop=4
                \ shiftwidth=4
augroup END

"}}}

" Misc autocommands {{{

"Highlight current line
augroup cursorline
    au!
    au BufEnter * set cursorline
    au BufLeave * set nocursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

" Return vim to the last position when reopening a file
augroup line_return
    au!
    au BufreadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute "normal! g'\"" |
                \ endif
augroup END

" Strip trailing whitespaces
au BufWritePre,FileWritePre,FileAppendPre,FilterWritePre *
            \ call StripTrailingWhitespace()

" Functions
function StripTrailingWhitespace()
    %s/\s*$//
    ''
endfunction
"}}}

" --------------------------------- End .vimrc --------------------------------
