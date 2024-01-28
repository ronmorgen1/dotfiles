if vim.loader then
  vim.loader.enable()
end

require "config.launch"
require "config.options"
require "config.keymaps"
require "config.autocmds"

spec "plugins.bufdelete"
spec "plugins.colorscheme"
spec "plugins.illuminate"
spec "plugins.indentline"
spec "plugins.mason"
spec "plugins.project"
spec "plugins.schemastore"
spec "plugins.telescope"
spec "plugins.whichkey"
spec "plugins.breadcrumbs"
spec "plugins.toggleterm"

require "config.lazy"
