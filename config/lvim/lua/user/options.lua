local M = {}

M.config = function()
	lvim.builtin.breadcrumbs.active = true
	lvim.builtin.dap.active = true
	lvim.builtin.illuminate.active = false
	lvim.builtin.comment.active = false
	lvim.builtin.lualine.theme = "kanagawa-dragon"
	lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
	lvim.builtin.nvimtree.setup.view.side = "left"
	lvim.builtin.terminal.active = true
	lvim.builtin.terminal.open_mapping = "<C-t>"
	lvim.builtin.terminal.persist_mode = false
	lvim.colorscheme = "kanagawa-dragon"
	lvim.format_on_save = false
	lvim.log.level = "warn"
	lvim.reload_config_on_save = true
	lvim.transparent_window = false
	lvim.undofile = false
	lvim.guicursor = ""
	vim.g.dashboard_disable_statusline = 1
	vim.g.dashboard_enable_session = 0
	vim.g.loaded_perl_provider = 0
	vim.g.ultest_deprecation_notice = 0
	vim.g.ultest_summary_width = 30
	vim.opt.autowriteall = true -- automatically :write before running commands and changing files
	vim.opt.background = "dark"
	vim.opt.backup = false -- No backup files
	vim.opt.clipboard = "unnamedplus"
	vim.opt.cmdheight = 1
	vim.opt.completeopt = { "menu", "menuone", "noselect" }
	vim.opt.confirm = true -- make vim prompt me to save before doing destructive things
	vim.opt.exrc = false -- Allow project local vimrc files example .nvimrc see :h exrc
	vim.opt.hidden = true
	vim.opt.joinspaces = false
	vim.opt.list = true
	vim.opt.pumblend = 10
	vim.opt.guicursor = ""
	vim.opt.redrawtime = 1500
	vim.opt.relativenumber = false
	vim.opt.secure = true -- Disable autocmd etc for project local vimrc files.
	vim.opt.showcmd = true -- show command in bottom bar
	vim.opt.smartindent = true
	vim.opt.swapfile = false -- No swap files
	vim.opt.termguicolors = true
	vim.opt.timeoutlen = 250
	vim.opt.ttimeoutlen = 10
	vim.opt.ttyfast = true
	vim.opt.undofile = false
	vim.opt.updatetime = 100
	vim.opt.wrap = true
	vim.opt.wrapscan = true -- Searches wrap around the end of the file
	vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
	vim.wo.foldlevel = 4
	vim.wo.foldmethod = "expr"
	vim.wo.foldminlines = 1
	vim.wo.foldnestmax = 3
	vim.opt.wildignore = {
		"*.aux,*.out,*.toc",
		"*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
		-- media
		"*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
		"*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
		"*.eot,*.otf,*.ttf,*.woff",
		"*.doc,*.pdf",
		-- archives
		"*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
		-- temp/system
		"*.*~,*~ ",
		"*.swp,.lock,.DS_Store,._*,tags.lock",
		-- version control
		".git,.svn",
		--rust
		"Cargo.lock,Cargo.Bazel.lock",
	}
end

return M
