require("core")

packer_bootstrap(function(use)
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"
  use "echasnovski/mini.nvim"
  use "dstein64/vim-startuptime"
  use {
    "nvim-lua/popup.nvim",
    module = "popup",
  }
  use {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  }
  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  }
  ---- Completion
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    requires = {
      { "ms-jpq/coq.thirdparty", branch = "3p"        },
      { "ms-jpq/coq.artifacts",  branch = "artifacts" },
    },
    config = function()
      vim.g.coq_settings = {
        ["auto_start"] = "shut-up",
	      ["display.pum.fast_close"] = false,
      }
    end,
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }
  ---- LSP
  use {
    "williamboman/nvim-lsp-installer",
    requires = { "neovim/nvim-lspconfig" },
    after = "coq_nvim",
  }
  use "tamago324/nlsp-settings.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use {
    "folke/lsp-colors.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lsp-colors").setup()
    end,
  }
  ---- Navigation
  use {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      map("n", "<leader>tt", "<cmd>NvimTreeToggle   <cr>")
      map("n", "<leader>tr", "<cmd>NvimTreeRefresh  <cr>")
      map("n", "<leader>tf", "<cmd>NvimTreeFindFile <cr>")

      require("nvim-tree").setup {
        disable_netrw = true,
	update_cwd = true,
	view = {
	  preserve_window_proportions = true,
	},
	actions = {
	  open_file = {
	    resize_window = true,
	  },
	},
      }
    end,
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      map("n", "<leader>fs", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').minimal_theme()<cr>")
      map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').minimal_theme()<cr>")
      map("n", "<leader>ff", "<cmd>lua require('telescope').extensions.file_browser.file_browser(require('telescope.themes').minimal_theme()<cr>")

      local telescope = require('telescope')
      require('telescope.themes').minimal_theme = function()
        return require('telescope.themes').get_ivy({
          borderchars = {
	    prompt  = { "─", " ", " ", " ", '─', '─', " ", " "  },
            results = { " ",                                    },
	    preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'  },
          },
	  layout_config = { height = 15 },
	  width         = 0.8,
	  previewer     = false,
	  prompt_title  = false,
	  results_title = false,
	})
      end

      telescope.setup {
        pickers = {
	  buffers = {
	    mappings = {
	      -- Enable buffer deletion
	      i = { ["<c-d>"] = "delete_buffer" },
	      n = { ["dd"] = "delete_buffer" },
	    },
	  },
	},
      }

      telescope.load_extension "file_browser"
    end,
  }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {
        options = {
          theme = "auto",
	  component_separators = { left = "", right = "" },
	  section_separators   = { left = "", right = "" },
	  globalstatus = true,
        },
      }
    end,
  }

  ---- Git
  use "lewis6991/gitsigns.nvim"
  use {
    "TimUntersberger/neogit",
    module = "neogit",
  }

  ---- TS
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  }
  
  ---- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
    end,
  }
  ---- Theme
  use "Th3Whit3Wolf/one-nvim"
  ---- MISC
  use {
    "antoinemadec/FixCursorHold.nvim",
    event = "VimEnter",
  }
end)
