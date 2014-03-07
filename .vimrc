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
set mouse=nv
set number relativenumber
set completeopt-=preview
set scrolloff=4
set showcmd
set splitbelow splitright switchbuf=useopen
set termencoding=utf-8 fileencoding=utf-8 fileformats=unix,dos,mac
set timeout timeoutlen=1000 ttimeoutlen=100
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
    set guioptions= lines=40 columns=140 guifont=Inconsolata-g:h14
endif

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
let mapleader = ','

" Remap some keys to be more useful
nmap <tab> %
xmap <tab> %
inoremap <expr> <tab> self#simpleTabComplete("omni")
inoremap <expr> <s-tab> self#shiftTabEval()
xnoremap * :<C-u> call self#VSetSearch('/')<CR>/<C-r>=@/<CR><CR>
xnoremap # :<C-u> call self#VSetSeatch('?')<CR>?<C-r>=@/<CR><CR>
nnoremap ' `
nnoremap \ ,
nnoremap / /\v
xnoremap / /\v
nnoremap Q gq
nnoremap Y y$
xnoremap < <gv
xnoremap > >gv
nnoremap <space> za
nnoremap S i<CR><ESC>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" Search/Replace the word under the cursor
nnoremap <leader>s :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>S :%s/\<<C-r>=expand('<cword>')<CR>\>/

" Autoclose
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O

" Close the quickfix list
nnoremap <leader>q :cclose<CR>

" Quickly edit files
nnoremap <leader>ev :e ~/dotfiles/.vimrc<CR>

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef mfgg=G`fzz

" Remove trailing whitespace
nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Finding files
nnoremap <leader>f :find **/*
nnoremap <leader>F :find <C-r>=expand('%:p:h').'/**/*'<CR>
nnoremap <leader>x :sfind **/*
nnoremap <leader>X :sfind <C-r>=expand('%:p:h').'/**/*'<CR>
nnoremap <leader>v :vertical sfind **/*
nnoremap <leader>V :vertical sfind <C-r>=expand('%:p:h').'/**/*'<CR>

" Buffers
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :vertical sbuffer <C-z><S-Tab>

" Plugin Settings and Mappings {{{1
" Netrw {{{2
let [netrw_winsize, netrw_banner, netrw_liststyle] = [20, 0, 3]

" Gist {{{2
let [gist_open_browser_after_post, gist_detect_filetype] = [1, 1]

" Emmet {{{2
let g:user_emmet_expandabbr_key = "<c-j>"

" Dispatch {{{2
nnoremap <leader>d :Dispatch<space>

" Fugitive {{{2
nnoremap <leader>ga :Git add --all .<CR>:Gcommit<CR>
nnoremap <leader>gb :Git co -b<space>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

" Clang_Complete {{{2
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" Tabular {{{2
let g:no_default_tabular_maps=1
xnoremap <leader>t :Tabularize<space>/
nnoremap <leader>t :Tabularize<space>/

" Syntastic {{{2
let [syntastic_auto_loc_list, syntastic_loc_list_height] = [1, 3]
let g:syntastic_python_checkers = ['python', 'flake8', 'pep8']

" Functions and Commands {{{1
call self#CursorShapeMode()
command! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>
command! BD silent e# | bd#
