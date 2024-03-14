return {
  {
    "vim-airline/vim-airline",
    lazy = false,
  },
  {
    "vim-airline/vim-airline-themes",
    lazy = false,
    config = function()
      vim.g.airline_theme = "atomic"
      vim.g["airline#extensions#codeium#enabled"] = 1
    end,
  },
}
