local M = {}

M.config = function()
  local opts = { noremap = true, silent = true }

  -- Move/Escapse Insert mode
  lvim.keys.insert_mode["jj"] = "<Esc>"
  lvim.keys.insert_mode["<C-h"] = "<Left>"
  lvim.keys.insert_mode["<C-j"] = "<Down>"
  lvim.keys.insert_mode["<C-k"] = "<Up>"
  lvim.keys.insert_mode["<C-l"] = "<Right>"

  -- Split/Navigate Buffer
  lvim.keys.normal_mode["-"] = ":split<CR>"
  lvim.keys.normal_mode["|"] = ":vsplit<CR>"
  lvim.keys.normal_mode["<S-h>"] = "<Cmd>BufferLineCyclePrev<CR>"
  lvim.keys.normal_mode["<S-l>"] = "<Cmd>BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["[b"] = "<Cmd>BufferLineMoveNext<CR>"
  lvim.keys.normal_mode["]b"] = "<Cmd>BufferLineMovePrev<CR>"

  -- Hitting escape also clears spelling and search highlights
  vim.api.nvim_set_keymap(
    "n",
    "<ESC>",
    ":nohls |:set norelativenumber | :setlocal nospell<ESC>",
    opts
  )

  -- When you search, center the result and open any folds
  vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)

  -- When you search backwards, center the result and open any folds
  vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)

  -- Yank from the current position to the end of the line
  vim.api.nvim_set_keymap("n", "Y", "y$", opts)
end

return M
