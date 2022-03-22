local cmd = vim.cmd
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer..."
  cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save plugins.lua
cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local present, packer = pcall(require, "packer")
if not present then
  return
end

-- Have packer use popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Performance
  use "lewis6991/impatient.nvim"
  use "nathom/filetype.nvim"
  use "dstein64/vim-startuptime"

  -- Gitsigns
  use "lewis6991/gitsigns.nvim"
  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  }

  -- Mini.nvim
  use "echasnovski/mini.nvim"

  -- CMP
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "tamago324/nlsp-settings.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use {
    "folke/lsp-colors.nvim",
    config = function()
      require("lsp-colors").setup()
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- MISC
  use "goolord/alpha-nvim"
  use "kyazdani42/nvim-tree.lua"
  use "folke/which-key.nvim"
  use "folke/trouble.nvim"
  use "antoinemadec/FixCursorHold.nvim"
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  
  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- LazyGit
  use {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 0.8
      vim.g.lazygit_floating_window_use_plenary = 1
    end,
  }

  -- Symbols
  use "simrat39/symbols-outline.nvim"
end)
