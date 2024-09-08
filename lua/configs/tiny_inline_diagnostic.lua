-- Disable virtual text by default
vim.diagnostic.config({ virtual_text = false })

-- Keymap to toggle inline diagnostics using <leader>d
vim.keymap.set("n", "<leader>d", function()
	-- Toggle diagnostics
	local diagnostics_shown = require("tiny-inline-diagnostic").toggle()

	print("tiny-inline-diagnostic toggled")
end, { desc = "Toggle Inline Diagnostic" })
