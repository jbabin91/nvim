local configs = {
  "lsp",
  "comment",
  "impatient",
  "bufremove",
  "cursorword",
  "gitsigns",
  "indentline",
  "surround",
  "trailspace",
  "treesitter",
  "neogit",
}

for _, v in pairs(configs) do
  require("configs."..v)
end

