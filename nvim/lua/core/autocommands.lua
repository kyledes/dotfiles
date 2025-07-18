-- Highlight when yankin) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--[[ this, but lua .. kinda
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
]]
local highlight = function()
	if vim.bo.buftype == "nofile" or vim.bo.buftype == "terminal" then
		return
	end

	command = string.format([[match %s /\s\+$/]], "DiffDelete")
	vim.cmd(command)
end

local ws_group = vim.api.nvim_create_augroup("highlight-ws", { clear = true })

vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertLeave" }, {
	desc = "Highlight trailing white space",
	group = ws_group,
	pattern = "*",
	callback = highlight,
})

remove_ws = function()
	local save_cursor = vim.fn.getpos(".")
	vim.cmd([[keeppatterns %substitute/\v\s+$//eg]])
	vim.fn.setpos(".", save_cursor)
end

vim.keymap.set("n", "<leader>rs", remove_ws, { desc = "[r]emove trailing white[s]pace" })
