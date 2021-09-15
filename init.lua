--- Install pack
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
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

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'Mofiqul/dracula.nvim' -- theme
  use { 'hoob3rt/lualine.nvim',   requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'abecodes/tabout.nvim'
  use 'ruanyl/vim-gh-line'
  use { 'hrsh7th/nvim-cmp', requires = {
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp";
    } 
  }
  use 'terryma/vim-expand-region'
  use 'NTBBloodbath/doom-one.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate'
  };
  use {'nvim-treesitter/nvim-treesitter-textobjects'};
  use 'romgrk/barbar.nvim';
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  };
end)

require('settings')
require('keymaps')
require('appearance')

-- plugins
require('plugins/telescope')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/treesitter')
require('plugins/barbar')
require('plugins/gh')
require('plugins/tree')
