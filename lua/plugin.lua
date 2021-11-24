--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━━━━❰ Plugin Manager ❱━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--

-- If you want to automatically ensure that packer.nvim is installed on any machine you clone your configuration to,
-- add the following snippet (which is du to @Iron-E) somewhere in your config before your first usage of packer:
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

require("packer").startup({
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    --━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--
    --━━━━━━━━━━━━━━━❰ currently Using ❱━━━━━━━━━━━━━━━━━--
    -- Speed up loading Lua modules in Neovim to improve startup time.
    use("lewis6991/impatient.nvim")
    -- Easily speed up your neovim startup time! A faster version of filetype.vim
    use("nathom/filetype.nvim")
    -- Vim Startup time profiler
    use("dstein64/vim-startuptime")
    -- A collection of common configurations for Neovim's built-in language server client
    use({
      "neovim/nvim-lspconfig",
      config = [[require("plugins/lspconfig")]],
    })
    use({
      "williamboman/nvim-lsp-installer",
      config = [[require("plugins/lsp_installer_nvim")]],
    })
    -- vscode-like pictograms for neovim lsp completion items topics
    use({
      "onsails/lspkind-nvim",
      config = [[require("plugins/lspkind")]],
    })
    -- Utility functions for getting diagnostic status and progress messages from LSP servers,
    -- for use in the Neovim statusline
    use({
      "nvim-lua/lsp-status.nvim",
      config = [[require("plugins/lspstatus")]],
    })
    -- A completion plugin for neovim coded in lua.
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",     -- nvim-cmp source for neovim builtin LSP client
        "hrsh7th/cmp-nvim-lua",     -- nvim-cmp source for neovim lua
        "hrsh7th/cmp-buffer",       -- nvim-cmp source for buffer words
        "hrsh7th/cmp-path",         -- nvim-cmp source for filesystem paths
        "hrsh7th/cmp-calc",         -- nvim-cmp source for math calculation
        "saadparwaiz1/cmp_luasnip", -- luasnip completion source for nvim-cmp
      },
      config = [[require("plugins/cmp")]],
    })
    -- Snippet Engine for Neovim written in Lua.
    use({
      "L3MON4D3/LuaSnip",
      requires = {
        -- Snippet collection for a set of different programming languages for faster development.
        "rafamadriz/friendly-snippets",
      },
      config = [[require("plugins/luasnip")]],
    })
    -- colorscheme for (neo)vim written in lua specially made for roshnivim
    use("shaeinst/roshnivim-cs")
    use("folke/tokyonight.nvim")
    use("EdenEast/nightfox.nvim")
    -- Nvim Treesitter configurations and abstraction layer
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = [[require("plugins/treesitter")]],
    })
    -- A super powerful autopairs for Neovim. It supports multiple characters.
    use({
      "windwp/nvim-autopairs",
      config = [[require("plugins/autopairs")]],
    })
    -- Find, Filter, Preview, Pick. All lua, all the time.
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        -- FZF sorter for telescope written in c
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
      },
      config = [[require("plugins/telescope")]],
    })
    -- Use (neo)vim terminal in the floating/popup window.
    use({
      "voldikss/vim-floaterm",
      config = [[require("plugins/floaterm")]],
    })
    -- lua `fork` of vim-web-devicons for neovim
    use({
      "kyazdani42/nvim-web-devicons",
      config = [[require("plugins/webdevicons_nvim")]],
    })
    -- Maximizes and restores the current window in vim
    use({
      "szw/vim-maximizer",
      config = [[require("plugins/maximizer")]],
    })
    -- Smart and powerful comment plugin for neovim. Supports commentstring, dot repeat, left-right/up-down motions, hooks, and more.
    use({
      "numToStr/Comment.nvim",
      config = [[require("plugins/comment_nvim")]]
    })
    -- A surround text object plugin for neovim written in lua.
    use({
      "blackcauldron7/surround.nvim",
      config = [[require("plugins/surround_nvim")]],
    })
    -- The fastest Neovim colorizer.
    use({
      "norcalli/nvim-colorizer.lua",
      config = [[require("plugins/colorizer")]],
    })
    -- A vim plugin to display the indention levels with thin vertical lines
    use({
      "Yggdroot/indentLine",
      config = [[require("plugins/indentLine")]],
    })
    -- To change current working directory to project's root directory.
    use({
      "ygm2/rooter.nvim",
      config = [[require("plugins/rooter_nvim")]],
    })
    -- Git signs written in pure lua.
    use({
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = [[require("plugins/gitsigns_nvim")]],
    })
    -- A pretty diagnostics, references, telescope results, quickfix, and location list to help you resolve all the trouble your code is causing.
    use({
      "folke/trouble.nvim",
      config = [[require("plugins/trouble_nvim")]],
    })
    -- A snazzy bufferline for Neovim
    use({
      "akinsho/nvim-bufferline.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = [[require("plugins/bufferline_nvim")]],
    })
    -- A File Explorer for Neovim written in lua.
    use({
      "kyazdani42/nvim-tree.lua",
      config = [[require("plugins/tree_nvim")]],
    })
    -- A minimal, stylish, and customizable statusline for Neovim written in lua.
    use({
      "Famiu/feline.nvim",
      requires = "nvim-lua/lsp-status.nvim",
      config = [[require("plugins/feline_nvim")]],
    })
    -- No-nonsense floating terminal plugin for Neovim.
    use({
      "numToStr/FTerm.nvim",
      config = [[require("plugins/fterm_nvim")]],
    })
    -- Code formatter
    use({
      "mhartington/formatter.nvim",
      config = [[require("plugins/formatter")]],
    })

