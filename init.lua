-- Load basic configuration
local utils_ok, utils = pcall(require, "utils")
if not utils_ok then return end

local modules = {
  "options",
  "keymap",
  "commands",
}

for _, module_name in ipairs(modules) do
  local ok, err = pcall(require, module_name)
  if not ok then
    local msg = "calling module: " .. module_name .. " fail: " .. err
    utils.log_err(msg)
  end
end

-- load plugins
utils.load_plugins()
