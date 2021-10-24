local colors = require "core.theme"

require("bufferline").setup {
  options = {
    view = "default",
    numbers = "ordinal",
    buffer_close_icons = "",
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length =  18,
    max_prefix_length = 15,
    show_buffer_close_icons = true,
    show_line_diagnostics = true,
    persist_buffer_sort = true,
    separator_style = { "", "" },
    enforce_regular_tabs = false,
    always_show_bufferline = true,
  },
  highlights = {
    modified           = { guifg = colors.green, guibg = "#0F1E28" },
    modified_visible   = { guifg = "#3C706F", guibg = "#16242E" },
    modified_selected  = { guifg = colors.cyan, guibg = "#142832" },

    fill               = { guifg = "#0F1E28" },
    background         = { guifg = colors.base04, guibg = "#0F1E28" },

    tab                = { guifg = colors.base01, guibg = "#0F1E28" },
    tab_selected       = { guibg = "#142832" },
    tab_close          = { guibg = "#0F1E28" },

    buffer_visible     = { guibg = "#16242E" },
    buffer_selected    = { guifg = colors.white, guibg = "#142832", gui = "" },

    indicator_selected = { guifg = colors.cyan, guibg = "#142832" },

    separator          = { guibg = "#62b3b2" },
    separator_selected = { guifg = colors.cyan, guibg = "#142832" },
    separator_visible  = { guibg = colors.cyan },

    duplicate          = { guifg = colors.base04, guibg = "#0F1E28", gui = "" },
    duplicate_selected = { guifg = colors.white, guibg = "#142832", gui = "" },
    duplicate_visible  = { guibg = "#16242E", gui = "" },
  },
}
