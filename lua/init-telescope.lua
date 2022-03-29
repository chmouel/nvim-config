vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>le', [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sB', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').git_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sy', [[<cmd>lua require('telescope.builtin').registers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sG', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ss', [[<cmd>lua require('telescope.builtin').builtin()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s;', [[<cmd>lua require('telescope.builtin').command_history()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap( 'n', '<leader>sp', ":lua require'telescope'.extensions.project.project{}<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap( 'n', '<leader>se', ":lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<CR>", {noremap = true, silent = true})
