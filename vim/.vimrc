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

"Avoid key conflict with supertab and xptemplate
let g:SuperTabMappingForward='<Plug>supertabKey'
let g:xptemplate_fallback= '<Plug>supertabKey'
let g:xptemplate_key = '<Tab>'
let g:xptemplate_pum_tab_nav=1

" General Settings
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B] "Status Line

"Use vim's title instead of the terminal's
set title

set scrolloff=3
set hidden "Manage multiple buffers effectively. 
set shiftwidth=2
set tabstop=2
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

" Wild menu
set wildmenu
set wildmode=list:longest
set wildchar=<TAB>

" Searching settings
set incsearch
set ignorecase
set showmatch
set hlsearch
set diffopt=filler,iwhite

"Java misc. settings
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_hightlight_debug=1
let java_ignore_javadoc=1
let java_minlines=150
let java_highlight_functions="style"
let java_hightlight_java_lang_ids=1

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
" Some shortcuts to commonly used toggles and other stuff.
map <F2> :NERDTreeToggle<CR>
"Reindent the entire file.
map <F3> gg=G
let mapleader = ","

"Theme Settings
colorscheme molokai
let g:molokai_original=1
let &t_EI .= "\<Esc>[4 q"

"End of .vimrc File"
