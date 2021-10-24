require("packer").startup(function(use)
  -- Packer can manage itself as an optional plugin
  use { "wbthomason/packer.nvim" }

  -- Impatient
  use { "lewis6991/impatient.nvim" }

  -- autopairs
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    after = "coq_nvim",
    config = function()
      require "plugins.configs.autopairs".setup()
    end,
  }
  -- Comments
  use { "b3nj5m1n/kommentary" }
  -- use {
  --   "terrortylor/nvim-comment",
  --   event = "BufRead",
  --   config = function()
  --     require "nvim_comment".setup()
  --   end,
  -- }
  -- use { "tpope/vim-commentary" }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "BufReadPost",
    config = function()
      require "plugins.configs.todo".setup()
    end,
  }

  -- File explorer
  -- use {
  --   "kyazdani42/nvim-tree.lua",
  --   requires = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require "nvim-tree".setup {}
  --   end,
  -- }
  use {
    "luukvbaal/nnn.nvim",
    event = "BufWinEnter",
    config = function()
      require "plugins.configs.nnn".setup()
    end,
  }

  -- Statusline
  use { "glepnir/galaxyline.nvim" }

  -- Bufferline
  -- TODO: look into barbar.nvim as an alternative
  use { "akinsho/nvim-bufferline.lua" }

  -- Indentation Guides
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.configs.blankline".setup()
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    config = function()
      require "plugins.configs.treesitter".setup()
    end,
    run = ":TSUpdate"
  }

  -- Completion & Snippets
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    config = function()
      vim.g.coq_settings = {
        auto_start = "shut-up",
        clients = { lsp = { resolve_timeout = 0.15, weight_adjust = 0.4}}
      }
    end,
    run = ":COQdeps"
  }
  use { "ms-jpq/coq.artifacts", branch = "artifacts" } -- 9000+ Snippets

  -- use { "hrsh7th/cmp-vsnip" }
  -- use {
  --   "hrsh7th/nvim-cmp",
  --   requires = {
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-path",
  --     -- "hrsh7th/cmp-vsnip",
  --     "hrsh7th/vim-vsnip",
  --     "hrsh7th/vim-vsnip-integ",
  --   }
  -- }

  -- Snippets
  -- use { "norcalli/snippets.nvim" }
  -- use { "johnpapa/vscode-angular-snippets" }
  -- use { "xabikos/vscode-javascript" }
  -- use { "sidthesloth91/vsc_html5_boilerplate" }
  -- use { "rafamadriz/friendly-snippets" }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
  }
  use { "nvim-lua/lsp-status.nvim" }
  use { "glepnir/lspsaga.nvim" }
  use { "ray-x/lsp_signature.nvim" }
  use { "onsails/lspkind-nvim" }
  -- use { "kosayoda/nvim-lightbulb" }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins.configs.gitsigns".setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
  }
  use { "kdheepak/lazygit.nvim" }

  -- Formatter
  use { "jose-elias-alvarez/null-ls.nvim" }

  -- Smooth Scroll
  use { "karb94/neoscroll.nvim" }

  -- Highlight Colorcodes
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end,
  }

  -- Themes
  --[[
  -- use { "morhetz/gruvbox" }
  -- use { "patstockwell/vim-monokai-tasty" }
  -- use { "arzg/vim-colors-xcode" }
  -- use { "chuling/vim-equinusocio-material" }
  -- use { "romgrk/github-light.vim" }
  -- use { "Khaledgarbaya/night-owl-vim-theme" }
  -- use { "kenwheeler/glow-in-the-dark-gucci-shark-bites-vim" }
  -- use { "TroyFletcher/vim-colors-synthwave" }
  -- use { "bluz71/vim-nightfly-guicolors" }
  --]]
  use { "folke/tokyonight.nvim" }

  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require "trouble".setup()
    end,
    -- [[ {
    -- -- your configuration comes here
    -- -- or leave it empty to use the default settings
    -- -- refer to the configuration section below
    -- } ]]
  }

  -- Keybindings
  use {
    "folke/which-key.nvim",
    -- config = function()
    --   require("which-key").setup {
    --     -- your configuration comes here
    --     -- or leave it empty to use the default settings
    --     -- refer to the configuration section below
    --   }
    -- end,
  }
end)
