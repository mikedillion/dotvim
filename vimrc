set nocompatible
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME

" tpope pathogen
execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin on
filetype plugin indent on

set hlsearch
set ruler

set number
set relativenumber

" No bell please!
set visualbell t_vb=

set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•

nnoremap K <nop>

nnoremap <SPACE> <NOP>
map <SPACE> <LEADER>
let mapleader = "\<Space>"

" inoremap <ESC> <NOP>
" inoremap jj <ESC>

set showbreak=↪

set backupskip+=*.tmp,crontab.*
if has("mac")
  set backupskip+=/private/tmp/*
endif

" ghlight lines over 79 columns (PEP8)
highlight OverLength ctermbg=red ctermfg=white guibg=#351818
match OverLength /\%79v.\+/

colorscheme solarized
set background=dark

" colorscheme dracula

map <Leader>d :set background=dark<CR>
map <Leader>l :set background=light<CR>

" flatui
" colorscheme flatui

" setfiletype for common files with no extension
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile Berksfile set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile Parsefile set filetype=yaml
au BufRead,BufNewFile Gruntfile set filetype=javascript
au BufRead,BufNewFile .sequelizerc set filetype=javascript

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

nnoremap ,, :tabnew<CR>
nnoremap ,. :tabnext<CR>
nnoremap ., :tabpre<CR>

" I'm getting tired of accidentally holding down the shift key...
" Reissue `w` even if I capitalize it...
"com W w

" Reselect the visual area when changing indenting in visual mode.
vnoremap > >gv

set omnifunc=syntaxcomplete#Complete
set cm=blowfish

set linespace=0

map <leader>v :set invpaste paste?<CR>
set pastetoggle=<leader>v

set autoindent
set expandtab

set tabstop=2
set softtabstop=2
set shiftwidth=2

" set guifont?; set guifont!
" set guifont=Monaco:h12
" set guifont=SauceCodePro\ Nerd\ Font\ Mono:h11
set guifont=Source\ Code\ Pro\ for\ Powerline:h11

" fat fingers
nnoremap q: <nop>
nnoremap q/ <nop>
nnoremap q? <nop>
nnoremap Q: q:
nnoremap Q/ q/
nnoremap Q? q?

" xterm-bracketed-paste
set t_BE=

" if has('mac')
"   if has('python3')
"       command! -nargs=1 Py py3 <args>
"       set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.6/Python
"       set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.6
"   else
"       command! -nargs=1 Py py <args>
"       set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
"       set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
"   endif
" endif

" http://vim.wikia.com/wiki/Insert_current_date_or_time
:nnoremap <leader>dt "=strftime("%c")<CR>P

set undodir=$HOME/.vim/undo//
set undofile

set directory^=$HOME/.vim/swap//


"  _____________________________
" /\                            \
" \_|  ____        _            |
"   | |  _ \ _   _| |__  _   _  |
"   | | |_) | | | | '_ \| | | | |
"   | |  _ <| |_| | |_) | |_| | |
"   | |_| \_\\__,_|_.__/ \__, | |
"   |                    |___/  |
"   |   ________________________|_
"    \_/__________________________/
au FileType ruby set tabstop=2 softtabstop=2 shiftwidth=2

" convert hashrockets globally
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>

" RSpec.vim mappings
autocmd FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <Leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <Leader>l :call RunLastSpec()<CR>
autocmd FileType ruby map <Leader>a :call RunAllSpecs()<CR>

"  _______________________________________
" /\                                      \
" \_|  ____        _   _                  |
"   | |  _ \ _   _| |_| |__   ___  _ __   |
"   | | |_) | | | | __| '_ \ / _ \| '_ \  |
"   | |  __/| |_| | |_| | | | (_) | | | | |
"   | |_|    \__, |\__|_| |_|\___/|_| |_| |
"   |        |___/                        |
"   |   __________________________________|_
"    \_/____________________________________/
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

"  _________________
" /\                \
" \_|   ____        |
"   |  / ___| ___   |
"   | | |  _ / _ \  |
"   | | |_| | (_) | |
"   |  \____|\___/  |
"   |               |
"   |   ____________|_
"    \_/______________/

" vim-go
au BufNewFile,BufRead *.go setlocal noet tabstop=4 shiftwidth=4 softtabstop=4
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"


"  ________________________________________________
" /\                                               \
" \_|  ____                        _ _             |
"   | |  _ \ _____      _____ _ __| (_)_ __   ___  |
"   | | |_) / _ \ \ /\ / / _ \ '__| | | '_ \ / _ \ |
"   | |  __/ (_) \ V  V /  __/ |  | | | | | |  __/ |
"   | |_|   \___/ \_/\_/ \___|_|  |_|_|_| |_|\___| |
"   |                                              |
"   |   ___________________________________________|_
"    \_/_____________________________________________/
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2
" set showtabline=2
" set noshowmode
" set t_Co=256

"  _________________________
" /\                        \
" \_|     _    _     _____  |
"   |    / \  | |   | ____| |
"   |   / _ \ | |   |  _|   |
"   |  / ___ \| |___| |___  |
"   | /_/   \_\_____|_____| |
"   |                       |
"   |   ____________________|_
"    \_/______________________/
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'javascript': ['eslint'],
\   'json': ['fixjson'],
\   'sh': ['shfmt'],
\   'python': ['autopep8', 'yapf'],
\   'yaml': ['prettier'],
\   'sql': ['sqlfluff'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'json': ['jq'],
\   'python': ['flake8', 'pylint'],
\   'sh': ['shellcheck'],
\   'sql': ['sqlint', 'sqlfluff'],
\ }

let g:ale_javascript_eslint_executable = 'eslint'
let g:ale_javascript_eslint_use_global = 0

let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 1
" let g:ale_set_signs = 1
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '✖'
" let g:ale_sign_warning = '⚠'

nmap <leader>a <Plug>(ale_fix)

"  ______________________________
" /\                             \
" \_|  ____                      |
"   | | __ )  _____  _____  ___  |
"   | |  _ \ / _ \ \/ / _ \/ __| |
"   | | |_) | (_) >  <  __/\__ \ |
"   | |____/ \___/_/\_\___||___/ |
"   |                            |
"   |   _________________________|_
"    \_/___________________________/
" https://boxes.thomasjensen.com/docs/
" -r removes boxes with the specified configuration the above (notice -r)
" -s WIDTHxHEIGHT  specifies the box size
" -d specifies formats from boxes-config
"    see: https://boxes.thomasjensen.com/box-designs.txt
" -a specifies aligment inside box
"    e.x. hcvc = horizontal center and vertical center

vmap ,xp !boxes -d parchment <CR>
nmap ,xp !!boxes -d parchment <CR>

vmap ,xs !boxes -d stone <CR>
nmap ,xs !!boxes -d stone <CR>

imap jj <Esc>

"  ___________________________________________________________
" /\                                                          \
" \_|  __  __ _            ____  _             _           _  |
"   | |  \/  (_)___  ___  |  _ \| |_   _  __ _(_)_ __  ___| | |
"   | | |\/| | / __|/ __| | |_) | | | | |/ _` | | '_ \/ __| | |
"   | | |  | | \__ \ (__  |  __/| | |_| | (_| | | | | \__ \_| |
"   | |_|  |_|_|___/\___| |_|   |_|\__,_|\__, |_|_| |_|___(_) |
"   |                                    |___/                |
"   |   ______________________________________________________|_
"    \_/________________________________________________________/

" CtrlP
nmap <Leader>p :CtrlP<CR>

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

" OpenURL
if has('mac')
  let g:loaded_open_url = 1
  map <leader>u :OpenURL<cr>
else
  let g:loaded_open_url = 0
endif

" vim-emoji
set completefunc=emoji#complete

" leader to convert :smiley_cat: to 😸
nmap <leader>e :s/:\([^: ]\+\):/\=emoji#for(submatch(1), submatch(0), 0)/g<CR>:nohl<CR>
