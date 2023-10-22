return {
  {
    "linux-cultist/venv-selector.nvim",
    opts = function(_, opts)
      if require("lazyvim.util").has "nvim-dap-python" then
        opts.dap_enabled = true
        opts.pyenv_path = "/Users/ron.morgenstern/.pyenv/versions"
      end
    end,
  },
}
