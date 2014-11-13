" ------------ ajh's .vimrc ------------
" Load Plugins {{{1
execute pathogen#infect()
runtime macros/matchit.vim

" Colorscheme and Syntax {{{1
syntax on
filetype plugin indent on
colorscheme hybrid_mod

" General Settings {{{1
set autoread
set backspace=indent,eol,start
set clipboard^=unnamed
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
set showcmd showbreak=↪
set splitbelow splitright switchbuf=useopen,usetab
set termencoding=utf-8 fileencoding=utf-8 fileformats=unix,dos,mac
set ttimeoutlen=50
set virtualedit=block
set wildmenu wildcharm=<C-z>

" Search Settings {{{1
set incsearch hlsearch
set smartcase ignorecase
set showmatch matchtime=2
set grepprg=ag\ --nogroup\ --nocolor

" Indent and Fold Settings {{{1
set softtabstop=4 shiftwidth=4
set smarttab expandtab
set autoindent breakindent breakindentopt=sbr
set nofoldenable

" Status Line {{{1
set statusline=%t\ %R\ %H\ %W\ %m\ %{fugitive#statusline()}%=\ %Y
set statusline+=\ \|\ %{&fenc}\ \|\ %{&ff}\ \|\ LN\ %1.7l:%1.7c

" Wildignore Settings {{{1
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**

" History, Backup, Undo {{{1
set history=10000
set backup undofile noswapfile
set backupdir=~/.vim/backup/
set undodir=~/.vim/backup/undo/

" GUI Settings {{{1
if has("gui_running")
    set guioptions= lines=40 columns=140 guifont=Fira\ Mono:h13
endif

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

" Use backspace for % (recursive mapping for matchit.vim)
nmap <BS> %
xmap <BS> %
omap <BS> %

" Switch between splits
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" Move by display lines by default
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> gj (v:count == 0 ? 'j' : 'gj')
nnoremap <expr> gk (v:count == 0 ? 'k' : 'gk')

" Expand buffer list similar to ## for the argslist
cnoremap %% <C-R>=functions#general#bufferList()<CR>

" Remap some keys to be more useful
nnoremap Q gq
nnoremap S i<CR><ESC>^m`gk:silent! s/\v +$//<CR>:noh<CR>``
nnoremap Y y$
nnoremap <CR> za
xnoremap < <gv
xnoremap > >gv

" Use * and # in visual mode
xnoremap * :<C-u>call functions#general#VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call functions#general#VSetSearch('?')<CR>/<C-R>=@/<CR><CR>

" Center the screen and open folds when moving/searching/jumping
nnoremap '' ``zzzv
nnoremap g; g;zzzv
nnoremap g, g,zzzv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g<C-]> g<C-]>zz

" Select entire line without any trailing or leading spaces
nnoremap <leader>v ^vg_

" Autoclose
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O

" Open and close the qf list
nnoremap <leader>c :copen<CR>
nnoremap <leader>q :cclose<CR>

" Quickly edit files
nnoremap <leader>ev :e ~/dotfiles/.vimrc<CR>

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef m`gg=G``

" Remove trailing whitespace
nnoremap <leader>W m`:%s/\s\+$//<CR>:let @/=''<CR>``

" Buffer switching
nnoremap <expr> <leader>b functions#general#bufNav("horizontal")
nnoremap <expr> <leader>B functions#general#bufNav("vertical")

" Literal word search
nnoremap g/ /\<\><left><left>

" Black-hole register
nnoremap <leader>x "_
xnoremap <leader>x "_

" Quick  grepping
nnoremap <leader>s :grep<space>
nnoremap <leader>V :vimgrep<space>

" Some mappings from unimpaired.vim
nnoremap [a :prev<CR>
nnoremap ]a :next<CR>
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [q  :cprevious<CR>
nnoremap ]q  :cnext<CR>
nnoremap col :set list!<CR>
nnoremap coh :set hlsearch!<CR>
nnoremap cos :set spell!<CR>

" Plugin Settings and Mappings {{{1
" Netrw {{{2
let [netrw_winsize, netrw_banner, netrw_liststyle] = [20, 0, 3]

" Emmet {{{2
let [user_emmet_expandabbr_key, use_emmet_complete_tag, user_emmet_mode] = ["<c-b>", 1, 'i']

" Vimple {{{2
let g:vimple_init_vars = 0

" VimFindsMe/VFM {{{2
let vfm_use_split = 1
nnoremap <leader>f :VFMEdit<CR>
nnoremap <leader>F :VFMArgs<CR>

" Dispatch {{{2
nnoremap d<space> :Dispatch<space>
nnoremap d<CR> :Dispatch<CR>
nnoremap m<CR> :Make<CR>

" Fugitive {{{2
nnoremap <leader>ga :Git add --all .<CR>:Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gC :Git co -b<space>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gs :Gstatus<CR>

" Clang_Complete {{{2
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" Tabular {{{2
let g:no_default_tabular_maps=1
xnoremap <leader>t :Tabularize<space>/
nnoremap <leader>t :Tabularize<space>/

" Jedi {{{2
let [jedi#auto_vim_configuration, jedi#popup_on_dot] = [0, 0]

" Commands {{{1
autocmd! CmdWinEnter * nnoremap <buffer> <CR> <CR>
autocmd! QuickFixCmdPost * copen
autocmd! VimEnter * call functions#cursorshape#CursorShapeMode()
autocmd! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe 'norm! g`"zz' | endif
command! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>
command! -narg=1 -complete=help H h <args> <bar> only <bar> setlocal ls=0
command! BD silent e# | bd#
command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
