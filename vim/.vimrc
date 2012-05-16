
"-----------------------"
" File: .vimrc          "
" Author: Watabou       "
" Modified: 05/13/2012  "
"-----------------------"

" Vim not vi 
set nocompatible

" Load Pathogen
call pathogen#infect()
call pathogen#helptags()

" Filetype settings
syntax on
filetype on
filetype plugin on
filetype indent on

"Exuberant Ctags Path
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set tags=tags;~/


"Java Omnicompletion
if has("autocmd")
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
endif

" General Settings
if has ("gui_running")
    " remove the toolbars and the right scrollbars. 
    set guioptions-=T
    set guioptions-=r

endif

"Status Line + Powerline
set laststatus=2

" Set powerline theme to fancy by default
" Note: Only use fancy if you have patched the font first! Else, use 'unicode'
let g:Powerline_symbols='fancy'

"Uncomment the following and comment the above to use a different Powerline theme
"let Powerline_theme='skwp'
"let Powerline_colorscheme='skwp'

"Use vim's title instead of the terminal's
set title

"Set text width 
set textwidth=80

"Diff ignores whitespace
set diffopt+=iwhite

" Tells vim to keep the cursor 8 lines from the top
" and bottom when scrolling
set scrolloff=8

"Allow use of the mouse for [a]ll modes
set mouse=a

"Hide the mouse when typing
set mousehide

"Manage multiple buffers effectively. 
set hidden

" Fast terminal connection
set ttyfast

" Change the behavior of the change command so that it shows a dollar sign at
" the point where the text will change upto.
set cpoptions+=$

"Allow pattern matching with special chars
set magic

"Show the command 
set showcmd

"Set fileformats
set ffs=unix,dos,mac

"Set the default encoding
set encoding=utf8

"Store some history
set history=1000

" For persistent undo. This setting will restore the file's undos even if it's
" reloaded.
set undofile

"Store a specified amount of undos
set undolevels=300

"Allow backspacing over indent, end of line, and start
set backspace=indent,eol,start

"Set line break
set linebreak

"Cmd height = 2 lines
set cmdheight=2

"Don't beep
set noerrorbells

" Instead, flash the screen
set visualbell

"Line numbering
set number

"Show the ruler
set ruler

"Sets vim to auto read if the file has been changed externally. 
set autoread 

" Indent settings 
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set copyindent
set preserveindent 

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
iab flase false
iab teh the
iab Teh the
iab thre there
iab treu true
iab Taht That
iab tath that
iab Seperate Separate
iab seperate separate

"Allow java syntax highlight accept cpp keywords
let java_allow_cpp_keywords=1

"Mapping Settings

"Change mapleader to "," character
let mapleader=","

" If in insert mode, pressing jj will take you back to normal mode
inoremap jj <ESC>

"Reindent the entire file.
nmap ,fef ggVG=

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

"Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" Change directory to the current file's directory
nmap <silent> ,cd :lcd %h<CR>

"Toggle search highlight
nmap <silent> ,hs :nohls<CR>

"Use ^-E to replace the , mapping
nnoremap <C-E> ,

"Puts pwd into the path
cmap <C-P><C-R>=expand("%:p:h") . "/"

"Change case
"Uppercase
nmap ,u mQviwU`Q
"Lowercase
nmap ,l mQviwu`Q

"Theme Settings

" For Solarized:
"set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized

" For Molokai: 
colorscheme molokai
"Use original colors
let g:molokai_original = 1

" Changes matching parens to underlining instead of a glaring color
:hi MatchParen cterm=underline ctermbg=none ctermfg=none

"Cursor shape settings
"Changes the cursor shape depending on the current mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Save file when focus is lost
au FocusLost * :wa

" Various Plugin Settings

"----------- NERDTree Settings -------------------------

"Always show the bookmarks
let NERDTreeShowBookmarks=1

"NERDTree open and close toggle
nmap <F2> :NERDTreeToggle<CR>

"----------- Tagbar Settings ---------------------------

"Tagbar Toggle 
nnoremap <silent> <F4> :TagbarToggle<CR>

"Set TagBar width from 40 to 30.
let g:tagbar_width = 30

"----------- Gundo Settings ---------------------------

"Gundo toggle
nnoremap <F3> :GundoToggle<CR>

"Set gundo preview width
let g:gundo_preview_height=1

"----------- FuzzyFinder Settings --------------------

"FuzzyFinder File
nmap <silent> ,ff :FufFile<cr>

"FuzzyFinder Buffer
nmap <silent> ,fb :FufBuffer<cr>

"Start FuzzyFinder in ~/.vim dir
nmap <silent> ,fv :FufFile ~/.vim/<cr>

"----------- Yankring Settings -----------------------

"Yankring history file
let g:yankring_history_dir = '~/.vim/tmp'

"--------------------End of .vimrc File------------------
