local M = {
  "neanias/everforest-nvim",
  version = "main",
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.cmd [[colorscheme everforest]]
  require("everforest").setup {
    background = "soft",
  }
end

return M
