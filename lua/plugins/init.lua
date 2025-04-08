local config_util = require("libs._set_config")
local load_conf = config_util.load_conf
local load_confs = config_util.load_confs

require("lazy").setup({
	"onsails/lspkind.nvim",

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"L3MON4D3/LuaSnip",
	"hrsh7th/nvim-cmp",

	-- Mason, LSP, DAP, Lint and etc.
	"aznhe21/actions-preview.nvim",
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	"jay-babu/mason-nvim-dap.nvim",
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter', -- optional
			'nvim-tree/nvim-web-devicons', -- optional
		}
	},
	{
		"oclay1st/gradle.nvim",
		cmd = { "Gradle", "GradleExec", "GradleInit" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {}, -- options, see default configuration
		keys = {
			{
				"<Leader>G",
				function()
					require("gradle").toggle_projects_view()
				end,
				desc = "Gradle",
			},
		},
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {} -- your configuration
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-context",
		build = ":TSUpdate",
	},

	-- Fizzy
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
	},
	"sindrets/diffview.nvim",
	"paopaol/telescope-git-diffs.nvim",
	{
		"linrongbin16/fzfx.nvim",
		-- Optional to avoid break changes between major versions.
		version = "v7.*",
		dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },
		config = function()
			require("fzfx").setup()
		end,
	},

	-- UI
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"antosha417/nvim-lsp-file-operations",
	"nvim-lua/lsp-status.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvchad/volt" },
	},
	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	-- Utils
	"numToStr/Comment.nvim",
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	"yamatsum/nvim-cursorline",
	{ "akinsho/toggleterm.nvim", version = "*",       config = true },
	{
		"samharju/yeet.nvim",
		dependencies = {
			"stevearc/dressing.nvim", -- optional, provides sane UX
		},
		version = "*",  -- use the latest release, remove for master
		cmd = "Yeet",
		opts = {},
	},
	{
		"jedrzejboczar/possession.nvim",
		init = function()
			require("possession").setup({})
		end,
	},
	"kdheepak/lazygit.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	"mattn/emmet-vim",

	-- UX
	{
		"m4xshen/autoclose.nvim",
		init = function()
			require("autoclose").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
		end,
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>-",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				-- NOTE: this requires a version of yazi that includes
				-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
	},

	-- Color
	"RRethy/base16-nvim",
	"nanotech/jellybeans.vim",
	"vim-scripts/Spacegray.vim",
	"AlessandroYorba/Alduin",
	"baskerville/bubblegum",
	"w0ng/vim-hybrid",
	"frenzyexists/aquarium-vim",
	"rebelot/kanagawa.nvim",
	"vague2k/vague.nvim",
	{ "catppuccin/nvim",         name = "catppuccin", priority = 1000 },
	{ "rose-pine/neovim",        name = "rose-pine" },
	{
		"killitar/obscure.nvim",
		priority = 1000,
		opts = {
			styles = {
				keywords = { italic = false },
				identifiers = { italic = false },
				functions = { italic = false },
				variables = { italic = false },
				booleans = { italic = false },
				comments = { italic = false },
			},
		},
	},

	-- Git
	"sindrets/diffview.nvim",
	"lewis6991/gitsigns.nvim",

	-- AI
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false,
		build = "make",
		opts = {
			provider = "copilot",
			auto_suggestions_provider = "copilot",

			behaviour = {
				auto_suggestions = true,
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = true,
				support_paste_from_clipboard = false,
				minimize_diff = true,
			},

			windows = {
				position = "right",
				wrap = true,
				width = 30,
			},
		},
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		}
	},
})

load_confs({
	"common",
	"cmp",
	"lspkind",
	"lsp",
	"mason-lspconfig",
	"mason-adaptor",
	"telescope",
	"neo-tree",
	"noice",
	"toggleterm",
	"conform",
})
