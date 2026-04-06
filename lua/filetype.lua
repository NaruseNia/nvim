local api = vim.api
local file_group = api.nvim_create_augroup('file_type', { clear = true })
api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.pen' },
  callback = function()
    vim.bo.filetype = 'json'
  end,
  group = file_group,
})
