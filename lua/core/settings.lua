-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
--- See: https://neovim.io/doc/user/vim_diff.html
--- [2] Defaults - *nvim-defaults*

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd                  -- Execute Vim commands
local exec = vim.api.nvim_exec       -- Execute Vimscript
local g = vim.g                      -- Global variables
local opt = vim.opt                  -- Set options (global/buffer/windows-scoped)
-- local fn = vim.fn                    -- Call Vim functions

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.fileencoding = "utf-8"           -- The encoding written to a file
opt.mouse = "a"                      -- Enable mouse support
opt.clipboard = "unnamedplus"        -- Copy/paste to system clipboard
opt.swapfile = false                 -- Don't use swapfile
opt.backup = false                   -- Creates a backup file
opt.writebackup = false              -- If a file is being edited by another program
opt.completeopt = "menuone,noselect" -- Autocomplete options
opt.timeoutlen = 100                 -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 300                 -- Faster completion (4000ms default)
opt.undofile = true                  -- Enable persistent undo

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true                    -- Show line number
opt.relativenumber = true            -- Set relative numbered lines
opt.showmatch = true                 -- Highlight matching parenthesis
opt.foldmethod = "marker"            -- Enable folding (default: `foldmarker`)
opt.colorcolumn = "120"              -- Line length marker at 80 columns
opt.splitright = true                -- Vertical split to the right
opt.splitbelow = true                -- Horizontal split to the bottom
opt.ignorecase = true                -- Ignore case letters when searching
opt.smartcase = true                 -- Ignore lowercase for the whole pattern
opt.linebreak = true                 -- Wrap on word boundary
opt.termguicolors = true             -- Enable 24-bit RGB colors
opt.showmode = true                  -- We don't need to see things like -- INSERT --
opt.pumheight = 10                   -- Pop up menu height
opt.cmdheight = 2                    -- More space in the neovim command line for displaying messages
opt.scrolloff = 8                    -- Adds 8 spaces to the bottom of the view when scrolling
opt.sidescrolloff = 8                -- Adds 8 spaces to the right of the view when scrolling
opt.signcolumn = "yes"               -- Always show the sign column, otherwise it would shift the text each time
opt.numberwidth = 2                  -- Set number column width to 2 {default 4}
opt.showtabline = 2                  -- Always show tabs
opt.cursorline = true                -- Highlight the current line
opt.hlsearch = true                  -- Highlight all matches on previous search pattern
opt.wrap = false                     -- Display lines as one long line

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true                 -- Use spaces instead of tabs
opt.shiftwidth = 2                   -- Shift 2 spaces when tab
opt.tabstop = 2                      -- 1 tab == 2 spaces
opt.smartindent = true               -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true                    -- Enable background buffers
opt.history = 100                    -- Remember N lines in history
opt.lazyredraw = true                -- Faster scrolling
opt.synmaxcol = 240                  -- Max column for syntax highlight

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------

-- Remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=800}
  augroup end
]], false)

-- Don't auto comment new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove line length marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

cmd [[set whichwrap+=<,>,[,],h,l]]

cmd [[set iskeyword+=-]]

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------

-- Open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks:
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
  autocmd BufLeave term://* stopinsert
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable nvim intro
opt.shortmess:append "csI"

-- Disable builtin plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
