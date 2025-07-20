local exports = {}

function exports.is_windows_native()
  return vim.fn.has("windows") == 1 and vim.fn.has("wsl") ~= 1
end

function exports.is_windows()
  return vim.fn.has("windows")
end

function exports.is_wsl()
  return vim.fn.has("wsl") == 1
end

return exports
