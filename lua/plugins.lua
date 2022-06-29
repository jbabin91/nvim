local fn = vim.fn

local bootstrap = false
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  bootstrap = fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local present, packer = pcall(require, "packer")
if not present then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  }
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "dstein64/vim-startuptime"

  use { "lewis6991/impatient.nvim", config = [[require("impatient")]] }

  use "tomasr/molokai"
  use "folke/tokyonight.nvim"

  use {
    "goolord/alpha-nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require("configs/alpha")]]
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    requires = { "RRethy/nvim-treesitter-endwise" },
    run = ":TSUpdate",
    config = [[require("configs/treesitter")]]
  }

  use {
    "neovim/nvim-lspconfig",
    requires = { "williamboman/nvim-lsp-installer" },
    after = { "coq_nvim", "null-ls.nvim" },
    config = [[require("configs/lsp")]]
  }

  use {
    "ms-jpq/coq_nvim",
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p" },
    },
    run = ":COQdeps",
    config = [[vim.g.coq_settings = { auto_start = "shut-up" }]]
  }

  use {
    "windwp/nvim-autopairs",
    config = [[require("nvim-autopairs").setup()]]
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  use {
    "numToStr/Comment.nvim",
    config = [[require("Comment").setup()]]
  }

  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require("configs/bufferline")]]
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = [[require("configs/lualine")]]
  }

  use {
    "norcalli/nvim-colorizer.lua",
    config = [[require("colorizer").setup()]]
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[require("configs/indent")]]
  }

  use {
    "vim-utils/vim-man",
    config = [[nmap("<leader>m", "<Plug>(Vman)")]]
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = [[require("configs/telescope")]]
  }

  use {
    "ms-jpq/chadtree",
    branch = "chad",
    run = { "python3 -m chadtree deps", ":CHADdeps" },
    config = [[nmap("<leader>t", "<cmd>CHADOpen<cr>", { noremap=true })]]
  }

  if bootstrap then
    packer.sync()
  end
end)
