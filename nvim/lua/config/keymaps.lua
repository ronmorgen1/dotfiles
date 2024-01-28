-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "Q", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
keymap("n", "<c-p>", ":lua require('telescope').extensions.projects.projects()<CR>", opts)
