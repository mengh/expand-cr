"
" Description: Auto CR expand based on a couple of patterns
" Author: SuperHumenG
"
" ==================== 

function! ExpandCR()
    let expandCR = "\<CR>\<C-o>==\<C-o>O\<tab>"
    let normalCR = "\<CR>" 

    if ExpandXMLTag()
        return expandCR
    elseif ExpandBraces()
        return expandCR 
    elseif ExpandParantheses()
        return expandCR 
    else
        return normalCR
    endif
endfunction

" expand braces
function! ExpandBraces()
    let line = getline(".")
    let col = col(".")
    let first = line[col-2]
    let second = line[col-1]

    if first ==# "{" && second ==# "}"
        return 1
    else
        return 0
    endif
endfunction

" expand parantheses
function! ExpandParantheses()
    let line = getline(".")
    let col = col(".")
    let first = line[col-2]
    let second = line[col-1]

    if first ==# "(" && second ==# ")"
        return 1
    else
        return 0
    endif
endfunction


" expand xml tags
function! ExpandXMLTag()
    let line   = getline(".")
    let col    = col(".")
    let first  = line[col-2]
    let second = line[col-1]
    let third  = line[col]

    if first ==# ">" && second ==# "<" && third ==# "/"
        return  1
    else
        return 0 
    endif
endfunction

inoremap <expr> <CR> ExpandCR()
