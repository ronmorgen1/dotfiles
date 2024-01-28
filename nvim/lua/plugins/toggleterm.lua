local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
}

function M.config()
  require("toggleterm").setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
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
     winblend = 0,
     highlights = {
      border = "Normal",
      background = "Normal",
     },
    },
  }

  vim.cmd [[
  augroup terminal_setup | au!
  autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
  autocmd TermEnter * startinsert!
  augroup end
  ]]

  vim.api.nvim_create_autocmd({ "TermEnter" }, {
    pattern = { "*" },
    callback = function()
      vim.cmd "startinsert"
      _G.set_terminal_keymaps()
    end,
  })

  local opts = { noremap = true, silent = true }
  function _G.set_terminal_keymaps()
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  end

end

return M
