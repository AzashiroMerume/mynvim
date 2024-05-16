require('packer').startup(function()

    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Airline status/tabline
    use 'bling/vim-airline'

    -- File icons
    use 'nvim-tree/nvim-web-devicons'

    -- Color highlighter
    use 'norcalli/nvim-colorizer.lua'

    -- Automatically close HTML tags
    use 'alvan/vim-closetag'

    -- File explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
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
    }

    -- Git integration
    use 'airblade/vim-gitgutter'
    use 'dinhhuy258/git.nvim' -- Simple clone of vim-fugitive

    -- Package management
    use {'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim'}

    -- Fuzzy finder and picker
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {
        'FabianWirth/search.nvim',
        dependencies = {'nvim-telescope/telescope.nvim'}
    }

    -- Navigation
    use {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    }

    -- Themes
    use 'azashiromerume/nagisa.nvim'
    use 'dasupradyumna/midnight.nvim'
    use 'projekt0n/github-nvim-theme'

    -- Zen mode and Twilight
    use 'folke/zen-mode.nvim'
    use 'folke/twilight.nvim'

    -- Buffer line
    use {
        'akinsho/bufferline.nvim',
        tag = '*',
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use 'famiu/bufdelete.nvim' -- Tab deletion control for bufferline

    -- Linting
    use 'mfussenegger/nvim-lint'

    -- Formatting
    use('stevearc/conform.nvim')

    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function() require('nvim-autopairs').setup {} end
    }

    -- LSP configuration
    use 'neovim/nvim-lspconfig'
    use({'j-hui/fidget.nvim', config = function() require('fidget').setup() end})

    -- Debug Adapter Protocol (DAP)
    use 'mfussenegger/nvim-dap'

    -- Autocompletion
    use('hrsh7th/nvim-cmp')
    use({
        'hrsh7th/cmp-nvim-lsp', -- LSP completion
        'saadparwaiz1/cmp_luasnip', -- Snippet completion
        'hrsh7th/cmp-vsnip', -- Snippet completion
        'hrsh7th/cmp-path', -- Path completion
        'hrsh7th/cmp-buffer', -- Buffer completion
        'onsails/lspkind.nvim', -- LSP icons
        after = {'hrsh7th/nvim-cmp'},
        requires = {'hrsh7th/nvim-cmp'}
    })
    use({"L3MON4D3/LuaSnip", tag = "v2.*"}) -- Snippet engine
    use('hrsh7th/vim-vsnip') -- Snippet engine

    -- Rust support
    use('rust-lang/rust.vim') -- Syntax highlighting, formatting, etc.
    use({'mrcjkb/rustaceanvim', version = '^4', ft = {'rust'}}) -- LSP integration

    -- TypeScript support
    use {
        'pmizio/typescript-tools.nvim',
        requires = {'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig'}
    }
    use 'leafgarland/typescript-vim' -- Highlighting
    use 'peitalin/vim-jsx-typescript' -- JSX support

    -- Dart/Flutter support
    use 'dart-lang/dart-vim-plugin'
    use 'thosakwe/vim-flutter'
    use 'natebosch/vim-lsc'
    use 'natebosch/vim-lsc-dart'

    -- Nuxt.js components navigation
    use('rushjs1/nuxt-goto.nvim')

    -- Commands work with Russian keyboard layout
    use 'powerman/vim-plugin-ruscmd'

    -- Markdown preview
    use({
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end
    })

    -- Devicons
    use 'ryanoasis/vim-devicons'

end)
