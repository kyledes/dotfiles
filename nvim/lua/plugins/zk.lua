local zk_home = os.getenv("ZK_NOTEBOOK_DIR")
require("zk").setup({
	-- Can be "telescope", "fzf", "fzf_lua", "minipick", "snacks_picker",
	-- or select" (`vim.ui.select`).
	picker = "telescope",
	home = zk_home,

	lsp = {
		-- `config` is passed to `vim.lsp.start(config)`
		config = {
			name = "zk",
			cmd = { "zk", "lsp" },
			filetypes = { "markdown" },
			-- on_attach = ...
			-- etc, see `:h vim.lsp.start()`
		},

		-- automatically attach buffers in a zk notebook that match the given filetypes
		auto_attach = {
			enabled = true,
		},
	},
})
-- print("zk notebook directory configured as: ", zk_home)
require("telescope").load_extension("zk")
