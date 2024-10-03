local exports = {}

exports.base46 = {
	theme = "ashes",
}

exports.ui = {
	cmp = {
		lspkind_text = true,
		style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
		format_colors = {
			tailwind = false,
		},
		icons_left = true,
	},
	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
	},
}

exports.lsp = {
	signature = true,
}

return exports
