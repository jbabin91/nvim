local g = vim.g
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic
-- use space as the leader key
map({ 'n', 'v' }, '<Space>', '<Nop>', opts)
g.mapleader = ' '
g.maplocalleader = ' '

-- Writing
map('n', '<Leader>w', ':w<CR>', opts)
map('i', '<Leader>w', '<C-c>:w<CR>', opts)

-- Window
map('n', '<Leader>q', ':q<CR>', opts)
map('n', '<Leader>v', ':vsplit<CR>', opts)
map('n', '<Leader>h', ':hsplit<CR>', opts)

-- Search
map('n', '<Esc><Esc>', ':noh<CR>', opts)

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })
vim.keymap.set('n', 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
