local present, alpha = pcall(require, 'alpha')
if not present then
  return
end

local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  [[ ██████   █████                                ███                 ]],
  [[░░██████ ░░███                                ░░░                  ]],
  [[ ░███░███ ░███   ██████   ██████  █████ █████ ████  █████████████  ]],
  [[ ░███░░███░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ]],
  [[ ░███ ░░██████ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ]],
  [[ ░███  ░░█████ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ]],
  [[ █████  ░░█████░░██████ ░░██████   ░░█████    █████ █████░███ █████]],
  [[░░░░░    ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ]],
}

dashboard.section.buttons.val = {
  dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('tff', '  Find file', ':Telescope find_files hidden=true no_ignore=true<CR>'),
  dashboard.button('tfv', '  Find file with preview', ':Telescope find_files preview=true hidden=true no_ignore=true<CR>'),
  dashboard.button('tfg', '  Live grep', ':Telescope live_grep preview=true<CR>'),
  dashboard.button('<Space>fb', '  File browser', ':Telescope file_browse preview=true<CR>'),
  dashboard.button('<Space>mf', '  Media files', ':Telescope media_files preview=true<CR>'),
  dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
}

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
