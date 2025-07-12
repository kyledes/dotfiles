vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.filetype = "on"
vim.g.have_nerd_font = true

--Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
local home_config = vim.fn.expand("~/.config")

vim.opt.undofile = true
vim.opt.undodir= {home_config .. "/nvim/undodir"}

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10


local group = vim.api.nvim_create_augroup("FileTypeOptions", { clear = true })

--[[ I think filetype option does this with sensible defaults
 function setFileType(ts, sw, sts, et)
    vim.opt.tabstop = ts
    vim.opt.shiftwidth = sw
    vim.opt.softtabstop = sts
    vim.opt.expandtab = et
 
 end
 
 vim.api.nvim_create_autocmd("BufEnter", { 
   callback = function() setFileType(2, 2, 2, true)end, 
   group = group, 
   pattern = {".yaml"},
 })
]]
