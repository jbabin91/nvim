local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }

-- Better escape using jk in insert and terminal mode
map('i', 'jk', '<Esc>', default_opts)
map('t', 'jk', '<C-\\><C-n>', default_opts)
map("t", "<C-h>", "<C-\\><C-n><C-w>h", default_opts)
map("t", "<C-j>", "<C-\\><C-n><C-w>j", default_opts)
map("t", "<C-k>", "<C-\\><C-n><C-w>k", default_opts)
map("t", "<C-l>", "<C-\\><C-n><C-w>l", default_opts)

-- Center search results
map('n', 'n', 'nzz', default_opts)
map('n', 'N', 'Nzz', default_opts)

-- Visual line wraps
map('n', 'k', 'v:count == 0 ? "gk" : "k"', expr_opts)
map('n', 'j', 'v:count == 0 ? "gj" : "j"', expr_opts)

-- Always center
map('n', 'k', 'kzz', default_opts)
map('n', 'j', 'jzz', default_opts)
map('n', 'G', 'Gzz', default_opts)

-- Better indent
map('v', '<', '<gv', default_opts)
map('v', '>', '>gv', default_opts)

-- Paste over currently selected text without yanking it
map('v', 'p', '"_dP', default_opts)

-- Switch buffer
map('n', '<S-h>', ':bprevious<CR>', default_opts)
map('n', '<S-l>', ':bnext<CR>', default_opts)

-- Cancel search highlighting with ESC
map('n', '<Esc>', ':nohlsearch<Bar>:echo<CR>', default_opts)

-- Move selected line / block of text in visual mode
map('x', 'K', ":move '<-2<CR>gv-gv", default_opts)
map('x', 'J', ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
map('n', '<C-Left>', ':vertical resize +1<CR>', default_opts)
map('n', '<C-Right>', ':vertical resize -1<CR>', default_opts)
map('n', '<C-Up>', ':resize -1<CR>', default_opts)
map('n', '<C-Down>', ':resize +1<CR>', default_opts)

-- Insert blank lines
map('n', ']<Space>', 'o<Esc>', default_opts)
map('n', '[<Space>', 'O<Esc>', default_opts)
