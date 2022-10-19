if exists('g:vscode')
    set encoding=utf-8
    call plug#begin('~/.vim/plugged')
    Plug 'asvetliakov/vim-easymotion'
	Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    call plug#end()
else
    call plug#begin('~/.vim/plugged')
    Plug 'michaeljsmith/vim-indent-object'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-fugitive'
	Plug 'vim-scripts/ReplaceWithRegister'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'preservim/vimux'
	Plug 'morhetz/gruvbox'
	Plug 'scrooloose/nerdtree'
	Plug 'jiangmiao/auto-pairs'
	Plug 'vim-airline/vim-airline'
	Plug 'jpalardy/vim-slime'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ayu-theme/ayu-vim'
    Plug 'arcticicestudio/nord-vim'
    call plug#end()
endif 

if exists('g:vscode')
	set clipboard+=unnamedplus
else
	set encoding=utf-8
	set number relativenumber
	syntax enable
	set noswapfile
	set scrolloff=7
	set backspace=indent,eol,start

	let mapleader = ' '
	set clipboard+=unnamedplus
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set expandtab
	set autoindent
	set fileformat=unix
	set signcolumn=yes


    colorscheme nord    
    hi Normal guibg=NONE ctermbg=NONE

	" Vim-slime
	let g:slime_target = "tmux"
	let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
	let g:slime_python_ipython = 1

	" let g:airline_theme='gruvbox'

	" vim-isort
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
endif
