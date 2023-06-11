
-- keybindings

-- bindings for easy split nav
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- toggle folds
vim.keymap.set('n', 'ä', 'za')
vim.keymap.set('n', 'Ä', 'zA')

-- vim.keymap.set('n', 'j', 'gj')
-- vim.keymap.set('n', 'k', 'gk')
-- vim.keymap.set('v', 'j', 'gj')
-- vim.keymap.set('v', 'k', 'gk')

vim.keymap.set('i', 'fj', '<Esc>')
vim.keymap.set('i', 'jf', '<Esc>')
vim.keymap.set('i', 'JF', '<Esc>')
vim.keymap.set('i', 'FJ', '<Esc>')

-- vim.keymap.set('t', 'fj', '<C-\><C-N>')
-- vim.keymap.set('t', 'jf', '<C-\><C-N>')
-- vim.keymap.set('t', 'JF', '<C-\><C-N>')
-- vim.keymap.set('t', 'FJ', '<C-\><C-N>')

-- S and T (shift+left/right) to move to end or beginning of line.
vim.keymap.set('n', 'H', '^')
vim.keymap.set('v', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'L', '$')

-- change Y to y$
vim.keymap.set('n', 'Y', 'y$')

-- press esc to exit terminal mode
-- vim.keymap.set('t', '<Esc>', '<C-\><C-n')

-- resize using alt keys
vim.keymap.set('n', '<A-up>', ':resize +1<CR>')
vim.keymap.set('n', '<A-down>', ':resize -1<CR>')
vim.keymap.set('n', '<A-left>', ':vert resize +1<CR>')
vim.keymap.set('n', '<A-right>', ':vert resize -1<CR>')


-- emmet leader key
-- vim.g.user_emmet_leader_key = '<A-Z>'
vim.g.user_emmet_leader_key = '<C-Z>'
