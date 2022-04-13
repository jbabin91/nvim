local present, indent = pcall(require, 'indent_blankline')
if not present then
  return
end

indent.setup({
  show_current_context = true,
  show_current_context_start = false,
  filetype_exclude = {
    'NvimTree',
    'packer',
    'toggleterm',
    'lsp-installer',
    'help',
    'alpha',
    'dashboard',
    'lspinfo',
  }
})

vim.g.indent_blankline_show_trailing_blankline_indent = false
