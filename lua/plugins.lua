local fn = vim.fn
local cmd = vim.cmd

-- Install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer..."
  cmd [[packadd packer.nvim]]
end

cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Used a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Packer manager
  use "lewis6991/impatient.nvim"
  use "tpope/vim-fugitive" -- Git commands in vim
  use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github
  use "numToStr/Comment.nvim" -- "gc" to comment visual regions/lines
  use "ludovicchabant/vim-gutentags" -- Automatic tags management
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  -- UI to select things (files, grep results, open buffers...)
  use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }}
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "rebelot/kanagawa.nvim"
  use "nvim-lualine/lualine.nvim" -- Fancier statusline
  -- Add indentation guides even on blank lines
  use "lukas-reineke/indent-blankline.nvim"
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }}
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use "nvim-treesitter/nvim-treesitter"
  -- Additional textobject for treesitter
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "hrsh7th/nvim-cmp" -- Autocompletion plugin
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-emoji"
  use "L3MON4D3/LuaSnip" -- Snippets plugin
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "github/copilot.vim"
  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use "ray-x/lsp_signature.nvim"
  use "b0o/SchemaStore.nvim"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  use "RRethy/vim-illuminate"

  -- Automatically setup your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- if PACKER_BOOTSTRAP then
  --   require("packer").sync()
  -- end
end)

