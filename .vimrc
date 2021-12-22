set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


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
colorscheme industry 

let mapleader = ","
map <leader>t <ESC>:tabnew<CR>
map <leader>n <ESC>:tabprevious<CR> 
map <leader>m <ESC>:tabnext<CR>
map <leader>q <ESC>:q!<CR>
map <leader>s <ESC>:wq<CR>

source ~/vcomments.vim
map <C-i> :call Comment()<CR>
map <C-o> :call Uncomment()<CR>

inoremap jk <ESC>
