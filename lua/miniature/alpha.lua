local present, alpha = pcall(require, "alpha")
if not present then
  return
end

local function pick_color()
  local colors = {
    "AlphaHeader1",
    "AlphaHeader2",
    "AlphaHeader3",
    "AlphaHeader4",
    "AlphaHeader5",
    "AlphaHeader6",
    "AlphaHeader7",
  }
  return colors[math.random(#colors)]
end

local dashboard = require "alpha.themes.dashboard"

-- Header
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

-- Button
local set_color = pick_color()

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButtonText"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  return b
end

dashboard.section.buttons.val = {
  -- button("s", "  Load session", ":lua require(\"persisted\").load()<CR>"),
  -- button("b", "  Bookmarks", ":Telescope harpoon marks<CR>"),
  -- button("r", "  Recently used files", ":Telescope frecency<CR>"),
  button("f", "  Find file", ":Telescope find_files hidden=true path_display=smart<CR>"),
  button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	button("p", "  Find project", ":Telescope projects <CR>"),
	button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	button("t", "  Find text", ":Telescope live_grep path_display=smart<CR>"),
  -- button("w", "  Find word", ":Telescope live_grep path_display=smart<CR>"),
	button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  button("u", "  Update plugins", ":lua require(\"packer\").sync()<CR>"),
	button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.buttons.opts = {
  spacing = 0,
}

-- Footer
dashboard.section.footer.val = require "alpha.fortune"

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

-- Layout

dashboard.config.layout = {
  { type = "padding", val = 1 },
  dashboard.section.header,
  { type = "padding", val = 1 },
  dashboard.section.buttons,
  { type = "padding", val = 0 },
  dashboard.section.footer,
}

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
