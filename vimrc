set nocompatible
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME

" No bell please!
set visualbell t_vb=
set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•

nnoremap <SPACE> <NOP>
map <SPACE> <LEADER>
let mapleader = "\<Space>"

"inoremap <ESC> <NOP>
"inoremap jk <ESC>

set backupskip+=*.tmp,crontab.*
if has("mac")
  set backupskip+=/private/tmp/*
endif

" ghlight lines over 79 columns (PEP8)
highlight OverLength ctermbg=red ctermfg=white guibg=#351818
match OverLength /\%79v.\+/

" tpope pathogen
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin on
filetype plugin indent on

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" solarized colors
colorscheme solarized
set background=dark
" set background=light

" flatui
" colorscheme flatui

set hlsearch
set ruler
set number
set relativenumber

" setfiletype for common files with no extension
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile Berksfile set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile Gruntfile set filetype=javascript

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

nnoremap ,, :tabnew<CR>
nnoremap ,. :tabnext<CR>
nnoremap ., :tabpre<CR>

" for numbers.vim
let g:enable_numbers = 0
nnoremap += :NumbersToggle<CR>

" I'm getting tired of accidentally holding down the shift key...
" Reissue `w` even if I capitalize it...
"com W w

" indentLine plugin
let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '|'

" indent-guides plugin
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

" Reselect the visual area when changing indenting in visual mode.
vnoremap > >gv

" vim-gitgutter
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('green_heart')
  let g:gitgutter_sign_removed = emoji#for('broken_heart')
  let g:gitgutter_sign_modified = emoji#for('cyclone')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" convert hashrockets globally
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>

" https://github.com/mlafeldt/chef-runner#use-with-vim
nnoremap <leader>r :w\|!chef-runner %<cr>

" open line in github. needs git 'url' alias
nnoremap <leader>o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

set omnifunc=syntaxcomplete#Complete
set cm=blowfish

set linespace=0

let g:airline_theme='bubblegum'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

map <Leader>v :set invpaste paste?<CR>
set pastetoggle=<Leader>v

" vim-hardtime
" https://github.com/takac/vim-hardtime
let g:hardtime_default_on = 0

" GitLink
nmap <leader>gl :echo gitlink#GitLink()<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

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

" ctag junk
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

if has('mac')
  let g:loaded_open_url = 1
  map <leader>u :OpenURL<cr>
else
  let g:loaded_open_url = 0
endif

set autoindent
set expandtab

set tabstop=2
set softtabstop=2
set shiftwidth=2

" Ruby
au FileType ruby set tabstop=2 softtabstop=2 shiftwidth=2

" RSpec.vim mappings
autocmd FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <Leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <Leader>l :call RunLastSpec()<CR>
autocmd FileType ruby map <Leader>a :call RunAllSpecs()<CR>

" Python
au FileType python set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Python :: flake8.vim
autocmd FileType python map <buffer> <Leader>f :call Flake8()<CR>
let g:flake8_show_in_gutter = 1

silent! if emoji#available()
  let g:flake8_error_marker = emoji#for('small_blue_diamond')
  let g:flake8_warning_marker = emoji#for('small_red_triangle_down')
endif

let g:flake8_pyflake_marker = ''
let g:flake8_complexity_marker = ''
let g:flake8_naming_marker = ''

highlight link Flake8_Error LineNr
highlight link Flake8_Warning LineNr
highlight link Flake8_Complexity LineNr
highlight link Flake8_Naming LineNr
highlight link Flake8_PyFlake LineNr

" Go
au BufNewFile,BufRead *.go setlocal noet tabstop=4 shiftwidth=4 softtabstop=4
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = "goimports"

" \e to convert :smiley_cat: to 😸
nmap <Leader>e :s/:\([^: ]\+\):/\=emoji#for(submatch(1), submatch(0), 0)/g<CR>:nohl<CR>
