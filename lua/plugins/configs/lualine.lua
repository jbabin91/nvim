local present, lualine = pcall(require, 'lualine')
if not present then
  return
end

local present_gps, gps = pcall(require, 'nvim-gps')
if not present_gps then
  return
end

local function hide_in_width()
  return vim.fn.winwidth(0) > 80
end

local icons = require 'utils.icons'

local fn = vim.fn

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = {
    error = icons.diagnostics.Error .. ' ',
    warn = icons.diagnostics.Warning .. ' ',
  },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  'diff',
  colored = false,
  symbols = {
    added = icons.git.Add .. ' ',
    modified = icons.git.Mod .. ' ',
    removed = icons.git.Remove .. ' ',
  },
  cond = hide_in_width,
}

local mode = {
  'mode',
  fmt = function(str)
    return '-- ' .. str .. ' --'
  end,
}

local filetype = {
  'filetype',
  icons_enabled = false,
  icon = nil,
}

local branch = {
  'branch',
  icons_enabled = true,
  icon = '',
}

local location = {
  'location',
  padding = 0,
}

-- cool function for progress
local function progress()
  local current_line = fn.line '.'
  local total_lines = fn.line '$'
  local chars = { '__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local function spaces()
  return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

local function nvim_gps()
  local gps_location = gps.get_location()
  if gps_location == 'error' then
    return ''
  else
    return gps.get_location()
  end
end

-- TODO: find out what is overriding this
vim.opt.laststatus = 3

-- Set statusbar
lualine.setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline', 'toggleterm' },
    disabled_filetypes = { 'alpha', 'dashboard', 'toggleterm' },
    always_divide_middle = true,
  },
  sections = {
    -- lualine_a = { branch, diagnostics },
    lualine_a = { branch },
    lualine_b = { diagnostics },
    -- lualine_c = { nvim_gps },
    lualine_c = {
      { nvim_gps, cond = hide_in_width },
    },
    -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_x = { diff, spaces, 'encoding', filetype },
    lualine_y = { location },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

vim.opt.laststatus = 3
