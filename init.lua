local TAB_WIDTH = 2

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

-- Prelude --
require("lazy_init")
-- For make correct mappings --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("plugins.init")
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end
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
-- vim.cmd("colorscheme obscure")

require("autocmd")