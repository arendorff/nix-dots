-- basic settings

-- Allow gf to open non-existent files
-- map gf :edit <cfile><cr>

-- Reselect visual selection after indenting
-- vnoremap < <gv
-- vnoremap > >gv

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
-- vnoremap y myy`y
-- vnoremap Y myY`y

-- Paste replace visual selection without copying it
-- vnoremap <leader>pP "_dP

-- Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
vim.o.splitbelow = true
vim.o.splitright = true

-- scroll in the middle
vim.o.scrolloff = 999

vim.g.mapleader = ' '  -- map leader to Space

-- Stop newline continution of comments
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

vim.cmd [[set formatoptions-=cro]]               -- Stop newline continution of comments
vim.cmd [[set clipboard+=unnamedplus]]               -- all yanks are also in clipboard register

vim.o.linebreak = true -- to make vim not split words when breaking a line
vim.o.tabstop = 2
vim.o.shiftwidth = 0 -- number of spaces used for each step auf autoindent, >>, etc.
vim.o.softtabstop = 2
vim.o.expandtab = true -- use spaces instead of tabs.
vim.o.smarttab = true -- let's tab key insert 'tab stops', and bksp deletes tabs.
vim.o.shiftround = true -- tab / shifting moves to closest tabstop.
vim.o.autoindent = true -- Match indents on new lines.
vim.o.smartindent = true -- Intellegently dedent / indent new lines based on rules
vim.o.breakindent = true -- wrapping text respects indentation
vim.o.wrap = false --  disable wrap
-- vim.o.number = true --  disable wrap
-- vim.o.relativenumber = true --  disable wrap
-- vim.o.textwidth = 100 
-- vim.o.colorcolumn = 100 
-- vim.g.colorcolumn = 100 
-- vim.cmd [[set colorcolumn=100
          -- set textwidth=100]]
vim.cmd("set colorcolumn=100")
vim.cmd("set textwidth=99")

-- Make search more sane
vim.o.ignorecase = true -- case insensitive search
vim.o.smartcase = true -- If there are uppercase letters, become case-sensitive.
vim.o.incsearch = true -- live incremental searching
vim.o.showmatch = true -- live match highlighting
vim.o.hlsearch = false -- highlight matches of search
vim.o.gdefault = true -- use the `g` flag by default.

-- enable markdown syntax hightlighting in codeblocks (not enabled by default)
vim.g.markdown_fenced_languages = {'html', 'python', 'css', 'javascript', 'lua', 'vim'}
-- enable markdown folding for headers
vim.g.markdown_folding = 1

-- colorscheme
vim.o.termguicolors = true -- necessary 
vim.cmd.colorscheme('base16-default-dark')

