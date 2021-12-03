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
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'abecodes/tabout.nvim'
  use 'ruanyl/vim-gh-line'
  use {'lukas-reineke/format.nvim'}
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
     run = ':TSUpdate'
  };
  use {'nvim-treesitter/nvim-treesitter-textobjects'};
  use 'romgrk/barbar.nvim';
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  };

  use {
   "hoob3rt/lualine.nvim",
    config = function()
    require("lualine").setup {
      options = {
        theme = "github"
      }
    }
    end
  }
  use {
    "projekt0n/github-nvim-theme",
    after = "lualine.nvim",
    config = function()
      require("github-theme").setup({
        theme_style = "dark_default"
      })
   end
  }
end)


require('settings')
require('keymaps')
require('appearance')

-- plugins
require('telescope')
require('nvim-cmp')
require('nvim-lspconfig')
require('treesitter')
require('barbar')
require('tree')
require('packages')
