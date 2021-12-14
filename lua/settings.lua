local settings = {}
-- `utils`                -> Module required or at the beginning of the import file
-- `vim.cmd`              -> Used to execute Vim commands
-- `vim.api.nvim_command` -> Used to execute Neovim commands
-- `utils.opt`            -> Helper functions are used to set various Vim options in global, buffer, and window scope.

function settings.setup()
  local utils = require "utils"
  local opt = utils.opt
  local cmd = vim.cmd
  local indent = 2 -- set indent number

  vim.g.did_load_filetypes = 1
  cmd [[syntax enable]] -- enable syntax highlighting
  cmd [[filetype plugin indent on]]

  -- Buffer options
  opt("b", "expandtab", true) -- convert tabs to spaces
  opt("b", "tabstop", indent) -- insert the number of spaces for a tab
  opt("b", "shiftwidth", indent) -- change the number of space characters inserted for indentation
  opt("b", "softtabstop", indent) -- set the number of columns for a TAB
  opt("b", "smartindent", true)

  -- Global options
  opt("o", "showtabline", indent) -- always show tabline
  opt("o", "autochdir", true) -- change the current working directory whenever opening a file
  opt("o", "autoindent", true) -- enable auto indent
  opt("o", "wrap", true) -- wrap text
  opt("o", "signcolumn", "yes") -- always show the signcolumn, or it would shift the text each time
  opt("o", "hidden", true) -- when off a buffer is unloaded when it is abandoned
  opt("o", "scrolloff", indent) -- minimal number of screen lines to keep above and below the cursor
  opt("o", "shiftround", true) -- round indent to multiple of 'shiftwidth', apply to >, <
  opt("o", "smartcase", true) -- enable smartcase
  opt("o", "smarttab", true) -- enable smarttab
  opt("o", "smartindent", true) -- enable smartindent
  opt("o", "termguicolors", true) -- enable termguicolors
  opt("o", "splitbelow", true) -- horizontal splits will automatically be below
  opt("o", "splitright", true) -- vertical splits will automatically be to the right
  opt("o", "ruler", true) -- show the cursor position all the time
  opt("o", "updatetime", 100) -- faster completion
  opt("o", "timeoutlen", 500) -- time in milliseconds to wait for a mapped sequence to complete
  opt("o", "cmdheight", 1) -- more space for displaying messages, default 1
  opt("o", "completeopt", "menuone,noselect") -- a comma separated list of options for Insert mode completion

  -- Window scope optitons
  opt("w", "number", true) -- display absolute line number
  opt("w", "relativenumber", true) -- enable relative line numbers
  opt("w", "cursorline", true) -- enable highlighting of the current line
  opt("w", "cursorcolumn", true) -- enable highlighting of the current column
  opt("w", "foldmethod", "indent") -- The kind of folding used for the current window
  opt("w", "foldlevel", 99) -- The foldlevel of line
  opt("w", "foldenable", false) -- Disable open all fold
  opt("w", "fillchars", "eob: ") -- Characters to fill the statusline and vertical separators. eob: ~
  opt("w", "listchars", "tab:| ,trail:▫")
  -- Searching
  opt("o", "hlsearch", true) -- enable highlight on search
  opt("o", "incsearch", true) -- enable inline search
  opt("o", "ignorecase", true) -- enable ignore case sensitivity
  opt("o", "smartcase", true) -- enable smart casing

  -- Extras
  opt("o", "list", true) -- enable highlighting of the current line
  opt("o", "textwidth", 0) -- default textwidth
  opt("o", "viewoptions", "cursor,slash,folds,unix") -- default viewoptions

  -- Highlight on yank
  cmd [[au TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]

  -- Clipboard & Mouse
  -- opt("o", "clipboard", "unnamed,unnamedplus")
  opt("o", "mouse", "a")
end

function settings.disable_builtins()
  local disabled_builtins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
  }

  for _, plugin in pairs(disabled_builtins) do
    vim.g["loaded_" .. plugin] = 1
  end
end

return settings
