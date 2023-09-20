require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { { "prettier" } },
    zsh = { { "shfmt" } },
    sh = { { "shfmt" } },
    python = { { "black" } }
  },
}
