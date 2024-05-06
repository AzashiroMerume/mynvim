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
    autocmd Bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
]])
