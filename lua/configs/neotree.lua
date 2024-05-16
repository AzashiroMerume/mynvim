vim.api.nvim_command([[autocmd VimEnter * Neotree]])

-- vim.cmd([[nnoremap <C-f> :Neotree reveal<cr>]])
vim.cmd([[nnoremap <C-b> :Neotree toggle<cr>]])

require("neo-tree").setup({persistent_window = true})
