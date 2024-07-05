-- Set encoding to UTF-8
vim.opt.encoding = "UTF-8"
vim.opt.termguicolors = true

vim.o.guifont = "UbuntuSansMono\\ NF:h11"
vim.opt.incsearch = true
vim.opt.hlsearch = true

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
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true })

-- Theme
vim.cmd.colorscheme("EndOfTheWorld")

-- Split creation
vim.api.nvim_set_keymap("n", "<leader>vs", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>hs", ":split<CR>", { noremap = true, silent = true })

-- Close split
vim.api.nvim_set_keymap("n", "<leader>cl", ":close<CR>", { noremap = true, silent = true })

-- Split navigation keybindings
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- Fast movement keybindings
vim.api.nvim_set_keymap("n", "<S-h>", "5h", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-j>", "5j", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-k>", "5k", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-l>", "5l", { noremap = true })

-- Move between errors and search results
vim.api.nvim_set_keymap("n", "<leader>qn", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qp", ":cprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ln", ":lnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lp", ":lprev<CR>", { noremap = true, silent = true })

-- Terminal configuration
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":term<CR>", { noremap = true, silent = true })

-- Buffer navigation/tab navigation
-- Create new tab with new buffer
vim.api.nvim_set_keymap("n", "<leader>nn", ":tabnew<CR>", { noremap = true })
-- Switch to next buffer/tab
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>bp", ":bprev<CR>", { noremap = true })

-- Clipboard settings
vim.opt.clipboard:append("unnamedplus")

-- GUI font settings
vim.g.airline_powerline_fonts = 1

-- ctrlp settings
vim.g.ctrlp_user_command = {
	-- Exclude .git directory
	"rg --files --hidden --iglob !.git",
}

-- Function to open Neovim config folder with a username argument
function OpenConfigFolder(username)
	local path = "C:\\Users\\" .. username .. "\\AppData\\Local\\nvim"
	vim.cmd("e " .. path)
end

-- Create a custom command :OpenConfig <username> to call OpenConfigFolder function
vim.cmd("command! -nargs=1 OpenConfig lua OpenConfigFolder(<f-args>)")
