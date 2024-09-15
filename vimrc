syntax on
set wildmenu
set backspace=indent,eol,start
set nowrap

set signcolumn=no
set guicursor=
set termguicolors
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hlsearch
set incsearch
set nobackup
set noswapfile
let &undodir = expand("$HOME") . "/.vim/undodir"
set undofile
set updatetime=50
set mouse=
let g:netrw_banner = 0
set scrolloff=8


let mapleader = " "
nnoremap <Leader>pv :Ex<CR>
nnoremap <Leader>h :nohl<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
xnoremap <Leader>p "_dP
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y
nnoremap Q <nop>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <Leader>x :!chmod +x %<CR>
nnoremap <Leader>w :!./%<CR>

colorscheme default
set background=dark
set notgc
