set nocompatible
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME

" tpope pathogen
execute pathogen#infect()
execute pathogen#helptags()

filetype plugin on
filetype plugin indent on
syntax on

set hlsearch
set ruler

set number
set relativenumber
nnoremap <leader>r :set relativenumber!<cr>

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

" ghlight lines over 79 columns (PEP8)
highlight OverLength ctermbg=red ctermfg=white guibg=#351818
match OverLength /\%79v.\+/

" +--------+
" | colors |
" +--------+
" colorscheme lightning
set background=light

map <leader>d :set background=dark<cr>
map <leader>l :set background=light<cr>

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

nnoremap ,, :tabnew<cr>
nnoremap ,. :tabnext<cr>
nnoremap ., :tabpre<cr>

" I'm getting tired of accidentally holding down the shift key...
" Reissue `w` even if I capitalize it...
"com W w

" Reselect the visual area when changing indenting in visual mode.
vnoremap > >gv

set linespace=0

map <leader>v :set invpaste paste?<cr>
set pastetoggle=<leader>v

set autoindent
set expandtab

set tabstop=2
set softtabstop=2
set shiftwidth=2

" set guifont?; set guifont!
set guifont=Source\ Code\ Pro\ for\ Powerline:h12

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
" http://man7.org/linux/man-pages/man3/strftime.3.html
nnoremap <leader>dtt "=strftime("%a %b %d, %l%p")<CR>P

" TODO: make this a function and check for number of
" digits in hour to get rid of that extra space
nnoremap <leader>dt o# TODO(miked -  <Esc>"=strftime("%a %b %d, %l%p") . "):"<CR>PA

" https://vim.fandom.com/wiki/Encryption
set cm=blowfish

""""""""""""""""""""""
" undo, swap, backup "
""""""""""""""""""""""
if isdirectory($HOME . '/.vim/undo') == 0
  call mkdir($HOME.'/.vim/undo', 'p')
endif
set undodir=$HOME/.vim/undo//
set undofile

if isdirectory($HOME . '/.vim/swap') == 0
  call mkdir($HOME.'/.vim/swap', 'p')
endif
set directory=$HOME/.vim/swap//

set backupskip+=*.tmp,crontab.*
if has("mac")
  set backupskip+=/private/tmp/*
endif

if isdirectory($HOME . '/.vim/backup') == 0
  call mkdir($HOME.'/.vim/backup', 'p')
endif
set backupdir=$HOME/.vim/backup//
set backup

source $HOME/.vim/config/ale.vim
source $HOME/.vim/config/completion.vim
source $HOME/.vim/config/powerline.vim

source $HOME/.vim/config/go.vim
source $HOME/.vim/config/python.vim
source $HOME/.vim/config/ruby.vim

source $HOME/.vim/config/latex.vim
source $HOME/.vim/config/boxes.vim
source $HOME/.vim/config/misc_plugins.vim
source $HOME/.vim/config/urls.vim

source $HOME/.vim/config/zhongwen.vim
