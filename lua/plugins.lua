local execute = vim.api.nvim_command
local fn = vim.fn

-- If Packer is not installed, download, and install it
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone --depth https://github.com/wbthomason/packer.nvim " .. install_path)
  execute("packadd packer.nvim")
end

local use = require("packer").use

return require("packer").startup({
  function()
    -- Packer Can manage itself
    use "wbthomason/packer.nvim"

    -- Improve startup time until: https://github.com/neovim/neovim/pull/15436
    use "lewis6991/impatient.nvim"
    use "nathom/filetype.nvim"

    -- {{{ tpope's plugins
    use "tpope/vim-commentary" -- "gc" to comment visual regions/lines
    use { "tpope/vim-fugitive", event = "User InGitRepo" } -- Git commands in nvim
    use "tpope/vim-repeat" -- enable repeating supported plugin maps with "."
    use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github
    use "tpope/vim-speeddating" -- use CTRL-A/CTRL-X to increment dates, times, and more
    use "tpope/vim-surround" -- quoting/parenthesizing made simple
    use "tpope/vim-unimpaired" -- Pairs of handy bracket mappings
    -- }}}

    -- {{{ Themes
    use "folke/tokyonight.nvim"
    use "EdenEast/nightfox.nvim"
    use "gruvbox-community/gruvbox"
    use "joshdick/onedark.vim"
    use "overcache/NeoSolarized"
    --- }}}

    -- {{{ utility plugins
    -- UI to select things (files, grep results, open buffers...)
    use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use("liuchengxu/vista.vim") -- 🌵 Viewer & Finder for LSP symbols and tags
    -- ✅ Highlight, list and search todo comments in your projects
    use {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim"}
    -- A blazing fast and easy to configure neovim statusline written in pure lua
    use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
    -- Add indentation guides even on blank lines
    use("lukas-reineke/indent-blankline.nvim")
    -- use("lukas-reineke/format.nvim") -- Neovim lua plugin to format the current buffer with external executables
    use { "sbdchd/neoformat", cmd = { "Neoformat" }}
    use "ggandor/lightspeed.nvim"
    -- use {
    --   "phaazon/hop.nvim",
    --   branch = "v1",
    --   config = function()
    --     require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    --   end,
    -- }
    -- use("justinmk/vim-sneak") -- The missing motion for Vim 👟
    -- use("chaoren/vim-wordmotion") -- More useful word motions for Vim
    use "kdheepak/tabline.nvim"
    -- Add git related info in the signs columns and popups
    use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use("windwp/nvim-autopairs") -- A super powerful autopair for Neovim. It supports multiple characters.
    use("dstein64/nvim-scrollview") -- 📍A Neovim plugin that displays interactive vertical scrollbars.
    -- A file explorer tree for neovim written in lua
    -- use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"}
    use({ "ms-jpq/chadtree", run = ":CHADdeps" })
    use("akinsho/toggleterm.nvim") -- A neovim lua plugin to help easily manage multiple terminal windows.
    -- Startup time
    use({ "dstein64/vim-startuptime", cmd = { "StartupTime" } })
    -- }}}

    -- {{{ improved syntax plugins
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- Additional textobjects for treesitter
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("windwp/nvim-ts-autotag") -- Use treesitter to auto close and auto rename html tag
    use({ "norcalli/nvim-colorizer.lua", cmd = "ColorizerToggle" }) -- The fastest Neovim colorizer
    use "glepnir/dashboard-nvim"
    use { "goolord/alpha-nvim", event = "VimEnter", config = [[require("configs.alpha")]] }
    -- }}}

    -- {{{ lsp/autocompletion/snippets
    -- Collection of configurations for built-in LSP client
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "ray-x/lsp_signature.nvim"
    use "onsails/lspkind-nvim" -- vscode-like pictograms for neovim lsp completion items

    -- autocompletion
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
      },
    })
    use("ray-x/cmp-treesitter")
    -- use("hrsh7th/nvim-cmp") -- Autocompletion plugin
    -- use("hrsh7th/cmp-nvim-lsp")
    -- use("hrsh7th/cmp-path")
    -- use("hrsh7th/cmp-buffer")
    -- use("hrsh7th/cmp-calc")
    -- use("hrsh7th/cmp-nvim-lua")
    -- use("hrsh7th/cmp-emoji")
    use "github/copilot.vim"

    -- snippets
    use "sirver/ultisnips"
    use "quangnguyen30192/cmp-nvim-ultisnips"
    -- use("saadparwaiz1/cmp_luasnip")
    -- use("L3MON4D3/LuaSnip") -- Snippets plugin
    -- use("rafamadriz/friendly-snippets") -- Set of preconfigured snippets for different languages.
    -- }}}
  end,
  config = {
    profile = {
      enable = true,
      threshold = 0.1,
    },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  }
})

-- # vim foldmethod=marker
