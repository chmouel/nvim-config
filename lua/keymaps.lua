local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)

-- Close all windows and exit from neovim
map('n', '<leader>q', ':qa<CR>', default_opts)

--- Something i had in emacs for a while 
--
map("n", "<A-j>", "5gj", default_opts)
map("n", "<A-k>", "5gk", default_opts)

map("n", "Y", "yy", default_opts)
map("t", "<ESC>", "<C-\\><C-n>", default_opts)
map("t", "<A-Left>", "<C-\\><C-n>:bp<CR>", default_opts)

-- Emacs alike in command line
vim.cmd([[
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B>		<Left>
cnoremap <C-F>		<Right>
]])

-- Alt arrow for moving around
vim.cmd([[
nnoremap <M-Up> <C-w><Up>
nnoremap <M-Down> <C-w><Down>
nnoremap <M-Left> <C-w><Left>
nnoremap <M-Right> <C-w><Right>
]])
