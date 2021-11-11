local nightfox = require("nightfox")

nightfox.setup({
  fox = "nightfox",
  alt_nc = true,
  visual = true,
  search = true,
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold",
  },
  inverse = {
    match_paren = true,
  },
})

nightfox.load()
