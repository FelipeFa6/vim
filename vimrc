syntax on

set notgc
set background=dark
set nu
set nowrap
set hlsearch

" indentation
set expandtab shiftwidth=4 softtabstop=4 tabstop=4


" don't pollute directories with swap files, keep them in one place
silent !mkdir -p ~/.vim/{backup,swp}/
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" except crontab, which will complain that it can't see any changes
au FileType crontab setlocal bkc=yes

" just highlight the line with the error, i don't need a column
set signcolumn=no

" disable previews of completions
set completeopt-=preview

" default to no color column
au FileType * setlocal colorcolumn=0

" i hold shift a lot, make :W work like :w and :Q like :q
cabbr W w
cabbr Q q
cabbr E e

" w! still failed?  try w!! to write as root
cmap w!! w !sudo tee >/dev/null %

" pluggins
call plug#begin()
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/vim-easy-align'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'

	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/vim-lsp'
call plug#end()

" lsp configuration typying autocompletion
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_float_cursor = 1

filetype plugin on

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" windows
map <C-n> :Vexplore <CR>

" tabs
map <C-t> :Texplore <CR>
map <S-h> :tabprevious <CR>
map <S-l> :tabnext <CR>

" make buffer windows easier to navigate
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" lsp
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" netrw banner
let g:netrw_banner=0
let g:netrw_dirhistmax  = 0
let g:netrw_dirhist_cnt = 0

