-- Set encoding to UTF-8
vim.opt.encoding = "UTF-8"
vim.opt.termguicolors = true

vim.o.guifont = "UbuntuSansMono\\ NF:h11"
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.o.wrap = false
vim.loader.enable()

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
vim.api.nvim_set_keymap("n", "<leader>cs", ":close<CR>", { noremap = true, silent = true })

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

-- Terminal configuration
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":term<CR>", { noremap = true, silent = true })

-- Buffer navigation/tab navigation
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true })

-- Switch to next buffer/tab
vim.api.nvim_set_keymap("n", "<leader>n", ":bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":bprev<CR>", { noremap = true })

-- Clipboard settings
vim.opt.clipboard:append("unnamedplus")

-- GUI font settings
vim.g.airline_powerline_fonts = 1

-- ctrlp settings
vim.g.ctrlp_user_command = {
    -- Exclude .git directory
    "rg --files --hidden --iglob !.git",
}

local function load_dotenv()
    local ok, dotenv = pcall(require, "dotenv")
    if ok then
        dotenv.load()
    end
end

local previous_directory = nil

function OpenConfigFolder(username)
    load_dotenv()
    previous_directory = vim.fn.getcwd()

    if username == nil or username == "" then
        username = os.getenv("USERNAME")
    end
    local path = "C:\\Users\\" .. username .. "\\AppData\\Local\\nvim"
    vim.cmd("e " .. path)
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

vim.cmd("command! -nargs=? OpenConfig lua OpenConfigFolder(<f-args>)")
vim.cmd("command! ReturnToPreviousDirectory lua ReturnToPreviousDirectory()")
vim.api.nvim_set_keymap("n", "<leader>oc", ":OpenConfig<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ob", ":ReturnToPreviousDirectory<CR>", { noremap = true, silent = true })
