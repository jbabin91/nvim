local settings = require("user-conf")
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
  return string.format('require("configs.%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  execute("packadd packer.nvim")
end

-- initialize and configure packer
local present, packer = pcall(require, "packer")

packer.init({
  profile = {
    enable = true,
    threshold = 0,
  },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
})

packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "lewis6991/impatient.nvim"
  -- use "dstein64/vim-startuptime"
  use "tweekmonster/startuptime.vim"
  use "xiyaowong/nvim-cursorword" -- Highlight cursor word

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = get_config("telescope"),
  }
  use "jvgrootveld/telescope-zoxide"
  use "crispgm/telescope-heading.nvim"
  use "nvim-telescope/telescope-symbols.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-packer.nvim"

  use { "kyazdani42/nvim-tree.lua", config = get_config("nvim-tree") }

  use { "numToStr/Navigator.nvim", config = get_config("navigator") }

  use {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = get_config("lualine"),
  }

  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = get_config("colorizer"),
  }

  use { "windwp/nvim-autopairs", config = get_config("autopairs") }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = get_config("treesitter"),
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "p00f/nvim-ts-rainbow"

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell",
      "lukas-reineke/cmp-rg",
    },
    config = get_config("cmp"),
  }
  use "rafamadriz/friendly-snippets"
  use {
    "L3MON4D3/LuaSnip",
    require = "saadparwaiz1/cmp_luasnip",
    config = get_config("luasnip"),
  }

  use {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    },
    config = get_config("diffview"),
  }
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    requires = "nvim-lua/plenary.nvim",
    config = get_config("neogit"),
  }
  use { "f-person/git-blame.nvim", config = get_config("git-blame") }
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    requires = "nvim-lua/plenary.nvim",
    config = get_config("gitsigns"),
  }

  use {
    "kevinhwang91/nvim-bqf",
    requires = { { "junegunn/fzf", module = "nvim-bqf" } },
    config = get_config("nvim-bqf"),
  }

  use {
    "akinsho/nvim-bufferline.lua",
    event = "BufReadPre",
    requires = "kyazdani42/nvim-web-devicons",
    config = get_config("bufferline"),
  }
  use "famiu/bufdelete.nvim"

  use "williamboman/nvim-lsp-installer"
  use { "neovim/nvim-lspconfig", config = get_config("lsp") }
  use {
    "ray-x/lsp_signature.nvim",
    requires = "neovim/nvim-lspconfig",
    config = get_config("lsp-signature"),
  }
  use { "onsails/lspkind-nvim", requires = { "famiu/bufdelete.nvim" } }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = get_config("null-ls"),
  }
  use {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = get_config("symbols"),
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = get_config("indent-blankline"),
  }

  use {
    "akinsho/nvim-toggleterm.lua",
    keys = { "<C-n>", "<leader>fl", "<leader>gt" },
    config = get_config("toggleterm"),
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = get_config("todo"),
  }

  use { "ahmedkhalf/project.nvim", config = get_config("project") }

  use "ironhouzi/starlite-nvim"

  use { "folke/which-key.nvim", config = get_config("which") }

  use "junegunn/vim-easy-align"

  use { "rhysd/vim-grammarous", cmd = "GrammarousCheck" }

  use "RRethy/vim-illuminate"

  use {
    "ptzz/lf.vim",
    requires = "voldikss/vim-floaterm",
    config = get_config("lf"),
  }

  if settings.theme == "nightfox" then
    use { "EdenEast/nightfox.nvim", config = get_config("nightfox") }
  elseif settings.theme == "catppuccino" then
    use { "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") }
  elseif settings.theme == "tokyonight" then
    use { "folke/tokyonight.nvim", config = get_config("tokyonight") }
  else
    use { "rebelot/kanagawa.nvim", config = get_config("kanagawa") }
  end

  use {
    "ThePrimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim",
    config = get_config("harpoon"),
  }

  use {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = get_config("zen-mode"),
  }

  use { "folke/twilight.nvim", config = get_config("twilight") }

  use "ggandor/lightspeed.nvim"

  use { "cuducos/yaml.nvim", ft = "yaml" }

  use {
    "ray-x/go.nvim",
    ft = "go",
    config = get_config("go"),
  }

  use { "LudoPinelli/comment-box.nvim", config = get_config("comment-box") }

  use { "rcarriga/nvim-notify", config = get_config("notify") }

  use {
    "echasnovski/mini.nvim",
    branch = "stable",
    config = get_config("mini"),
  }

  use {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    config = get_config("nvim-window"),
  }

  -- use { "waylonwalker/Telegraph.nvim", config = require("telegraph").setup() }

  use "rhysd/conflict-marker.vim"

  use { "edluffy/specs.nvim", config = get_config("specs") }

  use "mfussenegger/nvim-ts-hint-textobject"

  use {
    "goolord/alpha-nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = get_config("alpha"),
  }
end)

-- TODO: ????
-- use {"lukas-reineke/headlines.nvim", config = get_config("headlines")}
-- https://github.com/glepnir/lspsaga.nvim
-- use 'glepnir/lspsaga.nvim'
