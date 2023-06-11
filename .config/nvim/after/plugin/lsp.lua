-- -- require'lspconfig'.eslint.setup{}
-- require'lspconfig'.tsserver.setup{}
-- require'lspconfig'.lua_ls.setup{}

-- require'lspconfig'.eslint.setup{
--     cmd = { "eslint", "--stdio" }
--     -- cmd = { "vscode-eslint-language-server", "--stdio" }
-- }

-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }

 -- lsp zero stuff below:

 local lsp = require('lsp-zero').preset({
   name = 'recommended',
   -- set_lsp_keymaps = true,
   set_lsp_keymaps = {preserve_mappings = false}, -- overwrite existing keymaps. 
   manage_nvim_cmp = true,
   suggest_lsp_servers = true,
 })

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()



