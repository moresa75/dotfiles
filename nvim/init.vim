set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set noswapfile              " disable creating swap file
set background=dark
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set shiftwidth=2
set textwidth=130
set expandtab
set t_Co=256
syntax on
set ruler
set showmode
set guifont=Monaco:h13
set linespace=2
set tabstop=2
set smartindent
set smartcase
set belloff=all
set laststatus=2
set cursorline
set scrolloff=10
filetype plugin on
set omnifunc=syntaxcomplete

let mapleader = ","

nmap <leader>t <ESC>:tabnew<CR>
nmap <leader>z <ESC>:tabprevious<CR>
nmap <leader>x <ESC>:tabnext<CR>
map <leader>q <ESC>:q!<CR>
map <leader>w <ESC>:w<CR>
map <leader>s <ESC>:wq<CR>

if (&filetype=='c' || &filetype=='cpp')
  inoremap .. ->
endif

nnoremap <leader>g <C-W>h
nnoremap <leader>h <C-W>l
inoremap jk <ESC>
 
call plug#begin('~/.vim/plugged')
  Plug 'vim-syntastic/syntastic'
  Plug 'itchyny/lightline.vim'
  Plug 'dracula/vim'
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'pechorin/any-jump.vim'
call plug#end()

colorscheme dracula

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>
nmap // :BLines!<CR>
nmap <leader>f :Files!<CR>
xnoremap <leader>j :AnyJumpVisual <CR>


inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


let s:comment_map = {
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \   "verilog": '\/\/',
    \   "systemverilog": '\/\/',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " "
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>

runtime! ftplugin/man.vim

" syntastic options/configs
highlight SyntasticErrorLine guibg=#2f0000
highlight SyntasticError guibg=#2f0001
set statusline+=%#warningmsg#

" autocomplete stuff
autocmd FileType python set omnifunc=syntaxcomplete
autocmd FileType c set omnifunc=syntaxcomplete

command! Config execute ":tabnew ~/.config/nvim/init.vim"

