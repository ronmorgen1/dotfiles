local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
}

function M.config()
  local mappings = {
    ["w"] = { "<cmd>write<CR>", "Save" },
    ["W"] = { "<cmd>wall<CR>", "Save all" },
    [","] = { "<cmd>Telescope buffers<CR>", "Switch BUffer" },
    ["."] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Open File " },
    g = {
       name = "Git",
      s = { "<cmd>Telescope git_status<cr>", "Status" },
      b = { "<cmd>Telescope git_branches<cr>", "Branches" },
      c = { "<cmd>Telescope git_commits<cr>", "Commits" },
    },
    f = {
      name = "Find",
      ["f"] = { "<cmd>Telescope find_files<CR>", "Find project files" },
      ["r"] = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
      ["b"] = { "<cmd>Telescope buffers<CR>", "Buffers" },
      ["p"] = { "<cmd>Telescope projects<CR>", "Projects" },
      ["w"] = { "<cmd>Telescope live_grep<CR>", "Word" },
      ["k"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    },
    p = {
      name = "Plugins",
      ["i"] = { "<cmd>Lazy install<cr>", "Install" },
      ["s"] = { "<cmd>Lazy sync<cr>", "Sync" },
      ["S"] = { "<cmd>Lazy clear<cr>", "Status" },
      ["c"] = { "<cmd>Lazy clean<cr>", "Clean" },
      ["u"] = { "<cmd>Lazy update<cr>", "Update" },
      ["p"] = { "<cmd>Lazy profile<cr>", "Profile" },
      ["l"] = { "<cmd>Lazy log<cr>", "Log" },
      ["d"] = { "<cmd>Lazy debug<cr>", "Debug" },
    },
    t = {
      name = "Tab",
      ["s"] = {
        "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
        "Find Tab",
      },
      ["n"] = { "<cmd>tabnew<cr>", "New" },
      ["c"] = { "<cmd>tabclose<cr>", "Close" },
      ["C"] = { "<cmd>tabonly<cr>", "Close Others" },
    },
  }

  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }

  local vmappings = {
    ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    },
  }

  local vopts = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }

  local which_key = require "which-key"

  which_key.setup {
    plugins = {
      marks = true,
      registers = false,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    popup_mappings = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    window = {
      border = "rounded",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    ignore_missing = true,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    show_keys = true,
    triggers = "auto",
    triggers_blacklist = {
      i = { "j", "k" },
      v = { "j", "k" },
    },
    disable = {
      buftypes = { "Quickfix", "nofile", "prompt" },
      filetypes = { "TelescopePrompt" },
    },
  }

  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)
end

return M
