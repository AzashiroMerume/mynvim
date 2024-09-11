require("bufferline").setup({})

local closed_buffers = {}

function delete_buffer()
    local bufnr = vim.fn.bufnr("%")
    if bufnr ~= -1 then
        local bufname = vim.fn.bufname(bufnr)
        local line_number = vim.fn.line(".")
        -- Store both buffer name and line number
        table.insert(closed_buffers, { name = bufname, line = line_number })
        vim.cmd(":Bdelete")
    else
        print("Invalid buffer number")
    end
end

function wipeout_buffer()
    local bufnr = vim.fn.bufnr("%")
    if bufnr ~= -1 then
        local bufname = vim.fn.bufname(bufnr)
        local line_number = vim.fn.line(".")
        -- Store both buffer name and line number
        table.insert(closed_buffers, { name = bufname, line = line_number })
        vim.cmd(":Bwipeout")
    else
        print("Invalid buffer number")
    end
end

function reopen_last_closed_buffer()
    if #closed_buffers > 0 then
        local last_closed = table.remove(closed_buffers)
        local last_closed_bufname = last_closed.name
        local last_closed_line = last_closed.line

        if vim.fn.filereadable(last_closed_bufname) == 1 then
            vim.cmd("edit " .. last_closed_bufname)
            -- Restore the cursor position
            vim.fn.cursor(last_closed_line, 1)
        else
            print("Last closed buffer no longer exists")
        end
    else
        print("No buffer to reopen")
    end
end

-- Set key mappings using vim.keymap.set
vim.keymap.set("n", "<leader>u", ":lua reopen_last_closed_buffer()<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", ":lua delete_buffer()<CR>", { silent = true })
vim.keymap.set("n", "<leader>bw", ":lua wipeout_buffer()<CR>", { silent = true })
