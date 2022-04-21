setlocal tabstop=2
setlocal shiftwidth=2
set indentexpr=nvim_treesitter#indent()
setlocal autoread
autocmd BufWritePost *.go silent :!go fmt %
