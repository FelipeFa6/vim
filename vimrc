" vim 9.1 config
" felipe farias <felipe.farias.e1@gmail.com>
"

let c_minlines=500
set backspace=indent,eol,start
set encoding=utf-8
set fillchars+=vert:│
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=1
set modelines=5
set nofoldenable
set nostartofline
set ruler
set scrolloff=10
set showcmd
set showmatch
set showmode
set smartcase
set smarttab
set spelllang=en_us
set wildmode=longest,list,full

" indentation
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" minor color config
set t_Co=256
colorscheme jcs
syntax off
set background=dark

" don't pollute directories with swap files, keep them in one place
silent !mkdir -p ~/.vim/{backup,swp}/
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" performance hack
if version >= 702
	au BufWinLeave * call clearmatches()
endif

" pluggins
call plug#begin()
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/vim-easy-align'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
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

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" just highlight the line with the error, i don't need a column
set signcolumn=no

" default to no color column
au FileType * setlocal colorcolumn=0

" all source code gets wrapped at <80 and auto-indented
au FileType arduino,asm,c,cpp,go,java,javascript,php,html,make,objc,perl setlocal tw=79 autoindent

" email and commit messages - expand tabs, wrap at 68 for future quoting, enable spelling
au FileType cvs,gitcommit,mail setlocal tw=68 et spell colorcolumn=69

" only enable buftabline on multiple buffers
let g:buftabline_show=1

" avoid temp files
set viminfo=
let g:netrw_dirhistmax = 0

" cursor (added characters because of st)
function! SetCursorShape()
    let &t_EI = "\e[2 q"
    let &t_SI = "\e[6 q"
    call echoraw(&t_EI)
endfunction

autocmd VimEnter * call SetCursorShape()
autocmd CmdlineLeave * call echoraw(&t_EI)
autocmd CmdlineEnter * call echoraw(&t_SI)

" trailing spaces
"set list
"set listchars=tab:>·,trail:·

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

