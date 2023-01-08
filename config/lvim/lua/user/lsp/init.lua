vim.diagnostic.config({ virtual_text = false })

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

local M = {}

M.config = function()
	local formatters = require("lvim.lsp.null-ls.formatters")
	local linters = require("lvim.lsp.null-ls.linters")

	formatters.setup({
		{ command = "stylua", filetypes = { "lua" } },
		{ command = "shfmt", filetypes = { "sh", "zsh" } },
		{ command = "black", filetypes = { "python" } },
		{ command = "prettier", filetypes = { "yaml", "json" } },
	})

	linters.setup({
		{ command = "eslint_d", filetypes = { "javascript" } },
		{ command = "flake8", filetypes = { "python" } },
	})
end

return M
