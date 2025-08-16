local function create_floating_input()
	local buf = vim.api.nvim_create_buf(false, true)
	local width, height = 50, 1
	local ui = vim.api.nvim_list_uis()[1]
	local win_opts = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((ui.width - width) / 2),
		row = math.floor((ui.height - height) / 2),
		style = "minimal",
		border = "rounded",
	}
	local win = vim.api.nvim_open_win(buf, true, win_opts)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "" })

	vim.cmd("startinsert")

	-- Set buffer-local keymap for Enter key to confirm input
	vim.keymap.set("i", "<CR>", function()
		local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
		local title = lines[1]:gsub("^%s*(.-)%s*$", "%1") -- trim whitespace
		vim.api.nvim_win_close(win, true)

		if title == "" then
			vim.notify("No title entered, note creation cancelled", vim.log.levels.WARN)
			return
		end

		-- local zk_notebook_dir = vim.fn.expand("~/zknotes")
		-- vim.cmd("lcd " .. zk_notebook_dir)

		vim.cmd(string.format("ZkNew {title = %s }", vim.fn.shellescape(title)))
	end, { buffer = buf, noremap = true, silent = true })

	vim.keymap.set("n", "<ESC>", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buf, noremap = true, silent = true })
end

-- Map your floating input window to <leader>zn or call directly
vim.keymap.set(
	"n",
	"<leader>zn",
	create_floating_input,
	{ noremap = true, silent = true, desc = "Create new zk note with title" }
)
local opts = { noremap = true, silent = true }

-- Open notes picker
vim.keymap.set("n", "<leader>zk", ":ZkNotes<CR>", opts)
vim.api.nvim_set_keymap(
	"n",
	"<leader>zf",
	"<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
	opts
)
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zl", "<Cmd>ZkInsertLink<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
vim.api.nvim_set_keymap(
	"n",
	"<leader>zf",
	"<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
	opts
)
