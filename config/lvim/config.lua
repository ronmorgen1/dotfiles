-------- Core Configurations --------
require("user.autocmds").config() -- Autocommands
require("user.options").config() -- Options
require("user.keymaps").config() -- Keybindings
require("user.plugins").config() -- Plugins
require("user.lualine").config() -- Lua

------ Plugins Configurations ------
require("user.which-key").config()

------ LSP Configurations ------
require("user.lsp").config()
