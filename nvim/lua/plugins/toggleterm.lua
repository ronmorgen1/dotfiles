local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
}

function M.config()

  require("toggleterm").setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
    },
  }

  -- TODO: Move to `lua/config/autocmd.lua` (?)
  vim.api.nvim_create_autocmd({ "TermEnter" }, {
    pattern = { "*" },
    callback = function()
      vim.cmd "startinsert"
    end,
  })

end

return M