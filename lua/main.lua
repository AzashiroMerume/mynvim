-- Set encoding to UTF-8
vim.opt.encoding = "UTF-8"
vim.opt.termguicolors = true

vim.o.guifont = "UbuntuSansMono\\ NF:h11"
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.o.wrap = false

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
    set noshowmode
    set updatetime=350
    let mapleader=" "
    inoremap jk <Esc>
    vnoremap vjk <Esc>
    tnoremap jk <C-\><C-n>
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

vim.api.nvim_create_autocmd("DirChanged", {
    callback = function()
        local cwd = vim.fn.getcwd()
        local cwd_escaped = cwd:gsub("\\", "\\\\")
        vim.cmd('silent! call chansend(v:stderr, "\\033]7;file:///' .. cwd_escaped .. '\\007")')
    end,
})

-- Theme
vim.cmd.colorscheme("EndOfTheWorld")

-- File Saving
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true })

-- Split creation
vim.api.nvim_set_keymap("n", "<leader>dv", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":split<CR>", { noremap = true, silent = true })

-- Close split
vim.api.nvim_set_keymap("n", "<leader>de", ":close<CR>", { noremap = true, silent = true })

-- Resize splits
vim.api.nvim_set_keymap("n", "<leader>dk", ":resize +5<CR>", { noremap = true, silent = true }) -- Increase horizontal split height
vim.api.nvim_set_keymap("n", "<leader>dj", ":resize -5<CR>", { noremap = true, silent = true }) -- Decrease horizontal split height

vim.api.nvim_set_keymap("n", "<leader>dh", ":vertical resize +5<CR>", { noremap = true, silent = true }) -- Increase vertical split width
vim.api.nvim_set_keymap("n", "<leader>dl", ":vertical resize -5<CR>", { noremap = true, silent = true }) -- Decrease vertical split width

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
vim.api.nvim_set_keymap("n", "<leader>ls", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>le", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ls", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>le", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", "5h", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-j>", "5j", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-k>", "5k", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-l>", "5l", { noremap = true })

-- Move between errors and search results
vim.api.nvim_set_keymap("n", "<leader>qn", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qp", ":cprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ln", ":lnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lp", ":lprev<CR>", { noremap = true, silent = true })

-- Buffer navigation/tab navigation
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true })

-- Switch to next buffer/tab
vim.api.nvim_set_keymap("n", "<leader>n", ":bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":bprev<CR>", { noremap = true })

-- Replace character in normal mode without yanking
vim.api.nvim_set_keymap("n", "r", '"_r', { noremap = true }) -- Use black hole register to replace a character

-- Replace selection in visual mode without yanking
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true }) -- Change selected text without yanking
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true }) -- Delete selected text without yanking

-- Key mappings to zoom in and out
vim.api.nvim_set_keymap("n", "<C-=>", ":lua change_font_size(1)<CR>", { noremap = true, silent = true }) -- Zoom in
vim.api.nvim_set_keymap("n", "<C-->", ":lua change_font_size(-1)<CR>", { noremap = true, silent = true }) -- Zoom out

-- Clipboard settings
vim.opt.clipboard:append("unnamedplus")

-- GUI font settings
vim.g.airline_powerline_fonts = 1

-- ctrlp settings
vim.g.ctrlp_user_command = {
    -- Exclude .git directory
    "rg --files --hidden --iglob !.git",
}

function Load_env()
    local env = {}
    local env_file_path = vim.fn.stdpath("config") .. "/.env"

    local file = io.open(env_file_path, "r")
    if not file then
        print("Error: .env file not found at " .. env_file_path)
        return env
    end

    for line in file:lines() do
        if line ~= "" and line:sub(1, 1) ~= "#" then
            local key, value = line:match("^(%S+)=(%S+)$")
            if key and value then
                env[key] = value
            end
        end
    end
    file:close()
    return env
end

local previous_directory = nil

function OpenConfigFolder()
    previous_directory = vim.fn.getcwd()

    local config_path = vim.fn.stdpath("config")
    vim.cmd("e " .. config_path)
end

function ReturnToPreviousDirectory()
    if previous_directory then
        vim.cmd("e " .. previous_directory)
        previous_directory = nil
    else
        print("No previous directory saved!")
        vim.cmd("echo 'No previous directory saved!'")
    end
end

vim.cmd("command! OpenConfig lua OpenConfigFolder()")
vim.cmd("command! ReturnToPreviousDirectory lua ReturnToPreviousDirectory()")
vim.api.nvim_set_keymap("n", "<leader>oc", ":OpenConfig<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ob", ":ReturnToPreviousDirectory<CR>", { noremap = true, silent = true })
