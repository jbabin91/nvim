local interface = {}

function interface.alpha_setup()
  local alpha = require "alpha"
  local theme = require "alpha.themes.dashboard"

  -- Set header
  local header = {
    type = "text",
    val = {
      [[                                                     ]],
      [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                     ]],
    },
    opts = {
      position = "center",
      hl = "Type",
    },
  }

  theme.section.header.val = header.val
  theme.section.header.opts = header.opts
  alpha.setup(theme.opts)
  vim.cmd [[
    autocmd FileType alpha setlocal nofoldenable
  ]]
end

function interface.barbar_setup()
  -- barbar
  vim.g.bufferline = {
    animation = false,
    auto_hide = true,
    icons = true,
  }
end

function interface.setup()
  -- colorizer
  require("colorizer").setup(nil, {
    RRGGBB = true,
    RRGGBBAA = true,
    css = true,
    css_fn = true,
    rgb_fn = true,
    hsl_fn = true,
  })

  -- Statusline
  require("lualine").setup()

  -- gitsigns
  require("gitsigns").setup {
    signs = {
      add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
  }

  -- Indent Blankline
  require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = {
      "aerial",
      "alpha",
      "dashboard",
      "gitcommit",
      "help",
      "lspinfo",
      "NvimTree",
      "packer",
      "Startify",
      "TelescopePrompt",
      "TelescopeResults",
      "Trouble",
      "undotree",
    },
    buftype_exclude = {
      "nofile",
      "terminal",
    },
  }

  -- Icons
  require("nvim-web-devicons").setup { default = true }

  -- colorscheme
  local utils = require "utils"
  local opt = utils.opt
  local cmd = vim.cmd

  opt("o", "termguicolors", true)
  -- sonokai configurations
  -- available style options: default, atlantis, andromeda, shusia, maia, espresso
  -- vim.g.sonokai_style = "default"
  -- vim.g.sonokai_menu_selection_background = "green"
  -- vim.g.sonokai_enable_italic = 1
  -- vim.g.sonokai_disable_italic_comment = 1
  -- vim.g.sonokai_diagnostic_text_highlight = 1
  -- vim.g.sonokai_current_word = "bold"
  -- tokyonight configurations
  vim.g.tokyonight_style = "storm"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_dark_sidebar = true
  -- activate theme
  cmd [[colorscheme tokyonight]]
  -- custom mod
  cmd [[hi CursorLineNr guifg=#89ddff]]
  cmd [[hi PmenuSel guibg=#89ddff guifg=#1f2335]]
end

return interface
