local map = vim.keymap.set

-- General
map("n", "q", "<cmd> lua require('config.functions').smart_quit() <CR>") -- quit with prompt if unsaved changes
map("n", "Q", "<cmd> qa <CR>") -- quit all without prompt
map("n", "s", "<cmd> w <CR>") -- save
map("v", "<", "<gv") -- keep visual selection after indenting
map("v", ">", ">gv") -- keep visual selection after indenting
map("n", "<leader>l", "<cmd> nohlsearch <CR>") -- clear highlights

-- Tabs
map("n", "<leader>tn", "<cmd> tabnew <CR>") -- new tab
map("n", "<leader>tc", "<cmd> tabclose <CR>") -- close tab
map("n", "<leader>to", "<cmd> tabonly <CR>") -- close all other tabs
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")

-- Windows
map("n", "<leader>wh", "<cmd> split <CR>") -- Horizontal split window
map("n", "<leader>wv", "<cmd> vsplit <CR>") -- vertical split window

-- Move between windows
map("n", "[s", "<C-w>w") -- Move cursor to window below/right of the current one
map("n", "]s", "<C-w>W") -- Move cursor to window above/left of the current one

-- nvimtree
-- map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
-- map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")

-- comment.nvim
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)

map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- format
map("n", "<leader>fm", function()
  require("conform").format()
end)
