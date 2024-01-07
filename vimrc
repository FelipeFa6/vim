" vimrc
set expandtab
set nu
set shiftwidth=4
set tabstop=4
set wildmenu

nnoremap <leader>q :conf q<CR>

map <C-n> :vertical split ./ <CR>
map <S-n> :split ./<CR>

map <C-t> :tabnew ./<CR>
map <S-h> :tabprevious <CR>
map <S-l> :tabnext <CR>

map <C-f> :GF<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

call plug#begin()
    Plug 'junegunn/fzf.vim'

    " LSP
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

source $HOME/.vim/lsp.vim

colorscheme jcs
syntax off
