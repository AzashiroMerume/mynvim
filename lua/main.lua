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

-- Fast movement keybindings
vim.api.nvim_set_keymap('n', '<S-h>', '5h', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-j>', '5j', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-k>', '5k', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-l>', '5l', {noremap = true})

-- Terminal configuration
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>t', ':term<CR>',
                        {noremap = true, silent = true})

-- Buffer navigation/tab navigation
-- Create new tab with new buffer
vim.api.nvim_set_keymap('n', '<leader>n', ':tabnew<CR>', {noremap = true})
-- Switch to next buffer/tab
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>', {noremap = true})
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

function OpenConfigFolder() vim.cmd('e C:\\Users\\kuand\\AppData\\Local\\nvim') end

-- Map <leader>ec to open Neovim config folder
vim.api.nvim_set_keymap('n', '<leader>ec', ':lua OpenConfigFolder()<CR>',
                        {noremap = true, silent = true})

-- Function to open Neovim config folder with a username argument
function OpenConfigFolder(username)
    local path = 'C:\\Users\\' .. username .. '\\AppData\\Local\\nvim'
    vim.cmd('e ' .. path)
end

-- Create a custom command :OpenConfig <username> to call OpenConfigFolder function
vim.cmd('command! -nargs=1 OpenConfig lua OpenConfigFolder(<f-args>)')
