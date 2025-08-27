local os_util = require("libs.os_util")
local jdtls_setup = require("jdtls.setup")

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = jdtls_setup.find_root(root_markers)
if not root_dir then
  return
end

local get_jdtls = function(home_dir)
  if os_util.is_windows_native() then
    return home_dir .. "/AppData/Local/nvim-data/mason/packages/jdtls"
  else
    return home_dir .. "/.local/share/nvim/mason/packages/jdtls"
  end
end

local get_os_name = function()
  if os_util.is_windows_native() then
    return "win"
  elseif os_util.is_mac() then
    return "mac"
  else
    return "linux"
  end
end

local home = os.getenv("HOME")
local jdtls_path = get_jdtls(home)
local config_dir = jdtls_path .. "/config_" .. get_os_name() -- if you use linux /config_linux
local launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

-- LSP capabilities with nvim-cmp
local capabilities = require("blink.cmp").get_lsp_capabilities()

local function get_java_home()
  return os.getenv("JAVA_HOME")
end

local function get_java()
  return get_java_home() .. "/bin/java"
end

local config = {
  cmd = {
    get_java(),
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", launcher_path,
    "-configuration", config_dir,
    "-data", workspace_dir,
  },
  root_dir = root_dir,
  capabilities = capabilities,
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = get_java_home(),
          },
        },
      },
      import = {
        gradle = {
          enabled = true, -- Gradleサポートを有効化
        },
        maven = {
          enabled = true, -- Mavenサポートを有効化
        }
      },
      signatureHelp = { enabled = true },
    },
  },
  init_options = {
    bundles = {},
    extendedClientCapabilities = jdtls_setup.extendedClientCapabilities
  }
}

jdtls_setup.start_or_attach(config)
