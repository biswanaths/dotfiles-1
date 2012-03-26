"-----------------------"
"File: .VIMRC          "
"Author: Watabou       "
"Version: 1.0          "
"-----------------------"
 
"Pathogen
call pathogen#infect()
call pathogen#helptags()

"Exuberant Ctags Path
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set tags=tags

" General Settings
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
syntax on
set background=dark
set shiftwidth=2
set tabstop=2
set magic
set showcmd
set nocompatible "I want vim not vi
set ffs=unix,dos,mac
set encoding=utf8
set history=200
set undolevels=300
set backspace=indent,eol,start
set linebreak
set cmdheight=2
set noerrorbells "Stop whining
set number
set ruler
set autoread "Sets vim to auto read if the file has been changed externally. 

" Indent settings 
filetype on
filetype indent on
filetype plugin on
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set copyindent
set preserveindent "Preserves indent as best as it can

" Wild mode
set wildmode=list:longest
set wildmenu
set wildchar=<TAB>

" Searching settings
set incsearch
set ignorecase
set showmatch
set hlsearch
set diffopt=filler,iwhite

"Filetype Settings
"Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Vimscript
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

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
"My plus key is kinda wonky, shut up.
imap <C-p> +
" Some shortcuts to commonly used toggles and other stuff.
map <F2> :NERDTreeToggle<CR>
"Reindent the entire file.
map <F3> gg=G

"Theme Settings
colorscheme molokai
let g:molokai_original=1

"End of .vimrc File"
