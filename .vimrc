" ------------ ajh's .vimrc ------------
" Load Plugins
execute pathogen#infect()
runtime macros/matchit.vim

" Colorscheme and Syntax
syntax on
filetype plugin indent on
colorscheme hybrid_mod

" General Settings
set autoread
set backspace=indent,eol,start
set clipboard+=unnamed
set completeopt-=preview
set dictionary+=/usr/share/dict/words
set formatoptions+=1j
set hidden
set laststatus=2
set lazyredraw
set list listchars=eol:\ ,tab:▸\ ,trail:·
set mouse=n
set nostartofline
set number relativenumber
set path=.,**
set showcmd
set splitbelow splitright switchbuf=useopen
set termencoding=utf-8 fileencoding=utf-8 fileformats=unix,dos,mac
set ttimeoutlen=50
set virtualedit=block
set wildmenu wildcharm=<C-z>

" Search Settings
set incsearch hlsearch
set smartcase ignorecase
set showmatch matchtime=2
set grepprg=ag\ --nogroup\ --nocolor

" Indent and Fold Settings
set softtabstop=4 shiftwidth=4
set smarttab expandtab
set autoindent
set nofoldenable

" Status Line
set statusline=%t\ %R\ %H\ %W\ %m\ %{fugitive#statusline()}%=\ %Y
set statusline+=\ \|\ %{&fenc}\ \|\ %{&ff}\ \|\ LN\ %1.7l:%1.7c

" Wildignore Settings
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,**/temp/***.obj

" History, Backup and Undo settings
set history=10000
set backup undofile noswapfile
set backupdir=~/.vim/backup/
set undodir=~/.vim/backup/undo/

" GUI Settings
if has("gui_running")
    set guioptions= lines=40 columns=140 guifont=Inconsolata-g:h13
endif

" Vim Niceties (Colorcolumn and Returning to the same line)
call matchadd('ColorColumn', '\%81v', 100)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe 'norm! g`"zz' | endif

" Filetype Settings
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
let g:sh_indent_case_labels = 1
let [rubycomplete_buffer_loading, rubycomplete_classes_in_global, rubycomplete_rails] = [1, 1, 1]
let [python_highlight_all, java_highlight_all] = [1, 1]
let [hs_highlight_boolean, hs_highlight_types, hs_highlight_more_types, hs_highlight_debug] = [1, 1, 1, 1]

" General Mappings
let mapleader = ' '

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
cnoremap %% <C-R>=functions#general#bufferList()<CR>

" Remap some keys to be more useful
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
nnoremap <leader>ef m`gg=G``

" Remove trailing whitespace
nnoremap <leader>W m`:%s/\s\+$//<CR>:let @/=''<CR>``

" Buffers
nnoremap <expr> <leader>b functions#general#bufNav("horizontal")
nnoremap <expr> <leader>B functions#general#bufNav("vertical")
nnoremap <leader>l :vertical sb#<CR>

" Make arrow keys useful
nnoremap <left> :vertical resize +2 <CR>
nnoremap <right> :vertical resize -2 <CR>
nnoremap <up> :resize +2 <CR>
nnoremap <down> :resize -2 <CR>

" Literal word search
nnoremap g/ /\<

" Black-hole register
nnoremap <leader>x "_
xnoremap <leader>x "_

" Gist support for vim. No 1000 line vim plugin required.
xnoremap <leader>p y:silent !gist -Pacos -f <C-r>%<CR>:redraw!<CR>
nnoremap <leader>p :silent !gist -Pacos -f <C-r>%<CR>:redraw!<CR>

" Selection of mappings from unimpaired.vim
nnoremap [a :prev<CR>
nnoremap ]a :next<CR>
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [q  :cprevious<CR>
nnoremap ]q  :cnext<CR>
nnoremap col :set list!<CR>
nnoremap coh :set hlsearch!<CR>
nnoremap cos :set spell!<CR>

" Plugin Settings and Mappings
" Netrw
let [netrw_winsize, netrw_banner, netrw_liststyle] = [20, 0, 3]

" Emmet
let [user_emmet_expandabbr_key, use_emmet_complete_tag, user_emmet_mode] = ["<c-b>", 1, 'i']

" Vimple
let g:vimple_init_vars = 0

" VimFindsMe/VFM
let vfm_use_split = 1
nnoremap <leader>f :VFMEdit<CR>
nnoremap <leader>F :VFMArgs<CR>

" Dispatch
nnoremap d<space> :Dispatch<space>
nnoremap d<CR> :Dispatch<CR>
nnoremap m<CR> :make<CR>
nnoremap M<CR> :Make<CR>

" Fugitive
nnoremap <leader>ga :Git add --all .<CR>:Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gC :Git co -b<space>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gs :Gstatus<CR>

" Clang_Complete
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" Tabular
let g:no_default_tabular_maps=1
xnoremap <leader>t :Tabularize<space>/
nnoremap <leader>t :Tabularize<space>/

" Jedi
let [jedi#auto_vim_configuration, jedi#popup_on_dot] = [0, 0]

" Commands
autocmd! CmdWinEnter * nnoremap <buffer> <CR> <CR>
autocmd! QuickFixCmdPost * copen
autocmd! VimEnter * call functions#cursorshape#CursorShapeMode()
command! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>
command! -narg=1 -complete=help H h <args> <bar> only <bar> setlocal ls=0
command! BD silent e# | bd#
command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
