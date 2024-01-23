local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  require("lualine").setup {
    options = {
      theme = "auto",
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          { "diff", separator = { left = "" } },
          { "filetype" },
        },
        lualine_y = {},
        lualine_z = {
          { "location", padding = { left = 0, right = 1 } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  }
end

return M
