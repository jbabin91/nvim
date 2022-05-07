local gitsigns_status, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status then
  print("'Gitsigns' errors.")
  return
end

gitsigns.setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
})
