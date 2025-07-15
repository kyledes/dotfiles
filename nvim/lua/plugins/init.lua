require("plugins.colorscheme")
require("plugins.gitsigns")
require("plugins.telescope")
require("plugins.lualine")
require("plugins.which_key")
require("plugins.lsp_config")
require("plugins.treesitter")
require("plugins.lazydev")
require("plugins.none-ls")
-- replace this with an ls and a loop?

-- local function splitFile(filename, sep)
--  for k, v in string.gmatch(filename, "(%w+)(\\.%w+)") do
--     return k 
--  end
-- end
-- local plugin_config = vim.fn.expand("~/.config/lua/plugins")
--
-- ls = "ls" .. plugin_config 
-- local plugins = {}
-- for dir in io.popen(ls):lines() do plugins[#plugins+1]=splitfile(dir) end
--
-- for i, plugin in pairs(plugins) do
--   require("plugins." .. plugin)
-- end
