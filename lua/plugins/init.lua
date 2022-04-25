-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer = require 'packer'
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  },
  auto_clean = true,
  compile_on_sync = true,
  auto_reload_compiled = true,
  profile = {
    enable = true,
    threshold = 0,
  },
}

local function with_config(name)
  vim.defer_fn(function()
    pcall(require, string.format('plugins.configs.%s', name))
  end, 0)
end

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'lewis6991/impatient.nvim'
  use 'dstein64/vim-startuptime'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use { 'kyazdani42/nvim-web-devicons', opt = true }

  -- use 'tpope/vim-fugitive' -- Git commands in nvim
  -- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  -- use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  use {
    'kyazdani42/nvim-tree.lua',
    config = with_config 'nvim-tree',
  }
  use {
    'tamago324/lir.nvim',
    config = with_config 'lir',
  }
  use {
    'akinsho/bufferline.nvim',
    config = with_config 'bufferline',
  }
  use {
    'akinsho/toggleterm.nvim',
    config = with_config 'toggleterm',
  }
  use 'moll/vim-bbye'
  use 'ahmedkhalf/project.nvim'
  use 'goolord/alpha-nvim'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'folke/which-key.nvim'
  -- use 'folke/zen-mode.nvim'
  use {
    'folke/todo-comments.nvim',
    config = with_config 'todo-comments',
  }
  use 'unblevable/quick-scope'
  use {
    'phaazon/hop.nvim',
    config = with_config 'hop',
  }
  use {
    'andymass/vim-matchup',
    config = with_config 'matchup',
  }
  use 'nacro90/numb.nvim'
  use {
    'monaqa/dial.nvim',
    config = with_config 'dial',
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = with_config 'colorizer',
  }
  use {
    'windwp/nvim-spectre',
    config = with_config 'spectre',
  }
  use {
    'karb94/neoscroll.nvim',
    config = with_config 'neoscroll',
  }
  use 'kevinhwang91/nvim-bqf'
  use 'ThePrimeagen/harpoon'
  use {
    'MattesGroeger/vim-bookmarks',
    config = with_config 'bookmark',
  }
  use {
    'Mephistophiles/surround.nvim',
    config = with_config 'surround',
  }
  use {
    'rcarriga/nvim-notify',
    config = with_config 'notify',
  }
  use {
    'tversteeg/registers.nvim',
    config = with_config 'registers',
  }
  -- use 'nyngwang/NeoZoom.lua'
  use {
    'SmiteshP/nvim-gps',
    config = with_config 'gps',
  }
  -- use { 'michaelb/sniprun', run = 'bash ./install.sh' }
  -- use {
  --   'iamcco/markdown-preview.nvim',
  --   run = 'cd app && pnpm install',
  --   ft = 'markdown',
  -- }
  -- use 'matbme/JABS.nvim'

  -- "gc" to comment visual regions/lines
  use {
    'numToStr/Comment.nvim',
    config = with_config 'comment',
  }
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      'tom-anders/telescope-vim-bookmarks.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = with_config 'telescope',
  }
  use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  -- use 'folke/tokyonight.nvim'
  -- use 'lunarvim/colorschemes'
  -- use 'lunarvim/darkplus.nvim'
  -- use { 'rose-pine/neovim', as = 'rose-pine' }
  -- use 'rebelot/kanagawa.nvim'
  use {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = with_config 'lualine',
  }
  -- Add indentation guides even on blank lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = with_config 'indentline',
  }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'windwp/nvim-ts-autotag',
      'p00f/nvim-ts-rainbow',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'romgrk/nvim-treesitter-context',
      'mizlan/iswap.nvim',
      -- 'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = with_config 'treesitter',
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
      'williamboman/nvim-lsp-installer',
      'hrsh7th/nvim-cmp', -- Autocompletion plugin
      'hrsh7th/cmp-buffer', -- buffer completions
      'hrsh7th/cmp-path', -- path completions
      'hrsh7th/cmp-cmdline', -- cmdline completions
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip', -- Snippets plugin
      'rafamadriz/friendly-snippets',
      'jose-elias-alvarez/null-ls.nvim',
      'tamago324/nlsp-settings.nvim',
      'ray-x/lsp_signature.nvim',
      'b0o/SchemaStore.nvim',
    },
    config = with_config 'lsp',
  }
  use {
    'windwp/nvim-autopairs',
    config = with_config 'autopairs',
  }
  use {
    'filipdutescu/renamer.nvim',
    config = with_config 'renamer',
  }
  use {
    'github/copilot.vim',
    config = with_config 'copilot',
  }
  use {
    'RRethy/vim-illuminate',
    config = with_config 'illuminate',
  }
  use {
    'simrat39/symbols-outline.nvim',
    config = with_config 'symbol-outline',
  }
  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = with_config 'gitsigns',
  }
  -- use {
  --   'f-person/git-blame.nvim',
  --   opt = true,
  --   config = with_config 'git-blame',
  -- }
  -- use 'ruifm/gitlinker.nvim'
  -- use 'mattn/vim-gist'
  -- use 'mattn/webapi-vim'
  -- use 'rhysd/conflict-marker.vim'

  -- DAP
  use {
    'mfussenegger/nvim-dap',
    config = with_config 'dap',
  }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/nvim-dap-ui'
  use 'Pocco81/DAPInstall.nvim'
end)
