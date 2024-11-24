require("dashboard").setup({
    config = {
        project = {
            action = function(path)
                vim.cmd("cd " .. path)
                vim.cmd("Neotree filesystem reveal")
                vim.cmd("Telescope find_files cwd=" .. path)
            end,
        },
    },
})