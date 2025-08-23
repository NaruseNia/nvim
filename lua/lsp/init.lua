vim.lsp.config('*', {
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(
  --   vim.lsp.protocol.make_client_capabilities()
  -- )
})

vim.lsp.config("lua_ls", require("lsp.lua_ls"))
vim.lsp.config("vtsls", require("lsp.vtsls"))
vim.lsp.config("zls", require("lsp.zls"))
vim.lsp.config("omnisharp", require("lsp.omnisharp"))

local lsps = {
  "lua_ls",
  "vtsls",
  "zls",
  "omnisharp",
}

vim.lsp.enable(lsps, true)
