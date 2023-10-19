local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
}

function M.config()
	local function search_result()
		if vim.v.hlsearch == 0 then
			return ""
		end
		local last_search = vim.fn.getreg("/")
		if not last_search or last_search == "" then
			return ""
		end
		local searchcount = vim.fn.searchcount({ maxcount = 9999 })
		return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
	end

	require("lualine").setup({
		options = {
			theme = everforest,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
				{
					"diagnostics",
					source = { "nvim" },
					sections = { "error" },
				},
				{
					"diagnostics",
					source = { "nvim" },
					sections = { "warn" },
				},
				{ "filename", file_status = false, path = 1 },
				{
					"%w",
					cond = function()
						return vim.wo.previewwindow
					end,
				},
				{
					"%r",
					cond = function()
						return vim.bo.readonly
					end,
				},
				{
					"%q",
					cond = function()
						return vim.bo.buftype == "quickfix"
					end,
				},
			},
			lualine_c = {},
			lualine_x = {},
			lualine_y = { search_result, "filetype" },
			lualine_z = { "%l:%c", "%p%%/%L" },
		},
		inactive_sections = {
			lualine_c = { "%f %y %m" },
			lualine_x = {},
		},
		extensions = {},
	})
end

return M
