local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local c = require("libs.config")

local themes = {
  { "vague2k/vague.nvim" },
  { "dgox16/oldworld.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "metalelf0/jellybeans-nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "bluz71/vim-moonfly-colors" },
  { "zenbones-theme/zenbones.nvim" },
  { "everviolet/nvim" },
  { "olivercederborg/poimandres.nvim" },
  { "Everblush/nvim" },
  { "oskarnurm/koda.nvim" },
  { "datsfilipe/vesper.nvim" },
  { "yorumicolors/yorumi.nvim" },
  { "vague2k/huez.nvim" },
  { "ThorstenRhau/token" },
  { "AhmedAbdulrahman/vim-aylin" },
  { "kartikp10/noctis.nvim" },
  { "phha/zenburn.nvim" },
  { "catppuccin/nvim" },
  { "rose-pine/neovim" },
  { "ribru17/bamboo.nvim" },
  { "mellow-theme/mellow.nvim" },
  { "frenzyexists/aquarium-vim" },
  { "kvrohit/rasmus.nvim" },
  { "ilof2/posterpole.nvim" },
  { "ficcdaf/ashen.nvim" },
  { "Everblush/everblush.vim" },
  { "Mofiqul/vscode.nvim" },
  { "kvrohit/substrata.nvim" },
  "aizen"
}

--#region Mini
now(function()
  require("mini.notify").setup {
    lsp_progress = {
      enable = false,
    }
  }
  vim.notify = require("mini.notify").make_notify()
end)
now(function()
  require("mini.icons").setup()
  require("mini.tabline").setup()
  -- require("mini.statusline").setup()
end)

later(function()
  require("mini.ai").setup()
  require("mini.comment").setup()
  require("mini.pairs").setup()
  require("mini.pick").setup()
end)
--#endregion

--#region Prerequisites
now(function()
  add({ source = "nvim-lua/plenary.nvim" })
  add({ source = "nvim-tree/nvim-web-devicons" })
  add({ source = "neovim/nvim-lspconfig" })
  add({ source = "vim-denops/denops.vim" })
  add({
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "main",
    monitor = "main",
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })
end)
--#endregion

--#region LSP/Treesitter
now(function()
  add({
    source = "williamboman/mason.nvim",
    hooks = {
      post_checkout = function()
        vim.cmd("MasonUpdate")
      end,
    },
  })
  add({
    source = "williamboman/mason-lspconfig.nvim",
    hooks = {
      post = function()
        vim.cmd("MasonUpdate")
      end,
    },
  })
  c.load_conf("lsp")
  add({
    source = "nvimtools/none-ls.nvim",
    depends = { "nvim-lua/plenary.nvim" },
  })
  add({ source = "jay-babu/mason-null-ls.nvim" })
  add({ source = "onsails/lspkind.nvim" })
  c.load_conf("lspkind")

  add({ source = "rachartier/tiny-code-action.nvim" })
  c.load_conf("tiny-code-action")

  do
    add({
      source = "MysticalDevil/inlay-hints.nvim",
      depends = { "neovim/nvim-lspconfig" }
    })
    require("inlay-hints").setup()
  end

  add({ source = "mrcjkb/rustaceanvim" })
  add({ source = "NaruseNia/valen.nvim" })
  add({
    source = "nvim-treesitter/nvim-treesitter-context",
    depends = { "nvim-treesitter/nvim-treesitter" }
  })

  do
    add({ source = "Canop/nvim-bacon" })
    require("bacon").setup {
      quickfix = {
        enabled = true,
        event_trigger = true,
      },
    }
  end
end)
--#endregion

--#region File explorer
do
  add({ source = "stevearc/oil.nvim" })
  require("oil").setup({
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    }
  })
  add({
    source = "nvim-neo-tree/neo-tree.nvim",
    checkout = "v3.x",
    depends = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  })
  c.load_conf("neo-tree")
end
--#endregion

--#region Themes
do
  add({
    source = "lmantw/themify.nvim",
    depends = {
      "rktjmp/lush.nvim"
    }
  })
  require("themify").setup(themes)
end
--#endregion

--#region Finders
do
  add({ source = "stevearc/aerial.nvim" })
  require("aerial").setup {}

  add({
    source = "nvim-telescope/telescope.nvim",
    depends = {
      "nvim-lua/plenary.nvim",
    },
  })
  add({
    source = "danielfalk/smart-open.nvim",
    depends = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope-fzy-native.nvim",
    },
  })
  c.load_conf("telescope")
  later(function()
    add({ source = "dnlhc/glance.nvim" })
    c.load_conf("glance")
  end)
