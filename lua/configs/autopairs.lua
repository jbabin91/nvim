enable_check_bracket_line = false
local present, npairs = pcall(require, "nvim-autopairs")
if not present then
  return
end

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string" }, -- it will not add pair on that treesitter node
    javascript = { "template_string" },
    java = false, -- don't check treesitter on java
  },
}
