local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
lspconfig.gdscript.setup(capabilities)
lspconfig.dartls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		-- Key mappings for LSP
		local buf_map = function(bufnr, mode, lhs, rhs, opts)
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true })
		end

		-- Example keybindings for LSP functions
		buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		buf_map(bufnr, "n", "S", "<cmd>lua vim.lsp.buf.hover()<CR>")
		buf_map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
		buf_map(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
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
