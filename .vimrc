" ------------ ajh's .vimrc ------------
" Load Plugins {{{1
execute pathogen#infect()
runtime! macros/matchit.vim

" General Settings {{{1
set autoread
set backspace=indent,eol,start
set clipboard+=unnamed
set dictionary+=/usr/share/dict/words
set formatoptions+=1j
set hidden
set laststatus=2
set lazyredraw
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:·,trail:·
set mouse=a
set number relativenumber
set omnifunc=syntaxcomplete#Complete
set scrolloff=4
set showcmd
set splitbelow splitright switchbuf=useopen
set tags=./tags;,tags;
set termencoding=utf-8 fileencoding=utf-8 fileformats=unix,dos,mac
set timeout timeoutlen=1000 ttimeoutlen=100
set virtualedit=block
set wildmenu

" Colorscheme and Syntax {{{1
syntax on
filetype plugin indent on
let g:hybrid_use_Xresources=1
colorscheme hybrid_mod

" Search Settings {{{1
set incsearch hlsearch
set smartcase ignorecase
set showmatch matchtime=2

" Indent and Fold Settings {{{1
set softtabstop=4 shiftwidth=4
set smarttab expandtab
set autoindent
set nofoldenable

" Status Line {{{1
set statusline=%t\ \%R\ \%H\ \%W\ \%m\ \%{fugitive#statusline()}\%=
set statusline+=\ \%Y\ \|\ \%{&fenc}\ \|\ \%{&ff}\ \|\ LN\ \%1.7l\:\%1.7c\ 

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
    set guioptions= lines=40 columns=140 guifont=Inconsolata-g:h14
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
let [rubycomplete_classes_in_global, rubycomplete_rails] = [1, 1]
let [python_highlight_all, java_highlight_all] = [1, 1]
let [hs_highlight_boolean, hs_highlight_types, hs_highlight_more_types, hs_highlight_debug] = [1, 1, 1, 1]

" General Mappings {{{1
let mapleader = ','

" Remap some keys to be more useful
nmap <tab> %
vmap <tab> %
nnoremap ' `
nnoremap \ ,
nnoremap / /\v
xnoremap / /\v
nnoremap Q gq
nnoremap Y y$
xnoremap < <gv
xnoremap > >gv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <silent> * *Nzz
nnoremap <silent> # #Nzz
nnoremap <space> za
nnoremap S i<CR><ESC>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Searching/Replace the word under the cursor
nnoremap <leader>s :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>S :%s/\<<C-r>=expand('<cword>')<CR>\>/

" Autoclose
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O

" Quickly delete a buffer
nnoremap <leader>l :ls<CR>:bd<space>

" Close the quickfix list
nnoremap <leader>q :cclose<CR>

" Quickly edit files
nnoremap <leader>ev :e ~/.vimrc<CR>

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef mfgg=G`fzz

" Remove trailing whitespace
nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Plugin Settings and Mappings {{{1
" Python-mode
let [pymode_lint_on_fly, pymode_lint_cwindow] = [0, 0]

" Netrw
let [netrw_winsize, netrw_banner, netrw_liststyle] = [20, 0, 3]

" Gist
let [gist_open_browser_after_post, gist_detect_filetype] = [1, 1]

" Emmet
let [user_emmet_expandabbr_key] = ["<c-j>"]

" Dispatch
nnoremap <leader>d :Dispatch<CR>
nnoremap <leader>D :Dispatch<space>

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

" Tabular
xnoremap <leader>t :Tabular<space>/

" Functions and Commands {{{1
call functions#CursorShapeMode()
command! -nargs=0 Format call functions#AStyleFormat()
command! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>
command! BD silent e# | bd#
