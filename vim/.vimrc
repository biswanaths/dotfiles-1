"-----------------------"
" File: .vimrc          "
" Author: Watabou       "
" Modified: 06/09/2012  "
"-----------------------"

" Let's use vim instead of vi
set nocompatible

" Use pathogen to manage bundles
call pathogen#infect()

"Turn on all filetype stuff to on including syntax highlighting
syntax on
filetype plugin indent on

" General Settings {{{
if has ("gui_running")
    " remove the toolbars and the right scrollbars. 
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    highlight SpellBad term=underline gui=undercurl guisp=Orange
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

"Set text width to be 80 characters long. 
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

" Fast terminal.
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

"Wrap lines at convenient points
set linebreak

"wrap text by default
set wrap

"Don't continue comment after I press o or O
set formatoptions-=o

"For the love of science, don't beep.
set visualbell

" Printing options
set printoptions=header:0,duplex:long,paper:letter

" Add the unnamed register to the clipboard
set clipboard+=unnamed

"Line numbering
set number

"Show the ruler
set ruler

"Sets vim to auto read if the file has been changed externally. 
set autoread 
"}}}

" Indent settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent
set preserveindent
set copyindent

" Folds
set foldmethod=manual  " Fold based on indent
set foldnestmax=3      " deepest folds are 3 levels
set nofoldenable       " don't fold by default.
" specifies the commands which open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

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

"Return vim to the same line after reopening a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line ("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

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

" Some autocmds for filetypes
if has("autocmd")
    "Ruby
    autocmd FileType ruby compiler ruby
    " Java
    autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
endif

"Omni Completion
if has("autocmd") && exists("+omnifunc")
    autocmd FileType *
      \ if &omnifunc == "" |
      \   setlocal omnifunc=syntaxcomplete#Complete |
      \ endif
endif

"Mapping Settings

" Disable the arrow keys in command mode.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" And disable it in insert mode.
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" map the jk  keys to jump to the next visual line instead of the next line
" number if the line is wrapped.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

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

"Use a different location for the bookmarks file
let g:NERDTreeBookmarksFile='~/.vim/backup/'

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

"Let tagbar expand the gui window when it opens
let g:tagbar_expand=1

"Omit useless stuff
let g:tagbar_compact=1

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

"------------ NeoComplCache Settings ---------------------

" General settings
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcahce_enable_underbar_completion=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_auto_completion_start_length=4
let g:neocomplcache_force_overwrite_completefunc=1
let g:neocomplcache_temporary_dir='~/.vim/tmp/neocon'

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
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

"------------ Syntastic Settings -------------------------

"Mark errors with :signs
let g:syntastic_enable_signs=1

"Automatically jump to the error after saving
let g:sytastic_auto_jump=0

"------------ Clang_Complete Settings --------------------

"Auto select the first entry but don't insert it into code
let g:clang_auto_select=1

"Auto close preview window
let g:clang_close_preview=1
"}}}

"----------- SuperTab Settings ---------------------------

" Remab the default completion type
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"-------------------- End of .vimrc File -----------------------------
