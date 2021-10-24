local g = vim.g
local opt = vim.opt

-- GENERAL SETTINGS
opt.iskeyword:append("-") -- treat dash separated words as a word text object
opt.formatoptions:remove("cro") -- Stops newline continuation of comments
opt.sessionoptions:append("globals")

opt.hidden = true -- Required to keep multiple buffers open
opt.wrap = false -- Display long lines as just one line
opt.whichwrap:append("<>[]hl")
opt.encoding = "utf-8" -- The encoding displayed
opt.pumheight = 10 -- Makes the popup menu smaller
opt.fileencoding = "utf-8" -- The encoding written to the file
opt.ruler = true -- Show the cursor position all the time
opt.cmdheight = 1 -- More space for displaying messages
opt.equalalways = false -- Prevent auto balance split size when split
opt.mouse = "a" -- Enable your mouse
opt.splitbelow = true -- Horizontal splits will automatically open below
opt.splitright = false -- Vertical splits will automatically open to the right
opt.conceallevel = 0 -- So that I can see `` in markdown files
opt.tabstop = 2 -- Insert 2 spaces for a tab
opt.shiftwidth = 2 -- Change the number of space characters inserted for indentions
opt.smarttab = true -- Makes tabbing smarter (will realize you have 2 vs 4 spaces)
opt.expandtab = true -- Converts tabs to spaces
opt.smartindent = true -- Makes indenting smart
opt.autoindent = true -- Good auto indent
opt.laststatus = 2 -- Always display the status line
opt.nu = true -- Line numbers
opt.rnu = true -- Relative linenumbers
opt.cul = true -- Enable highlighting for the current line
opt.termguicolors = true
opt.background = "dark" -- tell vim what the background color is
opt.showmode = false -- We don't need to see things like -- INSERT -- anymore
opt.backup = false -- This is recommended by coc
opt.writebackup = false -- This is recommended by coc
opt.shortmess:append("csI") -- Don't pass messages to |ins-completion-menu|.
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.updatetime = 300 -- Faster completion
opt.timeoutlen = 100 -- By default timeoutlen is 1000 ms
opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else
opt.incsearch = true
opt.switchbuf = "useopen,usetab"
opt.completeopt = "menuone,noselect"
opt.title = true
opt.list = true
opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
opt.wildignorecase = true
opt.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
opt.ignorecase = true
opt.smartcase = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = { eob = " " }

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
  g["loaded_" .. plugin] = 1
end
