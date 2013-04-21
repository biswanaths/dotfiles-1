"---------------------------------"
"        _                        "
" __   _(_)_ __ ___  _ __ ___     "
" \ \ / / | '_ ` _ \| '__/ __|    "
"  \ V /| | | | | | | | | (__     "
" (_)_/ |_|_| |_| |_|_|  \___|    "
"                                 "
"---------------------------------"
" File: ~/.vimrc                  "
" Author: Akshay                  "
" Updated: March 2, 2013          "
"---------------------------------"
" Vundle Settings {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"}}}
" Installed Plugins {{{
Bundle 'c9s/perlomni.vim'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'dahu/MarkMyWords'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/zencoding-vim'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'mileszs/ack.vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'paradigm/TextObjectify'
Bundle 'Raimondi/delimitMate'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scratch.vim'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsaleh/vim-matchit'
Bundle 'xolox/vim-easytags'

" }}}
" Colorscheme plugins {{{
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'trapd00r/neverland-vim-theme'
Bundle 'w0ng/vim-hybrid'
"}}}
" Colorscheme / Syntax / Filetype {{{
syntax on
filetype plugin indent on
set t_Co=256
set background=dark
let g:hybrid_use_Xresources=1
colorscheme hybrid

" Hybrid Colorscheme better settings {{{2
if g:colors_name == "hybrid"
    " Better popup menu
    hi Pmenu ctermfg=137 ctermbg=233 cterm=none
    hi PmenuSel ctermfg=196 ctermbg=234 cterm=bold
    hi PmenuSbar ctermfg=000 ctermbg=233 cterm=none
    hi PmenuThumb ctermfg=137 ctermbg=235 cterm=none
    " Better status bar
    hi! StatusLine ctermfg=234 ctermbg=136
    hi! StatusLineNC ctermfg=234 ctermbg=100
    " Orgasmic matching color
    hi! MatchParen ctermfg=196 ctermbg=234 cterm=bold
endif

""}}}2

"}}}
" General Settings {{{
set relativenumber              " 'Tis the age of relative numbering
set showcmd
set cmdheight=2
set showmode
set nofoldenable                " Don't fold automatically
set foldmethod=syntax
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set mouse=a
set scrolloff=8
set synmaxcol=700
set nrformats-=octal          " Prevents (in|de)crementing a 0 padded number to octal
set clipboard=unnamed
set laststatus=2
set backspace=indent,eol,start
set ttyfast                    " Fast terminal connection
set cpoptions+=$               " Shows a dollar sign when changing text
set fileformats=unix,mac,dos
set encoding=utf-8
set formatoptions-=o          "Doesn't continue the comment after pressing o
set formatoptions=qrn1
set virtualedit=block
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:·,trail:·
set visualbell
set autoread                  "Detect when a file has been changed externally
set autochdir
set switchbuf=useopen,usetab
set shell=/usr/local/bin/zsh
set spelllang=en_us
set spellfile=~/.vim/custom-dictionary.utf-8.add
if has('mouse')
    " recognize the mouse inside a tmux session
    set ttymouse=xterm2
endif
let mapleader=','           " Let leader key be , instead of \
set splitbelow              " Split below the current buffer.
set splitright              " Split right of the current buffer (vertical splits)
"}}}
" Status Line {{{
set statusline=
set statusline+=\ ff\:%{&ff}
set statusline+=\ fenc\:\%{&fenc}\ buf\:\%1.3n\ ft\:\%#StatusFTP#\%Y
set statusline+=\ \%#StatusRO#\%R\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W
set statusline+=\ \%#StatusModFlag#\%M
set statusline+=\ file\:\%#StatusLine#\%f
set statusline+=\%=col\:\%1.7c\ line\:\%1.7l\ of\ %L\ rel\:\%p%%
set statusline+=\ \ 

"}}}
" Search Settings {{{
nnoremap / /\v
xnoremap / /\v
set incsearch
set ignorecase
set showmatch
set matchtime=3
set hlsearch     " highlight matches
set wrapscan     " wrap search to top

"}}}
" Tab Settings {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

"}}}
" Indent Settings {{{
set cindent
set preserveindent
set copyindent
set shiftround
set textwidth=80
set nowrap

"}}}
" Completions {{{
set wildmenu
set wildmode=full
set wildchar=<Tab>
set completeopt-=preview
set completeopt+=longest
set omnifunc=syntaxcomplete#Complete

