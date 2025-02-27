" pluggins.vim

call plug#begin()
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'

    Plug 'mkitt/tabline.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'ntpeters/vim-better-whitespace'

    Plug 'nordtheme/vim'
    Plug 'morhetz/gruvbox'

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

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" tabline
let g:tablineclosebutton=1
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
