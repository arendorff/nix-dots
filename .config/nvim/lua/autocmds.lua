
-- autocommands

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
-- autocmd BufWritePre * %s/\s\+$//e
-- autocmd BufWritepre * %s/\n\+\%$//e

-- au BufEnter journal.md setlocal filetype=markdown
autocmd BufNewFile,BufRead journal.txt set ft=markdown
-- disable markdown folding for journal. Slows things down.
autocmd BufNewFile,BufRead journal.txt set foldmethod=manual

--vimrc folding
au BufEnter init.vim setlocal foldmethod=marker
-- auto source vimrc
au! BufWritePost $MYVIMRC source %      -- auto source when writing to init.vm alternatively you can run :source $MYVIMRC
