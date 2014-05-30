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

" Visual star-search. (Allow * usage on visually selected word)
function! functions#VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
