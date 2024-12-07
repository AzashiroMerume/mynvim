local lspconfig = require("lspconfig")

-- Extend capabilities for LSP with completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

lspconfig.lua_ls.setup({
    capabilities = capabilities,
})

-- GDScript (Godot)
lspconfig.gdscript.setup({
    capabilities = capabilities,
    force_setup = true,
    single_file_support = false,
    cmd = { "ncat", "127.0.0.1", "6005" },
    root_dir = require("lspconfig.util").root_pattern("project.godot", ".git"),
    filetypes = { "gd", "gdscript", "gdscript3" },
    on_attach = function(client, bufnr)
        -- Key mappings for LSP
        local buf_map = function(bufnr, mode, lhs, rhs, opts)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true })
        end

        -- GDScript-specific mappings
        buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>") -- Go to definition
        buf_map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>") -- Find references
        buf_map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- Go to implementation
        buf_map(bufnr, "n", "S", "<cmd>lua vim.lsp.buf.hover()<CR>") -- Show hover info
        buf_map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>") -- Rename symbol
        buf_map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>") -- Code actions
        buf_map(bufnr, "n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>") -- Show signature help

        -- Diagnostic navigation
        buf_map(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>") -- Go to previous diagnostic
        buf_map(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>") -- Go to next diagnostic
    end,
})

-- Dart (Flutter)
lspconfig.dartls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- Key mappings for LSP
        local buf_map = function(bufnr, mode, lhs, rhs, opts)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true })
        end

        buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        buf_map(bufnr, "n", "S", "<cmd>lua vim.lsp.buf.hover()<CR>")
        buf_map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
        buf_map(bufnr, "n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        buf_map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        buf_map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    end,
    settings = {
        dart = {
            analysisExcludedFolders = {
                vim.fn.expand("$HOME/.pub-cache"),
                vim.fn.expand("$HOME/flutter"),
            },
            updateImportsOnRename = true,
            completeFunctionCalls = true,
        },
    },
})

-- Vue language server
lspconfig.volar.setup({
    init_options = {
        vue = {
            hybridMode = false,
        },
    },
})
