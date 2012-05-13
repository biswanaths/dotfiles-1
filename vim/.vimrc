"-----------------------"
"File: .VIMRC          "
"Author: Watabou       "
"Version: 1.0          "
"-----------------------"

"I want vim. 
set nocompatible
syntax on
filetype on
filetype plugin on
filetype indent on

"Pathogen
call pathogen#infect()
call pathogen#helptags()

"Exuberant Ctags Path
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set tags=tags;~/

"Set TagBar width from 40 to 30.
let g:tagbar_width = 30

"Set gundo preview width
let g:gundo_preview_height=1

"Java Omnicompletion
if has("autocmd")
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
endif

" General Settings
if has ("gui_running")
    set guioptions-=T
    set guioptions-=r
endif

"Status Line + Powerline
set laststatus=2
let g:Powerline_symbols='fancy'

"Use vim's title instead of the terminal's
set title

set textwidth=80

"Diff ignores whitespace
set diffopt+=iwhite

set scrolloff=8
set mouse=a
set hidden "Manage multiple buffers effectively. 
set cpoptions+=$
set magic
set showcmd
set ffs=unix,dos,mac
set encoding=utf8
set history=1000
set undolevels=300
set backspace=indent,eol,start
set linebreak
set cmdheight=2
set noerrorbells "Stop whining
set visualbell
set number
set ruler
set autoread "Sets vim to auto read if the file has been changed externally. 

" Indent settings 
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set copyindent
set preserveindent 
"set list
"set listchars=tab:¦\

" Wild menu
set wildmenu
set wildmode=list:longest
set wildchar=<TAB>

"Completes by the whole tag, instead of just the function name
set showfulltag

" Searching settings
set incsearch
set ignorecase
set showmatch
set hlsearch
set diffopt=filler,iwhite

" Backup settings
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"Typos
iab anf and
iab adn and
iab teh the
iab thre there
iab flase false
iab treu true

"Mapping Settings
imap <C-l> <Space>=><Space>
"Reindent the entire file.
nmap <leader>fef ggVG=

"Help for vim is mapped to F1 automatically. 
"NerdTree
nnoremap <F2> :NERDTreeToggle<CR>
"Gundo
nnoremap <F3> :GundoToggle<CR>
"Tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>

"Puts pwd into the path
cmap <C-P> <C-R>=expand("%:p:h") . "/"

"Toggle hlsearch
nmap <leader>hs :set hlsearch! hlsearch?<CR>

"Change case
"Uppercase
nmap <leader>u mQviwU`Q
"Lowercase
nmap <leader>l mQviwu`Q

"Theme Settings
colorscheme molokai
let g:molokai_original = 1
" Changes matching parens to underlining instead of a glaring color
:hi MatchParen cterm=underline ctermbg=none ctermfg=none

"Cursor shape settings
"Changes the cursor shape depending on the current mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"End of .vimrc File"
