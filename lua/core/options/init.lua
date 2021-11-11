vim.cmd("filetype plugin indent on")

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = false
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 5
vim.o.mouse = "a"

vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorcolumn = true
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"

vim.o.tabstop = JB.options.tabwidth
vim.bo.tabstop = JB.options.tabwidth
vim.o.softtabstop = JB.options.tabwidth
vim.bo.softtabstop = JB.options.tabwidth
vim.o.shiftwidth = JB.options.tabwidth
vim.bo.shiftwidth = JB.options.tabwidth
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

-- Disable various builtin plugins in Vim that bogs down speed
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1

vim.opt.dictionary:append("/usr/share/dict/words")
