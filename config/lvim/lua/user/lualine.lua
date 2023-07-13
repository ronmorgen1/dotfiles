local M = {}

local components = require("lvim.core.lualine.components")

local diagnostics = {
	"diagnostics",

	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },

	diagnostics_color = {
		error = "Statusline",
		warn = "Statusline",
		info = "Statusline",
		hint = "Statusline",
	},
	symbols = {
		error = lvim.icons.diagnostics.Error .. " ",
		warn = lvim.icons.diagnostics.Warning .. " ",
		info = "I",
		hint = "H",
	},
	colored = false, -- Displays diagnostics status in color if set to true.
	update_in_insert = false, -- Update diagnostics in insert mode.
	always_visible = true, -- Show diagnostics even if there are none.
}

local function env()
	local current_env = os.getenv("PYENV_VERSION")
	local icon = "🐍"
	return string.format("%#s %#s", icon, current_env)
end

M.config = function()
	lvim.builtin.lualine.style = "lvim"
	lvim.builtin.lualine.sections.lualine_a = { components.mode }
	lvim.builtin.lualine.sections.lualine_b = { components.branch, diagnostics, env }
	lvim.builtin.lualine.sections.lualine_c = {}

	lvim.builtin.lualine.sections.lualine_x = {}
	lvim.builtin.lualine.sections.lualine_y = { components.encoding, components.filetype }
	lvim.builtin.lualine.sections.lualine_z = { components.location }
end

return M
