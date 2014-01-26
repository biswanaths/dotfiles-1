" ------------ ajh's .vimrc ------------
" Source Vundle {{{1
if filereadable(expand("~/.vim/vimrc.bundles")) 
    let mapleader=','
    source ~/.vim/vimrc.bundles 
endif

" Colorscheme and Syntax {{{1
filetype plugin indent on
syntax on
let g:hybrid_use_Xresources=1
colorscheme hybrid-mod

" General Settings {{{1
set autoread
set backspace=indent,eol,start
set clipboard+=unnamed
set formatoptions+=1j
set hidden
set laststatus=2
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:·,trail:·
set mouse=a
set number relativenumber
set omnifunc=syntaxcomplete#Complete
set scrolloff=4
set showcmd
set splitbelow splitright
set switchbuf=useopen,usetab
set tags=./tags;,tags;
set termencoding=utf-8 fileencoding=utf-8
set timeout timeoutlen=1000 ttimeoutlen=100
set virtualedit=block
set wildmenu
runtime macros/matchit.vim

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
set statusline=%t\ \%{SyntasticStatuslineFlag()}\ \%#StatusRO#\%R
set statusline+=\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W\ \%#StatusModFlag#\%m
set statusline+=\ \%{fugitive#statusline()}\%=\ \%#StatusFTP#\%Y
set statusline+=\ \|\ \%{&fenc}\ \|\ \%{&ff}\ \|\ LN\ \%1.7l\:\%1.7c\ 

" Wildignore Settings {{{1
set wildignorecase
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.zip,*/tmp/*,*.obj
set wildignore+=*.manifest,*~,#*#,%*,*=

" History, Backup and Undo settings {{{1
set history=10000
set noswapfile
set undofile
set backupdir=~/.vim/backup/
set undodir=~/.vim/backup/undo/

" GUI Settings {{{1
if has("gui_running")
    set guioptions=ac lines=40 columns=140 guifont=Inconsolata-g:h14
endif

" Window Management (Moving and Closing) {{{1
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
nnoremap <silent> <leader>ch :wincmd h<CR>:close<CR>
nnoremap <silent> <leader>cj :wincmd j<CR>:close<CR>
nnoremap <silent> <leader>ck :wincmd k<CR>:close<CR>
nnoremap <silent> <leader>cl :wincmd l<CR>:close<CR>

" Vim Niceties (Colorcolumn and Returning to the same line) {{{1
call matchadd('ColorColumn', '\%81v', 100)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g'\"" | endif

" Filetype Settings {{{1
let python_highlight_all = 1
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
let g:java_highlight_all = 1
let [c_space_errors, c_comment_strings] = [1, 1]
let [hs_highlight_boolean, hs_highlight_types, hs_highlight_more_types, hs_highlight_debug] = [1, 1, 1, 1]

" General Mappings {{{1
nnoremap H ^
nnoremap L g_

" Use \ to search backward characterwise
nnoremap \ ,

" No ex mode for me, thanks.
nnoremap Q gq

" Make Y behave like C, D, etc.
nnoremap Y y$

" Quickly Edit vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>eb :e ~/.vim/vimrc.bundles<CR>

" Send text to the black hole register
nnoremap <leader>d "_d

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
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Tmux settings (Cursor and bce) {{{1
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Custom Commands {{{1
command! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>
command! CD lcd %:p:h
command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
command! Todo tselect TODO
command! Fix tselect FIXME
