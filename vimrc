call plug#begin()

Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'

call plug#end()

syntax on
" disable syntax on certain files
au FileType c,make,html,vim set syntax=off

colorscheme jcs
set nu
set nowrap
set hlsearch

" indentation
set expandtab shiftwidth=4 softtabstop=4 tabstop=4

" columns no colors
set signcolumn=no
au FileType * setlocal colorcolumn=0

" make :W work like :w and :Q like :q
cabbr W w
cabbr Q q
cabbr E e

" w! still failed?  try w!! to write as root
cmap w!! w !sudo tee >/dev/null %

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" buffer navigation
map <C-n> :Vexplore <CR>
map <C-t> :Texplore <CR>
map <S-h> :tabprevious <CR>
map <S-l> :tabnext <CR>

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" netrw banner
let g:netrw_banner=0
let g:netrw_dirhistmax  = 0
let g:netrw_dirhist_cnt = 0

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

" wildmenu
set wildmenu
set wildmode=longest:full,full

" when starting up, restore cursor position from viminfo
au BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
