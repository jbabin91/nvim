-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal --
-- Better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- Resize with Ctrl + arrows
keymap("n", "<c-Up>", ":resize -2<cr>", opts)
keymap("n", "<c-Down>", ":resize +2<cr>", opts)
keymap("n", "<c-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-Right>", ":vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<s-l>", ":bnext<cr>", opts)
keymap("n", "<s-h>", ":bprevious<cr>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)

-- Close bufers
keymap("n", "<s-q>", "<cmd>Bdelete!<cr>", opts)

-- Insert --
-- Press jk fast to exit
keymap("i", "jk", "<Esc>", opts)

-- Visual --
-- Better paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --
-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fp", ":Telescope projects<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", opts)
keymap("x", "<leader>/", "<cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require('dap').toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require('dap').terminate()<cr>", opts)
