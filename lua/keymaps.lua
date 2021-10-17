local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)

-- Close all windows and exit from neovim
map('n', '<leader>q', ':qa<CR>', default_opts)

---  Comment line
map("n", "<leader>c", "gcc", {})

--- Something i had in emacs for a while 
--
map("n", "<A-j>", "5gj", default_opts)
map("n", "<A-k>", "5gk", default_opts)

-- Emacs alike in command line
vim.cmd([[
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B>		<Left>
cnoremap <C-F>		<Right>
]])
