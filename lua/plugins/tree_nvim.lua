local ok, _ pcall(require, "nvim-tree")

if not ok then return end

local gl = vim.g

gl.nvim_tree_side                  = 'left'   --left by default
gl.nvim_tree_width                 = 25   --30 by default, can be width_in_columns or 'width_in_percent%'
-- gl.nvim_tree_ignore                = { '.git', 'node_modules', '.cache' }   --empty by default
-- gl.nvim_tree_gitignore             = 1   --0 by default
--gl.nvim_tree_auto_open             = 0   --0 by default, opens the tree when typing `vim $DIR` or `vim`
-- gl.nvim_tree_auto_close            = 1   --0 by default, closes the tree when it's the last window
-- gl.nvim_tree_auto_ignore_ft        = { 'startify', 'dashboard' }   --empty by default, don't auto open tree on specific filetypes.
-- gl.nvim_tree_quit_on_open          = 1   --0 by default, closes the tree when you open a file
-- gl.nvim_tree_follow                = 1   --0 by default, this option allows the cursor to be updated when entering a buffer
gl.nvim_tree_indent_markers        = 1   --0 by default, this option shows indent markers when folders are open
-- gl.nvim_tree_hide_dotfiles         = 1   --0 by default, this option hides files and folders starting with a dot `.`
-- gl.nvim_tree_git_hl                = 1   --0 by default, will enable file highlight for git attributes (can be used without the icons).
gl.nvim_tree_highlight_opened_files= 1   --0 by default, will enable folder and file icon highlight for opened files/directories.
-- gl.nvim_tree_root_folder_modifier  = ':~'   --This is the default. See :help filename-modifiers for more options
-- gl.nvim_tree_tab_open              = 1   --0 by default, will open the tree when entering a new tab and the tree was previously open
-- gl.nvim_tree_auto_resize           = 0   --1 by default, will resize the tree to its saved width when opening a file
-- gl.nvim_tree_disable_netrw         = 0   --1 by default, disables netrw
-- gl.nvim_tree_hijack_netrw          = 0   --1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
-- gl.nvim_tree_add_trailing          = 1   --0 by default, append a trailing slash to folder names
-- gl.nvim_tree_group_empty           = 1   -- 0 by default, compact folders that only contain a single folder into one node in the file tree
-- gl.nvim_tree_lsp_diagnostics       = 0   --0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
-- gl.nvim_tree_disable_window_picker = 1   --0 by default, will disable the window picker.
-- gl.nvim_tree_hijack_cursor         = 0   --1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
-- gl.nvim_tree_icon_padding          = ' '   --one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
-- gl.nvim_tree_update_cwd            = 1   --0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 25,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

local cmd   = vim.cmd           -- execute Vim commands

cmd('autocmd ColorScheme * highlight highlight NvimTreeBg guibg=None')
cmd('autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeBg')

-- Mappings
local keymap = vim.api.nvim_set_keymap
local options = { noremap=true, silent=true }

-- Toggle Nvim-Tree
keymap('n', '<leader>f',   ':NvimTreeToggle<CR>',      options)
