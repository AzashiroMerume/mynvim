require("gitsigns").setup()

require("git").setup({
    default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

    keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Close blame window
        quit_blame = "q",
    },
    winbar = false,
})

-- Add the keymap for diffthis using gitsigns
vim.api.nvim_set_keymap("n", "<Leader>gd", ":Gitsigns diffthis<CR>", { noremap = true, silent = true })
