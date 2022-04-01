local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  -- colorcolumn = "80",
  -- colorcolumn = "120",
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  laststatus = 3,
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- cmd [[syntax enable]] -- syntax highlighting
-- -- Set highlight on search
-- opt.hlsearch = false
-- opt.number = true -- Make line numbers default
-- opt.rnu = true -- Relative line numbers
-- opt.mouse = "a" -- Enable mouse mode
-- opt.modeline = true -- Enable modlines for files
-- opt.modelines = 5 -- Number of modelines
-- opt.showmode = false
-- opt.cursorline = true -- Highlight line cursor is in
-- -- Tab settings
-- opt.tabstop = 2 -- 2 tabstop
-- opt.shiftwidth = 2
-- opt.expandtab = true -- tabs -> spaces
-- opt.smartindent = true -- nice indenting
-- opt.foldmethod = "marker" -- set fold method to marker
-- -- Enable break indent
-- opt.breakindent = true
-- -- Backup/Swap files
-- opt.swapfile = false -- have files saved to swap
-- opt.undofile = true -- File undo history preserved outside current session
-- -- Case insensitive searching UNLESS /C or capital in search
-- opt.ignorecase = true
-- opt.smartcase = true
-- -- Decrease update time
-- opt.updatetime = 350
-- opt.signcolumn = "yes"
-- opt.termguicolors = true
-- -- New win split options
-- opt.splitbelow = true
-- opt.splitright = true
-- -- Set completeopt to have a better completion experience
-- opt.completeopt = "menu,menuone,noselect"

-- Disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
g.loaded_matchparen        = 1
g.loaded_matchit           = 1
g.loaded_logiPat           = 1
g.loaded_rrhelper          = 1
g.loaded_tarPlugin         = 1
g.loaded_gzip              = 1
g.loaded_zipPlugin         = 1
g.loaded_2html_plugin      = 1
g.loaded_shada_plugin      = 1
g.loaded_spellfile_plugin  = 1
g.loaded_netrw             = 1
g.loaded_netrwPlugin       = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_remote_plugins    = 1

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

