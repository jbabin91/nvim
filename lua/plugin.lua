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
  print "Installing packer close and reopen Neovim..."
  cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost configs/plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
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
  profile = {
    enable = true,
    threshold = 1,
  }
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Package manager
  use "dstein64/vim-startuptime"
  use "lewis6991/impatient.nvim"
  use "nathom/filetype.nvim"
  use "nvim-lua/popup.nvim" -- An implementation of the popup API from vim in neovim
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"

  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "tpope/vim-ragtag"
  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"
  use "tpope/vim-vinegar"
  use "tpope/vim-endwise"
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github
  use "tpope/vim-markdown"
  -- use "numToStr/Comment.nvim" -- "gc" to comment visual regions/lines
  -- use "ludovicchabant/vim-gutentags" -- Automatic tags management
  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  -- Statusline
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" }}
  -- Add indentation guides even on blank lines
  use "lukas-reineke/indent-blankline.nvim"
  -- use "romgrk/barbar.nvim"
  -- use "glepnir/dashboard-nvim"
  -- use "norcalli/nvim-colorizer.lua"
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
  }
  use "folke/which-key.nvim"

  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim"
  use "unblevable/quick-scope"
  use "phaazon/hop.nvim"
  use "andymass/vim-matchup"
  use "nacro90/numb.nvim"
  use "monaqa/dial.nvim"
  use "br1anchen/nvim-colorizer.lua"
  use "windwp/nvim-spectre"
  use "folke/zen-mode.nvim"
  use "karb94/neoscroll.nvim"
  use "folke/todo-comments.nvim"
  use "kevinhwang91/nvim-bqf"
  use "ThePrimeagen/harpoon"
  use "lunarvim/vim-solidity"
  use "Mephistophiles/surround.nvim"
  use "Shatur/neovim-session-manager"
  use "rcarriga/nvim-notify"
  use "nyngwang/NeoZoom.lua"
  use "SmiteshP/nvim-gps"

  -- autocompletion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-emoji",
      -- "hrsh7th/cmp-vsnip",
      -- "hrsh7th/vim-vsnip",
    },
  }
  -- snippets
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json form
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use "ray-x/lsp_signature.nvim"
  use "b0o/SchemaStore.nvim"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  use "github/copilot.vim"
  use "RRethy/vim-illuminate"

  use "tami5/lspsaga.nvim"
  use "onsails/lspkind-nvim"
  use "windwp/nvim-autopairs"

  -- Colorscheme
  -- use "mjlbach/onedark.nvim" -- Theme inspired by Atom
  -- use "sickill/vim-monokai"
  -- use "morhetz/gruvbox"
  -- use "shaunsingh/nord.nvim"
  -- use "sainnhe/gruvbox-material"
  -- use "sainnhe/everforest"
  -- use "relastle/bluewery.vim"
  -- use "haishanh/night-owl.vim"
  use "folke/tokyonight.nvim"
  use "rebelot/kanagawa.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use { "p00f/nvim-ts-rainbow", commit = "c6c26c4def0e9cd82f371ba677d6fc9baa0038af" }
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "romgrk/nvim-treesitter-context"
  use "mizlan/iswap.nvim"
  -- use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  -- use "nvim-treesitter/nvim-treesitter-textobjects"
  -- use "nvim-treesitter/nvim-treesitter-refactor"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"
  use "https://github.com/rhysd/conflict-marker.vim"

  -- DAP
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"

  -- MISC
  use "jiangmiao/auto-pairs"
  use "yuttie/comfortable-motion.vim"
  use "mattn/emmet-vim"
  use "editorconfig/editorconfig-vim"
  use "wakatime/vim-wakatime"

  -- Automatically setup your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

