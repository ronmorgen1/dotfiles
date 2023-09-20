vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "silent !tmux set status off"
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd "silent !tmux set status on"
  end,
})