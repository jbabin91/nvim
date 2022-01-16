local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <space>
api.nvim_set_keymap("", "<space>", "<nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true -- Set highlight on search
opt.number = true -- Make line numbers default
opt.relativenumber = true -- Make relative number default
opt.mouse = "a" -- Enable mouse mode
opt.breakindent = true -- Enable break indent
opt.undofile = true -- Save undo history
opt.ignorecase = true -- Case insensitive searching unles /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 -- Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

function _G.statusline()
  local filepath = "%f"
  local align_section = "%="
  local parcentage_through_file = "%p%%"
  return string.format(
    "%s%s%s",
    filepath,
    align_section,
    percentage_through_file
  )
end

-- Status line
-- vim.cmd [[
--   set statusline=%!v:lua.statusline()
--   set statusline=%f  " Path to the file
--   set statusline+=%= " Switch to the right side
--   set statusline+=%l " Current line
--   set statusline+=/  " Separator
--   set statusline+=%L " Total lines
-- ]]
