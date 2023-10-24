local M = {
  "neanias/everforest-nvim",
  version = "main",
  lazy = false,
  priority = 1000,
  config = function()
    require("everforest").setup {
      background = "soft",
    }
  end,
}

function M.config()
  vim.cmd [[colorscheme everforest]]
end

return M
