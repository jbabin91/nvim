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
    -- Useful functionality
    use({
      "tpope/vim-commentary",  -- "gc" to comment visual regions/lines
      -- "tpope/vim-repeat",      -- enable repeating supported plugin maps with "."
      "tpope/vim-speeddating", -- use CTRL-A/CTRL-X to increase dates, times, and more
      "tpope/vim-surround",    -- quoting/parenthesizing made simple
      -- "tpope/vim-unimpaired",  -- Pairs of handy bracket mappings
      "tpope/vim-eunuch",      -- Adds a dozen core Unix file operations as Vim commands
    })
    -- Web development
    use({
      "mattn/emmet-vim",
      "editorconfig/editorconfig-vim",
      "vuki656/package-info.nvim", -- Display latest package version as virtual text in package.json
    })
    -- Databases
    use({
      "nanotee/sqls.nvim", -- SQLs (sql database connection plugin + LSP client)
    })
    -- LSP improvements
    use({
      "jose-elias-alvarez/nvim-lsp-ts-utils", -- Utilities to improve the Typescript development experience
      "liuchengxu/vista.vim", -- List all functions and variables in a window of your current file
    })
    -- Completion tools
    -- use({
    --   "ms-jpq/coq_nvim", -- Fast as F*CK Neovim completion.
    -- })
    -- AI code
    use({
      "jameshiew/nvim-magic", -- Framework for integrating AI code assistance.
    })
    -- Markdown
    use({
      "ellisonleao/glow.nvim", -- Markdown preview using glow
      cmd = ":GlowInstall",
    })
    -- Org
    use({
      "vhyrro/neorg",
    })
    -- Utility
    use({
      "max397574/better-escape.nvim", -- Create shortcuts to escape insert mode without getting delay
      "rcarriga/nvim-notify", -- A fancy, configurable, notification manager for Neovim
      "lewis6991/spellsitter.nvim", -- Enable Neovim's spell checker with tree-sitter
      "goolord/alpha-nvim", -- A fast and highly customizable greeter like vim-startify/dashboard-nvim for Neovim
    })
    -- Debuggin
    use({
      "mfussenegger/nvim-dap", -- Debug Adapter Protocol client implementation for Neovim
      "rcarriga/nvim-dap-ui", -- A UI for nvim-dap
      "Pocco81/DAPInstall.nvim", -- A Neovim plugin for managing several debuggers for Nvim-dap
    })
    -- UI Indent visualizer
    use({
      "lukas-reineke/indent-blankline.nvim",
    })
    -- File Trees
    -- use({
    --   "ms-jpq/chadtree", -- File manager for Neovim. Better than NERDTree
    --   cmd = ":CHADdeps",
    -- })
    -- Git
    -- use({
    --   "TimUntersberger/neogit", -- A Magit clone for Neovim that change some things to fit the Vim philosophy
    --   "tveskag/nvim-blame-line", -- A small plugin that uses neovims virtual text to print git blame info
    --   "tanvirtin/vgit.nvim", -- Visual Git Plugin for Neovim to enhance your git experience
    --   "sindrets/diffview.nvim", -- Single tabpage interface for easily cycling through diffs for all modified files.
    --   "kdheepak/lazygit.nvim", -- Plugin for calling lazygit from within Neovim
    -- })
    -- Motion
    use({
      "phaazon/hop.nvim", -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document.
      -- "ggandor/lightspeed.nvim", -- A Sneak-like plugin offering unparalleled navigation speed via ahead-of-time displayed labels.
    })
    -- Editing Support
    use({
      "nacro90/numb.nvim", -- Peek lines in a non-obtrusive way
      "McAuleyPenney/tidy.nvim", -- Clear trailing whitespace and empty lines at end of file on every save
    })
    -- Treesitter plugins
    use({
      "p00f/nvim-ts-rainbow", -- Rainbow 🌈 parentheses for Neovim using tree-sitter 🌈
      "JoosepAlviste/nvim-ts-context-commentstring", -- A Neovim plugin for setting the =commentstring= option based on the cursor location in the file.
    })
    -- Command Line
    use({
      "gelguy/wilder.nvim", -- A plugin for fuzzy command line autocompletion
    })
    -- Keybinding
    use({
      "AckslD/nvim-whichkey-setup.lua", -- Plugin that wraps vim-which-key to simplify setup in Lua
      "folke/which-key.nvim", -- Neovim plugin that shows a popup with possible keybindings of the command you started typing.
      "LionC/nest.nvim", -- Lua utility to map keys concisely using cascading trees.
    })
    use({
      "sindrets/winshift.nvim", -- Rearrange your windows with ease
      "luukvbaal/stabilize.nvim", -- Stabilized window content on window open/close events
    })

    -- Other plugins
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
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
    -- A light-weight lsp plugin based on neovim built-in lsp with a highly performant UI.
    -- use {
    --   'glepnir/lspsaga.nvim',
    --   config = [[ require('plugins/lspsaga') ]]
    -- }
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
    -- use("shaeinst/roshnivim-cs")
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
    -- use({
    --  "voldikss/vim-floaterm",
    --   config = [[require("plugins/floaterm")]],
    -- })
    -- lua `fork` of vim-web-devicons for neovim
    use({
      "kyazdani42/nvim-web-devicons",
      config = [[require("plugins/webdevicons_nvim")]],
    })
    -- Maximizes and restores the current window in vim
    -- use({
    --   "szw/vim-maximizer",
    --   config = [[require("plugins/maximizer")]],
    -- })
    -- Smart and powerful comment plugin for neovim. Supports commentstring, dot repeat, left-right/up-down motions, hooks, and more.
    -- use({
    --   "numToStr/Comment.nvim",
    --   config = [[require("plugins/comment_nvim")]]
    -- })
    -- Neovim commenting plugin, written in Lua.
    -- use {
    --   'b3nj5m1n/kommentary',
    --   config = [[ require('plugins/kommentary') ]]
    -- }
    -- A surround text object plugin for neovim written in lua.
    -- use({
    --   "blackcauldron7/surround.nvim",
    --   config = [[require("plugins/surround_nvim")]],
    -- })
    -- The fastest Neovim colorizer.
    use({
      "norcalli/nvim-colorizer.lua",
      config = [[require("plugins/colorizer")]],
    })
    -- A vim plugin to display the indention levels with thin vertical lines
    -- use({
    --   "Yggdroot/indentLine",
    --   config = [[require("plugins/indentLine")]],
    -- })
    -- To change current working directory to project's root directory.
    -- use({
    --   "ygm2/rooter.nvim",
    --   config = [[require("plugins/rooter_nvim")]],
    -- })
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
    -- use { -- A neovim tabline plugin.
    --   'romgrk/barbar.nvim',
    --   config = [[ require('plugins/barbar_nvim') ]]
    -- }
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
    -- use {
    --   'hoob3rt/lualine.nvim',
    --   requires = {'kyazdani42/nvim-web-devicons', opt = true},
    --   config = [[ require('plugins/lualine') ]]
    -- }
    -- use { --neovim statusline plugin written in lua
    --   'glepnir/galaxyline.nvim',
    --   config = [[ require('plugins/galaxyline_nvim') ]]
    -- }
    -- No-nonsense floating terminal plugin for Neovim.
    -- use({
    --   "numToStr/FTerm.nvim",
    --   config = [[require("plugins/fterm_nvim")]],
    -- })
    -- Code formatter
    use({
      "mhartington/formatter.nvim",
      config = [[require("plugins/formatter")]],
    })
    -- For flutter/dart
    -- Tools to help create flutter apps in neovim using native lsp
    -- use({
    --   "akinsho/flutter-tools.nvim",
    --   requires = {
    --     "nvim-lua/plenary.nvim",
    --     "Neevash/awesome-flutter-snippets", -- collection of snippets and shortcuts for commonly used flutter functions and classes.
    --     {
    --       "dart-lang/dart-vim-plugin", -- Syntax highlighting for Dar in vim
    --       config = [[require("plugins/dart_vim_plugin")]],
    --     },
    --   },
    --   config = [[require("plugins/fluttertools")]],
    -- })
    -- For Web-Development
    -- Use treesitter to autoclose and autorename html tag, work with html,tsx,vue,svelte,php.
    use({
      "windwp/nvim-ts-autotag",
      requires = "nvim-treesitter/nvim-treesitter",
      config = [[require("plugins/ts-autotag_nvim")]],
    })
  end,
  config = {
    compile_path = fn.stdpath("config") .. "/plugin/packer_compiled.lua"
  }
})
