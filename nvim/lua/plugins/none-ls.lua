local mason_null_opts = {
	ensure_installed = {
		"checkmake",
		"prettier", -- ts/js formatter
		"shfmt",
		"ruff",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
}

require("mason-null-ls").setup(mason_null_opts)
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

local opts = {
	sources = {
		diagnostics.checkmake,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
		formatting.stylua,
		formatting.shfmt.with({ args = { "-i", "4" } }),
		formatting.terraform_fmt,
		require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
		require("none-ls.formatting.ruff_format"),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
}
null_ls.setup(opts)

vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format({ async = false })
end, {})
