require("bufferline").setup({
    options = {
        custom_filter = function(buf_number)
            local bufname = vim.fn.bufname(buf_number)
            -- If the buffer has no name (empty string), don't show it.
            if bufname == "" then
                return false
            end
            return true
        end,
    },
})

local closed_buffers = {}

function Delete_buffer()
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

function Wipeout_buffer()
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

function Wipeout_all_buffers()
    local buffers = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buffers) do
        if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_get_option_value("buflisted", { buf = bufnr }) then
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            local line_number = vim.api.nvim_buf_get_mark(bufnr, ".")[1]
            table.insert(closed_buffers, { name = bufname, line = line_number })
            vim.api.nvim_buf_delete(bufnr, { force = true })
        end
    end
end

function Reopen_last_closed_buffer()
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

vim.keymap.set("n", "<leader>u", ":lua Reopen_last_closed_buffer()<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", ":lua Delete_buffer()<CR>", { silent = true })
vim.keymap.set("n", "<leader>bw", ":lua Wipeout_buffer()<CR>", { silent = true })
vim.keymap.set("n", "bwa", ":lua Wipeout_all_buffers()<CR>", { silent = true })
