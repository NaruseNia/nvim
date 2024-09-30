local config_util = require("libs._set_config")
local load_conf = config_util.load_conf
local load_confs = config_util.load_confs

require("lazy").setup({
  "onsails/lspkind.nvim",

  -- Completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",

  -- Mason, LSP, DAP, Lint and etc.
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {}
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" }
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
  },
  "jay-babu/mason-nvim-dap.nvim",
  {
    "github/copilot.vim",
    lazy = false,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",
    build = ":TSUpdate"
  },

  -- Fizzy
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
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
  "nvim-lualine/lualine.nvim",
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "romgrk/barbar.nvim",
    init = function() vim.g.barbar_auto_setup = true end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- Utils
  "numToStr/Comment.nvim",
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function() require("hop").setup { keys = "etovxqpdygfblzhckisuran" } end,
  },
  "yamatsum/nvim-cursorline",
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {
    "samharju/yeet.nvim",
    dependencies = {
        "stevearc/dressing.nvim", -- optional, provides sane UX
    },
    version = "*", -- use the latest release, remove for master
    cmd = "Yeet",
    opts = {},
  },

  -- UX
  {
    "m4xshen/autoclose.nvim",
    init = function() require("autoclose").setup() end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end
  },

  -- Color
  "RRethy/base16-nvim",
  "nanotech/jellybeans.vim",
  "vim-scripts/Spacegray.vim",
  "AlessandroYorba/Alduin",
  "baskerville/bubblegum",
  "w0ng/vim-hybrid",
  "frenzyexists/aquarium-vim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine" },

  -- Git
  "sindrets/diffview.nvim",
  "lewis6991/gitsigns.nvim",

})

load_confs({
  "common",
  "cmp",
  "lspkind",
  "mason-lspconfig",
  "mason-adaptor",
  "telescope",
  "neo-tree",
  "lualine",
  "noice",
  "toggleterm",
})
