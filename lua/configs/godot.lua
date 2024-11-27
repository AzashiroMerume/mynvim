-- FileType autocmd for GDScript settings
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

-- Function to load Godot address
local function get_godot_address()
    load_dotenv()
    return os.getenv("GODOT_ADDRESS") or "127.0.0.1:55432"
end

-- Function to check if address is in use
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

-- Function to start Godot connection if in a Godot project
local function start_godot_connection()
    local godot_project_file = vim.fn.getcwd() .. "/project.godot"
    local gdproject = io.open(godot_project_file, "r")
    if gdproject then
        io.close(gdproject)
        local godot_address = get_godot_address()
        if is_address_in_use(godot_address) then
            print("Address " .. godot_address .. " is already in use. Aborting connection.")
            return
        end
        vim.fn.serverstart(godot_address)
        print("Godot connection started at " .. godot_address)
    end
end

-- Run connection check on startup
start_godot_connection()

-- Autocmd for when the working directory changes
vim.api.nvim_create_autocmd("DirChanged", {
    callback = function()
        start_godot_connection()
    end,
})
