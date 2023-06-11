
" -- autocommands
"
" -- Automatically deletes all trailing whitespace and newlines at end of file on save.
" -- autocmd BufWritePre * %s/\s\+$//e
" -- autocmd BufWritepre * %s/\n\+\%$//e
"
" -- au BufEnter journal.md setlocal filetype=markdown
autocmd BufNewFile,BufRead journal.txt set ft=markdown
" -- disable markdown folding for journal. Slows things down.
autocmd BufNewFile,BufRead journal.txt set foldmethod=manual

" enable wrap only for markdown and journal
autocmd BufNewFile,BufRead *.md set wrap
autocmd BufNewFile,BufRead journal.txt set wrap

" disable colorcolumn and textwidth in md files 
" autocmd BufNewFile,BufRead *.md set colorcolumn=0
autocmd BufNewFile,BufRead journal.txt set colorcolumn=0
autocmd BufNewFile,BufRead *.md set colorcolumn=0
autocmd BufNewFile,BufRead *.md set textwidth=0
autocmd BufNewFile,BufRead journal.txt set textwidth=0
" disable cmp autocompletion 
autocmd BufNewFile,BufRead journal.txt :lua require('cmp').setup.buffer { enabled = false }

" --vimrc folding
au BufEnter init.vim setlocal foldmethod=marker
" -- auto source vimrc
" au! BufWritePost $MYVIMRC source %      -- auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" disable IndentLines plugin in md. 
autocmd BufNewFile,BufRead *.md :IndentLinesDisable
autocmd BufNewFile,BufRead journal.txt :IndentLinesDisable
