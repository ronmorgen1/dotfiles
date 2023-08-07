local M = {}

M.config = function()
  lvim.builtin.lualine.sections.lualine_a = { "mode" }

  lvim.builtin.lualine.sections.lualine_b = { "branch" }
  lvim.builtin.lualine.sections.lualine_c = { "diagnostics" }
  lvim.builtin.lualine.sections.lualine_x = { "encoding", "filetype" }
  lvim.builtin.lualine.sections.lualine_y = { "spaces" }
  lvim.builtin.lualine.sections.lualine_z = { "location" }
end

return M
