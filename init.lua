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
  use 'famiu/bufdelete.nvim'
  use {
    'RRethy/vim-hexokinase',
    run = 'make hexokinase',
    cmd = {"HexokinaseToggle"},
  }
  use {
    'ntpeters/vim-better-whitespace'
  }
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' } ,
    cond = function()
      return vim.fn.has('nvim-0.6') == 1
    end
  }
  use { 'junegunn/fzf', cond = function() return vim.fn.has('nvim-0.6') == 0 end }
  use { 'junegunn/fzf.vim', cond = function() return vim.fn.has('nvim-0.6') == 0 end }
  use 'Mofiqul/dracula.nvim' -- theme
  use {
    'neovim/nvim-lspconfig',
  }
  use 'dense-analysis/ale'
  use 'L3MON4D3/LuaSnip'
  use 'abecodes/tabout.nvim'
  use 'ruanyl/vim-gh-line'
  use 'projekt0n/github-nvim-theme'
  use {'kevinhwang91/nvim-hlslens'}
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {'cespare/vim-toml'}
  use {'lukas-reineke/format.nvim' }
  use {'LnL7/vim-nix'}
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  use 'axvr/org.vim'
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
     run = ':TSUpdate',
  };
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
  };
  use {
    'romgrk/barbar.nvim',
  };
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  };
    -- statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
end)

require('init-settings')
require('init-keymaps')

require('init-feline')
require('init-nvim-cmp')
require('init-treesitter')
require('init-barbar')
require('init-tree')
require('init-format')
require('init-lspconfig')
require('init-telescope')
require('init-hexokinase')
require('init-whitespace')

pcall(require, 'local')
