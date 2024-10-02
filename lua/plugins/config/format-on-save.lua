local formatters = require("format-on-save.formatters")

require("format-on-save").setup({
  exclude_path_patterns = { "node_modules/*", ".git/*" },
  formatters_by_ft = {
    rust = formatters.lsp
  }
})
