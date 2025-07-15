mason_null_opts = {
  ensure_installed = {
    'checkmake',
    'prettier', -- ts/js formatter
    'shfmt',
    'ruff',
  },
-- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
}

require('mason-null-ls').setup(mason_null_opts)

local null_ls = require 'null-ls'
local formatting = null_ls.builtins.formatting   -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

local sources = {
  diagnostics.checkmake,
  formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
  formatting.stylua,
  formatting.shfmt.with { args = { '-i', '4' } },
  formatting.terraform_fmt,
  require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
  require 'none-ls.formatting.ruff_format',
}
null_ls.setup(sources)

vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format { async = false} end, {})
