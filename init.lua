local theme, completion
local g = vim.g
local impatient_status, impatient = pcall(require, "impatient")
if impatient_status then
  impatient.enable_profile()
end

-- THEME:
theme = "gruvbox"
-- theme = "onedark"
-- theme = "tokyonight"

-- COMPLETION:
-- completion = "cmp"
completion = "coq"

g.__selected_theme = theme
g.__selected_completion = completion

g.coq_settingss = {
  auto_start = true,
  clients = {
    tmux = {
      enabled = false,
    },
  },
}

g.do_filetype_lua = 1
g.did_load_filetypes = 0

local core_modules = {
  "autocmds",
  "plugins",
  "options",
  "keymaps",
  "configs",
}

for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

-- require("autocmds")
-- require("plugins")
-- require("options")
-- require("keymaps")
-- require("configs")

require("utils").disable()
