"-----------------------"
" File: .vimrc          "
" Author: Watabou       "
" Modified: 05/19/2012  "
"-----------------------"

" Let's use vim instead of vi 
set nocompatible

" Load Pathogen
call pathogen#infect()
call pathogen#helptags()

" Filetype settings
syntax on
filetype on
filetype plugin on
filetype indent on

"OmniCompletion
set ofu=syntaxcomplete#Complete

" General Settings {{{
if has ("gui_running")
    " remove the toolbars and the right scrollbars. 
    set guioptions-=T
    set guioptions-=r
endif

"Status Line + Powerline
set laststatus=2   "Always show the status bar.
" Set powerline theme to fancy by default
" note: only works with patched fonts. :h powerline.txt
let g:Powerline_symbols='fancy'

"Keep status bar height small.
set cmdheight=2

"Assume 256 colors.
set t_Co=256

"Use vim's title
set title

"Set text width 
set textwidth=80

"Diff ignores whitespace
set diffopt+=iwhite

" Tells vim to keep the cursor 8 lines from the top
" and bottom when scrolling
set scrolloff=8

"Allow use of the mouse for all modes
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
set encoding=utf-8

"Store some history
set history=1000

" Use persistent undo that enables vim to undo the file even if the file's
" reloaded.
set undofile

"Store a specified amount of undos -- useful for persistent undo.
set undolevels=300

"Allow backspacing over indent, end of line, and start
set backspace=indent,eol,start

"Set line break
set linebreak

"wrap text by default
set wrap

"Don't beep
set noerrorbells

"Line numbering
set number

"Show the ruler
set ruler

"Sets vim to auto read if the file has been changed externally. 
set autoread 
"}}}

" Indent settings 
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set copyindent
set preserveindent 

" Wild menu settings
set wildmenu
set wildmode=list:longest
" tell wildmenu to ignore these types of files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pdf,*.bmp,*.gif,*.jpg,*.jpeg,*.png
set wildignore+=*.pages,*.ichat,*.DS_Store,.git,.hg,.svn
set wildchar=<TAB>
"Completes by the whole tag, instead of just the function name
set showfulltag

"Searching settings
set incsearch
set ignorecase
set showmatch
set hlsearch

"Backup settings
set noswapfile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set undodir=~/.vim/tmp

"Typos
iab anf and
iab adn and
iab flase false
iab teh the
iab Teh The
iab thre there
iab treu true
iab Taht That
iab taht that
iab tath that
iab Seperate Separate
iab seperate separate

"Allow java syntax highlight to accept cpp keywords
let java_allow_cpp_keywords=1

"Mapping Settings

" okay let's try no arrow keys...
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

"Change mapleader to "," character
let mapleader=","

" Ok, lets try remapping j and k to gj and gk
noremap j gj
noremap k gk
noremap gj j
noremap gk k

"Reindent the entire file.
nmap ,fef ggVG=

" Ack -- better than grep.
nmap ,a <Esc>:Ack! 

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

"Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" Yank text to the OS X clipboard
noremap ,y "*y
noremap ,yy "*Y

" Change directory to the current file's directory
nmap <silent> ,cd :lcd %h<CR>

"Toggle search highlight
nmap <silent> ,hs :nohls<CR>

"Use ^-E to replace the , mapping
nnoremap <C-E> ,

"Puts pwd into the path
cmap <C-P><C-R>=expand("%:p:h") . "/"

" Change the height of the status bar
nnoremap ,1 :set cmdheight=1<cr>
nnoremap ,2 :set cmdheight=2<cr>

"Change case
"Uppercase
nmap ,u mQviwU`Q
"Lowercase
nmap ,l mQviwu`Q

"Theme Settings

" For Solarized:
"set background=dark
"call togglebg#map("")
"colorscheme solarized

" For Molokai: 
colorscheme molokai
"Use original colors
let g:molokai_original = 1

" set the gui font to look nice
set guifont=Inconsolata-dz\ for\ Powerline:h12

" Add support for cursor shape depending on the normal or insert mode.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Changes matching parens to underlining instead of a glaring color
:hi MatchParen cterm=underline ctermbg=none ctermfg=none

" Save file when focus is lost
au FocusLost * :wa

" Various Plugin Settings {{{

"----------- NERDTree Settings --------------------------

"Always show the bookmarks
let NERDTreeShowBookmarks=1

"NERDTree open and close toggle
nmap <F2> :NERDTreeToggle<CR>

"----------- Tagbar Settings ----------------------------

"Tagbar Toggle 
nnoremap <silent> <F4> :TagbarToggle<CR>

"Set TagBar width from 40 to 30.
let g:tagbar_width=30

"Automatically open tagbar for a supported file
autocmd VimEnter * nested :call tagbar#autoopen(1)

"----------- Gundo Settings -----------------------------

"Gundo toggle
nnoremap <F3> :GundoToggle<CR>

"Set gundo preview width
let g:gundo_preview_height=1

"Set gundo preview and window width
let g:gundo_width=30

"----------- CtrlP Settings -----------------------------

"Specify the cache directory
let g:ctrlp_cache_dir=$HOME.'/.vim/tmp/.cache/ctrlp'

"Specify a smaller window height.
let g:ctrlp_max_height=20

"Don't interfere with Yankring
let g:ctrlp_map=',ctp'

"----------- FuzzyFinder Settings -----------------------
"FuzzyFinder File
"Start search in home directory since I rarely want
"to search a file outside my home directory.
nmap <silent> ,ff :FufFile ~/<cr>

"FuzzyFinder Buffer
nmap <silent> ,fb :FufBuffer<cr>

"Start FuzzyFinder in ~/.vim dir
nmap <silent> ,fv :FufFile ~/.vim/<cr>

"----------- Yankring Settings --------------------------

"Yankring history file
let g:yankring_history_dir='~/.vim/tmp'

"---------- Vim-Notes Settings----------------------------

"Specify the directory where all notes are stored
let g:notes_directory='~/Documents/Uni/Notes'

" Append .txt extension to all notes.
let g:notes_suffix='.txt'

"---------- Vim-Indent-Guides Settings--------------------

"Change the colors of the indents
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey  ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=4

"---------- Vim-EasyTags Settings ------------------------

"Let easy tags be always enabled
let g:easytags_always_enabled=1

"Change the location of easytags file
let g:easytags_file='~/.vim/tags/tags'

"Generate tags for members.
let g:easytags_include_members=1

"------------ Clang_Complete Settings --------------------

"Auto select the first entry but don't insert it into code
let g:clang_auto_select=1

"Auto close preview window
let g:clang_close_preview=1

"}}}
"-------------------- End of .vimrc File -----------------------------
