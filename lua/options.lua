-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1
vim.g.shell = '/bin/bash/' -- fish has speed issues with nvim-tree
vim.g.neovide_cursor_vfx_mode = 'pixiedust' -- neovide trail
-- vim.opt.fillchars = { eob = ' ' } -- disable tilde fringe
vim.opt.undofile = true -- enable persistent undo
vim.opt.swapfile = false -- disable swap
vim.opt.cursorline = true -- enable cursorline
vim.opt.mouse = 'a' -- enable mouse
vim.opt.signcolumn = 'yes' -- enable signcolumn
vim.opt.updatetime = 250
vim.opt.clipboard = 'unnamedplus' -- enable universal clipboard
vim.opt.scrolloff = 3 -- leave 3 lines up/down while scrolling
vim.opt.tabstop = 2 -- tabs should be 2 'space' wide
vim.opt.shiftwidth = 2 -- tabs should be 2 'space' wide
vim.opt.expandtab = true -- tabs should be spaces
vim.opt.linebreak = true -- clean linebreaks
vim.opt.number = true -- show absolute numbers
vim.opt.relativenumber = true -- show relative numbers
vim.opt.showmode = false
vim.opt.guifont = 'JetBrainsMono Nerd Font Mono' -- set guifont for neovide
vim.opt.shortmess:append('casI') -- disable intro
vim.opt.whichwrap:append('<>hl') -- clean aligned wraps
vim.opt.guicursor:append('i:blankwait700-blinkon400-blinkoff250')

-- Remap for dealing with word wrap
local map = vim.api.nvim_set_keymaps
local opts = { noremap = true, silent = true, expr = true }

map('n', 'k', [[v:count == 0 ? 'gk' : 'k']], opts)
map('n', 'j', [[v:count == 0 ? 'gj' : 'j']], opts)

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]]
