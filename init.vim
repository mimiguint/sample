augroup MyAutoCmd
  autocmd!
augroup END


" encoding
"
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,mac,dos


" default option
"
set complete+=k
set autoindent
set wildmenu
set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set ttyfast
set hidden
set autoread
set clipboard=unnamed,unnamedplus

" tab width
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" leader key
let g:mapleader=','


" visual
"
syntax on
set t_Co=256
set ruler
set number
set nowrap
set ambiwidth=double
set showcmd
set showmatch
set list
set listchars=tab:>_,trail:_,extends:\
set laststatus=2


" mapping
"
nnoremap j gj
nnoremap k gk

" delete
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
nnoremap s "_s
nnoremap S "_S
vnoremap s "_s
vnoremap S "_S

" split window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tab window
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent><S-t> :tabnew<CR>

" encoding
nnoremap <Leader>eu :set fenc=utf-8<CR>
nnoremap <Leader>ee :set fenc=euc-jp<CR>
nnoremap <Leader>es :set fenc=cp932<CR>

nnoremap <Leader>eru :e ++enc=utf-8 %<CR>
nnoremap <Leader>ere :e ++enc=euc-jp %<CR>
nnoremap <Leader>ers :e ++enc=cp932 %<CR>
nnoremap <Leader>err :e %<CR>

" remove highlight
nnoremap <silent><ESC><ESC> :nohlsearch<CR>



" plugins
"
filetype plugin indent on

" dein.vim
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let s:dein_dir = g:cache_home . '/dein'

if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml_dir = g:config_home . '/nvim/dein'
  call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
