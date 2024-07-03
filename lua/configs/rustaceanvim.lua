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

			-- Define key mappings
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end
			local opts = { noremap = true, silent = true }

			-- Mappings.
			buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
			buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
			buf_set_keymap(
				"n",
				"<space>wl",
				"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
				opts
			)
			buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
			buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
			buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
			buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
			buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
			buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

			buf_set_keymap("v", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
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
