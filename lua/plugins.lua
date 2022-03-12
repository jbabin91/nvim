-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme
local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugin's load time must be over for it to be included in the profile
    },
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local cmd = vim.cmd
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_boostrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      cmd [[packadd packer.nvim]]
    end
    cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]
  end

  -- Plugins
  local function plugins(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "lewis6991/impatient.nvim"
    use "nathom/filetype.nvim"
    use "dstein64/vim-startuptime"
    use "kyazdani42/nvim-tree.lua"
    use "lukas-reineke/indent-blankline.nvim"
    use "windwp/nvim-autopairs"
    use "kyazdani42/nvim-web-devicons"
    use "liuchengxu/vista.vim"
    use "nvim-treesitter/nvim-treesitter"
    use "navarasu/onedark.nvim"
    use "tanvirtin/monokai.nvim"
    use { "rose-pine/neovim", as = "rose-pine" }
    use "neovim/nvim-lspconfig"
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
      },
    }
    use "famiu/feline.nvim"
    use "lewis6991/gitsigns.nvim"
    use "goolord/alpha-nvim"

    -- Bootstrap Neovim
    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require "packer"

  -- Performance
  pcall(require, "impatient")
  -- pcall(require, "packer_compiled")

  packer.init(conf)
  packer.startup(plugins)
end

return M
