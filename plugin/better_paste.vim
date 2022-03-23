if exists('g:loaded_better_paste') | finish | endif
let g:loaded_better_paste = 1

function! PasteOver()
     let s:restore_reg = @"
     return "p@=RestoreRegister()\<cr>"
endfunction

function! RestoreRegister()
    let @" = s:restore_reg
    if &clipboard == "unnamedplus"
        let @+ = s:restore_reg
    endif
    if &clipboard == "unnamed"
        let @* = s:restore_reg
    endif
    return ''
endfunction
vnoremap <silent> <expr> p PasteOver()
