local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
  print("'Lualine' errors.")
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = "|",
    section_separators = "",
  },
})
