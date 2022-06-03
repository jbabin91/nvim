local cmd, fn, g, opt = vim.cmd, vim.fn, vim.g, vim.opt
local settings = require("user-conf")
local utils = require("functions")

opt.inccommand = "split"
opt.updatetime = 300 -- Decrease update time for faster completion
opt.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete
opt.backup = false -- creates a backup file
opt.swapfile = true -- enable/disable swap file creation
opt.dir = fn.stdpath("data") .. "/swp" -- swap file directory
opt.undofile = true -- enable/disable undo file creation
opt.undodir = fn.stdpath("data") .. "/undodir" -- set undo directory
opt.history = 500 -- Use the 'history' option to set the number of lines from command mode that are remembered.
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.number = settings.number -- Make line numbers default
opt.relativenumber = settings.relative_number -- Make relative number default
opt.cmdheight = 1 -- space for displaying messages/commands
opt.showmode = false -- Do not need to show the mode. We use the status line instead
opt.showtabline = 2 -- always show tabs
if settings.global_statusline then
  opt.laststatus = 3 -- Global statusline
else
  opt.laststatus = 2
end
opt.smartcase = true -- Smart case
opt.smartindent = true -- Make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.expandtab = true -- Conver tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- how many columns a tab counts for
opt.termguicolors = true -- Enable colors in terminal
opt.cursorline = false -- highlight the current line
opt.scrolloff = 16 -- Minimal number of screen lines to keep above and below cursor
opt.sidescrolloff = 8 -- Minimal number of columns to scroll horizontally
opt.hlsearch = true -- Set highlight on search
opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
opt.foldenable = false -- disable folding: enable with zi
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
opt.colorcolumn = "99999"
opt.wildmode = "full"
opt.lazyredraw = true -- do not redraw screen while running macros
if utils.isNotEmpty(settings.grepprg) then
  opt.grepprg = settings.grepprg
end
opt.completeopt = "menu,menuone,noselect,noinsert" -- A comma separated list of options for Inset mode completeion
opt.mouse = "a" -- Enable mouse mode
opt.breakindent = true -- Enable break indent
opt.signcolumn = "yes" -- Always show sign column
opt.joinspaces = false -- No double spaces with join after a dot
opt.sessionoptions = "buffers,curdir,help,tabpages,winsize,winpos,terminal"
opt.smarttab = true
opt.textwidth = 0
opt.autoindent = true
opt.softtabstop = 2

-- go to previous/next line with h,l, left arrow and right arrow when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable nvim intro
opt.shortmess:append "sI"

-- Better search
opt.path:remove "/usr/include"
opt.path:append "**"

-- Wild settings
opt.wildignorecase = true
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"

-- Fold settings