" }}}
" Wildignore {{{
set wildignore+=.hg,.git,.svn
set wildignore+=*.out
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.zip,*.so,*.swp,*/tmp/*
set wildignore+=*.o,*.obj,*.manifest,*.sublime-project,*.sublime-workspace
set wildignore+=*.pyc
set wildignore+=*.spl
set wildignore+=*.DS_Store
set wildignore+=*/Library/*,*/Pictures/*,*/Books/*,*/Public/*
set wildignore+=*.rvm/*,.gem/*,*.cpan/*,.cache/*,.config/*,*.cpan*,*.rbenv/*
set wildignore+=*~,#*#,*.sw?,%*,*=

"}}}
"Backup settings {{{
set noswapfile
set backup
set backupdir=~/.vim/backup//
set undodir=~/.vim/backup/undo//
set directory=~/.vim/tmp/swap//
set history=1000
set undofile
set undoreload=10000
set nohidden

"}}}
" GUI Settings {{{
if has("gui_running")
    autocmd! FocusLost * :wa
    autocmd! GUIEnter set vb t_vb=
    set lines=40
    set columns=140
    set fuoptions=maxvert,maxhorz
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guifont=Inconsolata-g:h12
    colorscheme badwolf
endif

"}}}
" Window Management {{{
" -- Switching between windows
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap <silent> <C-l> <C-W>l
" -- Moving windows
nnoremap <silent> <leader>sh <C-W>H
nnoremap <silent> <leader>sj <C-W>J
nnoremap <silent> <leader>sk <C-W>K
nnoremap <silent> <leader>sl <C-W>L
" -- Closing windows
nnoremap <silent> <leader>cc :close<CR>
nnoremap <silent> <leader>cw :cclose<CR>
nnoremap <silent> <leader>ch :wincmd h<CR>:close<CR>
nnoremap <silent> <leader>cj :wincmd j<CR>:close<CR>
nnoremap <silent> <leader>ck :wincmd k<CR>:close<CR>
nnoremap <silent> <leader>cl :wincmd l<CR>:close<CR>

" Automatically resize vertical splits
au! WinEnter * setlocal winfixheight
au! WinEnter * wincmd =

" }}}
" Plugin Preferences and Mappings {{{

" -- Yankstack Settings --
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <C-P> <Plug>yankstack_substitute_newer_paste

" -- Commentary Settings -- 
autocmd FileType tmux set commentstring=#\ %s

" -- Gundo Settings --
let g:gundo_width=30
let g:gundo_preview_height=35
let g:gundo_help=0
nnoremap <silent> <F1> :GundoToggle<CR>

" -- Tagbar Settings --
let g:tagbar_expand=1
let g:tagbar_singleclick=1
let g:tagbar_compact=1
let g:tagbar_width=35
nnoremap <silent> <leader>gt :TagbarToggle<CR>

" -- Syntastic Settings --
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_enable_balloons=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = {'mode': 'active',
            \ 'active_filetypes': ['c', 'cpp', 'ruby', 'perl'],
            \ 'passive_filetypes': ['java', 'python'] }

" -- Supertab Settings --
" Shuts up supertab's annoying messages.
let g:SuperTabCrMapping=0

" -- UltiSnips Settings --
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" -- Jedi-vim Settings --
let g:jedi#popup_on_dot=0
let g:jedi#use_tabs_not_buffers=0
let g:jedi#popup_select_first=1

" -- Python-Mode Settings --
let g:pymode_rope=1
let g:pymode_doc=1
let g:pymode_doc_key='K'
let g:pymode_lint=1
let g:pymode_lint_checker="pyflakes,pep8"
let g:pymode_lint_write=1
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_folding=0
let g:python_run_key='<leader>r'
let g:pymode_lint_message=1
let g:pymode_rope=1
let g:pymode_rope_enable_autoimport=1
let g:pymode_rope_autoimport_generate=1
let g:pymode_motion=1
let g:pymode_virtualenv=0
let python_highlight_all=1

" -- ClangComplete Settings --
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_close_preview=1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
let g:clang_complete_patterns=1
let g:clang_complete_macros=1

" -- Tabular Settings --
xnoremap <leader>t :Tabular<space>/

" -- EasyTags Settings --
let g:easytags_always_enabled=1
let g:easytags_include_members=1
" ctrlp keeps lowering updatetime which messes with easytags
let g:easytags_updatetime_autodisable=1
let g:easytags_by_filetype='~/.vim/tags/'
let g:easytags_resolve_links=1
let g:easy_tags_supress_ctags_warning=1

" -- Ctrl-p Settings --
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :CtrlPCurWD<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMixed<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>T :CtrlPBufTag<CR>
nnoremap <leader>w :CtrlPLine<CR>
let g:ctrlp_extensions = ['tag', 'line']
let g:ctrlp_mruf_max = 25
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '3hjr'
let g:ctrlp_root_markers = ['tags']
let g:ctrlp_buftag_types = {
    \ 'javascript' : '--lanaguage-force=javascript --javascript-types=fv'
    \ }

" -- Netrw Settings -- 
let g:netrw_winsize='999'
let g:netrw_banner=0
let g:netrw_keepdir=0
let g:netrw_liststyle=3

"}}}
" Vim Niceties {{{

" Reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" Vim refuses to open folds when searching even when I freaking told it to.
" For fuck's sake.
nnoremap n nzzzv
nnoremap N Nzzzv

" Force save files requiring root permissions
cmap w!! %!sudo tee > /dev/null %

" Reselect the line that was last pasted
nnoremap <leader>V V`]

" select the entire line but ignore the indentation
nnoremap vv ^vg_

" Splits a line -- opposite of J (join lines)
nnoremap ,sp i<cr><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Remap jj to escape from insert mode
inoremap jj <Esc>

" Map jk to move between visual lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Keep search pattern at the center of the screen
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Reformat a C/C++ file in the One True Brace Style
" All other styles are inferior and lack wisdom.
command! -nargs=0 Format call AStyleFormat()
function! AStyleFormat()
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'objc' || &filetype == 'javascript'
        :%!astyle
    elseif &filetype == 'java'
        :%!astyle --mode=java
    endif
endfunction

" }}}
" General Mappings {{{

" Restore , for searching with f/F/t/T
nnoremap \ ,

" Open help in a vertical split
nnoremap <leader>h :vert h

" Use the arrow keys to move around quickfix list keeping the cursor in the
" middle.
nnoremap <up> :lprev<CR>zvzz
nnoremap <down> :lnext<CR>zvzz
nnoremap <left> :cprev<CR>zvzz
nnoremap <right> :cnext<CR>zvzz
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Toggle list chars
nnoremap <leader>l :set list!<CR>

" Auto Semicolon insertion
inoremap <C-;> <ESC>maA;<ESC>`aa
nnoremap <leader>; maA;<ESC>`a

" Screw Ex-mode
nnoremap Q gq

" Readline-line editing for command mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" Quickly edit stuff
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>ez :e ~/.zshrc<CR>
nnoremap <silent> <leader>et :e ~/.tmux.conf<CR>
nnoremap <silent> <leader>es :e ~/.slate<CR>

" Reindent entire file and return cursor to the same line
nnoremap <leader>ef maggVG=`a

" Toggle hlsearch
nnoremap <silent> <leader>/ :set hlsearch!<CR>

" Toggle paste mode
nnoremap <silent> <leader>p :set invpaste<CR>:setlocal paste?<CR>

" Never felt the need to use H or L
nnoremap H ^
nnoremap L $

" UpperCase
inoremap <C-u> <esc>mzgUiw`z

" Remove trailing whitespace
" I don't want this for .vimrc since some trailing spaces may be possible
" in statuslines and such
if (&ft!=?'vim')
    nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z
endif

" Use space to toggle folds
nnoremap <Space> za

" Yank to the end of the line
nnoremap Y y$

" Focus only on fold that is on the cursor position
nnoremap <leader>z zMzvzz

"}}}
" Cscope Settings {{{
if has('cscope')
    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help

    command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" }}}
" Typos {{{
iabbrev flase false
iabbrev Flase False
iabbrev grammer grammar
iabbrev pbng #!/usr/local/bin/perl<CR>
iabbrev teh the
iabbrev treu true
iabbrev Treu True

"}}}
" Tmux Cursor Bullcrap {{{
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"}}}
" Next motion text object {{{
" Copied from a public gist by AndrewRadev
onoremap an :<c-u>call <SID>NextTextObject('a')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i')<cr>

function! s:NextTextObject(motion)
    echo
    let c = nr2char(getchar())
    exe "normal! f".c."v".a:motion.c
endfunction

"}}}
" Quick Filetype Settings {{{

" Perl's Devel::REPL
autocmd BufRead repl.rc setlocal filetype=perl

" Better brace insertion
autocmd Filetype c,cpp,objc,perl,java,javascript inoremap {<CR>  {<CR>}<Esc>O

"}}}
" Misc Autocommands {{{
" Return vim to the last position when reopening a file
augroup line_return
    au!
    au BufreadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute "normal! g'\"" |
                \ endif
augroup END

" Switch to regular number line when in insert mode.
autocmd! InsertEnter * set number
autocmd! InsertLeave * set relativenumber

"Vim doesn't escape fast enough from visual/insert mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FreakingEscapeAlreadyPlease
        au!
        au InsertLeave * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"}}}
" --------------------------------- End .vimrc ------------------------------
