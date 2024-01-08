" vim 9.1 config
" felipe farias <felipe.farias.e1@gmail.com>
"

" defaults for everything
set backspace=indent,eol,start
let c_minlines=500
set encoding=utf-8
set fillchars+=vert:│
set hidden
set ignorecase
set incsearch
set laststatus=2
set modelines=5
set nocompatible
set nofoldenable
set nohlsearch
set nostartofline
set ruler
set scrolloff=10
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smartcase
set smarttab
set spellcapcheck=
set spellfile=~/.vimspell.add
set spelllang=en_us
set tabstop=4
set timeoutlen=0
set wildmode=longest,list,full

" don't pollute directories with swap files, keep them in one place
silent !mkdir -p ~/.vim/{backup,swp}/
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" minor color config
set t_Co=256
syntax on
colorscheme jcs

" highlight stray spaces and tabs when out of insert mode
au BufWinEnter * match ExtraWhitespace /\(\s\+$\|\^\s*     \+\)/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\(\s\+$\|\^\s*     \+\)/
" performance hack
if version >= 702
	au BufWinLeave * call clearmatches()
endif

" pluggins
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
call plug#end()

" exit
nnoremap <leader>q :conf q<CR>

" windows
map <C-n> :vertical split ./ <CR>
map <S-n> :split ./<CR>

" tabs
map <C-t> :tabnew ./<CR>
map <S-h> :tabprevious <CR>
map <S-l> :tabnext <CR>

" fzf
map <C-f> :GF<CR>

" lsp
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" just highlight the line with the error, i don't need a column
set signcolumn=no

" default to no color column
au FileType * setlocal colorcolumn=0

" all source code gets wrapped at <80 and auto-indented
au FileType arduino,asm,c,cpp,go,java,javascript,php,html,make,objc,perl setlocal tw=79 autoindent colorcolumn=81

" email and commit messages - expand tabs, wrap at 68 for future quoting, enable spelling
au FileType cvs,gitcommit,mail setlocal tw=68 et spell colorcolumn=69

" only enable buftabline on multiple buffers
let g:buftabline_show=1

" avoid temp files
set viminfo=
let g:netrw_dirhistmax = 0

" lsp configuration typying autocompletion
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

