require("move").setup({
    line = {
        enable = true, -- Enables line movement
        indent = true, -- Toggles indentation
    },
    block = {
        enable = true, -- Enables block movement
        indent = true, -- Toggles indentation
    },
    word = {
        enable = true, -- Enables word movement
    },
    char = {
        enable = false, -- Enables char movement
    },
})

local opts = { noremap = true, silent = true }

-- Normal-mode commands
vim.keymap.set("n", "<C-A-j>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<C-A-k>", ":MoveLine(-1)<CR>", opts)
vim.keymap.set("n", "<C-A-h>", ":MoveHChar(-1)<CR>", opts)
vim.keymap.set("n", "<C-A-l>", ":MoveHChar(1)<CR>", opts)
vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

-- Visual-mode commands
vim.keymap.set("v", "<C-A-j>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<C-A-k>", ":MoveBlock(-1)<CR>", opts)
vim.keymap.set("v", "<C-A-h>", ":MoveHBlock(-1)<CR>", opts)
vim.keymap.set("v", "<C-A-l>", ":MoveHBlock(1)<CR>", opts)
