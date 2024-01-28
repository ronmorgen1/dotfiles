local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}


function M.config()

  local execs = {
    "lua_ls",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    "rust_analyzer",
  }
  
  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = execs,
  }
end

return M
