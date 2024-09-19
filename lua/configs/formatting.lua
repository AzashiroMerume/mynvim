local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "prettierd", "eslint_d" },
        svelte = { "prettier" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        lua = { "stylua" },
        dart = { "dart_format" },
        rust = { "rustfmt" },
    },
})

-- Map a key combination to format using Conform (optional)
vim.keymap.set({ "n", "v" }, "<S-A-f>", function()
    conform.format({ lsp_fallback = true, async = true, timeout_ms = 2000 })
end, { desc = "Format file or range (in visual mode)" })
