return {
  {
    "neanias/everforest-nvim",
    version = "main",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup {
        background = "soft",
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
