-- Set encoding to UTF-8
vim.opt.encoding = "UTF-8"

vim.o.guifont = "UbuntuSansMono\\ NF:h11"

-- General Settings
vim.cmd([[
    set number
    set relativenumber
    set smarttab
    set cindent
    set tabstop=2
    set shiftwidth=2
    set expandtab
    set mouse=a
    let mapleader=" "
    inoremap jk <Esc>
    tnoremap jk <C-\><C-n>
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

-- File Saving
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true})

-- Theme
vim.cmd.colorscheme 'EndOfTheWorld'

-- Split navigation keybindings
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

-- Terminal configuration
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>t', ':term<CR>',
                        {noremap = true, silent = true})

-- Buffer navigation/tab navigation
-- Create new tab with new buffer
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnew<CR>', {noremap = true})
-- Switch to next buffer/tab
-- Move to next tab with Ctrl+Tab
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>', {noremap = true})
-- Move to previous tab with Ctrl+Shift+Tab
vim.api.nvim_set_keymap('n', '<leader>bp', ':bprev<CR>', {noremap = true})

-- Clipboard settings
vim.opt.clipboard:append("unnamedplus")

-- GUI font settings
vim.g.airline_powerline_fonts = 1

-- WordProcessor function
function WordProcessor()
    if vim.bo.modifiable then
        -- movement changes
        vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
        vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
        -- formatting text
        vim.bo.formatoptions = "1"
        vim.bo.expandtab = false
        vim.bo.wrap = true
        vim.bo.linebreak = true
        -- spelling and thesaurus
        vim.bo.spell = true
        vim.bo.spelllang = "en_us"
        vim.bo.thesaurus:add("\\home\\test\\.vim\\thesaurus\\mthesaur.txt")
        vim.bo.complete:append("s")
    else
        print("Buffer is not modifiable")
    end
end

vim.cmd([[command! WP call WordProcessor()]])

-- ctrlp settings
vim.g.ctrlp_user_command = {
    -- Exclude .git directory
    'rg --files --hidden --iglob !.git'
}
