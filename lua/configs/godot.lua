vim.api.nvim_create_autocmd("FileType", {
    pattern = "gdscript",
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.indentexpr = ""
    end,
})

local function get_godot_address()
    local envs = Load_env()
    return envs["GODOT_ADDRESS"] or "127.0.0.1:55432"
end

local function is_address_in_use(address)
    local ip, port = address:match("(.+):(%d+)")
    local command

    if vim.fn.has("win32") == 1 then
        command = "netstat -ano | findstr :" .. port
    else
        command = "ss -tuln | grep " .. ip .. ":" .. port
    end

    local result = vim.fn.system(command)
    return result ~= ""
end

local function start_godot_connection(address)
    local godot_project_file = vim.fn.getcwd() .. "/project.godot"
    local gdproject = io.open(godot_project_file, "r")
    if gdproject then
        io.close(gdproject)
        local godot_address = address or get_godot_address()
        if is_address_in_use(godot_address) then
            print("Address " .. godot_address .. " is already in use. Aborting connection.")
            return
        end
        vim.fn.serverstart(godot_address)
        print("Godot connection started at " .. godot_address)
    end
end

local function stop_godot_connection()
    local godot_address = get_godot_address()
    vim.fn.serverstop(godot_address)
    print("Godot connection stopped at " .. godot_address)
end

vim.api.nvim_create_user_command("StartGodotConnection", function(opts)
    local address = opts.args ~= "" and opts.args or nil
    start_godot_connection(address)
end, { nargs = "?" })
vim.api.nvim_create_user_command("StopGodotConnection", stop_godot_connection, {})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        start_godot_connection()
    end,
})
vim.api.nvim_create_autocmd("DirChanged", {
    callback = function()
        start_godot_connection()
    end,
})
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.gd",
    callback = function()
        local clients = vim.lsp.get_clients()
        local has_godot = vim.tbl_contains(
            vim.tbl_map(function(c)
                return c.name
            end, clients),
            "godot"
        )
        if not has_godot then
            start_godot_connection()
        end
    end,
})
