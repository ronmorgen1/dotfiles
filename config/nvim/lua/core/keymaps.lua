local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
map("n", "q", "<cmd> q <CR>", opts) -- quit with prompt if unsaved changes
map("n", "Q", "<cmd> qa <CR>") -- quit all without prompt
map("n", "s", "<cmd> w <CR>") -- save
map("v", "<", "<gv") -- keep visual selection after indenting
map("v", ">", ">gv") -- keep visual selection after indenting
map("n", "<leader>l", "<cmd> nohlsearch <CR>", opts) -- clear highlights

-- Tabs
map("n", "<leader>tn", "<cmd> tabnew <CR>", opts) -- new tab
map("n", "<leader>tc", "<cmd> tabclose <CR>", opts) -- close tab
map("n", "<leader>to", "<cmd> tabonly <CR>", opts) -- close all other tabs
map("n", "<Tab>", "<cmd> bNext <CR>", opts) -- next buffer
map("n", "<S-Tab>", "<cmd> bprevious <CR>", opts) -- previous buffer

-- Windows
map("n", "<leader>wh", "<cmd> split <CR>", opts) -- Horizontal split window
map("n", "<leader>wv", "<cmd> vsplit <CR>", opts) -- vertical split window

-- Move between windows
map("n", "[s", "<C-w>w", opts) -- Move cursor to window below/right of the current one
map("n", "]s", "<C-w>W", opts) -- Move cursor to window above/left of the current one