end
--#endregion

--#region Completion
do
  add({
    source = "zbirenbaum/copilot.lua",
  })
  require("copilot").setup({})

  add({
    source = "L3MON4D3/LuaSnip",
  })
  require("luasnip").setup({})
  require("luasnip.loaders.from_snipmate").lazy_load()
  require("luasnip.loaders.from_lua").lazy_load()

  add({
    source = "fang2hou/blink-copilot",
  })
  add({
    source = "saghen/blink.cmp",
    checkout = "v1.6.0",
    depends = {
      "L3MON4D3/LuaSnip",
    },
  })
  c.load_conf("blink")
end
--#endregion

--#region AI
do
  add({
    source = "coder/claudecode.nvim",
    depends = {
      "folke/snacks.nvim",
    },
  })
  require("claudecode").setup {}
end
--#endregion

--#region Git
do
  add({ source = "kdheepak/lazygit.nvim" })
  add({ source = "sindrets/diffview.nvim" })
end
--#endregion

--#region UX
do
  add({ source = "aznhe21/actions-preview.nvim" })

  later(function()
    add({ source = "saecki/crates.nvim" })
    require("crates").setup {}
  end)

  later(function()
    add({ source = "lewis6991/hover.nvim" })
    c.load_conf("hover")
  end)

  do
    add({ source = "lambdalisue/kensaku.vim" })
    add({ source = "lambdalisue/kensaku-search.vim" })
    add({ source = "lambdalisue/kensaku-command.vim" })
    vim.api.nvim_set_keymap(
      'c',
      '<CR>',
      '<Plug>(kensaku-search-replace)<CR>',
      { noremap = true, silent = true }
    )

    add({ source = "folke/flash.nvim" })
    c.load_conf("flash")
  end

  add({ source = "monaqa/dial.nvim" })

  add({ source = "johmsalas/text-case.nvim" })
  require("textcase").setup {}

  add({ source = "andersevenrud/nvim_context_vt" })
  require("nvim_context_vt").setup {
    prefix = "»",
  }

  add({ source = "jghauser/mkdir.nvim" })
  add({ source = "nacro90/numb.nvim" })
  add({ source = "JoosepAlviste/nvim-ts-context-commentstring" })
  add({ source = "windwp/nvim-ts-autotag" })
  add({ source = "unblevable/quick-scope" })
  add({ source = "m-demare/hlargs.nvim" })
  add({
    source = "SmiteshP/nvim-navic",
    depends = { "neovim/nvim-lspconfig" },
  })
end
--#endregion

--#region Additional Support
do
  add({
    source = "oclay1st/gradle.nvim",
    depends = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  })
  require("gradle").setup {}
end
--#endregion

--#region Misc
do
  add({
    source = "nvim-lualine/lualine.nvim",
    depends = { "nvim-tree/nvim-web-devicons" },
  })
  c.load_conf("lualine")


  add({ source = "akinsho/toggleterm.nvim" })
  c.load_conf("toggleterm")

  later(function()
    add({ source = "stevearc/conform.nvim" })
    c.load_conf("conform")
  end)

  add({ source = "kevinhwang91/nvim-ufo", depends = { "kevinhwang91/promise-async", "neovim/nvim-lspconfig" } })
  c.load_conf("ufo")
  add({ source = "luukvbaal/statuscol.nvim" })
  c.load_conf("statuscol")

  add({ source = "kazhala/close-buffers.nvim" })

  later(function()
    add({
      source = "wasabeef/bufferin.nvim",
      depends = {
        "nvim-tree/nvim-web-devicons",
      },
    })
    c.load_conf("bufferin")
  end)

  add({ source = "MeanderingProgrammer/render-markdown.nvim" })
  require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
  })
  add({ source = "sitiom/nvim-numbertoggle" })
  add({ source = "SmiteshP/nvim-navic", depends = { "neovim/nvim-lspconfig" } })

  do
    add({ source = "b0o/incline.nvim" })
    add({ source = "shellRaining/hlchunk.nvim" })
    c.load_conf("incline")
    c.load_conf("hlchunk")
  end

  do
    add({ source = "jake-stewart/multicursor.nvim" })
    c.load_conf("multicursor")
  end

  do
    add({ source = "folke/which-key.nvim" })
  end

  do
    add({
      source = "ghillb/cybu.nvim",
      checkout = "main",
      monitor = "main",
      depends = {
        "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim"
      }
    })
    require("cybu").setup {}
  end

  do
    add({ source = "j-hui/fidget.nvim" })
    require("fidget").setup {}
  end
end
--#endregion
