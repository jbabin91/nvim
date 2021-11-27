local icons = require("icons")
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
  -- dashboard.button("e", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button("a", icons.fileNoBg .. "Find File", ":Telescope find_files<CR>"),
  dashboard.button("b", icons.fileCopy .. "Recents", ":Telescope oldfiles hidden=true<CR>"),
  -- dashboard.button("c", icons.timer .. "Load Last Session", "SessionLoad"),
  dashboard.button("d", icons.t .. "Find Word", ":Telescope live_grep<CR>"),
  dashboard.button("e", icons.container .. "Sync Plugins", ":PU<CR>"),
  dashboard.button("g", icons.vim .. "Settings", ":edit $MYVIMRC<CR>"),
  dashboard.button("h", icons.container .. "Quit NVIM" , ":qa<CR>"),
}

-- local handle = io.popen('fortune')
-- local fortune = handle:read("*a")
-- handle:close()
-- dashboard.section.footer.val = fortune

alpha.setup(dashboard.opts)
