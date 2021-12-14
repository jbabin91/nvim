--[[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
Neovim init file
--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
-- load impatient first
local present, _ = pcall(require, 'impatient')
if present then require('impatient') end

-- disable builtin plugins
local disabled_builtins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 1
end

-- load options, mappings, and plugins
local modules = {
  'options',
  'mappings',
  'packer_compiled',
  'packerInit',
  'pluginList',
}

for i = 1, #modules, 1 do
  pcall(require, modules[i])
end


-- require('packerInit')
-- require('pluginList')

-- require('settings')
-- require('keymaps')
-- require('plugins/packer')
-- require('plugins/nvim-tree')
-- require('plugins/indent-blankline')
-- require('plugins/feline')
-- require('plugins/vista')
-- require('plugins/nvim-cmp')
-- require('plugins/nvim-lspconfig')
-- require('plugins/nvim-treesitter')
-- require('plugins/alpha-nvim')
