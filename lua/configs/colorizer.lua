local colorizer_status, colorizer = pcall(require, "colorizer")
if not colorizer_status then
  print("'colorizer' errors.")
  return
end

colorizer.setup({
  "css",
  "javascript",
  "typescript",
  "json",
  "rust",
  "lua",
}, {
  mode = "foreground",
})
