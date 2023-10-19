if vim.loader and vim.fn.has("nvim-0.9.1") == 1 then
	vim.loader.enable()
end

for _, source in ipairs({
	"core.options",
	"core.keymaps",
	"core.autocmds",
	"core.launch",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end

-- UI
spec("plugins.ui.lualine")
spec("plugins.ui.colorscheme")
spec("plugins.ui.alpha")

-- LSP
spec("plugins.lsp.mason")
spec("plugins.lsp.lspconfig")

-- Editor
spec("plugins.editor.telescope")

-- Utils
spec("plugins.utils.project")

-- DO NOT INSERT ANYTHING BELOW THIS LINE (lazy.nvim bootstrap)
require("core.lazy")
