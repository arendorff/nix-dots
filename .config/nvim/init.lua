require('settings')
require('plugins')
require('keybinds')
require('leader')
require('abbr')

vim.cmd('source ~/.config/nvim/lua/autocmds.vim')

-- luasnip
vim.cmd('source ~/.config/nvim/after/plugin/luasnip.vim')
-- luasnip plugins
require("luasnip.loaders.from_vscode").lazy_load()


-- cool plugins to check out: 
-- 1. harpoon
-- 2. null-ls
-- 3. prettier vim 



