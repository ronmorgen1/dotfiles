local M = {}

M.config = function()
	lvim.plugins = {
		{ "akinsho/toggleterm.nvim" },
		{ "rebelot/kanagawa.nvim" },
		{ "simrat39/rust-tools.nvim" },
		{
			"f-person/git-blame.nvim",
			event = "BufRead",
			config = function()
				vim.g.gitblame_enabled = 0
				vim.g.gitblame_message_template = "<summary> • <date> • <author>"
				vim.g.gitblame_date_format = "%r"
				vim.g.gitblame_virtual_text_column = 85
			end,
		},
		{
			"chrisbra/csv.vim",
			ft = { "csv" },
			enabled = lvim.builtin.csv_support,
		},
		{
			"saecki/crates.nvim",
			version = "v0.3.0",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("crates").setup({
					null_ls = {
						enabled = true,
						name = "crates.nvim",
					},
					popup = {
						border = "rounded",
					},
				})
			end,
		},
		{
			"zbirenbaum/copilot.lua",
			event = { "VimEnter" },
			config = function()
				vim.defer_fn(function()
					require("copilot").setup({
						plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
					})
				end, 100)
			end,
		},
		{
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup()
			end,
		},
		{
			"ruifm/gitlinker.nvim",
			event = "BufRead",
			config = function()
				require("gitlinker").setup({
					opts = {
						add_current_line_on_normal_mode = true,
						action_callback = require("gitlinker.actions").copy_to_clipboard,
						print_url = true,
					},
				})
			end,
			dependencies = "nvim-lua/plenary.nvim",
		},
		{
			"vladdoster/remember.nvim",
			event = { "BufRead", "BufNewFile" },
			config = function()
				require("remember").setup({
					open_folds = true,
				})
			end,
		},
	}

	-- Can not be placed into the config method of the plugins.
	lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
	table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
end

return M
