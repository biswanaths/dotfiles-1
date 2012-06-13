"-----------------------"
" File: .vimrc          "
" Author: Watabou       "
" Modified: 06/09/2012  "
"-----------------------"

" Let's use vim instead of vi
set nocompatible

" Vundle settings
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" Let vundle manage bundles
Bundle 'gmarik/vundle'

" My bundles:
Bundle 'ehamberg/vim-cute-python'
Bundle 'ervandew/supertab'
Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mattn/gist-vim'
Bundle 'mattsa/vim-fuzzee'
Bundle 'mileszs/ack.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplcache'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/vitality.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tlib_vim'
Bundle 'Watabou90/snipmate-snippets'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-notes'

" Plugins from vim-scripts
Bundle 'Rainbow-Parenthesis'
Bundle 'YankRing.vim'

"Vim Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle 'Lucius'

"Turn on all filetype indenting, plugins, and syntax highlighting
filetype on
filetype plugin on
filetype indent on
syntax on

"OmniCompletion
set ofu=syntaxcomplete#Complete

" General Settings {{{
if has ("gui_running")
    " remove the toolbars and the right scrollbars. 
    set guioptions-=T
    set guioptions-=r
endif

"Always show the status
set laststatus=2

"Keep status bar height small.
set cmdheight=2

" Use 256 colors
if &term!="xterm"
    set t_Co=256
endif

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

" Faster terminal.
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

"Don't continue comment after I press o or O
set formatoptions-=o

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
set softtabstop=4
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

" Java omni complete and misc. stuff
let java_allow_cpp_keywords=1
if has("autocmd")
    autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
endif

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

" Set theme to Solarized
set background=dark
call togglebg#map("")
colorscheme solarized

" Or set theme to Monokai
"if has('gui_running')
"    colorscheme monokai
"else
"    colorscheme molokai 
"    let g:molokai_original=1
"endif

" set the gui font to look nice
if has("gui_running")
    set guifont=Inconsolata-dz\ for\ Powerline:h12
endif

" Various Plugin Settings {{{

"----------- Powerline Settings -------------------------
let g:Powerline_symbols='fancy'

"----------- NERDTree Settings --------------------------

"Always show the bookmarks
let NERDTreeShowBookmarks=1

"Use minimal UI
let NERDTreeMinimalUI=1

"Set the window width
let NERDtreeWinSize=30

"Use arrows for directories
let NERDTreeDirArrows=1

"NERDTree open and close toggle
nmap <F2> :NERDTreeToggle<CR>

"----------- Tagbar Settings ----------------------------

"Tagbar Toggle 
nnoremap <silent> ,T :TagbarToggle<CR>

"Set TagBar width from 40 to 30.
let g:tagbar_width=30

"----------- Gundo Settings -----------------------------

"Gundo toggle
nnoremap <F3> :GundoToggle<CR>

"Set gundo preview width
let g:gundo_preview_height=1

"Open on the right instead of the left
let g:gundo_right=1

"Set gundo preview and window width
let g:gundo_width=30

"----------- CtrlP Settings -----------------------------

"Ignore these files
let g:ctrlp_custom_ignore='\.git$\|\.hg$\|\.svn$'

"default to filename searches
let g:ctrl_p_by_filename=1

"Specify the cache directory
let g:ctrlp_cache_dir=$HOME.'/.vim/tmp/.cache/ctrlp'

"Specify a smaller window height.
let g:ctrlp_max_height=20

"Don't interfere with Yankring's paste.
let g:ctrlp_map=',t'
nnoremap <silent> ,t :CtrlPMixed<CR>

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

"---------- Vim-EasyTags Settings ------------------------

"Let easy tags be always enabled
let g:easytags_always_enabled=1

"Change the location of easytags file
let g:easytags_file='~/.vim/tags/tags'

"Generate tags for members.
let g:easytags_include_members=1

"------------ NeoComlCache Settings ----------------------

" General settings
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_max_list=10
let g:neocomplcache_auto_completion_start_length=4
inoremap <D-Space> <C-n>

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"------------ Syntastic Settings -------------------------

"Mark errors with :signs
let g:syntastic_enable_signs=1

"Automatically jump to the error after saving
let g:sytastic_auto_jump=0

"Show the error list automatically
let g:syntastic_auto_loc_list=1

"------------ Clang_Complete Settings --------------------

"Auto select the first entry but don't insert it into code
let g:clang_auto_select=1

"Auto close preview window
let g:clang_close_preview=1

"}}}
"-------------------- End of .vimrc File -----------------------------
