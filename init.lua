require("core")
require("plugins")
require("configs")

---- Indentation
set_tab_width(2, true)

---- Theme
remove_excess_text()
set_colorscheme("one-nvim")

---- Keybinds
set_leader(" ")
map("n", "<leader>n", "<cmd>noh<cr>") -- For clearing search highlights
map("t", "<esc>",     "<C-\\><C-n>" ) -- For exiting terminal

---- LSP Setup
configure_lsp_windows({
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
})

configure_lsp_signs({
  Error = " ",
  Warn  = " ",
  Hint  = " ",
  Info  = " "
})
