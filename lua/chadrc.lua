local exports = {}

exports.base46 = {
  theme = "kanagawa-dragon",
}

exports.ui = {
  cmp = {
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = false,
    },
    icons_left = false,
  },
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
  },
}

exports.lsp = {
  signature = true,
}

return exports
