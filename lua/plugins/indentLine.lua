local g = vim.g
-- Change Conceal Behaviour
-- This plugin enables the Vim conceal feature which automatically hides stretches of text based on syntax highlighting.
-- For example, users utilizing the built in json.vim syntax file will no longer see quotation marks in their JSON files.
-- so for .json file, disable conceal Behaviour

-- vim.cmd([[ autocmd BufRead,BufNewFile *.json let g:indentLine_setConceal = 0 ]])

-- enable/disable indent line guide
-- g.indentLine_enabled = 1

-- Change Indent Char
-- g.indentLine_char = '▏'
-- to display more beautiful lines.
-- let g:indentLine_char_list = ['|', '¦', '┆', '┊']

-- customize conceal color(indent line guide color )
-- g.indentLine_color_gui = '#222F22'

g.indentLine_fileTypeExclude = {"alpha", "packer", "startuptime"}

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

require("indent_blankline").setup({
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
  -- space_char_highlight_list = {
  --   "IndentBlanklineIndent1",
  --   "IndentBlanklineIndent2",
  -- },
  show_current_context = true,
  show_current_context_start = true,
})
