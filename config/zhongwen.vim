" https://old.reddit.com/r/vim/comments/2odq4l/osx_texttospeech_in_vim/
:vnoremap <silent><leader>[ "xy:call system('say --rate 100 '. shellescape(@x) .' &')<CR>
:nnoremap <silent><leader>[ :call system('say --rate 100 '.shellescape(expand('<cword>')).' &')<CR>]"]
:vnoremap <silent><leader>] "xy:call system('say --rate 200 '. shellescape(@x) .' &')<CR>
:nnoremap <silent><leader>] :call system('say --rate 200 '.shellescape(expand('<cword>')).' &')<CR>]"]
