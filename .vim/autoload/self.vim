" Format a c/cpp/java file with AStyle
function! self#AStyleFormat()
    norm! mf
    if &filetype == 'c' || &filetype == 'cpp'
        :%!astyle --mode=c
    elseif &filetype == 'java'
        :%!astyle --mode=java
    endif
    norm! `fzz
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
function! self#simpleTabComplete(direction, mapping)
    " From: https://gist.github.com/dahu/9679489
    " "n"ext or "f"orward vs, say "p"rev or "b"ackward
    let dirs = ["\<c-p>", "\<c-n>"]
    let dir = a:direction =~? '[nf]'
    let map = a:mapping

    if pumvisible()
        return dirs[dir]
    endif

    let pos = getpos('.')
    let substr = matchstr(strpart(getline(pos[1]), 0, pos[2]-1), "[^ \t]*$")
    if (strlen(substr) == 0)
        return "\<tab>"
    endif

    let period = match(substr, '\.') != -1
    let file_pattern = match(substr, '\/') != -1

    if file_pattern
        return "\<C-x>\<C-f>"
    elseif period && (&omnifunc != '')
        if get(b:, 'tab_complete_pos', []) == pos
            let exp = "\<C-x>" . dirs[!dir]
        else
            let exp = "\<C-x>\<C-o>"
        endif
        let b:tab_complete_pos = pos
        return exp
    endif

    if map ==? "user"
        return "\<C-x>\<C-u>"
    elseif map ==? "tags"
        return "\<C-x>\<C-]>"
    elseif map ==? "dict"
        return "\<C-x>\<C-k>"
    else
        return "\<C-x>" . dirs[!dir]
    endif
endfunction

" From nelstrom/visual-star-search
function! self#VSetSearch(cmdtype)
    let temp = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" A simple buffer navigation function.
function! self#bufNav(arrangement)
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
