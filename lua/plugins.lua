local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Lazy.nvim can manage itself
	{ "letieu/wezterm-move.nvim" },
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	}, -- File icons
	{ "nvim-tree/nvim-web-devicons" }, -- Color highlighter
	{ "norcalli/nvim-colorizer.lua" }, -- Automatically close HTML tags
	{ "alvan/vim-closetag" }, -- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Common utilities
			"nvim-tree/nvim-web-devicons", -- File icons
			"MunifTanjim/nui.nvim", -- UI components
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							bo = {
								filetype = {
									"neo-tree",
									"neo-tree-popup",
									"notify",
								},
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
	}, -- Git integration
	{ "lewis6991/gitsigns.nvim" },
	{ "dinhhuy258/git.nvim" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",

			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},

	-- Package management
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- Fuzzy finder and picker
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"FabianWirth/search.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	-- Move Line and Blocks
	{ "fedepujol/move.nvim" },
	-- Navigation
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ -- highlighting for harpoon
		"letieu/harpoon-lualine",
		dependencies = {
			{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
			},
		},
	},
	{ -- Syntax highlighting
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({
				with_sync = true,
			})
			ts_update()
		end,
	},
	-- Lua
	{
		"olimorris/persisted.nvim",
		lazy = false,
		config = true,
	},
	-- Theme Picker
	-- {
	-- 	"vague2k/huez.nvim",
	-- 	-- if you want registry related features, uncomment this
	-- 	-- import = "huez-manager.import"
	-- 	branch = "stable",
	-- 	event = "UIEnter",
	-- 	config = function()
	-- 		require("huez").setup({})
	-- 	end,
	-- },
	-- Theme Picker
	{ "zaldih/themery.nvim" },
	-- Themes
	{ "azashiromerume/nagisa.nvim", lazy = false, priority = 1000 },
	{ "dasupradyumna/midnight.nvim" },
	{ "folke/zen-mode.nvim" },
	{ "folke/twilight.nvim" }, -- Buffer line
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{ "famiu/bufdelete.nvim" }, -- Tab deletion control for bufferline
	-- Linting
	{ "mfussenegger/nvim-lint" }, -- Formatting
	{ "stevearc/conform.nvim" }, -- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	}, -- LSP configuration
	{ "neovim/nvim-lspconfig" },
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},

	---- AI suggestion
	--{
	--	"supermaven-inc/supermaven-nvim",
	--	config = function()
	--		require("supermaven-nvim").setup({})
	--	end,
	--},

	-- Display prettier diagnostic messages
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			require("tiny-inline-diagnostic").setup()
		end,
	},

	-- Debug Adapter Protocol (DAP)
	{ "mfussenegger/nvim-dap" }, -- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind.nvim",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.3.0",
	},
	{ "hrsh7th/vim-vsnip" }, -- Snippet engine
	-- Rust support
	{ "rust-lang/rust.vim" }, -- Syntax highlighting, formatting, etc.
	{ "mrcjkb/rustaceanvim", version = "^4", ft = { "rust" } }, -- LSP integration
	-- TypeScript support
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{ "leafgarland/typescript-vim" }, -- Highlighting

	-- Nuxt.js components navigation
	{ "rushjs1/nuxt-goto.nvim" }, -- Commands work with Russian keyboard layout
	{ "powerman/vim-plugin-ruscmd" }, -- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	}, -- Devicons
	{ "ryanoasis/vim-devicons" },
})
