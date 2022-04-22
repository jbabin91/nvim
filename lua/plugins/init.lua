-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer = require 'packer'
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  },
  auto_clean = true,
  compile_on_sync = true,
  auto_reload_compiled = true,
  profile = {
    enable = true,
    threshold = 0,
  },
}

local function with_config(name)
  vim.defer_fn(function()
    pcall(require, string.format('plugins.configs.%s', name))
  end, 0)
end

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'lewis6991/impatient.nvim'
  use 'dstein64/vim-startuptime'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use { 'kyazdani42/nvim-web-devicons', opt = true }

  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-surround'

  -- "gc" to comment visual regions/lines
  use {
    'numToStr/Comment.nvim',
    config = with_config('comment'),
  }
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = with_config('telescope'),
  }
  use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  use {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = with_config('lualine'),
  }
  -- Add indentation guides even on blank lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = with_config('blankline'),
  }
  -- Add git related info in the signs columns and popups
  use {
    'lewis6991/gitsigns.nvim',
    config = with_config('gitsigns'),
  }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'windwp/nvim-ts-autotag',
      'p00f/nvim-ts-rainbow',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = with_config('treesitter'),
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
      'williamboman/nvim-lsp-installer',
      'hrsh7th/nvim-cmp', -- Autocompletion plugin
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip', -- Snippets plugin
      'rafamadriz/friendly-snippets',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = with_config('lsp'),
  }
  use {
    'windwp/nvim-autopairs',
    config = with_config('autopairs'),
  }
end)
