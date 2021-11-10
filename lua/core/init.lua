local modules = {
  "options",
  "plugins",
  "mappings",
}

for _, mod in ipairs(modules) do
  local ok, err = pcall(require, "core." .. mod)
  if not ok then
    vim.notify(
      string.format("--- Module '%s' failed to load due to error: %s", mod, err),
      vim.log.levels.ERROR
    )
  end
end
