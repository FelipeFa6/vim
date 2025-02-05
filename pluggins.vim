" pluggins.vim

call plug#begin()

    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'
    Plug 'pacha/vem-tabline'

    Plug 'zekzekus/menguless'
    Plug 'pbrisbin/vim-colors-off'

call plug#end()

" fzf
nnoremap <C-p> :FZF <CR>
nnoremap <C-b> :Buffers <CR>
nnoremap <Leader>c :Colors <CR>
nnoremap <Leader>pf :GFiles<CR>
nnoremap <Leader>ps :RG<CR>
imap <C-x><C-f> <plug>(fzf-complete-path)
imap <C-x><C-l> <plug>(fzf-complete-line)

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

" tabline
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
set hidden
