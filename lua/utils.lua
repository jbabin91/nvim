-- ===============================================================================
-- ============================== HELPER FUNCTIONS ===============================
-- ===============================================================================

local M = {}

function M.packer_lazy_load(plugin, timer)
  if plugin then
    timer = timer or 0
    vim.defer_fn(function()
      require("packer").loader(plugin)
    end, timer)
  end
end

-- ------------------------ Disable unnecessary plugins --------------------------

function M.disable()
  local disabled_builtins = {
    "fzf",
    "gtags",
    "matchparen",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
  }

  for _, plugin in pairs(disabled_builtins) do
    vim.g["loaded_" .. plugin] = 1
  end
end

-- --------------------------- Notifications -------------------------------------

function M.log(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({{ name .. ": ", hl }, { msg }}, true, {})
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

return M
