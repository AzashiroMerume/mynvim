-- Bufferline settings
vim.opt.termguicolors = true
require("bufferline").setup {}

-- bufdeletenvim
vim.api.nvim_set_keymap('n', '<leader>bd', ':Bdelete<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>bw', ':Bwipeout<CR>', {noremap = true})
