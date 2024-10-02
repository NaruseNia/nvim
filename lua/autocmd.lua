vim.api.nvim_create_autocmd({ "QuitPre" }, {
	callback = function(context)
		vim.api.nvim_buf_delete(context.buf, { force = true })
	end,
})
