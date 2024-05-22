local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Lazy.nvim can manage itself
    {'letieu/wezterm-move.nvim'}, -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('lualine').setup() end
    }, -- File icons
    {'nvim-tree/nvim-web-devicons'}, -- Color highlighter
    {'norcalli/nvim-colorizer.lua'}, -- Automatically close HTML tags
    {'alvan/vim-closetag'}, -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Common utilities
            "nvim-tree/nvim-web-devicons", -- File icons
            "MunifTanjim/nui.nvim", -- UI components
            "3rd/image.nvim", -- Image support
            {
                's1n7ax/nvim-window-picker',
                version = '2.*',
                config = function()
                    require'window-picker'.setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            bo = {
                                filetype = {
                                    'neo-tree', "neo-tree-popup", "notify"
                                },
                                buftype = {'terminal', "quickfix"}
                            }
                        }
                    })
                end
            }
        }
    }, -- Git integration
    {'lewis6991/gitsigns.nvim'}, {'dinhhuy258/git.nvim'}, -- Simple clone of vim-fugitive

    -- Package management
    {'williamboman/mason.nvim'}, {'williamboman/mason-lspconfig.nvim'},

    -- Fuzzy finder and picker
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {{'nvim-lua/plenary.nvim'}}
    }, {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {
        'FabianWirth/search.nvim',
        dependencies = {'nvim-telescope/telescope.nvim'}
    }, -- Move Line and Blocks
    {'fedepujol/move.nvim'}, -- Navigation
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {{'nvim-lua/plenary.nvim'}}
    }, -- Syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    }, -- Themes
    {'azashiromerume/nagisa.nvim'}, {'dasupradyumna/midnight.nvim'},
    {'projekt0n/github-nvim-theme'}, -- Zen mode and Twilight
    {'folke/zen-mode.nvim'}, {'folke/twilight.nvim'}, -- Buffer line
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons'
    }, {'famiu/bufdelete.nvim'}, -- Tab deletion control for bufferline
    -- Linting
    {'mfussenegger/nvim-lint'}, -- Formatting
    {'stevearc/conform.nvim'}, -- Autopairs
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function() require('nvim-autopairs').setup() end
    }, -- LSP configuration
    {'neovim/nvim-lspconfig'},
    {'j-hui/fidget.nvim', config = function() require('fidget').setup() end},

    -- Debug Adapter Protocol (DAP)
    {'mfussenegger/nvim-dap'}, -- Autocompletion
    {'hrsh7th/nvim-cmp'}, {
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'onsails/lspkind.nvim',
        dependencies = {'hrsh7th/nvim-cmp'}
    }, {"L3MON4D3/LuaSnip", version = "v2.*"}, -- Snippet engine
    {'hrsh7th/vim-vsnip'}, -- Snippet engine
    -- Rust support
    {'rust-lang/rust.vim'}, -- Syntax highlighting, formatting, etc.
    {'mrcjkb/rustaceanvim', version = '^4', ft = {'rust'}}, -- LSP integration
    -- TypeScript support
    {
        'pmizio/typescript-tools.nvim',
        dependencies = {'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig'}
    }, {'leafgarland/typescript-vim'}, -- Highlighting
    {'peitalin/vim-jsx-typescript'}, -- JSX support
    -- Dart/Flutter support
    {'dart-lang/dart-vim-plugin'}, {'thosakwe/vim-flutter'},
    {'natebosch/vim-lsc'}, {'natebosch/vim-lsc-dart'},

    -- Nuxt.js components navigation
    {'rushjs1/nuxt-goto.nvim'}, -- Commands work with Russian keyboard layout
    {'powerman/vim-plugin-ruscmd'}, -- Markdown preview
    {
        'iamcco/markdown-preview.nvim',
        build = function() vim.fn['mkdp#util#install']() end
    }, -- Devicons
    {'ryanoasis/vim-devicons'}
})
