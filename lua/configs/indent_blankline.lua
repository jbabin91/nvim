local indent_status, indent = pcall(require, "indent_blankline")
if not indent_status then
  print("'Indent_Blankline' errors.")
  return
end

indent.setup({
  char = "|",
  show_trailing_blankline_indent = false,
})
