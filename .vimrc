"--------------------------------------------------------"
"  File:   .vimrc                                        "
"  Author: Akshay Hegde                                  "
"  Date:   Jan 3, 2013                                   "
"                                                        "
"  Hosted on github.com/akshayhegde                      "
"  NOTE: Not compatible with Vim <= 7                    "
"--------------------------------------------------------"

" Turn off vi compatiblity.
set nocompatible

" Required for Vundle
filetype off

" Vundle runtime path
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Installed plugins
Bundle 'c9s/perlomni.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/csapprox'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kien/tabman.vim'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/zencoding-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-pasta'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-perl/vim-perl'
Bundle 'xolox/vim-easytags'

" Great Colorschemes
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'trapd00r/neverland-vim-theme'

" Vim-scripts repo
Bundle 'YankRing.vim'
Bundle 'a.vim'
Bundle 'python.vim'

" Colorscheme / Syntax / Filetype
syntax on
filetype plugin indent on
set t_Co=256
set background=dark
colorscheme badwolf
"colorscheme solarized
"let g:solarized_termtrans=1
"colorscheme Tomorrow-Night
"colorscheme molokai

" ----  Misc settings ----
" Turn on line numbers
set number

" Always show the last command
set showcmd

" Show the mode we are in
set showmode

" Folds are based on indent
set foldmethod=indent

" Comamnds which open folds
set foldopen=block,insert,jump,mark,quickfix,search,undo

" Turn on mouse for all modes
set mouse=a

" Hide the mouse while typing
set mousehide

" Always show the statusbar
set laststatus=2

" Keeps the cursor 8 lines from the top/bottom of the screen when scrolling
set scrolloff=8

" Enable backspace over everyting
set backspace=indent,eol,start

" Ignore whitespace when diffing
set diffopt+=iwhite

" Set the timeout for the leader key or similar commands
set timeoutlen=500

" Fast terminal connection
set ttyfast

" Performance option -- don't redraw when executing macros
set lazyredraw

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Shows a dollar sign upto the point where c will change text
set cpoptions+=$

" Set the fileformats to use
set fileformats=unix,mac

" Set the encoding to utf-8
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf8

" Set some formatoptions
set formatoptions-=o
set formatoptions-=c
set formatoptions-=r

" Change the pwd to the current buffer
set autochdir

" Turn off beeping
set visualbell

" Turn on the ruler
set ruler

"Detect when a file has been changed externally
set autoread

" Set the default shell
set shell=/usr/local/bin/zsh

" Default spell language
set spelllang=en_us

" Lets vim recognize the mouse even inside a tmux session
if has('mouse')
    set ttymouse=xterm2
endif

" Search settings
set incsearch
set ignorecase
set showmatch
set matchtime=3
set hlsearch     " highlight matches
set wrapscan     " wrap search to top

" Tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set textwidth=80

" Indenting
set autoindent
set cindent
set preserveindent
set copyindent
set shiftround
set nowrap

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
set history=1000
set noswapfile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set undofile                " Turn on persistent undo
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/backup

"Better buffer management
set nohidden


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

" Allow for emacs like editing in the command bar
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" Quickly edit and source the .vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Tab management
map ,tt :tabnew<CR>
map ,tc :tabclose<CR>
noremap ,tn :tabnext<CR>
noremap ,tp :tabprevious<CR>

" ,l toggles the display white space and other list chars
nmap ,l :set list!<CR>
set listchars=tab:»\ ,eol:¬

" Reindent entire file and return cursor to the same line
nmap ,fef ggVG=''

" The search highlighting in vim is annoying and burns my eyes.
nmap <silent> ,hs :set hlsearch!<CR>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" Set the execute bit for the current file
nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

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

" -- Python-Mode Settings --
let g:pymode_rope=1
let g:pymode_doc=1
let g:pymode_doc_key='K'
let g:pymode_lint=1
let g:pymode_lint_checker="pyflakes,pep8"
let g:pymode_lint_write=1
let g:pymode_virtualenv=1
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_folding=0

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

" -- Perl --
augroup ft_perl
    au!
    au FileType perl
                \ setlocal
                \ tabstop=4
                \ softtabstop=4
                \ shiftwidth=4
                \ textwidth=79
                \ expandtab
                \ colorcolumn=80
                \ makeprg=perl\ -c\ %\ $*
                \ errorformat=%f:%l:%m
                \ autowrite
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
"augroup cursorline
"au!
"au BufEnter * set cursorline
"au BufLeave * set nocursorline
"au InsertEnter * set nocursorline
"au InsertLeave * set cursorline
"augroup END

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
