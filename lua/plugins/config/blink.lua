require("blink-cmp").setup({
	completion = {
		documentation = {
			auto_show = true,
		},
		menu = {
			draw = {
				-- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
				columns = { { "kind_icon", gap = 1 }, { "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
		},
	},
	snippets = { preset = "luasnip" },
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
