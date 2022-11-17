
" Plug {{{



call plug#begin(stdpath('data') . '/plugged')

Plug 'dag/vim-fish'
Plug 'chriskempson/base16-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'cespare/vim-toml'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'lnl7/vim-nix'

" Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
" Plug 'nvim-tree/nvim-tree.lua'

" Plug 'yggdroot/indentline'


call plug#end()
" }}}


" basic settings {{{

" disable status bar
set laststatus=0
" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Paste replace visual selection without copying it
vnoremap <leader>pP "_dP

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

" set noswapfile "no swap files
" " syntax on
" scroll in the middle
set scrolloff=999

" disable mouse support
set mouse=


set formatoptions-=cro                  " Stop newline continution of comments
autocmd FileType * set formatoptions-=cro " had to use an autocommand because ftplugin would keep overwriting these settings. STILL DOESNT WORK with some files. Very annoying.

" " set fileencoding=utf-8                  " The encoding written to file
set clipboard+=unnamedplus               " all yanks are also in clipboard register
" " set autochdir                           " Your working directory will always be the same as your working directory
" " use this instead for automatic changing of directory if something breaks with autochdir
" " autocmd BufEnter * silent! lcd %:p:h

" " "" formatting
set linebreak " to make vim not split words when breaking a line
set tabstop=4
set shiftwidth=0 "number of spaces used for each step auf autoindent, >>, etc.
set softtabstop=2
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set noautoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules
set breakindent " wrapping text respects indentation
"
" " set or unset cursorline cursorbar
" " set cursorline
"
" " spelling
" " set spelllang=en_us,de_de
"
" " Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set nohlsearch " highlight matches of search
set gdefault " use the `g` flag by default.
"
" " allow the cursor to go anywhere in visual Block mode.
" " set virtualedit+=block
"
" "use utf8 encoding
" " set encoding=utf-8
"
" "wann neue zeile?
" " set textwidth=999
" "set wrapmargin=1
"
" "buffers don't disappear when not active
" " set hidden

" }}}

" keybindings {{{

" bindings for easy split nav
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"toggle folds
nnoremap ä za
nnoremap Ä zA

" move about
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

inoremap fj <Esc>
inoremap jf <Esc>
inoremap JF <Esc>
inoremap FJ <Esc>

tnoremap fj <C-\><C-N>
tnoremap jf <C-\><C-N>
tnoremap JF <C-\><C-N>
tnoremap FJ <C-\><C-N>

"S and T (shift+left/right) to move to end or beginning of line.
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" change Y to y$
nnoremap Y y$

 " press esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

"resize using alt keys
noremap <A-up> :resize +1<CR>
noremap <A-down> :resize -1<CR>
noremap <A-left> :vert resize +1<CR>
noremap <A-right> :vert resize -1<CR>

" }}}

" autocommands {{{

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" au BufEnter journal.md setlocal filetype=markdown
autocmd BufNewFile,BufRead journal.txt set ft=markdown

"vimrc folding
au BufEnter init.vim setlocal foldmethod=marker
" auto source vimrc
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC


" " }}}


" lua << EOF
" -- disable netrw at the very start of your init.lua (strongly advised)
" vim.g.loaded_netrw = 1
" vim.g.loaded_netrwPlugin = 1
" -- empty setup using defaults
" require("nvim-tree").setup()

" EOF
