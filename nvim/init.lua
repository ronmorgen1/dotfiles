if vim.loader then
  vim.loader.enable()
end

-- check if we have the latest stable version of nvim
local version = vim.version
local expected_ver = "0.9.5"
local ev = version.parse(expected_ver)
local actual_ver = version()

if version.cmp(ev, actual_ver) ~= 0 then
  local _ver = string.format("%s.%s.%s", actual_ver.major, actual_ver.minor, actual_ver.patch)
  local msg = string.format("Expect nvim %s, but got %s instead. Use at your own risk!", expected_ver, _ver)
  vim.api.nvim_err_writeln(msg)
end

require "config.autocmds"
require "config.keymaps"
require "config.launch"
require "config.options"

spec "plugins.colorscheme"
spec "plugins.lualine"
spec "plugins.treesitter"
spec "plugins.schemastore"
spec "plugins.lspconfig"

require "config.lazy"
