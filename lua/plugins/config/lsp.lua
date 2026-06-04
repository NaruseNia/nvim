require("mason").setup({})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "jsonls",
    "yamlls",
    "taplo",
    "vtsls",
    "vue_ls",
  },
  automatic_installation = true,
})

vim.lsp.config("vtsls", {
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath("data")
                .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
    },
  },
})

vim.lsp.enable({ "lua_ls", "vtsls", "vue_ls" })
