if vim.env.VSCODE then
  vim.g.vscode = true
end

-- vim.loader = false
if vim.loader then
  vim.loader.enable()
end

-- check if we have the latest stable version of nvim
local version = vim.version
local expected_ver = "0.9.4"
local ev = version.parse(expected_ver)
local actual_ver = version()

if version.cmp(ev, actual_ver) ~= 0 then
  local _ver = string.format("%s.%s.%s", actual_ver.major, actual_ver.minor, actual_ver.patch)
  local msg = string.format("Expect nvim %s, but got %s instead. Use at your own risk!", expected_ver, _ver)
  vim.api.nvim_err_writeln(msg)
end

require "user.launch"

require "config.options"
require "config.keymaps"
require "config.autocmds"

spec "plugins.colorscheme"
spec "plugins.toggleterm"
spec "plugins.telescope"
spec "plugins.whichkey"
spec "plugins.project"
spec "plugins.comment"
spec "plugins.bufferline"
spec "plugins.gitsigns"
spec "plugins.treesitter"
spec "plugins.lualine"

-- bootstrap lazy.nvim, LazyVim and your plugins
require "config.lazy"
