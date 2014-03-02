" Format a c/cpp/java file with AStyle
function! self#AStyleFormat()
    if &filetype == 'c' || &filetype == 'cpp'
        :%!astyle --mode=c
    elseif &filetype == 'java'
        :%!astyle --mode=java
    endif
endfunction

" Change cursor shape when in insert and normal modes
function! self#CursorShapeMode()
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
endfunction

" Because supertab is 800 sloc too long for me
function! self#simpleTabComplete()
    " If popup menu is visible, just go through the list.
    if pumvisible()
        return "\<c-n>"
    endif

    let line = getline('.')
    let substr = strpart(line, -1, col('.') + 1)
    let substr = matchstr(substr, "[^ \t]*$")

    " Nothing to do, just insert a regular tab.
    if (strlen(substr) == 0)
        return "\<tab>"
    endif

    let period = match(substr, '\.') != -1
    let file_pattern = match(substr, '\/') != -1

    if (!period && !file_pattern)
        return "\<C-x>\<C-p>"
    elseif
        return "\<C-x>\<C-f>"
    else
        return "\<c-x>\C-o>"
    endif
endfunction
