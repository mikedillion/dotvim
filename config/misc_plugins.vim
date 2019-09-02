" CtrlP
nmap <leader>p :CtrlP<CR>

" numbers.vim
let g:enable_numbers = 0
nnoremap += :NumbersToggle<CR>

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '|'

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

" vim-gitgutter
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('green_heart')
  let g:gitgutter_sign_removed = emoji#for('broken_heart')
  let g:gitgutter_sign_modified = emoji#for('cyclone')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
else
  let g:gitgutter_sign_added = '✚'
  let g:gitgutter_sign_removed = '✖'
  let g:gitgutter_sign_modified = '➜'
  let g:gitgutter_sign_modified_removed = '⚠'
endif

" https://github.com/mlafeldt/chef-runner#use-with-vim
nnoremap <leader>r :w\|!chef-runner %<cr>

" open line in github. needs git 'url' alias
nnoremap <leader>o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

" vim-hardtime
" https://github.com/takac/vim-hardtime
let g:hardtime_default_on = 0

" GitLink
nmap <leader>gl :echo gitlink#GitLink()<CR>

" tagbar
nmap <leader>t :TagbarToggle<CR>

" ctag junk
nnoremap <leader>. :CtrlPTag<cr>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" vim-emoji
set completefunc=emoji#complete

" leader to convert :smiley_cat: to 😸
nmap <leader>e :s/:\([^: ]\+\):/\=emoji#for(submatch(1), submatch(0), 0)/g<CR>:nohl<CR>
