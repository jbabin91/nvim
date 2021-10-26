if require "plugins.first_load"() then return end
-- require("plugins.install")
-- require("plugins.configs")
-- require("plugins.configs.lsp")
local core_modules = {
  "plugins.install",
  "plugins.configs",
}

for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end
