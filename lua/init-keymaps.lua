local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Close all windows and exit from neovim
map("n", "<leader>q", ":qa<CR>", default_opts)

map("v", "<A-w>", '"+y', default_opts)
map("n", "<C-y>", '"+gP', default_opts)
map("n", "Y", "yy", default_opts)

map("n", "<Leader>c", "<cmd>cd %:h<CR>", default_opts)
map("n", "<C-l>", "<C-^>", default_opts)

--- terminal
map("t", "<ESC>", "<C-\\><C-n>", default_opts)
map("t", "<C-w><C-w>", "<C-\\><C-n><C-w><C-w><CR>", default_opts)

-- Emacs alike in command line
vim.cmd([[
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
]])

-- just make more sense for me
map("n", "<C-J>", "<C-D>", default_opts)
map("n", "<C-K>", "<C-U>", default_opts)

-- Alt arrow for moving around
vim.cmd([[
nnoremap <M-Up> <C-w><Up>
nnoremap <M-Down> <C-w><Down>
nnoremap <M-Left> <C-w><Left>
nnoremap <M-Right> <C-w><Right>
]])

-- Startify
map("n", "<Space>st", ":Startify<CR>", default_opts)

map("n", "<C-[>", "<cmd>ALEPrevious<CR>", default_opts)
map("n", "<C-]>", "<cmd>ALENext<CR>", default_opts)

-- Replace
map("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", default_opts)
