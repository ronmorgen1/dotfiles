return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require "alpha.themes.dashboard"
      local logo = {
        [[                                                        ]],
        [[ d8b   db d88888b  .d88b.  db    db d888888b .88b  d88. ]],
        [[ 888o  88 88'     .8P  Y8. 88    88   `88'   88'YbdP`88 ]],
        [[ 88V8o 88 88ooooo 88    88 Y8    8P    88    88  88  88 ]],
        [[ 88 V8o88 88~~~~~ 88    88 `8b  d8'    88    88  88  88 ]],
        [[ 88  V888 88.     `8b  d8'  `8bd8'    .88.   88  88  88 ]],
        [[ VP   V8P Y88888P  `Y88P'     YP    Y888888P YP  YP  YP ]],
        [[                                                        ]],
      }

      dashboard.section.header.val = logo

      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button(
          "p",
          " " .. " Find project",
          ":lua require('telescope').extensions.projects.projects()<CR>"
        ),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("s", " " .. " Last Session", [[:lua require("persistence").load({ last = true }) <cr>]]),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }

      return dashboard
    end,

    config = function(_, dashboard)
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)
    end,
  },
}
