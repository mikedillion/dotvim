set nocompatible
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME

" No bell please!
set visualbell t_vb=

nnoremap <SPACE> <NOP>
map <SPACE> <LEADER>
let mapleader = "\<Space>"

"inoremap <ESC> <NOP>
"inoremap jk <ESC>

set backupskip+=*.tmp,crontab.*
if has("mac")
  set backupskip+=/private/tmp/*
endif

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
set background=light

" flatui
" colorscheme flatui

set hlsearch
set ruler
set nu

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

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

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
vnoremap < <gv
vnoremap > >gv

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

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀ '
let g:airline_left_alt_sep = '⮁ '
let g:airline_right_sep = '⮂l'
let g:airline_right_alt_sep = '⮃ '
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.linenr = '⭡ '

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

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
