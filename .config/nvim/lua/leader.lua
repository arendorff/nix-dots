
-- leader

-- tab for next buffer
-- vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>')

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- vim.keymap.set('n', '<leader>ee', '<cmd>Explore<cr>')
vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>')

-- buffer
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>')
-- last modified buffer
-- vim.keymap.set('n', '<leader>bb', '<cmd>b#<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>b#<cr>')

-- splits
vim.keymap.set('n', '<leader>sv', '<cmd>vsp<cr>')
vim.keymap.set('n', '<leader>sh', '<cmd>sp<cr>')
vim.keymap.set('n', '<leader>sq', '<cmd>wqa<cr>')
vim.keymap.set('n', '<leader>sc', '<cmd>q<cr>')

-- write
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')

-- quit 
vim.keymap.set('n', '<leader>q', '<cmd>wqa<cr>')

-- terminal
vim.keymap.set('n', '<leader>T', '<cmd>terminal<cr>')

-- tabs
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<leader>tq', '<cmd>tabclose<cr>')
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<leader>tp', '<cmd>tabprev<cr>')

-- dot files
vim.keymap.set('n', '<leader>.v', ':edit ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>.f', ':edit ~/.config/fish/config.fish<cr>')
vim.keymap.set('n', '<leader>.k', ':edit ~/.config/kitty/kitty.conf<cr>')

-- colorizer
vim.keymap.set('n', '<leader>c', ':ColorizerToggle<cr>')

-- source vimrc
vim.keymap.set('n', '<leader>%', ':source ~/.config/nvim/init.vim<cr>')
