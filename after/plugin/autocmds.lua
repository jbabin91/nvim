local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remove all trailing whitespace on save
autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = augroup("TrimWhiteSpaceGrp", { clear = true }),
})

-- Disable auto comment new line
autocmd("BufEnter", {
  command = "set formatoptions-=cro",
})

-- Close nvim if NvimTree is only running buffer
autocmd("BufEnter", {
  command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
})

-- Highlight on yank
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank { timeout = 500 }",
  group = augroup("YankHighlight", { clear = true }),
})

-- Go to last loc when opening a buffer
autocmd("BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
})

-- Windows to close with "q"
autocmd("FileType", {
  command = [[nnoremap <buffer><silent> q :close<CR>]],
  pattern = { "help", "startuptime", "qf", "lspinfo" },
})
autocmd("FileType", {
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  pattern = "man",
})

-- Show cursorline only in active window
local cursorGrp = augroup("CursorLine", { clear = true })
autocmd({ "InsertLeave", "WinEnter" }, {
  command = "set cursorline",
  group = cursorGrp,
  pattern = "*",
})
autocmd({ "InsertEnter", "WinLeave" }, {
  command = "set nocursorline",
  group = cursorGrp,
  pattern = "*",
})

-- Enable spell checking for certain file types
autocmd({ "BufRead", "BufNewFile" }, {
  command = "setlocal spell",
  pattern = { "*.txt", "*.md", "*.tex" },
})
