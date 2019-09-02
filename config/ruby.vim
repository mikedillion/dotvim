au FileType ruby set tabstop=2 softtabstop=2 shiftwidth=2

" convert hashrockets globally
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>

" RSpec.vim mappings
autocmd FileType ruby map <leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <leader>l :call RunLastSpec()<CR>
autocmd FileType ruby map <leader>a :call RunAllSpecs()<CR>
