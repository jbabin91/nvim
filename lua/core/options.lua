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
  ignorecase = true,
  termguicolors = true,
  mouse = "a", -- Enable your mouse
  clipboard = "unnamedplus", -- Copy paste between vim and everything else
  hidden = true, -- Required to keep multiple buffers open
  showmode = false, -- We don't need to see things like -- INSERT -- anymore
  timeoutlen = 3e3, -- By default timeoutlen is 1000 ms
  tabstop = 2, -- Insert 2 spaces for a tab
  shiftwidth = 2, -- Change the number of space characters inserted for indentions
  expandtab = true, -- Converts tabs to spaces
  conceallevel = 0,
  laststatus = 2, -- Always display the status line
  wrap = true, -- Display long lines as just one line
  linebreak = true,
  list = true,
  listchars = "tab:»·,trail:·", -- "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
  wildmenu = true,
  wildmode = "full",
  autoread = true,
  -- updatetime = 500,
  updatetime = 300, -- Faster completion
  redrawtime = 500,
  --illchars = vim.o.fillchars .. "vert:│",
  undofile = true,
  undodir = vim.fn.stdpath "cache" .. "/undo",
  virtualedit = "onemore",
  guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
  complete = ".,w,b,u,t,k",
  completeopt = "menu,menuone,noinsert,noselect",
  formatoptions = "jtcroql",
  inccommand = "nosplit",
  shortmess = "atIcF",
  isfname = table.concat(
    vim.tbl_filter(function(entry)
      if entry == "=" then
        return false
      else
        return true
      end
    end, vim.split(
      vim.o.isfname,
      ","
    )),
    ","
  ),
  swapfile = false,
  diffopt = "internal,filler,closeoff,algorithm:patience,iwhiteall",
  splitbelow = true, -- Horizontal splits will automatically open below
  splitright = false, -- Vertical splits will automatically open to the right
  backup = false, -- This is recommended by coc
  writebackup = false, -- This is recommended by coc
  cursorline = true,
  cursorcolumn = true,
  emoji = false,
  indentexpr = "nvim_treesitter#indent()",
}

Option.b {
  swapfile = false,
  shiftwidth = 2, -- Change the number of space characters inserted for indentions
  indentexpr = "nvim_treesitter#indent()",
}

Option.w {
  number = true,
  relativenumber = true,
  numberwidth = 1,
  signcolumn = "yes", -- Always show the signcolumn, otherwise it would shift the text each time
  spell = false,
  foldlevel = 99,
  foldmethod = "syntax",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldtext = "v:lua.foldText()",
  linebreak = true,
}

-- old config
-- local g = vim.g
-- local opt = vim.opt

-- GENERAL SETTINGS
-- opt.iskeyword:append "-"
-- opt.formatoptions:remove "crot"
-- opt.sessionoptions:append "globals"

-- opt.hidden = true -- Required to keep multiple buffers open
-- opt.wrap = true -- Display long lines as just one line
-- opt.whichwrap:append "<>[]hl"
-- opt.encoding = "utf-8" -- The encoding displayed
-- opt.pumheight = 10 -- Makes the popup menu smaller
-- opt.fileencoding = "utf-8" -- The encoding written to the file
-- opt.ruler = true -- Show the cursor position all the time
-- opt.cursorline = false
-- opt.cmdheight = 2 -- More space for displaying messages
-- opt.equalalways = false -- Prevent auto balance split size when split
-- opt.mouse = "a" -- Enable your mouse
-- opt.splitbelow = true -- Horizontal splits will automatically open below
-- opt.splitright = false -- Vertical splits will automatically open to the right
-- opt.conceallevel = 0 -- So that I can see `` in markdown files
-- opt.tabstop = 2 -- Insert 2 spaces for a tab
-- opt.shiftwidth = 2 -- Change the number of space characters inserted for indentions
-- opt.smarttab = true -- Makes tabbing smarter (will realize you have 2 vs 4 spaces)
-- opt.expandtab = true -- Converts tabs to spaces
-- opt.smartindent = true -- Makes indenting smart
-- opt.autoindent = true -- Good auto indent
-- opt.laststatus = 2 -- Always display the status line
-- opt.nu = true -- Line numbers
-- opt.rnu = true -- Relative linenumbers
-- opt.cul = false -- Enable highlighting for the current line
-- opt.termguicolors = true
-- opt.background = "dark" -- tell vim what the background color is
-- opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
-- opt.showcmd = true
-- opt.swapfile = false
-- opt.backup = false -- This is recommended by coc
-- opt.writebackup = false -- This is recommended by coc
-- opt.undofile = true
-- opt.undodir = vim.fn.stdpath "cache" .. "/undo"
-- opt.shortmess:append "csI"
-- opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
-- opt.updatetime = 300 -- Faster completion
-- opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms
-- opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else
-- opt.incsearch = true
-- opt.inccommand = "split"
-- opt.switchbuf = "useopen,usetab"
-- opt.completeopt = "menuone,noselect"
-- opt.title = true
-- opt.list = true
-- opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
-- opt.wildignorecase = true
-- opt.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
-- opt.ignorecase = true
-- opt.smartcase = true
-- opt.scrolloff = 8
-- opt.hlsearch = true
-- opt.diffopt = "filler,vertical"
-- opt.backspace = "indent,eol,start"
-- opt.errorbells = false

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
-- opt.fillchars = { eob = " " }

-- vim.g.nvcode_termcolors = 256
-- old config END

-- disable some builtin vim plugins
local disabled_built_ins = {
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

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

return Option
