--  ╭─────────────────────────────────────────────────────────────────────────────╮
--  │          Options are automatically loaded before lazy.nvim startup          │
--  │                     Default options that are always set:                    │
--  │ https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua │
--  ╰─────────────────────────────────────────────────────────────────────────────╯

vim.g.mapleader = " "

vim.opt.expandtab = false -- Use tabs instead of spaces
vim.opt.grepprg = "rg --vimgrep --smart-case --"
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.shortmess:append { W = true, I = true, c = true }
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
vim.opt.pumblend = 10
vim.g.open_command = vim.g.os == "Darwin" and "open" or "xdg-open"
vim.g.dotfiles = vim.env.DOTFILES or vim.fn.expand "~/.dotfiles"
vim.g.vim_dir = vim.g.dotfiles .. "/.config/nvim"

-- Stop loading built in plugins
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.logipat = 1

-- Disable some extension providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Ensure all auto commands are cleared
vim.api.nvim_create_augroup("vimrc", {})

if vim.fn.has "nvim-0.8" == 1 then
  vim.opt.backup = true
  vim.opt.cmdheight = 0
  vim.opt.backupdir = vim.fn.stdpath "state" .. "/backup"
end

---- Enable spell check by default unless in vscode
if not vim.g.vscode then
  vim.o.spell = true
end

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_floating_blur = 0
  vim.g.neovide_floating_opacity = 90
  vim.opt.guifont = "FiraCode Nerd Font:h13"
end
