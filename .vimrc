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
au! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g'\"zz" | endif

" Filetype Settings {{{1
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
let [rubycomplete_buffer_loading, rubycomplete_classes_in_global, rubycomplete_rails] = [1, 1, 1]
let [python_highlight_all, java_highlight_all] = [1, 1]
let [hs_highlight_boolean, hs_highlight_types, hs_highlight_more_types, hs_highlight_debug] = [1, 1, 1, 1]

" General Mappings {{{1
let mapleader = ','

" Use Enter key for matchit
nmap <cr> %
xmap <cr> %

" Tab complete
inoremap <expr> <s-tab> self#shiftTabEval()
inoremap <expr> <tab> self#simpleTabComplete("omni")

" Searching improvements
nnoremap \ ,
nnoremap / /\v
xnoremap / /\v
nnoremap n nzzzv
nnoremap N Nzzzv
xnoremap # :<C-u> call self#VSetSeatch('?')<CR>?<C-r>=@/<CR><CR>
xnoremap * :<C-u> call self#VSetSearch('/')<CR>/<C-r>=@/<CR><CR>

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

" Remap some keys to be more useful
nnoremap ' `
nnoremap Q gq
nnoremap S i<CR><ESC>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w
nnoremap Y y$
xnoremap < <gv
xnoremap > >gv
nnoremap <space> za

" Search/Replace the word under the cursor
nnoremap <leader>s :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>S :%s/\<<C-r>=expand('<cword>')<CR>\>/

" Selection mappings
nnoremap <leader>v ^vg_
nnoremap <leader>V `[V`]

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

" Buffers
nnoremap <expr> <leader>b self#bufNav("horizontal")
nnoremap <expr> <leader>B self#bufNav("vertical")

" Plugin Settings and Mappings {{{1
" Netrw {{{2
let [netrw_winsize, netrw_banner, netrw_liststyle] = [20, 0, 3]

" Emmet {{{2
let [user_emmet_expandabbr_key, use_emmet_complete_tag, user_emmet_mode] = ["<c-j>", 1, 'i']

" Dispatch {{{2
nnoremap <leader>d :Dispatch<CR>
nnoremap <leader>m :Make<CR>

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

" CtrlP {{{2
nnoremap <leader>f :CtrlP<CR>
let [ctrlp_use_caching, ctrlp_user_command] = [0, 'ag %s -l --nocolor --hidden -g ""']

" Pymode {{{2
let [pymode_lint_signs, pymode_lint_on_fly, pymode_lint_cwindow] = [0, 0, 0]

" Functions and Commands {{{1
call self#CursorShapeMode()
command! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>
command! BD silent e# | bd#
