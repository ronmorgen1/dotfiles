local M = {}

M.config = function()
  lvim.plugins = {
    { "akinsho/toggleterm.nvim" },
    { "sainnhe/everforest" },
    {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = {
          enabled = true,
          layout = {
            position = "bottom",
            size = 0.4
          }
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end,
  },
  }
end

return M
