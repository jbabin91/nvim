return {
  {
    "rose-pine/neovim",
    enabled = false,
    lazy = false,
    name = "rose-pine",
    priority = 1000,
    config = function()
      vim.cmd("set background=dark")
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "catppuccin/nvim",
    enabled = true,
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
    },
  },
}
