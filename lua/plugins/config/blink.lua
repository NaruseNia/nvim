require("blink-cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
    },
    menu = {
      draw = {
        -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
        columns = { { "kind_icon", gap = 1 }, { "label", "label_description", gap = 1 }, { "kind" } },
        components = {

          kind_icon = {
            text = function(ctx)
              local icon = ctx.kind_icon
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then
                  icon = dev_icon
                end
              else
                icon = require("lspkind").symbol_map[ctx.kind] or ""
              end

              return icon .. ctx.icon_gap
            end,

            highlight = function(ctx)
              -- local hl = ctx.kind_hl
              -- if vim.tbl_contains({ "Path" }, ctx.source_name) then
              --   local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
              --   if dev_icon then
              --     hl = dev_hl
              --   end
              -- end
              -- return hl
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          kind = {
            -- (optional) use highlights from mini.icons
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
        },
      },
    },
  },
  snippets = { preset = "luasnip" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "copilot" },
    providers = {
      snippets = {
        name = "snippets",
        module = 'blink.cmp.sources.snippets',
        score_offset = 200,
      },
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = -2,
        async = true,
      },
    },
  },
  fuzzy = {
    implementation = "prefer_rust",
  },
  keymap = {
    -- set to 'none' to disable the 'default' preset
    preset = "enter",

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },

    -- disable a keymap from the preset
    ["<C-e>"] = false, -- or {}

    -- show with a list of providers
    ["<C-space>"] = {
      function(cmp)
        cmp.show({ providers = { "snippets" } })
      end,
    },
  },
  appearance = {
    -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
    kind_icons = {
      Copilot = "",
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰆨",
      Constructor = "󰒓",

      Field = "",
      Variable = "󰆦",
      Property = "󰖷",

      Class = "",
      Interface = "",
      Struct = "",
      Module = "󰮄",

      Unit = "󰪚",
      Value = "󰦨",
      Enum = "",
      EnumMember = "",

      Keyword = "",
      Constant = "󰏿",

      Snippet = "󱄽",
      Color = "󰏘",
      File = "󰈔",
      Reference = "󰬲",
      Folder = "󰉋",
      Event = "󱐋",
      Operator = "󰪚",
      TypeParameter = "󰬛",
    },
  },
})
