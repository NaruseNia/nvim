local TAB_WIDTH = 2

-- Prelude --
require("lazy_init")
-- For make correct mappings --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("plugins.init")
require("keymaps.init")

vim.g.guitablabel = "%t"
vim.g.linebreak = "nowrap"

-- Vim options --
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true
vim.opt.pumblend = 10
vim.opt.cmdheight = 0
vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guifont = "ZedMono Nerd Font"

vim.cmd("language en_US")
vim.cmd("colorscheme catppuccin-mocha")
