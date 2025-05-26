" vimrc
syntax on
colorscheme off
set background=dark

let g:netrw_banner=0
set mouse=
set nowrap
set number
set path +=**
set relativenumber
set signcolumn=no
set tgc
set wildmenu
set showcmd
set splitright

let g:netrw_home=$HOME.'/.cache/'

"tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" mappings
let mapleader = " "

nnoremap [b :bprevious <CR>
nnoremap ]b :bnext <CR>

nnoremap <C-t> :tabnew <CR>
nnoremap [t :tabprevious <CR>
nnoremap ]t :tabnext <CR>

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

call plug#begin()
    Plug 'junegunn/vim-easy-align'
    Plug 'mattn/emmet-vim'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
call plug#end()

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" undotree
nnoremap <Leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    let target_path = expand('$HOME/.config/nvim/.undodir')
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" fugitive
map <Leader>gs :Git status .<CR>
map <Leader>gd :Git diff .<CR>
map <Leader>gb :Git blame<CR>
cabbr gs Git status .
cabbr gd Git diff .
cabbr gb Git blame

" overides
cabbr W w
cabbr Q q
cabbr E e
