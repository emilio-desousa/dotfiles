set encoding=utf-8
set number relativenumber
syntax enable
set noswapfile
set scrolloff=7
set backspace=indent,eol,start

let mapleader = ' '
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set signcolumn=yes
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

call plug#begin('~/.vim/plugged')

Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'rust': ['rustfmt'],
\}
colorscheme gruvbox

let g:airline_theme='gruvbox'

if (has("termguicolors"))
    set termguicolors
endif
" FZF
nmap <C-p> :Files<CR>
" Fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

"" NERDCommenter
"nmap <C-p> <Plug>NERDCommenterToggle
"vmap <C-p> <Plug>NERDCommenterToggle<CR>gv
inoremap kj <Esc>
" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <C-n> :NERDTreeToggle<CR>

" Tabs 
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod= ':t'
nmap <leader>1 :tabprevious<CR>
nmap <leader>2 :tabnext<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:rustfmt_autosave = 1
