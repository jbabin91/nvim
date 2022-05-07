local npairs_status, npairs = pcall(require, "nvim-autopairs")
if not npairs_status then
  print("'nvim-autopairs' errors.")
  return
end

npairs.setup({})
