vim.cmd([[
  nnoremap <f10> :NvimTreeToggle<CR>
]])

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	renderer = {
		icons = {
			webdev_colors = false,
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	view = {
		width = 25,
		height = 30,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {},
		},
	},
})