--━━━━━━━━━━━━━━━━━❰ DEVELOPMENT ❱━━━━━━━━━━━━━━━━━--

  -- For flutter/dart
  -- Tools to help create flutter apps in neovim using native lsp
  use({
    "akinsho/flutter-tools.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "Neevash/awesome-flutter-snippets", -- collection of snippets and shortcuts for commonly used flutter functions and classes.
      {
        "dart-lang/dart-vim-plugin", -- Syntax highlighting for Dar in vim
        config = [[require("plugins/dart_vim_plugin")]],
      },
    },
    config = [[require("plugins/fluttertools")]],
  })

  -- For Web-Development
  -- Use treesitter to autoclose and autorename html tag, work with html,tsx,vue,svelte,php.
  use({
    "windwp/nvim-ts-autotag",
    requires = "nvim-treesitter/nvim-treesitter",
    config = [[require("plugins/ts-autotag_nvim")]],
  })

--━━━━━━━━━━━━━━━━━❰ end of DEVELOPMENT ❱━━━━━━━━━━━━━━━━━--

--━━━━━━━━━━━━━❰ end currently Using ❱━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--

--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━❰ Not currently Using ❱━━━━━━━━━━━━━━━--

--[=[
  use { -- A light-weight lsp plugin based on neovim built-in lsp with highly a performant UI.
        'glepnir/lspsaga.nvim',
        config = [[ require('plugins/lspsaga') ]]
  }
  use { -- A neovim tabline plugin.
      'romgrk/barbar.nvim',
      config = [[ require('plugins/barbar_nvim') ]]
  }
  use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = [[ require('plugins/lualine') ]]
  }
  use { --neovim statusline plugin written in lua
        'glepnir/galaxyline.nvim',
        config = [[ require('plugins/galaxyline_nvim') ]]
  }
  use { -- Neovim commenting plugin, written in lua.
        'b3nj5m1n/kommentary',
        config = [[ require('plugins/kommentary') ]]
  }
  use { --  Github theme for Neovim, kitty, iTerm, Konsole, and Alacritty written in Lua
        "projekt0n/github-nvim-theme",
        config = [[ require('plugins/github-nvim-theme') ]]
  }
--]=]

--━━━━━━━━━━━━━━━━❰ end Not Using ❱━━━━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--
  end,
  config = {
    compile_path = fn.stdpath("config") .. "/plugin/packer_compiled.lua"
  }
})

--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━━━━❰ end of Plugin Manager ❱━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--
