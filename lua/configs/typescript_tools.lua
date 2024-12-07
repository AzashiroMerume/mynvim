require("typescript-tools").setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = false

        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    end,
    handlers = {},
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
    },
    settings = {
        separate_diagnostic_server = true,
        expose_as_code_action = {},
        tsserver_plugins = {
            "@styled/typescript-styled-plugin",
            "@vue/language-server",
            "@vue/typescript-plugin",
        },
        tsserver_max_memory = 2024,
        tsserver_format_options = {},
        tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
        },
        tsserver_locale = "en",
        complete_function_calls = false,
        include_completions_with_insert_text = false,
        code_lens = "off",
        disable_member_code_lens = true,
    },
})
