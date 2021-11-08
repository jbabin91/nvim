local cmd = vim.cmd
local utils = require("utils")
local opt = vim.opt

-- Variables
-- vim.g.python3_host_prog = "/home/john/.pyenv/versions/nvim-env/bin/python3"

-- Split direction
opt.splitbelow = true
opt.splitright = false

-- Resize sign column limit
opt.signcolumn = "yes:1"

-- Color line/column
opt.colorcolumn = "9999"
opt.cursorline = true

-- Completion menu
opt.pumheight = 20
opt.pumblend = 10

-- Set encoding
opt.encoding = "utf-8"

-- Hidden buffers to switch buffers without saving
opt.hidden = true

-- Enable mouse support
opt.mouse = "a"

-- Auto read file changes
opt.autoread = true

-- Make last window always have a status line
opt.laststatus = 2

-- Indent
opt.tabstop = 2      -- visual spaces that a tab represents
opt.softtabstop = 2  -- editing spaces that a tab (and its backspace) represent
opt.shiftwidth = 2   -- spaces used in autoindent (<< and >>)
opt.expandtab = true -- turn spaces into tabs?
opt.autoindent = true
opt.smartindent = true

-- Wrap behavior
opt.wrap = false

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Folding (with Treesitter)
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldlevel = 99

-- Set fold method to marker
opt.foldmethod = "marker"

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Faster update time
opt.updatetime = 200

-- Scroll offsets
opt.scrolloff = 5
opt.sidescrolloff = 4

-- Fillchars
opt.fillchars = "diff:╱"
opt.list = true
opt.listchars = { tab = "  " }

-- Jumplist
opt.jumpoptions = "stack"

-- Diff options
-- waiting on: https://github.com/neovim/neovim/pull/14537
-- oddly enough, this option isn't set as a table
opt.diffopt = "filler,vertical,closeoff,internal,indent-heuristic,algorithm:patience"

-- Enable filetype plugin
cmd("filetype plugin indent on")
cmd("set formatoptions-=c")
cmd("set formatoptions-=r")
cmd("set formatoptions-=o")

vim.g.did_load_filetypes = 1

-- Folds
function _G.custom_fold_expr()
  local line = vim.fn.getline(vim.v.foldstart)
  local sub = vim.fn.substitute(line, [[/*|*/|{{{\d=]], "", "g")
  return sub .. " (" .. tostring(vim.v.foldend - vim.v.foldstart) .. " lines)"
end
opt.foldtext = "v:lua.custom_fold_expr()"

-- Highlight text on yank
utils.create_augroup("highlight_on_yank", {
  { "TextYankPost", "*", "silent!", "lua vim.highlight.on_yank()" },
})

-- # vim foldmethod=marker
