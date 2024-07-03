require("bufferline").setup({})

local closed_buffers = {}

function delete_buffer()
	local bufnr = vim.fn.bufnr("%")
	if bufnr ~= -1 then
		local bufname = vim.fn.bufname(bufnr)
		table.insert(closed_buffers, bufname)
		vim.cmd(":Bdelete")
	else
		print("Invalid buffer number")
	end
end

function wipeout_buffer()
	local bufnr = vim.fn.bufnr("%")
	if bufnr ~= -1 then
		local bufname = vim.fn.bufname(bufnr)
		table.insert(closed_buffers, bufname)
		vim.cmd(":Bwipeout")
	else
		print("Invalid buffer number")
	end
end

function reopen_last_closed_buffer()
	if #closed_buffers > 0 then
		local last_closed_bufname = table.remove(closed_buffers)
		vim.cmd("edit " .. last_closed_bufname)
	else
		print("No buffer to reopen")
	end
end

-- Set key mappings using vim.keymap.set
vim.keymap.set("n", "<leader>bd", ":lua delete_buffer()<CR>", { silent = true })
vim.keymap.set("n", "<leader>bw", ":lua wipeout_buffer()<CR>", { silent = true })
vim.keymap.set("n", "<leader>bu", ":lua reopen_last_closed_buffer()<CR>", { silent = true })
