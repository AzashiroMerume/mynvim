require('packer').startup(function()
    use("wbthomason/packer.nvim")
    use 'bling/vim-airline'
    use 'norcalli/nvim-colorizer.lua'
    use 'alvan/vim-closetag'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'

    -- Package installing tool
    use {
        {
            'williamboman/mason.nvim',
            config = function() require("mason").setup() end
        }, 'williamboman/mason-lspconfig.nvim'
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- Harpoon
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = {{"nvim-lua/plenary.nvim"}}
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    }

    -- Theme
    use {'azashiromerume/nagisa.nvim'}

    -- Zen mode
    use 'folke/zen-mode.nvim'
    -- Twilight
    use "folke/twilight.nvim"

    -- bufferline
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    -- tab deletion control for bufferline
    use 'famiu/bufdelete.nvim'

    -- Conform(formatting)
    use("stevearc/conform.nvim")

    -- LCP
    use 'neovim/nvim-lspconfig'
    use({'j-hui/fidget.nvim', config = function() require("fidget").setup() end})

    -- Debug Adapter Protocol (DAP)
    use 'mfussenegger/nvim-dap'

    -- Autocompletion framework
    use("hrsh7th/nvim-cmp")
    use({
        -- cmp LSP completion
        "hrsh7th/cmp-nvim-lsp",
        -- cmp Snippet completion
        "hrsh7th/cmp-vsnip",
        -- cmp Path completion
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        after = {"hrsh7th/nvim-cmp"},
        requires = {"hrsh7th/nvim-cmp"}
    })
    -- See hrsh7th other plugins for more great completion sources!
    -- Snippet engine
    use('hrsh7th/vim-vsnip')

    -- Rust syntax highlighting, formatting and more
    use('rust-lang/rust.vim')
    -- Rust LCP integration
    use({'mrcjkb/rustaceanvim', version = '^4', ft = {'rust'}})

    -- TypeScript Highlighting
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'

    -- Dart/Flutter
    use 'dart-lang/dart-vim-plugin'
    use 'thosakwe/vim-flutter'
    use 'natebosch/vim-lsc'
    use 'natebosch/vim-lsc-dart'

    -- Commands will work even with ru lang keyboard
    use 'powerman/vim-plugin-ruscmd'

    -- Markdown Preview
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end
    })

    -- Themes
    use {'dasupradyumna/midnight.nvim'}
    use 'projekt0n/github-nvim-theme'
    use 'scrooloose/nerdtree'
    use 'ryanoasis/vim-devicons'
end)
