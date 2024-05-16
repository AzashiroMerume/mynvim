-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

local lspkind = require("lspkind")
lspkind.init {}

-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require("cmp")
cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Add tab support
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        })
    },

    sources = {
        {name = "luasnip"}, {name = "nvim_lsp"}, {name = "vsnip"},
        {name = "path"}, {name = "buffer"}
    }
})

local ls = require("luasnip")
ls.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI"
}

vim.keymap.set({"i", "s"}, "<c-k>", function()
    if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<c-j>",
               function() if ls.jumpable(-1) then ls.jump(-1) end end,
               {silent = true})
