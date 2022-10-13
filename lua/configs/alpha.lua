local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

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
  dashboard.button("f", " " .. " Find file", ":Telescope find_files<cr>"),
  dashboard.button("e", " " .. " New File", ":ene <BAR> startinsert<cr>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<cr>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles<cr>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep<cr>"),
  dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua<cr>"),
  dashboard.button("q", " " .. " Quit", ":qa<cr>"),
}
local function footer()
  return "neovim basic ide"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
