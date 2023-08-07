local M = {}

M.config = function()
  vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
      vim.cmd "set formatoptions-=cro"
    end,
  })

  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
      vim.cmd "silent! lcd %:p:h"
    end,
  })

  vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
      vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
    end,
  })
end

return M
