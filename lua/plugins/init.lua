return {
  {
    "tpope/vim-vinegar",
    "tpope/vim-surround",
    {
      "stevearc/oil.nvim",
      config = function()
        require("oil").setup({
          keymaps = {
            ["<C-p>"] = false,
            ["<C-h>"] = false,
            ["<C-l>"] = false,
          },
          view_options = {
            show_hidden = true,
          },
        })

        vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
      end,
    },
    "scrooloose/nerdcommenter",
    "windwp/nvim-autopairs",
    "alvan/vim-closetag",
    "mg979/vim-visual-multi",
    "romainl/vim-qf",
    "nvim-lua/plenary.nvim",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-tree/nvim-web-devicons",
    {
      "nmac427/guess-indent.nvim",
      opts = {
        filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
          "netrw",
          "tutor",
          "oil",
        },
      },
    },
    "christoomey/vim-tmux-navigator",
    "nvimtools/none-ls.nvim",
    "mrjones2014/legendary.nvim",
    "folke/trouble.nvim",
    "Exafunction/codeium.vim",
  },
}
