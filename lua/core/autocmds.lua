-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove whitespace
vim.cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Terminal visual Tweaks
--- enter insert mode when switching to terminal
vim.cmd [[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
]]


