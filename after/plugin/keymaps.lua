local g = vim.g
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local expr_opts = { expr = true, silent = true }

-- Remap leader and local leader to <Space>
keymap("", "<Space>", "<Nop>", opts)
g.mapleader = " "
g.maplocalleader = " "

-- Remap for dealing with visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', opts)

-- Tab switch buffer
keymap("n", "<Tab>", ":bnext<cr>", opts)
keymap("n", "<S-Tab>", ":bprevious<cr>", opts)

-- Cancel search highlighting with ESC
keymap("n", "<Esc>", ":nohlsearch<Bar>:echo<cr>", opts)

-- Autocorrect spelling from previous error
keymap("i", "<C-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)

-- Move selected line/block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Insert blank line
keymap("n", "]<Space>", "o<Esc>", opts)
keymap("n", "[<Space>", "O<Esc>", opts)
