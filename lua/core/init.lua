local core_modules = {
  "options",
  "disabled",
  "keymappings",
}

for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, "core." .. module)
  if not ok then
    error(("Error loading...%s\n\n%s"):format(module, err))
  end
end
