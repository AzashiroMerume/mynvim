require("typescript-tools").setup({
	on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
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
		tsserver_max_memory = "auto",
		tsserver_format_options = {},
		tsserver_file_preferences = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue",
		},
		tsserver_locale = "en",
		complete_function_calls = false,
		include_completions_with_insert_text = true,
		code_lens = "off",
		disable_member_code_lens = true,
		jsx_close_tag = {
			enable = false,
			filetypes = { "javascriptreact", "typescriptreact" },
		},
	},
})
