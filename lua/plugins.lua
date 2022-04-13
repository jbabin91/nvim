local fn = vim.fn
local utils = require('utils')

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer')
  vim.cmd [[packadd packer.nvim]]
end

local present, packer = pcall(require, 'packer')
if not present then
  return
end

utils.packer_commands()

packer.init({
  profile = {
    enable = true,
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'dstein64/vim-startuptime'
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'p00f/nvim-ts-rainbow'
  use 'norcalli/nvim-colorizer.lua'
  -- Colorschemes
  -- use {'catppuccin/nvim', as = 'catppuccin'}
  use 'rebelot/kanagawa.nvim'
  -- use 'marko-cerovac/material.nvim'
  -- use 'navarasu/onedark.nvim'
  -- use 'tiagovla/tokyodark.nvim'
  -- use 'Mofiqul/dracula.nvim'
  -- use 'yashguptaz/calvera-dark.nvim'
  -- use 'projekt0n/github-nvim-theme'
  -- use 'folke/tokyonight.nvim'
  -- use 'olimorris/onedarkpro.nvim'
  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  -- LSP
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'folke/trouble.nvim'
  use 'simrat39/symbols-outline.nvim'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp'
    },
  }
  use {'L3MON4D3/LuaSnip', requires = 'rafamadriz/friendly-snippets' }
  -- Statusline
  use 'nvim-lualine/lualine.nvim'
  use 'b0o/SchemaStore.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'b3nj5m1n/Kommentary'
  use 'lewis6991/gitsigns.nvim'
  use 'akinsho/bufferline.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'mhartington/formatter.nvim'
  use 'windwp/nvim-autopairs'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'goolord/alpha-nvim'

  -- Automatically set up the configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
