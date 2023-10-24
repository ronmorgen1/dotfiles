local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)
