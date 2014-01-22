" ------------ ajh's .vimrc ------------
" Vundle {{{1
if filereadable(expand("~/.vim/vimrc.bundles")) 
    source ~/.vim/vimrc.bundles 
endif

" Colorscheme / Syntax {{{1
filetype plugin indent on
syntax on
let g:hybrid_use_Xresources=1
colorscheme hybrid-mod

" General Settings {{{1
let mapleader=','
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
set incsearch hlsearch smartcase ignorecase
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
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.out,*.DS_Store,*.class
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.zip,*.so,*.swp,*/tmp/*
set wildignore+=*.o,*.out,*.obj,*.manifest,*~,#*#,*.sw?,%*,*=

"Backup settings {{{1
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

" Plugin Settings and Mappings {{{1
" Gist
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

" Python-mode
let g:pymode_lint_on_fly=0
let g:pymode_lint_cwindow=0

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Clang_Complete
let g:clang_close_preview=1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" DelimitMate
let delimitMate_expand_cr = 1

" vim-notes
let g:notes_directories = ['~/Dropbox/Notes']

" Syntastic
let g:syntastic_loc_list_height=4
let g:syntastic_javascript_checkers=['jslint']
let g:syntastic_mode_map = {'mode': 'active','active_filetypes':['javascript', 'haskell'], 'passive_filetypes': ['python', 'objc']}

" Supertab (Why would you go backwards?!)
let g:SuperTabDefaultCompletionType = "<c-n>"

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#data_directory = '~/.cache/neocomplete'
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" Tabular
xnoremap <leader>t :Tabular<space>/

" Ctrlp
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :CtrlPCurWD<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>k :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>T :CtrlPBufTag<CR>
nnoremap <leader>w :CtrlPLine<CR>
let g:ctrlp_extensions = ['tag', 'line']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Vim Niceties {{{1
call matchadd('ColorColumn', '\%81v', 100)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "norm! g'\"" | endif

" Filetype syntax and indent {{{1
" Haskell
let [hs_highlight_boolean, hs_highlight_types, hs_highlight_more_types, hs_highlight_debug] = [1, 1, 1, 1]
" C 
let [c_space_errors, c_comment_strings] = [1, 1]
" HTML
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
" Python
let python_highlight_all = 1

" General Mappings {{{1
nnoremap \ ,
nnoremap Q gq

" Make Y behave like C, D, etc.
nnoremap Y y$

" Quickly Edit vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>eb :e ~/.vim/vimrc.bundles<CR>

" Easily send text to the black hole
nnoremap <leader>d "_d

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef mfgg=G`fzz

" Remove trailing whitespace
nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Toggle folds
nnoremap <Space> za

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

" Center screen when searching. Don't jump to the next match automatically
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

" Commands {{{1
command! -bang -nargs=* -range=% -complete=file W <line1>,<line2> w<bang> <args>
command! CD lcd %:p:h
command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
command! Todo tselect TODO
command! Fix tselect FIXME
