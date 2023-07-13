local M = {}

M.config = function()
	lvim.builtin.which_key.mappings["/"] = {}
	lvim.builtin.which_key.mappings["t"] = {
		name = "+Terminal",
		f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
		v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
		h = {
			"<cmd>2ToggleTerm size=30 direction=horizontal<cr>",
			"Split horizontal",
		},
	}
	lvim.builtin.which_key.mappings["g"] = {
		name = "+Git",
		g = {
			"<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>",
			"Lazygit",
		},
		j = {
			"<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
			"Next Hunk",
		},
		k = {
			"<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
			"Prev Hunk",
		},
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
		y = {
			"<cmd>lua require 'gitlinker'.get_buf_range_url({action_callback = require 'gitlinker.actions'.copy_to_clipboard})<cr>",
			"Copy Parmalink",
		},
	}
	lvim.builtin.which_key.mappings["E"] = {
		name = "+Enviorment",
		s = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Select Virtual Enviorment" },
		c = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Current Virtual Enviorment" },
	}
end

return M
