require("noice").setup({
	messages = {
		enabled = true, -- enables the Noice messages UI
		view = "mini", -- default view for messages
		view_error = "mini", -- view for errors
		view_warn = "mini", -- view for warnings
		view_history = "messages", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	lsp = {
		signature = {
			enabled = false, -- enables the Noice signature UI
		},
		hover = {
			enabled = false, -- enables the Noice hover UI
		},
	},
})
