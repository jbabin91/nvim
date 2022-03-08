-- highlight BookmarkSign ctermbg=NONE ctermfg=160
-- highlight BookmarkLine ctermbg=194 ctermfg=NONE
local g = vim.g
local icons = require "configs.icons"
g.bookmark_sign = icons.ui.BookMark
g.bookmark_annotation_sign = icons.ui.Comment
g.bookmark_no_default_key_mappings = 1
g.bookmark_auto_save = 0
g.bookmark_auto_close = 0
g.bookmark_manage_per_buffer = 0
g.bookmark_save_per_working_dir = 0
-- g.bookmark_highlight_lines = 1
g.bookmark_show_warning = 0
g.bookmark_center = 1
g.bookmark_location_list = 0
g.bookmark_disable_ctrlp = 1
g.bookmark_display_annotation = 0
-- g.bookamrk_auto_save_file = "~/.config/lvim/bookmarks"
