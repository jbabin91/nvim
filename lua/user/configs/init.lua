local modules = {
  "alpha",
  "cmp",
  "indentline",
  "nvim-tree",
  "toggleterm",
  "autopairs",
  "comment",
  "project",
  "treesitter",
  "bufferline",
  "gitsigns",
  "lualine",
  "telescope",
  "whichkey",
}

for _, mod in ipairs(modules) do
  local ok, err = pcall(require, "user.configs." .. mod)
  if not ok then
    vim.notify(
      string.format("--- Module '%s' failed to load due to error: %s", mod, err),
      vim.log.levels.ERROR
    )
  end
end
