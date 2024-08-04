" general
set nowrap
set number
set relativenumber

" statusline
set laststatus=0

" look
set signcolumn=no
set guicursor=
set termguicolors

" indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" incremental search only
set hlsearch
set incsearch

" avoid swapfile
" undodir (plug) access only
set nobackup
set noswapfile
let &undodir = expand("$HOME") . "/.vim/undodir"
set undofile

set updatetime=50
set mouse=

" netrw
let g:netrw_banner = 0
set scrolloff=8

