return {

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = vim.fn.has "nvim-0.10" },
      format_on_save = false,
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "stylua", "shellcheck", "shfmt" })
      opts.ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      }
    end,
  },
}
