--  ╭──────────────────────────────────────────────────────────────────────────────╮
--  │           Autocmds are automatically loaded on the VeryLazy event            │
--  │                    Default autocmds that are always set:                     │
--  │ https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua │
--  ╰──────────────────────────────────────────────────────────────────────────────╯

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
