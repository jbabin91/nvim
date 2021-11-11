require("core")

local user_config = CONFIG_PATH .. "/lua/core/user-config/init.lua"

if not JB.utils.file.exists(user_config) then JB.utils.file.create(user_config) end

-- User config that overrides the above
vim.cmd("luafile " .. user_config)

local modules = {
  "core.options",
  "core.plugins",
  "core.keybindings",
}

for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  if not ok then
    vim.notify(
      string.format("--- Module '%s' failed to load due to error: %s", mod, err),
      vim.log.levels.ERROR
    )
  end
end
-- Syntax and Visual
-- If a custom theme is wanted, require() that in user-config.init
-- Otherwise if the default theme is not wanted change JB.settings.colorscheme
-- This will return nil if it's not found
if JB.settings.colorscheme ~= "custom" then
  JB.utils.plugins.require("configs.colorscheme." .. JB.settings.colorscheme)
end

-- LSP and Autocomplete
-- require("configs.language-servers")

-- Git
require("configs.gitsigns")

-- Other
require("configs.which-key")

if JB.settings.transparent_bg then
  vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
end
