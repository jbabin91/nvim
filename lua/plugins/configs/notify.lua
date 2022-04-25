local present, notify = pcall(require, 'notify')
if not present then
  return
end

local icons = require 'utils.icons'

notify.setup {
  stages = 'fade_in_slide_out',
  on_open = nil,
  on_close = nil,
  render = 'default',
  timeout = 1500,
  background_colour = 'Normal',
  minimum_width = 10,
  icons = {
    ERROR = icons.diagnostics.Error,
    WARN = icons.diagnostics.Warning,
    INFO = icons.diagnostics.Information,
    DEBUG = icons.ui.Bug,
    TRACE = icons.ui.Pencil,
  },
}

vim.notify = notify
