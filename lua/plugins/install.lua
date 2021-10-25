require("packer").startup {
  function(use)
    use { "wbthomason/packer.nvim" } -- Package manager
    use { "lewis6991/impatient.nvim" }
    -- tpope
    use {
      "tpope/vim-fugitive", -- Git commands in nvim
      "tpope/vim-rhubarb", -- Fugitive-sompanion to interact with github
      "tpope/vim-commentary", -- -- "gc" to comment visual regions/lines
      "tpope/vim-repeat", -- enable repeating supported plugin maps with "."
      "tpope/vim-speeddating", -- use CTRL-A/CTRL-X to increase dates, times, and more
      "tpope/vim-surround", -- quoting/parenthesizing made simple
      "tpope/vim-unimpaired", -- Pairs of handy bracket mappings
    }
    -- UI & Syntax
    use {
      "folke/tokyonight.nvim",
      -- use { "joshdick/onedark.vim" } -- Theme inspired by Atom
      -- use { "gruvbox-community/gruvbox" }
      -- use { "folke/tokyonight.nvim" }
      -- -- "christianchiarulli/nvcode-color-schemes.vim",
      "kyazdani42/nvim-web-devicons",
      -- Add indentation guides even on blank lines
      { "lukas-reineke/indent-blankline.nvim" },
      -- A blazing fast and easy to configure neovim statusline written in pure lua
      { "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } },
      -- -- {
      -- --   "NTBBloodbath/galaxyline.nvim",
      --   branch = "main",
      --   config = function()
      --     require("plugins.configs.galaxyline").setup()
      --   end,
      -- },
      {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim",
          { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
      },
      {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        run = ":TSUpdate",
      },
      -- Additional textobjects for treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      {
        "windwp/nvim-ts-autotag", -- Use treesitter to auto close and auto rename html tags
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
      },
      {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup()
        end,
      },
    }
    -- Collection of configurations for built-in LSP client
    -- use { "neovim/nvim-lspconfig" }
    -- use { "williamboman/nvim-lsp-installer" } -- Provides the missing :LspInstall for nvim-lspconfig
    -- use { "nvim-lua/lsp-status.nvim" }
    -- use { "glepnir/lspsaga.nvim" }
    -- use { "ray-x/lsp_signature.nvim" }
    -- use { "onsails/lspkind-nvim" }
    -- use { "kosayoda/nvim-lightbulb" }
    -- LSP
    -- use {
    --   "williamboman/nvim-lsp-installer",
    --   requires = {
    --     "neovim/nvim-lspconfig",
    --     "folke/lua-dev.nvim",
    --   },
    --   after = "coq_nvim",
    --   config = function()
    --     require("plugins.configs.lsp").setup()
    --   end,
    -- }
    -- Completion & Snippets
    use {
      "ms-jpq/coq_nvim",
      requires = {
        { "ms-jpq/coq.artifacts", branch = "artifacts" },
        -- { "ms-jpq/coq.thirdparty", branch = "3p" },
        {
          "onsails/lspkind-nvim",
          config = function()
            require("lspkind").init()
          end,
        },
      },
      branch = "coq",
      setup = function()
        vim.g.coq_settings = {
          keymap = { recommended = false }, -- for autopairs
          auto_start = "shut-up",
          ["display.pum.fast_close"] = false,
          clients = {
            lsp = {
              resolve_timeout = 0.15,
              weight_adjust = 0.4,
            },
          },
        }
      end,
      -- config = function()
      --   require("plugins.configs.coq_nvim").setup()
      -- end,
    }
    use { "windwp/nvim-autopairs" } -- A super powerful autopair for Neovim. It supports multiple characters
    -- Comments
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    }
    -- Git
    use {
      "rhysd/git-messenger.vim",
      "rhysd/committia.vim",
      "kdheepak/lazygit.nvim",
      {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
      },
    }
    -- use { }
    -- use {
    --   {
    --     "lewis6991/gitsigns.nvim",
    --     requires = {
    --       "nvim-lua/plenary.nvim",
    --     },
    --     config = function()
    --       require("plugins.configs.gitsigns").setup()
    --     end,
    --   },
    -- }
    -- Formatting/code style
    use {
      "mhartington/formatter.nvim",
      -- use {
      -- --   "mhartington/formatter.nvim",
      --   config = function()
      --     require("plugins.configs.formatter").setup()
      --   end,
      -- }
      "editorconfig/editorconfig-vim",
    }
    -- MISC
    use { "psliwka/vim-smoothie" }
    -- use { "karb94/neoscroll.nvim" }
    use { "ludovicchabant/vim-gutentags" } -- Automatic tags management
    use { "ms-jpq/chadtree", run = ":CHADdeps" } -- File Manager for Neovim, Better than NERDTree
    -- -- {
    -- --   "kyazdani42/nvim-tree.lua",
    --   setup = function()
    --     vim.g.nvim_tree_git_hl = 1
    --     vim.g.nvim_tree_add_trailing = 1
    --   end,
    --   after = "nvim-lsp-installer",
    --   config = function()
    --     require("plugins.configs.nvim_tree").setup()
    --   end,
    -- },
    use { "justinmk/vim-sneak" } -- The missing motion for Vim 👟
    use { "akinsho/toggleterm.nvim" } -- A neovim lua plugin to help easily manage multiple terminal windows
    --   {
    --     "akinsho/toggleterm.nvim",
    --     config = function()
    --       require("toggleterm").setup {
    --         open_mapping = [[<C-t>]],
    --       }
    --     end,
    --   },
    --   {
    --     "haya14busa/incsearch.vim",
    --     config = function()
    --       require("plugins.configs.incsearch").setup()
    --     end,
    --   },
    -- -- {
    -- --   "sheerun/vim-polyglot",
    --   setup = function()
    --     vim.g.polyglot_disabled = { "autoindent", "sensible" }
    --   end,
    -- },
    use {
      "tweekmonster/startuptime.vim",
      cmd = { "StartupTime" },
    }
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
}
