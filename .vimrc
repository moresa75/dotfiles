set nocompatible              " be iMproved, required
filetype off                  " required

set background=dark
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set shiftwidth=4
set textwidth=130
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
set smartcase
set belloff=all
set laststatus=2
set cursorline
set scrolloff=10
"set modifiable


let mapleader = ","
map <leader>t <ESC>:tabnew<CR>
map <leader>a <ESC>:tabprevious<CR> 
map <leader>f <ESC>:tabnext<CR>
map <leader>q <ESC>:q!<CR>
map <leader>w <ESC>:w<CR>
map <leader>s <ESC>:wq<CR>

nnoremap <leader>g <C-W>h
nnoremap <leader>h <C-W>l
inoremap jk <ESC>

" AnyJump stuff
" Normal mode: Jump to definition under cursor
nnoremap <leader>j :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    Plug 'itchyny/vim-cursorword'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-syntastic/syntastic'
    Plug 'pechorin/any-jump.vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme PaperColor

nnoremap <leader>n :NERDTreeFocus<CR>
autocmd VimEnter * NERDTree
autocmd vimenter * wincmd p
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
nnoremap <leader>n :NERDTreeFocus<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" FZF stuff
" blines
nmap // :BLines!<CR>
" Rip grep
nmap ?? :Rg!<CR>
" find files in the current buffer
nmap <leader>p :Files!<CR>
" commit history for the file

command! Gitlog execute ":BCommits!"

" load new confing for vimrc
command! Load execute ":source ~/.vimrc"

" function for closing NERDTree after closing the buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

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

function! LazyGit()
    execute ":! lazygit"
endfunction

nnoremap <leader>gg :call LazyGit()<cr>

function! Make(target)
    execute ":w"
    execute ":! make target"
endfunction

command! -nargs=1 Make call s:Make(<f-args>)

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers=['gofmt']


" Auto close for some
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
" inoremap \end <><Esc>?begin<Enter>Vy/<><Enter>pfbcwend<Esc>kddo
"
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
au FileType systemverilog let b:AutoPairs = AutoPairsDefine({'begin': 'end//n]'})

" open vimrc
command! Config execute ":tabnew ~/.vimrc"

