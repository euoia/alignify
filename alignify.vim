" Aligns a range based on an (optional) delimiter.
" If the delimiter if not provided, it defaults to '='.
"
" To use, select a range and:
" call Alignify()          - Aligns to column 35 on "=".
" call Alignify(20)        - Aligns to column 20 on "=".
" call Alignify(50, ":")   - Aligns to column 50 on ":".
"
" Used by specifying the column position to align at.
" Written by James Pickard.
function! Alignify(...) range abort
    let startline = line('.')

    " Defaults
    let colpos = get(a:000, 0, 35)
    let delim = get(a:000, 1, "=")

    " Check that colpos is a number.
    if type(colpos) != 0
        echoerr "first argument should be a number"
        return
    endif

    " Check that delim is a string.
    if type(colpos) != 1
        echoerr "second argument should be a string"
        return
    endif


    if a:firstline == a:lastline
        execute "normal gg"
        let lastline = line('$')
    else
        let lastline = a:lastline
    endif

    let firstline = line('.')

    " While we are not on the last line of the file.
    while line('.') != line('$')
        " Get the line number.
        let line=search(delim)

        execute "normal h"
        while col('.') < colpos
            execute "normal a "
        endwhile

        " Go to the first non-blank on the next line.
        execute "normal j^"

        if line('.') > lastline || line('.') < firstline
            return
        endif
    endwhile
endfunction

