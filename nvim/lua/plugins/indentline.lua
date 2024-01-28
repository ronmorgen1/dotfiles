local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
}

function M.config()
  require("ibl").setup {
    indent = {
      char = "│",
    },
    scope = {
      enabled = false,
      show_start = false,
      show_end = false,
    },
    exclude = {
      buftypes = { "terminal", "nofile" },
      filetypes = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "text",
      },
    },
  }
end

return M
