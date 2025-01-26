vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {},
    -- LSP configuration
    server = {
        on_attach = function(client, bufnr)
            -- Enable inlay hints
            vim.api.nvim_create_augroup("lsp_augroup", { clear = true })
            vim.api.nvim_create_autocmd("BufEnter", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.inlay_hint.enable(true, table)
                end,
                group = "lsp_augroup",
            })
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
                imports = { granularity = { group = "module" }, prefix = "self" },
                cargo = { buildScripts = { enable = true } },
                procMacro = { enable = true },
                diagnostics = { experimental = { enable = true } },
            },
        },
    },
    -- DAP configuration
    dap = {},
}
