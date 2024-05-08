vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeIgnore = {}
vim.g.NERDTreeStatusline = ''
vim.cmd([[
    nnoremap <leader>n :NERDTreeFocus<CR>
    nnoremap <silent> <C-f> :NERDTreeFind<CR>
    nnoremap <silent> <C-b> :NERDTreeToggle<CR>
    autocmd VimEnter * NERDTree
]])
