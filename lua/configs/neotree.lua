vim.cmd([[nnoremap <C-b> :Neotree toggle<cr>]])
vim.cmd([[nnoremap <C-f> :Neotree reveal<cr>]])

require("neo-tree").setup({ persistent_window = true })
