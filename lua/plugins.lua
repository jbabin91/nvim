local cmd = vim.cmd

local use = require("packer").use

-- Packer commands
cmd [[command! PackerInstall packadd packer.nvim | lua require("plugins").install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require("plugins").update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require("plugins").sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require("plugins").clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require("plugins").compile()]]
cmd [[command! PackerStatus packadd packer.nvim | lua require("plugins").status()]]
cmd [[command! PC PackerCompile]]
cmd [[command! PS PackerStatus]]
cmd [[command! PU PackerSync]]

return require("packer").startup {
  function()
    -- core
    use { "wbthomason/packer.nvim", opt = true }
    use { "nvim-lua/popup.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "lewis6991/impatient.nvim" }
    use { "nathom/filetype.nvim" }

    -- colorscheme
    use { "folke/tokyonight.nvim" }
    use { "sainnhe/sonokai" }

    -- interface
    use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
    use { "SmiteshP/nvim-gps" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "romgrk/barbar.nvim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "goolord/alpha-nvim", requires = { "kyazdani42/nvim-web-devicons" } }

    -- lsp
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/nvim-lsp-installer" }
    use { "folke/lsp-colors.nvim" }
    use { "onsails/lspkind-nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "hrsh7th/nvim-cmp" }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- git
    use { "tpope/vim-fugitive" }
    use { "lewis6991/gitsigns.nvim" }

    -- IDE-like development
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }
    use { "hrsh7th/cmp-vsnip" }
    use { "hrsh7th/vim-vsnip" }
    use { "mattn/emmet-vim" }
    use { "rafamadriz/friendly-snippets" }
    use { "b0o/schemastore.nvim" }
    use { "folke/trouble.nvim" }
    use { "tpope/vim-commentary" }
    use { "tpope/vim-unimpaired" }
    use { "tpope/vim-sleuth" }
    use { "tpope/vim-surround" }
    use { "windwp/nvim-autopairs" }
    use { "norcalli/nvim-colorizer.lua" }
    use { "mhartington/formatter.nvim" }
    use { "godlygeek/tabular" }

    -- programming languages enhancement
    -- use({ "fatih/vim-go", run = ":GoUpdateBinaries", ft = "go" })

    -- tools
    use { "phaazon/hop.nvim" }
    use { "numtostr/FTerm.nvim" }
    use { "folke/which-key.nvim" }
    use {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
      config = [[vim.g.startuptime_tries = 10]],
    }
    -- use({ "wakatime/vim-wakatime" })

    -- searching & filtering
    use { "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "haya14busa/incsearch.vim" }

    -- file explorer
    use { "kevinhwang91/rnvimr" }

    -- markdown support
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
    },
  },
}
