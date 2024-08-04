
source ~/.config/nvim/config/declutter.vim
source ~/.config/nvim/config/remap.vim
source ~/.config/nvim/config/set.vim
source ~/.config/nvim/config/plugin.vim

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
call plug#end()

" Harpoon
nnoremap <silent> <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>
" quick cyclying
for i in range(1, 5)
    execute 'nnoremap <silent> <leader>' . i . ' :lua require("harpoon.ui").nav_file(' . i . ')<CR>'
endfor

" Telescope mapings
nnoremap <silent> <leader>pf <cmd>Telescope find_files<CR>
nnoremap <silent> <C-p> <cmd>Telescope git_files<CR>
nnoremap <silent> <leader>pws <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>
nnoremap <silent> <leader>pWs <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cWORD>") })<CR>
nnoremap <silent> <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })<CR>
nnoremap <silent> <leader>vh <cmd>Telescope help_tags<CR>
