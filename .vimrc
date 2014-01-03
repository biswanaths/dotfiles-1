" ------------ ajh's .vimrc ------------
" Vundle {{{1
if filereadable(expand("~/.vim/vimrc.bundles"))
    source ~/.vim/vimrc.bundles
endif

" General Settings {{{1
let mapleader=','
set autoread
set backspace=indent,eol,start
set clipboard+=unnamed
set completeopt=menu,longest,preview
set formatoptions+=1j
set hidden
set laststatus=2
set lazyredraw
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:·,trail:·
set mouse=a
set nrformats-=octal
set number relativenumber
set omnifunc=syntaxcomplete#Complete
set scrolloff=4
set showcmd
set splitbelow splitright
set switchbuf=useopen,usetab
set synmaxcol=800
set termencoding=utf-8 fileencoding=utf-8
set timeout timeoutlen=1000 ttimeoutlen=100
set virtualedit=block
set wildmenu

" Colorscheme / Syntax {{{1
filetype plugin indent on
syntax on
let g:hybrid_use_Xresources=1
colorscheme hybrid-mod

" Status Line {{{1
set statusline=%t\ \%{SyntasticStatuslineFlag()}\ \%#StatusRO#\%R
set statusline+=\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W\ \%#StatusModFlag#\%m
set statusline+=\ \%{fugitive#statusline()}\%=\ \%#StatusFTP#\%Y
set statusline+=\ \|\ \%{&fenc}\ \|\ \%{&ff}\ \|\ LN\ \%1.7l\:\%1.7c\ 

" Search Settings {{{1
nnoremap / /\v
xnoremap / /\v
set incsearch hlsearch
set smartcase ignorecase
set showmatch
set matchtime=2

" Tab, Indent and Folds {{{1
set softtabstop=4 shiftwidth=4
set smarttab expandtab
set autoindent
set nofoldenable

" Wildignore Settings {{{1
set wildignorecase
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.out,*.DS_Store,*.class
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.zip,*.so,*.swp,*/tmp/*
set wildignore+=*.o,*.out,*.obj,*.manifest,*~,#*#,*.sw?,%*,*=

"Backup settings {{{1
set history=2000
set noswapfile
set backup
set undofile
set backupdir=~/.vim/backup/
set undodir=~/.vim/backup/undo/

" GUI Settings {{{1
if has("gui_running")
    set guioptions=ac lines=40 columns=140 guifont=Inconsolata-g:h14
endif

" Window Management {{{1
" -- Switching between windows
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
" -- Closing windows
nnoremap <silent> <leader>ch :wincmd h<CR>:close<CR>
nnoremap <silent> <leader>cj :wincmd j<CR>:close<CR>
nnoremap <silent> <leader>ck :wincmd k<CR>:close<CR>
nnoremap <silent> <leader>cl :wincmd l<CR>:close<CR>

" Plugin Settings and Mappings {{{1
" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Clang_Complete
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_close_preview=1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" DelimitMate
let delimitMate_expand_cr = 1

" vim-notes
let g:notes_directories = ['~/Dropbox/Notes']

" Haskellmode
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" Syntastic
let g:syntastic_loc_list_height=4
let g:syntastic_javascript_checkers=['jslint']

" Supertab (Why would you go backwards?!)
let g:SuperTabDefaultCompletionType = "<c-n>"

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#data_directory = '~/.cache/neocomplete'
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" Tabular
xnoremap <leader>t :Tabular<space>/

" Ctrlp
set grepprg=ag\ --nogroup\ --nocolor
nnoremap <c-p><c-p> :CtrlP<CR>
nnoremap <c-p><c-w> :CtrlPCurWD<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>k :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>T :CtrlPBufTag<CR>
nnoremap <leader>w :CtrlPLine<CR>
let g:ctrlp_extensions = ['tag', 'line']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1

" Vim Niceties {{{1
" Add a color column but only highlight over 80 columns
call matchadd('ColorColumn', '\%81v', 100)

" When opening a file, return to the last known position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g'\"" | endif

" Filetype syntax and indent {{{1
" Haskell
let hs_highlight_boolean=1
let hs_highlight_types=1
let hs_highlight_more_types=1
let hs_highlight_debug=1
" C 
let c_comment_strings = 1
" HTML
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
" Python
let python_highlight_all = 1

" General Mappings {{{1
" Restore \ to search character wise
nnoremap \ ,

" Easily send text to the black hole
nnoremap <leader>d "_d

" Tab is easier to type than %
nnoremap <tab> %

" Don't need arrow keys
nnoremap <up> :lprev<CR>zvzz
nnoremap <down> :lnext<CR>zvzz
nnoremap <left> :cprev<CR>zvzz
nnoremap <right> :cnext<CR>zvzz

" Geez fingers!
com! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>

" Easier way to escape
inoremap jk <Esc>

" Format paragraph (also I hate ex mode)
nnoremap Q gq

" Quickly edit vimrc or plugins
nnoremap <silent> <leader>ev :sp $MYVIMRC<CR>
nnoremap <silent> <leader>eb :sp ~/.vim/vimrc.bundles<CR>

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef mfgg=G`fzz

" Never felt the need to use H or L
nnoremap H ^
nnoremap L $

" Remove trailing whitespace
nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Use space to toggle folds
nnoremap <Space> za

" Yank to the end of the line
nnoremap Y y$

" Focus only on fold that is on the cursor position
nnoremap <leader>z zMzvzz

" Reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" Open folds when searching, always centering the screen
nnoremap n nzzzv
nnoremap N Nzzzv

" select the entire line but ignore the indentation
nnoremap vv ^vg_

" Splits a line -- opposite of J (join lines)
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Centet screen when searching. Don't jump to the next match automatically
nnoremap <silent> * *Nzz
nnoremap <silent> # #Nzz
nnoremap <silent> g* g*Nzz

" Tmux settings  {{{1
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    set t_ut=y
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Typos {{{1
if filereadable(expand("~/.vim/vim-typos"))
    source ~/.vim/vim-typos
endif
