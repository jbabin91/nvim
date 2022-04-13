local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.keymap.set

-- Remap space as leader key
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = 'n'
--   insert_mode = 'i'
--   visual_mode = 'v'
--   visual_block_mode = 'x'
--   term_mode = 't'
--   command_mode = 'c'

-- NORMAL --
-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
map('n', '<C-Up>', ':resize -2<Cr>', opts)
map('n', '<C-Down>', ':resize +2<Cr>', opts)
map('n', '<C-Left>', ':vertical resize -2<Cr>', opts)
map('n', '<C-Right>', ':vertical resize +2<Cr>', opts)

-- Navigate buffers
map('n', 'm', ':bnext<Cr>', opts)
map('n', 'z', ':bprevious<Cr>', opts)

-- Delete current buffer
map('n', '<Leader>bd', ':bd!<Cr>', opts)

-- Move text up and down
map('n', '<A-j>', '<Esc>:m .+1<Cr>==gi', opts)
map('n', '<A-k>', '<Esc>:m .-2<Cr>==gi', opts)

-- INSERT --
-- Press jk fast to enter normal mode
map('i', 'jk', '<Esc>', opts)

-- VISUAL --
-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move text up and down
map('v', '<A-j>', ':m .+1<Cr>==', opts)
map('v', '<A-k>', ':m .-2<Cr>==', opts)
map('v', 'p', '\"_dP', opts)

-- VISUAL BLOCK --
-- Move text up and down
map('x', 'J', ":move '>+1<Cr>gv-gv", opts)
map('x', 'K', ":move '<-2<Cr>gv-gv", opts)
map('x', '<A-j>', ":move '>+1<Cr>gv-gv", opts)
map('x', '<A-k>', ":move '<-2<Cr>gv-gv", opts)

-- Telescope
map('n', '<Leader>f', ':Telescope find_files hidden=true no_ignore=true<Cr>', opts)
map('n', '<Leader>fp', ':Telescope find_files preview=true hidden=true no_ignore=true<Cr>', opts)
map('n', '<Leader>fg', ':Telescope live_grep preview=true<Cr>', opts)
map('n', '<Leader>fb', ':Telescope file_browser preview=true<Cr>', opts)
map('n', '<Leader>mf', ':Telescope media_files preview=true<Cr>', opts)

-- NvimTree
map('n', '<C-n>', ':NvimTreeFindFileToggle<Cr>', opts)
vim.cmd [[tnoremap <silent> <C-n> <C-\><C-n>:NvimTreeToggle<Cr>]]
map('n', '<Leader>r', ':NvimTreeRefresh<Cr>', opts)

-- Search
map('n', '<Leader>nh', ':nohlsearch<Cr>', opts)

-- Toggle Terminal
vim.cmd [[nnoremap <silent> <A-d>:ToggleTerm<Cr>]]
vim.cmd [[tnoremap <silent> <A-d><C-\><C-n>:ToggleTerm<Cr>]]

-- Trouble
map('n', '<Leader>xx', '<Cmd>Trouble<Cr>', opts)
map('n', '<Leader>xw', '<Cmd>Trouble workspace_diagnostics<Cr>', opts)
map('n', '<Leader>xd', '<Cmd>Trouble document_diagnostics<Cr>', opts)
map('n', '<Leader>xl', '<Cmd>Trouble loclist<Cr>', opts)
map('n', '<Leader>xq', '<Cmd>Trouble quickfix<Cr>', opts)
map('n', 'gR', '<Cmd>Trouble lsp_references<Cr>', opts)
