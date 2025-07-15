local nvim_treesitter_configs = require 'nvim-treesitter.configs'

nvim_treesitter_configs.setup {
  ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'query', 'vim', 'vimdoc', 'python', 'go', 'dockerfile', 'cpp' },
  -- Autoinstall languages that are not installed
  auto_install = true,
  highlight = {
    enable = true,
    aditional_vim_regex_highlighting = false,
  },
  indent = { enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
