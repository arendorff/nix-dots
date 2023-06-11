

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'chriskempson/base16-vim'
    use 'vim-scripts/loremipsum'
    use 'tpope/vim-speeddating'
    use 'tpope/vim-repeat'
    use 'godlygeek/tabular'
    use 'tpope/vim-commentary'
    -- use 'tpope/vim-surround'
    use 'dag/vim-fish'
    use 'lnl7/vim-nix'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim' -- needed for telescope I think
    use 'nvim-tree/nvim-tree.lua'
    -- use 'nvim-tree/nvim-web-devicons'
    -- use 'raimondi/delimitmate'


    use 'ggandor/leap.nvim'

    use 'farmergreg/vim-lastplace'
    use 'windwp/nvim-autopairs'
    use 'yggdroot/indentline'

    use 'mattn/emmet-vim'

    use 'sbdchd/neoformat'

    use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
-- use 'neovim/nvim-lspconfig'
-- Autocompletion
-- use 'hrsh7th/nvim-cmp'         -- Required
-- use 'hrsh7th/cmp-nvim-lsp'     -- Required
-- use 'hrsh7th/cmp-buffer'       -- Optional
-- use 'hrsh7th/cmp-path'         -- Optional
-- use 'saadparwaiz1/cmp_luasnip' -- Optional
-- use 'hrsh7th/cmp-nvim-lua'     -- Optional

-- Snippets
-- use 'L3MON4D3/LuaSnip'             -- Required
-- use 'rafamadriz/friendly-snippets' -- Optional

    use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'main',
    -- branch = 'v1.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
    }
}


-- follow latest release and install jsregexp.
-- use 'L3MON4D3/LuaSnip', {'tag': '1.2.1', 'do': 'make install_jsregexp'}

-- use({
-- 	"L3MON4D3/LuaSnip",
-- 	-- follow latest release.
-- 	tag = "v<CurrentMajor>.*",
-- 	-- install jsregexp (optional!:).
-- 	run = "make install_jsregexp"
-- })

-- use 'rafamadriz/friendly-snippets' -- vscode snippets for luasnip

-- Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
-- Plug 'nvim-tree/nvim-tree.lua'

-- Plug 'yggdroot/indentline'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

