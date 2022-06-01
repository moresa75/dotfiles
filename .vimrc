set nocompatible              " be iMproved, required
filetype off                  " required

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set shiftwidth=2
set textwidth=130
set expandtab
set t_Co=256
syntax on
set showmatch
set ruler
set showmode
set showcmd
set splitright
set number
set hlsearch
set guifont=Monaco:h13
set linespace=2
set tabstop=2
set autoindent
set smartindent
set smartcase
set belloff=all
set laststatus=2
set cursorline
set scrolloff=10
set smarttab
set magic
set wildmenu

set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set incsearch               " incremental search
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set wildmode=longest,list   " get bash-like tab completions
set mouse=a                 " enable mouse click
set clipboard=unnamed       " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set noswapfile              " disable creating swap file
set background=dark
set omnifunc=syntaxcomplete

autocmd BufNewFile,BufRead *.v,*.sv set syntax=verilog

let mapleader = ","
map <leader>t <ESC>:tabnew<CR>
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


let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'kenn7/vim-arsync'
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'ycm-core/YouCompleteMe'
    Plug 'itchyny/lightline.vim'
    Plug 'https://github.com/adelarsq/vim-matchit'
    Plug 'itchyny/vim-cursorword'
    Plug 'vim-syntastic/syntastic'
    Plug 'pechorin/any-jump.vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme onedark

"autocmd VimEnter * NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>
nnoremap <leader>j :AnyJump<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" FZF stuff
" blines
nmap // :BLines!<CR>
nmap <leader>f :Files!<CR>
map  <leader>e :vertical term <CR>

" load new confing for vimrc
command! Load execute ":source ~/.vimrc"

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

function! Make(target)
    execute ":w"
    execute ":! make target"
endfunction


runtime! ftplugin/man.vim

highlight SyntasticErrorLine guibg=#2f0000
highlight SyntasticError guibg=#2f0001
set statusline+=%#warningmsg#

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


autocmd FileType python set omnifunc=syntaxcomplete
autocmd FileType c set omnifunc=syntaxcomplete

" open vimrc
command! Config execute ":tabnew ~/.vimrc"

let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['-log=verbose', '-pretty']

let s:rg_base_cmd = "rg -n --pcre2 --unicode"
" Show line numbers in search rusults
let g:any_jump_list_numbers = 0

" Auto search references
let g:any_jump_references_enabled = 1

" Auto group results by filename
let g:any_jump_grouping_enabled = 0

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 10

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'rg -n --pcre2 --json --unicode'


" Search results list styles:
" - 'filename_first'
" - 'filename_last'
let g:any_jump_results_ui_style = 'filename_first'

" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" Customize any-jump colors with extending default color scheme:
" let g:any_jump_colors = { "help": "Comment" }

" Or override all default colors
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" Disable default any-jump keybindings (default: 0)
let g:any_jump_disable_default_keybindings = 1

" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1

" Custom ignore files
" default is: ['*.tmp', '*.temp']
let g:any_jump_ignored_files = ['*.tmp', '*.temp']

" Search references only for current file type
" (default: false, so will find keyword in all filetypes)
let g:any_jump_references_only_for_current_filetype = 0

" Disable search engine ignore vcs untracked files
" (default: false, search engine will ignore vcs untracked files)
let g:any_jump_disable_vcs_ignore = 0

" highlight tabs and trailing whitespaces
" highlight ExtraWhitespace ctermbg=black guibg=black
" match ExtraWhitespace /\s\+$\|\t/
