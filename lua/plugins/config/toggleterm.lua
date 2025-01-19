if vim.fn.has("win32") or vim.fn.has("win64") then
	require("toggleterm").setup({
		-- For windows
		shell = "pwsh",
	})
end
