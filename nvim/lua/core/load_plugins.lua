require("lazy").setup({
	"ellisonleao/gruvbox.nvim",
	"tpope/vim-commentary",
	"lewis6991/gitsigns.nvim",
	"DrKJeff16/project.nvim",
	"zk-org/zk-nvim",
	"MeanderingProgrammer/render-markdown.nvim",
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"jayp0521/mason-null-ls.nvim",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"mason-org/mason.nvim",
	"ThePrimeagen/vim-be-good",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
	},
	"mason-org/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"neovim/nvim-lspconfig",
	"saghen/blink.cmp",
	{
		"folke/lazydev.nvim",
		ft = "lua",
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter",
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
})
