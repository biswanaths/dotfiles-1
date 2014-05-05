" ------------ ajh's .vimrc ------------
" Load Plugins {{{1
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'ajh17/snipmate.vim'
Plugin 'ajh17/VimCompletesMe'
Plugin 'dahu/SearchParty'
Plugin 'dahu/vim-fanfingtastic'
Plugin 'klen/python-mode'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'qstrahl/vim-dentures'
Plugin 'Rip-Rip/clang_complete'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-projectile'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
call vundle#end()

" General Settings {{{1
set autoread
set backspace=indent,eol,start
set clipboard^=unnamedplus
set dictionary+=/usr/share/dict/words
set formatoptions+=1j
set hidden
set laststatus=2
set lazyredraw
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:·,trail:·
set modeline
set mouse=nv
set number relativenumber
set completeopt-=preview
set showcmd
set shell=/usr/bin/zsh
set splitbelow splitright switchbuf=useopen
set termencoding=utf-8 fileencoding=utf-8 fileformats=unix,dos,mac
set ttimeoutlen=50
set virtualedit=block
set wildmenu wildcharm=<C-z>

" Colorscheme and Syntax {{{1
syntax on
filetype plugin indent on
colorscheme hybrid_mod

" Search Settings {{{1
set incsearch hlsearch
set smartcase ignorecase
set showmatch matchtime=2
set grepprg=ack\ -H\ --nocolor\ --nogroup\ --column

" Indent and Fold Settings {{{1
set softtabstop=4 shiftwidth=4
set smarttab expandtab
set autoindent
set nofoldenable

" Status Line {{{1
set statusline=%t\ \%R\ \%H\ \%W\ \%m\ \%{fugitive#statusline()}\%=\ \%Y
set statusline+=\ \|\ \%{&fenc}\ \|\ \%{&ff}\ \|\ LN\ \%1.7l\:\%1.7c\ 

" Wildignore Settings {{{1
set wildignorecase
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,**/temp/***.obj

" History, Backup and Undo settings {{{1
set history=10000
set backup undofile noswapfile
set backupdir=~/.vim/backup/
set undodir=~/.vim/backup/undo/

" GUI Settings {{{1
if has("gui_running")
    set guioptions= lines=40 columns=140 guifont=UbuntuMono\ 13
endif

" Vim Niceties (Colorcolumn and Returning to the same line) {{{1
call matchadd('ColorColumn', '\%81v', 100)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g`\"zz" | endif

" Filetype Settings {{{1
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
let g:sh_indent_case_labels = 1
let [rubycomplete_buffer_loading, rubycomplete_classes_in_global, rubycomplete_rails] = [1, 1, 1]
let [python_highlight_all, java_highlight_all] = [1, 1]
let [hs_highlight_boolean, hs_highlight_types, hs_highlight_more_types, hs_highlight_debug] = [1, 1, 1, 1]

" General Mappings {{{1
let mapleader = ' '

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

" Window switching
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" Move by display lines by default
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk

" Expand buffer list similar to ## for the argslist
cnoremap %% <C-R>=functions#bufferList()<CR>

" Remap some keys to be more useful
nnoremap ' `
nnoremap Q gq
nnoremap S i<CR><ESC>^m`gk:silent! s/\v +$//<CR>:noh<CR>``
nnoremap Y y$
nnoremap <CR> za
xnoremap < <gv
xnoremap > >gv

" Center the screen and open folds when moving/searching/jumping
nnoremap '' ``zzzv
nnoremap g; g;zzzv
nnoremap g, g,zzzv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g<C-]> g<C-]>zz

" Selection mappings
nnoremap <leader>v ^vg_
nnoremap <leader>V `[V`]

" Autoclose
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O

" Mappings for opening and closing the qf list
nnoremap <leader>c :copen<CR>
nnoremap <leader>q :cclose<CR>

" Quickly edit files
nnoremap <leader>ev :e ~/dotfiles/.vimrc<CR>

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef m`gg=G``zz

" Remove trailing whitespace
nnoremap <leader>W m`:%s/\s\+$//<CR>:let @/=''<CR>``

" Buffers
nnoremap <expr> <leader>b functions#bufNav("horizontal")
nnoremap <expr> <leader>B functions#bufNav("vertical")
nnoremap <leader>l :b#<CR>
nnoremap <leader>L :vertical sb#<CR>

" Make arrow keys useful
nnoremap <left> :vertical resize +2<cr>
nnoremap <right> :vertical resize -2<cr>
nnoremap <up> :resize +2<cr>
nnoremap <down> :resize -2<cr>

" Plugin Settings and Mappings {{{1
" Netrw {{{2
let [netrw_winsize, netrw_banner, netrw_liststyle] = [20, 0, 3]

" SearchParty {{{2
nmap <leader>x <Plug>SearchPartyHighlightClear

" Emmet {{{2
let [user_emmet_expandabbr_key, use_emmet_complete_tag, user_emmet_mode] = ["<c-b>", 1, 'i']

" Dispatch {{{2
nnoremap d<space> :Dispatch<space>
nnoremap d<CR> :Dispatch<CR>

" Fugitive {{{2
nnoremap <leader>ga :Git add --all .<CR>:Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gC :Git co -b<space>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>

" Tabular {{{2
let g:no_default_tabular_maps=1
xnoremap <leader>t :Tabularize<space>/
nnoremap <leader>t :Tabularize<space>/

" Python-mode {{{2
let [pymode_options, pymode_trim_whitespaces, pymode_breakpoint, pymode_lint] = [0, 0, 0, 0]

" CtrlP {{{2
nnoremap <leader>f :CtrlP<CR>
let [ctrlp_use_caching, ctrlp_user_command] = [0, 'ag %s -l --nocolor --hidden -g ""']

" Functions and Commands {{{1
function! s:CursorShapeMode()
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Tomorrow/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Tomorrow/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Tomorrow/cursor_shape block"
endfunction

autocmd! CmdWinEnter * nnoremap <buffer> <CR> <CR>
autocmd! QuickFixCmdPost * copen
autocmd! VimEnter * call <SID>CursorShapeMode()
command! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>
command! -narg=1 -complete=help H h <args> <bar> only <bar> setlocal ls=0
command! BD silent e# | bd#
