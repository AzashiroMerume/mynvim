local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        javascript = {"eslint_d"},
        typescript = {"prettier", "eslint_d"},
        javascriptreact = {"eslint_d"},
        typescriptreact = {"eslint_d"},
        vue = {"eslint_d"},
        svelte = {"prettier"},
        css = {"prettier"},
        html = {"prettier"},
        json = {"prettier"},
        yaml = {"prettier"},
        markdown = {"prettier"},
        graphql = {"prettier"},
        lua = {"stylua"},
        dart = {"dart_format"},
        rust = {"rustfmt"}
    },
})

-- Map a key combination to format using Conform (optional)
vim.keymap.set({"n", "v"}, "<S-A-f>", function()
    conform.format({lsp_fallback = true, async = true, timeout_ms = 2000})
end, {desc = "Format file or range (in visual mode)"})
