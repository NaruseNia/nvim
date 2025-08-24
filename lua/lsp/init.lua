local servers = {
  "lua_ls",
  "vtsls",
  "tailwindcss",
  "zls",
  "omnisharp",
}

vim.lsp.enable(servers, true)

require('mason').setup {}
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

vim.g.rustaceanvim = {
  server = {
    settings = {
      ["rust-analyzer"] = {
        inlayHints = {
          bindingModeHints = {
            enable = false,
          },
          chainingHints = {
            enable = true,
          },
          closingBraceHints = {
            enable = true,
            minLines = 25,
          },
          closureReturnTypeHints = {
            enable = "never",
          },
          lifetimeElisionHints = {
            enable = "never",
            useParameterNames = false,
          },
          maxLength = 25,
          parameterHints = {
            enable = true,
          },
          reborrowHints = {
            enable = "never",
          },
          renderColons = true,
          typeHints = {
            enable = true,
            hideClosureInitialization = false,
            hideNamedConstructor = false,
          },
        },
      },
    },
  },
}
