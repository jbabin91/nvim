local cmd = vim.cmd

local M = {
  base00 = "#1b2b34",
  base01 = "#343d46",
  base02 = "#4f5b66",
  base03 = "#65737e",
  base04 = "#a7adba",
  base05 = "#c0c5ce",
  base06 = "#cdd3de",
  base07 = "#d8dee9",
  red = "#ec5f67",
  orange = "#f99157",
  yellow = "#fac863",
  green = "#99c794",
  cyan = "#62b3b2",
  blue = "#6699cc",
  purple = "#c594c5",
  brown = "#ab7967",
  white = "#ffffff",
}

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

cmd[[colorscheme tokyonight]]

function M.setItalics()
  cmd[[ hi Comment gui=italic ]]
  cmd[[ hi Keyword gui=italic ]]
  cmd[[ hi Identifier gui=italic ]]
  cmd[[ hi StorageClass gui=italic ]]
  cmd[[ hi jsLineComment gui=italic ]]
  cmd[[ hi xmlAttrib gui=italic ]]
  cmd[[ hi htmlArg gui=italic ]]
  cmd[[ pythonSelf gui=italic ]]
end

return M
