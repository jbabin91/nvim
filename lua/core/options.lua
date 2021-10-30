-- Options
local Option = {}
local Type = { GLOBAL_OPTION = "o", WINDOW_OPTION = "wo", BUFFER_OPTION = "bo" }

local add_options = function(option_type, options)
  if type(options) ~= "table" then
    error 'options should be a type of "table"'
    return
  end
  local vim_option = vim[option_type]
  for key, value in pairs(options) do
    vim_option[key] = value
  end
end

Option.g = function(options)
  add_options(Type.GLOBAL_OPTION, options)
end
Option.w = function(options)
  add_options(Type.WINDOW_OPTION, options)
end
Option.b = function(options)
  add_options(Type.BUFFER_OPTION, options)
end

Option.g {
  -- Sync nvim clipboard with sys clipboard
  clipboard = "unnamedplus",
  -- Highlight line you are on
  cursorline = true,
  -- Enables search results as you type
  incsearch = true,
  -- Enables smart indenting
  smartindent = true,
  -- Time after the buffer is saved
  updatetime = 300,
  -- Enables mouse scroll
  mouse = "a",
  -- Disables swap files
  swapfile = false,
  -- Enables undo files
  undofile = true,
  -- Convert tab to 2 spaces
  tabstop = 2,
  -- Correctly indent lines inside blocks
  shiftwidth = 2,
  -- Enables tab to space conversion
  expandtab = true,
  -- Prefer opening new buffers to the right
  splitright = false,
  -- Prefer opening new buffers below
  splitbelow = true,
  -- Enable nvim set colors
  termguicolors = true,
  -- Enable changin buffers without saving
  hidden = true,
  -- Scroll offset
  scrolloff = 15,
  -- Scroll amount
  scroll = 15,
  -- Ignore case when searching
  ignorecase = true,
  -- Ignore case when searching
  wildignorecase = true,
  -- Search with case sensitive only if search query isn't the same case
  smartcase = true,
  -- Show relative line numbers in the sidebar
  relativenumber = true,
  -- Show sidebar
  signcolumn = "yes",
  -- Show current line number
  number = true,
  -- Disables line wrapping
  wrap = false,
  -- Enable spellcheck
  -- spell = false,
  -- Spell check language
  spelllang = "en",
  -- Don't check if line starts with capital letter
  spellcapcheck = "",
  -- Number of spell suggestions
  spellsuggest = "7",
  -- Support camel case spelling
  spelloptions = "camel",
  -- We don't need to see things like -- INSERT -- anymore
  showmode = false,
  conceallevel = 0,
  list = true,
  listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
  completeopt = "menu,menuone,noinsert,noselect",
  inccommand = "nosplit",
  shortmess = "atIcF",
  backup = false,
  writebackup = false,
}

Option.b {
  shiftwidth = 2, -- Change the number of space characters inserted for indentions
}

Option.w {
  number = true,
  relativenumber = true,
}

vim.g.mapleader = " "

-- TODO: convert to lua
vim.cmd([[
  " Enable syntax
  syntax on
  " Spell file location
  set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
  " Don't continue comment when adding a new line above/under comment 
  autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
]])

if vim.fn.has("termguicolors") == 1 then
  vim.o.termguicolors = true
  vim.cmd "colorscheme one"
end

-- Hide ~ from sign column
vim.cmd("hi EndOfBuffer guifg=#282c34")

-- Skinny buffer separator
vim.cmd("hi VertSplit guibg=NONE")

-- Fix cursor hold
vim.cmd("let g:cursorhold_updatetime = 100")

return Option
