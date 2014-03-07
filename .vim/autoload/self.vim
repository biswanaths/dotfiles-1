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
function! self#simpleTabComplete(mapping)
    if pumvisible()
        return "\<c-n>"
    endif

    let substr = matchstr(strpart(getline('.'), 0, col('.') - 1), "[^ \t]*$")
    if (strlen(substr) == 0)
        return "\<tab>"
    endif

    if a:mapping ==? "dict"
        return "\<C-x>\<C-k>"
    endif

    let period = match(substr, '\.') != -1
    let file_pattern = match(substr, '\/') != -1

    if (!period && !file_pattern)
        return "\<C-x>\<C-p>"
    elseif (file_pattern)
        return "\<C-x>\<C-f>"
    else
        if a:mapping ==? "complete"
            return "\<C-x>\<C-u>"
        elseif a:mapping ==? "tags"
            return "\<C-x>\<C-]>"
        else
            return "\<C-x>\<C-o>"
        endif
    endif
endfunction

" Smart shift-tab behavior
function! self#shiftTabEval()
    if pumvisible()
        return "\<c-p>"
    else
        return "\<c-o><<"
    endif
endfunction

" From nelstrom/visual-star-search
function! self#VSetSearch(cmdtype)
    let temp = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
