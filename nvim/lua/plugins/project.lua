require("project_nvim").setup({
	detection_methods = { "lsp", "pattern" },
	patterns = { ".git", "Makefile", "package.json", "go.mod" },

	-- Automatically change directory when project changes
	manual_mode = false,
	silent_chdir = true,
	scope_chdir = "global", -- or 'window'
})
