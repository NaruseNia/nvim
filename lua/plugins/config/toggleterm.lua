local os_util = require("libs.os_util")

if os_util.is_windows_native() then
  require("toggleterm").setup({
    shell = "pwsh",
  })
end
