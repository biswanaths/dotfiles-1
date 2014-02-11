" ------------ ajh's .vimrc ------------
" Source Vundle {{{1
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'mattn/emmet-vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Rip-Rip/clang_complete'
Bundle 'Shougo/neocomplete'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
runtime macros/matchit.vim

" General Settings {{{1
let mapleader = ','
set autoread
set backspace=indent,eol,start
set clipboard+=unnamed
set formatoptions+=1j
set hidden
set laststatus=2
set lazyredraw
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:·,trail:·
set mouse=a
set number relativenumber
set omnifunc=syntaxcomplete#Complete
set scrolloff=2
set showcmd
set splitbelow splitright switchbuf=useopen,usetab
set tags=./tags;,tags;
set termencoding=utf-8 fileencoding=utf-8
set timeout timeoutlen=1000 ttimeoutlen=100
set virtualedit=block
set visualbell t_vb=
set wildmenu

" Colorscheme and Syntax {{{1
filetype plugin indent on
syntax on
let g:hybrid_use_Xresources=1
colorscheme hybrid-mod

" Search Settings {{{1
nnoremap / /\v
xnoremap / /\v
set incsearch hlsearch smartcase ignorecase gdefault
set showmatch matchtime=2

" Indent and Fold Settings {{{1
set shiftround softtabstop=4 shiftwidth=4
set smarttab expandtab
set autoindent
set nofoldenable

" Status Line {{{1
set statusline=%t\ \%#StatusRO#\%R\ \%#StatusHLP#\%H
set statusline+=\ \%#StatusPRV#\%W\ \%#StatusModFlag#\%m\ \%{fugitive#statusline()}\%=
set statusline+=\ \%#StatusFTP#\%Y\ \|\ \%{&fenc}\ \|\ \%{&ff}\ \|\ LN\ \%1.7l\:\%1.7c

" Wildignore Settings {{{1
set wildignorecase
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.obj,*.manifest,*~,#*#,%*

" History, Backup and Undo settings {{{1
set history=10000
set backup undofile noswapfile
set backupdir=~/.vim/backup/
set undodir=~/.vim/backup/undo/

" GUI Settings {{{1
if has("gui_running")
    set guioptions=ac lines=40 columns=140 guifont=Inconsolata-g:h14
endif

" Moving windows {{{1
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" Vim Niceties (Colorcolumn and Returning to the same line) {{{1
call matchadd('ColorColumn', '\%81v', 100)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g'\"zz" | endif

" Filetype Settings {{{1
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
let [rubycomplete_buffer_loading, rubycomplete_classes_in_global, rubycomplete_rails] = [1, 1, 1]
let [python_highlight_all, java_highlight_all] = [1, 1]
let [hs_highlight_boolean, hs_highlight_types, hs_highlight_more_types, hs_highlight_debug] = [1, 1, 1, 1]

" General Mappings {{{1
nnoremap ' `
nnoremap \ ,
nnoremap Q gq
nnoremap Y y$

" Use tab key instead of % for matchit.vim
nmap <tab> %

" Quickly delete a buffer
nnoremap <leader>l :ls<CR>:bd<space>

" Quickly edit files
nnoremap <leader>ev :e ~/.vimrc<CR>

" Autoclose
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O

" Send text to the black hole register
nnoremap <leader>h "_d

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef mfgg=G`f

" Remove trailing whitespace
nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Toggle folds
nnoremap <Space> za

" Reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" Nicer searching behavior
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <silent> * *Nzz
nnoremap <silent> # #Nzz
nnoremap <silent> g* g*Nzz

" Splits a line -- opposite of J
nnoremap S i<CR><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Plugin Settings and Mappings {{{1
" Python-mode
let [pymode_lint_on_fly, pymode_lint_cwindow] = [0, 0]

" Netrw
let [netrw_banner, netrw_liststyle] = [0, 3]

" Gist
let [gist_open_browser_after_post, gist_detect_filetype] = [1, 1]

" Emmet
let [user_emmet_expandabbr_key] = ["<c-j>"]

" Dispatch
nnoremap <leader>D :Dispatch<CR>
nnoremap <leader>d :Dispatch<space>

" Fugitive
nnoremap <leader>ga :Git add --all .<CR>:Gcommit<CR>
nnoremap <leader>gb :Git co -b<space>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

" Ctrlp
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>k :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>T :CtrlPBufTag<CR>
nnoremap <leader>w :CtrlPLine<CR>
let g:ctrlp_extensions = ['tag', 'line']
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Clang_Complete
let g:clang_close_preview=1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" Supertab (Why would you go backwards?!)
let g:SuperTabDefaultCompletionType = "<c-n>"

" Neocomplete
let g:neocomplete#auto_completion_start_length = 4
let [neocomplete#enable_at_startup, neocomplete#enable_smart_case, neocomplete#force_overwrite_completefunc] = [1, 1, 1]
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" Tabular
xnoremap <leader>t :Tabular<space>/

" Functions and Commands {{{1
call functions#CursorShapeMode()
command! -nargs=0 Format call functions#AStyleFormat()
command! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>
command! CD lcd %:p:h
