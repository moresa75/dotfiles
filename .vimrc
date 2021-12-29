set nocompatible              " be iMproved, required
filetype off                  " required

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set shiftwidth=4
set textwidth=120
set expandtab
set t_Co=256
syntax on
set showmatch
set ruler
set showmode
set number
set noswapfile
set hlsearch
set guifont=Monaco:h13
set linespace=2
set tabstop=4 
set autoindent
set smartindent
set belloff=all
colorscheme industry

let mapleader = ","
map <leader>t <ESC>:tabnew<CR>
map <leader>a <ESC>:tabprevious<CR> 
map <leader>f <ESC>:tabnext<CR>
map <leader>q <ESC>:q!<CR>
map <leader>w <ESC>:w<CR>
map <leader>s <ESC>:wq<CR>

nnoremap <leader>g <C-W>h
nnoremap <leader>h <C-W>l

source ~/vcomments.vim
map <C-i> :call Comment()<CR>
map <C-o> :call Uncomment()<CR>

inoremap jk <ESC>
set laststatus=2

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
autocmd VimEnter * NERDTree
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
nnoremap <leader>n :NERDTreeFocus<CR>

