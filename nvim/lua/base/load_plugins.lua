require("lazy").setup({
  "ellisonleao/gruvbox.nvim",
  "lewis6991/gitsigns.nvim",
  "nvim-lualine/lualine.nvim",
  "mason-org/mason.nvim",
  "mason-org/mason-lspconfig.nvim", 
  { "neovim/nvim-lspconfig"},
  { 
    "folke/lazydev.nvim",
    ft = "lua",
  },
  {
    "folke/which-key.nvim", 
    event="VimEnter",
  },
  {
    "nvim-telescope/telescope.nvim", 
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
})
