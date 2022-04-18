--- Install pack
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
	false
)

local use = require("packer").use
require("packer").startup(function()
	use("karb94/neoscroll.nvim")
	use("mg979/vim-visual-multi")
	use({
		"RRethy/vim-hexokinase",
		run = "make hexokinase",
		cmd = { "HexokinaseToggle" },
	})
	use({
		"ntpeters/vim-better-whitespace",
	})
	use({
		"projekt0n/github-nvim-theme",
	})
	use("wbthomason/packer.nvim") -- Package manager
	use({
		"mhinz/vim-startify",
	})
	use("tpope/vim-commentary") -- "gc" to comment visual regions/lines
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			{
				"nvim-telescope/telescope-frecency.nvim",
				requires = { "tami5/sqlite.lua" },
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					color_devicons = true,
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
				},
			})
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("project")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("frecency")
		end,
		cond = function()
			return vim.fn.has("nvim-0.6") == 1
		end,
	})
	use({
		"junegunn/fzf",
		cond = function()
			return vim.fn.has("nvim-0.6") == 0
		end,
	})
	use({
		"junegunn/fzf.vim",
		cond = function()
			return vim.fn.has("nvim-0.6") == 0
		end,
	})
	use("Mofiqul/dracula.nvim") -- theme
	use({
		"neovim/nvim-lspconfig",
	})
	use("dense-analysis/ale")
	use("abecodes/tabout.nvim")
	use("ruanyl/vim-gh-line")
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		cond = function()
			return vim.fn.has("nvim-0.6") == 1
		end,
	})
	use({ "cespare/vim-toml" })
	use({
		"mhartington/formatter.nvim",
		config = function() end,
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use({ "hrsh7th/nvim-cmp", requires = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	} })
	use("terryma/vim-expand-region")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
	})
	use({
		"kyazdani42/nvim-tree.lua",
	})
	use({
		"romgrk/barbar.nvim",
		cond = function()
			return vim.fn.has("nvim-0.6") == 1
		end,
	})
	use({
		"famiu/feline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
end)

require("init-settings")
require("init-keymaps")

require("init-feline")
require("init-nvim-cmp")
require("init-treesitter")
require("init-barbar")
require("init-tree")
require("init-format")
require("init-lspconfig")
require("init-telescope")
require("init-hexokinase")
require("init-whitespace")
require("init-github-theme")
require("init-neoscroll")

pcall(require, "local")
