require("kanagawa").setup {
  undercurl = true,
  commentStyle = "italic",
  functionStyle = "NONE",
  keywordStyle = "italic",
  statementStyle = "bold",
  typeStyle = "NONE",
  variablebuiltinStyle = "italic",
  specialReturn = true,
  specialException = true,
  trasparent = false,
  colors = {},
  overrides = {},
}

vim.cmd [[colorscheme kanagawa]]
