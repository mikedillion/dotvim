au FileType python set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" yapf
:nnoremap <leader>y :call Yapf()<cr>
setlocal equalprg=yapf

" Python :: flake8.vim
autocmd FileType python map <buffer> <leader>f :call Flake8()<CR>
" let g:flake8_show_in_gutter = 1

" silent! if emoji#available()
"   let g:flake8_error_marker = emoji#for('small_blue_diamond')
"   let g:flake8_warning_marker = emoji#for('small_red_triangle_down')
" endif

" let g:flake8_pyflake_marker = ''
" let g:flake8_complexity_marker = ''
" let g:flake8_naming_marker = ''

" highlight link Flake8_Error LineNr
" highlight link Flake8_Warning LineNr
" highlight link Flake8_Complexity LineNr
" highlight link Flake8_Naming LineNr
" highlight link Flake8_PyFlake LineNr

" Extra space around comments.
" Flake8 compliant. Annoying everywhere else
let NERDSpaceDelims=1
