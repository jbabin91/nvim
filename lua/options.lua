local options = {
  background = 'dark',
  backspace = 'indent,eol,start',
  backup = false,
  clipboard = 'unnamedplus',
  cmdheight = 2,
  -- colorcolumn = '9999',
  completeopt = 'menu,menuone,noselect',
  conceallevel = 0,
  cursorline = true,
  encoding = 'utf-8',
  errorbells = false,
  expandtab = true,
  fileencoding = 'utf-8',
  hidden = true,
  hlsearch = true,
  ignorecase = true,
  incsearch = true,
  mouse = 'a',
  number = true,
  -- numberwidth = 2,
  -- omnifunc = 'syntaxcomplete#Complete',
  pumheight = 10,
  ruler = false,
  relativenumber = true,
  scrolloff = 8,
  shiftwidth = 2,
  showmode = false,
  -- showtabline = 4,
  sidescrolloff = 8,
  signcolumn = 'yes',
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  undofile = false,
  updatetime = 350,
  wrap = false,
  writebackup = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append('c')
vim.g.vim_json_warnings = false


