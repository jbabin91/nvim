local fn = vim.fn

-- Install packer
local PackerBootstrap
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
  })
  print("Installing packer...")
  vim.cmd([[packadd packer.nvim]])
end

vim.api.nvim_create_autocmd("BufWritePre", {
  command = "source <afile> | PackerSync",
  pattern = "plugins.lua",
  group = vim.api.nvim_create_augroup("Packer", { clear = true }),
})

-- Use a protected call so we don't error out on first use
local packer_status, packer = pcall(require, "packer")
if not packer_status then
  print("'packer' error")
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Package manager
  use "lewis6991/impatient.nvim"
  -- DEPENDENCIES:
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  -- LSP:
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "folke/trouble.nvim"
  use "kosayoda/nvim-lightbulb"
  use "RRethy/vim-illuminate"
  use "b0o/schemastore.nvim"
  use "folke/lua-dev.nvim"
  use "j-hui/fidget.nvim"
  use "jose-elias-alvarez/typescript.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  -- COMPLETION:
  use "windwp/nvim-autopairs"
  use "ms-jpq/coq_nvim"
  use "ms-jpq/coq.artifacts"
  use "ms-jpq/coq.thirdparty"
  -- use "hrsh7th/nvim-cmp"
  -- use "hrsh7th/cmp-buffer"
  -- use "hrsh7th/cmp-cmdline"
  -- use "hrsh7th/cmp-nvim-lua"
  -- use "hrsh7th/cmp-nvim-lsp"
  -- use "hrsh7th/cmp-nvim-lsp-signature-help"
  -- use "ray-x/cmp-treesitter"
  -- use "hrsh7th/cmp-calc"
  -- use "hrsh7th/cmp-emoji"
  -- use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  -- use "rafamadriz/friendly-snippets"
  -- use "honza/vim-snippets"
  -- use "onsails/lspkind-nvim"
  -- use "f3fora/cmp-spell"
  use "github/copilot.vim"
  -- TELESCOPE:
  use "tami5/sqlite.lua"
  use { "nvim-telescope/telescope.nvim", run = ":TSUpdate" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-project.nvim"
  use "nvim-telescope/telescope-frecency.nvim"
  -- use "kevinhwang91/nvim-bqf", ft = "qf" }
  use { "junegunn/fzf", run = function() vim.fn["fzf#install"]() end }
  -- TREESITTER:
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "p00f/nvim-ts-rainbow"
  use "windwp/nvim-ts-autotag"
  use "simrat39/symbols-outline.nvim"
  use "ThePrimeagen/refactoring.nvim"
  -- DEBUGGINS:
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  -- LANGUAGE_SPECIFIC:
  use "simrat39/rust-tools.nvim"
  use "tpope/vim-dadbod"
  -- use "kristijanhusak/vim-dadbod-completion"
  -- use "kristijanhusak/vim-dadbod-ui"
  use { "iamcco/markdown-preview.nvim", run = "cd app && npm install" }
  -- VISUALS:
  use "folke/tokyonight.nvim"
  use "mjlbach/onedark.nvim"
  use "luisiacc/gruvbox-baby"
  use "bluz71/vim-nightfly-guicolors"
  use "marko-cerovac/material.nvim"
  use "nvim-lualine/lualine.nvim" -- Fancier statusline
  use "SmiteshP/nvim-gps" -- Show current scope
  use "lewis6991/gitsigns.nvim"
  use "folke/todo-comments.nvim" -- Better todo comments
  use "norcalli/nvim-colorizer.lua"
  use "lukas-reineke/indent-blankline.nvim"
  use "b0o/incline.nvim"
  use "akinsho/bufferline.nvim"
  use { "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" }
  use "kyazdani42/nvim-tree.lua"
  use "stevearc/dressing.nvim"

  -- GIT:
  use "TimUntersberger/neogit"
  use "tpope/vim-fugitive" -- Git commands in nvim
  -- use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github
  use "junegunn/gv.vim"
  -- use "ludovicchabant/vim-gutentags" -- Automatic tags management
  -- use "f-person/git-blame.nvim"
  -- use "rmagatti/goto-preview"
  -- MOVEMENTS:
  use "phaazon/hop.nvim"
  -- use "unblevable/quick-scope" -- highlight for f, F, t, T movements
  use "machakann/vim-sandwich"
  -- use "arthurxavierx/vim-caser" -- word coercion
  -- use "chaoren/vim-wordmotion" -- camelCase, snake_case, kebab-case, etc. become separate words
  -- use "mizlan/iswap.nvim" -- interactive swap
  -- MISC:
  use "numToStr/Comment.nvim" -- "gc" to comment visual regions/lines
  use "gpanders/editorconfig.nvim"
  use "tpope/vim-abolish"
  use "tpope/vim-surround"
  use "andymass/vim-matchup"
  use "junegunn/vim-easy-align"
  use "akinsho/toggleterm.nvim"
  use "Darazaki/indent-o-matic"
  use "nvim-pack/nvim-spectre"
  use "rcarriga/nvim-notify"
  use "folke/which-key.nvim"
  use "dstein64/vim-startuptime"

  if PackerBootstrap then
    packer.sync()
  end
end)
