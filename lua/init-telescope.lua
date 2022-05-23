vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader><leader>",
	"<cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-B>",
	[[<cmd>lua require('telescope.builtin').buffers({ignore_current_buffer = true, sort_last_used = true})<CR>]],
	{ noremap = true, silent = true }
)
-- vim.api.nvim_set_keymap('n', '<leader>le', [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>sB",
	[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sd",
	[[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-f>",
	[[<cmd>lua require('telescope.builtin').git_files({previewer = false})<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sy",
	[[<cmd>lua require('telescope.builtin').registers()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sg",
	[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ss",
	[[<cmd>lua require('telescope.builtin').builtin({include_extensions = true })<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader><C-S>",
	[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"i",
	"<C-S>",
	[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>s;",
	[[<cmd>lua require('telescope.builtin').command_history()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-A-x>",
	[[<cmd>lua require('telescope.builtin').command_history()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>s.",
	[[<cmd>lua require('telescope.builtin').fd()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-p>",
	":lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>se",
	":lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<CR>",
	{ noremap = true, silent = true }
)
