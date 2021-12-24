local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  return
end

nightfox.setup {
  fox = "nordfox",
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold",
  },
  inverse = {
    match_paren = true,
  },
  colors = {
    red = "#FFF000",
    bg_alt = "#000000",
  },
  hlgroups = {
    TSPunctDelimiter = { fg = "${red}" },
    LspCodeLens = { bg = "#000000", style = "italic" },
  },
}

nightfox.load()
