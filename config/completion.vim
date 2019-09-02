set omnifunc=syntaxcomplete#Complete

nnoremap <leader>y :call YcmToggle()<cr>

function! YcmToggle()
    if g:ycm_auto_trigger
        let g:ycm_auto_trigger=0
    else
        let g:ycm_auto_trigger=1
    endif
endfunction

let g:ycm_auto_trigger=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
