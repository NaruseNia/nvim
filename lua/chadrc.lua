local exports = {}

exports.base46 = {
  changed_themes = {
    gruvchad = {
      base_16 = {
        base00 = "#191c19",
      },
      base_30 = {
        baby_pink = "#f75779",
        black = "#191c19",
      },
    },
  },
  theme = "gruvchad",
}

exports.ui = {
  cmp = {
    enabled = false,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = false,
    },
    icons_left = false,
  },
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp_c", "copilot", "cursor", "cwd" },
    modules = {
      lsp_c = function()
        local lsp_ignore = {
          "copilot",
        }
        local client = vim
            .iter(vim.lsp.get_clients { bufnr = 0 })
            :map(function(c)
              if vim.tbl_contains(lsp_ignore, c.name) then
                return nil
              end
              return c.name
            end)
            :totable()
        return "%#St_Lsp# 󰣖 " .. table.concat(client, ", ");
      end,

      copilot = function()
        local client = vim.iter(vim.lsp.get_clients { bufnr = 0 }):filter(function(c)
          return c.name:match("copilot")
        end):totable()

        if #client > 0 then
          return "%#St_Lsp#  " .. client[1].name
        else
          return "%#StText#  "
        end
      end,

      abc = "aaa",
    }
  },
}

exports.lsp = {
  signature = true,
}

return exports
