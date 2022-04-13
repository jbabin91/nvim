local present, toggleterm = pcall(require, 'toggleterm')
if not present then
  return
end

toggleterm.setup({
  direction = 'float',
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  local map = vim.api.nvim_buf_set_keymap
  map(0, 't', '<Esc>', [[<C-\><C-n>]], opts)
  map(0, 't', 'jk', [[<C-\><C-n]], opts)
  map(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  map(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  map(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  map(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd [[autocmd! TermOpen term://* lua set_terminal_keymaps()]]

local Terminal = require('toggleterm.terminal').Terminal

local opts = { noremap = true, silent = true }

local close_terminal = function(term)
  vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<Cmd>close<Cr>', opts)
end

-- Node.js
local node = Terminal:new({
  cmd = 'node',
  hidden = true,
  on_open = function(term)
    close_terminal(term)
  end,
})

function _NODE_TOGGLE()
  node:toggle()
end

-- Deno
local deno = Terminal:new({
  cmd = 'deno repl',
  hidden = true,
  on_open = function(term)
    close_terminal(term)
  end,
})

function _DENO_TOGGLE()
  deno:toggle()
end

-- gtop
local gtop = Terminal:new({
  cmd = 'gtop',
  hidden = true,
  on_open = function(term)
    close_terminal(term)
  end,
})

function _GTOP_TOGGLE()
  gtop:toggle()
end

-- Lazygit
local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
  on_open = function(term)
    close_terminal(term)
  end,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Python
local cmd_python = 'python'

if vim.fn.has('unix') == 1 then
  cmd_python = 'python3'
end

local python = Terminal:new({
  cmd = cmd_python,
  hidden = true,
  on_open = function(term)
    close_terminal(term)
  end,
})

function _PYTHON_TOGGLE()
  python:toggle()
end

local map = vim.keymap.set

map('n', '<Leader>n', '<Cmd>lua _NODE_TOGGLE()<Cr>', opts)
map('n', '<Leader>d', '<Cmd>lua _DENO_TOGGLE()<Cr>', opts)
map('n', '<Leader>g', '<Cmd>lua _GTOP_TOGGLE()<Cr>', opts)
map('n', '<Leader>l', '<Cmd>lua _LAZYGIT_TOGGLE()<Cr>', opts)
map('n', '<Leader>p', '<Cmd>lua _PYTHON_TOGGLE()<Cr>', opts)
