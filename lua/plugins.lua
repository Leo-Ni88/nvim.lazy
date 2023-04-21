local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
	-- Common utilities
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- Icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- Colorschema
	{ "rebelot/kanagawa.nvim", lazy = true },

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.lualine")
		end,
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		config = function()
			require("configs.bufferline")
		end,
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Background Transparent
	{
		"xiyaowong/nvim-transparent",
		config = function()
			require("configs.transparent")
		end,
	},

	-- Noice: replaces the UI for messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("configs.noice")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("configs.treesitter")
		end,
	},

	-- Mason: Portable lsp server package manager
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lsp")
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- Lspsaga
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("configs.lspsaga")
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- Neo-tree: File manager
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				enable_git_status = false,
				enable_diagnostics = false,
				filesystem = {
					follow_current_file = true,
				},
				buffers = {
					follow_current_file = true,
				},
			})
		end,
	},

	-- Show colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},

	-- Toggleterm: Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("configs.toggleterm")
		end,
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	},

	-- myword
	{ "dwrdx/mywords.nvim" },

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		config = function()
			require("configs.telescope")
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},

	-- numToStr/Comment.nvim
	{
		"numToStr/Comment.nvim",
		config = function()
			require("configs.comment")
		end,
	},

	-- Snippet Engine
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		build = "make install_jsregexp",
	},

	-- cmp: Autocomplete
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },

	-- LSP diagnostics, code actions, and more via Lua.
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Search
    --[[
	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("configs.spectre")
		end,
        dependencies = { "nvim-lua/plenary.nvim" },
	},
    --]]
})
