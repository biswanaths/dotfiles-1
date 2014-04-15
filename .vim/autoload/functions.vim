" Format a c/cpp/java file with AStyle
function! functions#AStyleFormat()
    norm! mf
    if &filetype == 'c' || &filetype == 'cpp'
        :%!astyle --mode=c
    elseif &filetype == 'java'
        :%!astyle --mode=java
    endif
    norm! `fzz
endfunction

" Change cursor shape when in insert and normal modes
function! functions#CursorShapeMode()
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
endfunction

" A simple buffer navigation function.
function! functions#bufNav(arrangement)
    if a:arrangement ==? "horizontal"
        if len(filter(map(range(bufnr('$')), 'buflisted(v:val)'), 'v:val == 1')) > 1
            return ":buffer \<C-z>\<S-Tab>"
        else
            return ":buffer "
        endif
    elseif a:arrangement ==? "vertical"
        if len(filter(map(range(bufnr('$')), 'buflisted(v:val)'), 'v:val == 1')) > 1
            return ":vertical sbuffer \<C-z>\<S-Tab>"
        else
            return ":vertical sbuffer "
        endif
    endif
endfunction

" Get the buffer list
function! functions#bufferList()
    let buflist = []
    for i in range(1, bufnr('$'))
        if bufexists(i)
            let buflist += [bufname(i)]
        endif
    endfor
    return join(map(buflist, 'escape(v:val, " ")'), ' ')
endfunction
