local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('AutoUpdatePlugins', { clear = true })
autocmd('BufWritePost', {
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerSync',
  group = 'AutoUpdatePlugins'
})

augroup('Highlight', { clear = true })
autocmd('TextYankPost', {
  command = 'silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}',
  group = 'Highlight'
})

augroup('RestoreCursorShapeOnExit', { clear = true })
autocmd('VimLeave', {
  command = 'set guicursor=a:hor20',
  group = 'RestoreCursorShapeOnExit'
})

autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = 'tsconfig.json',
  command = 'set filetype=jsonc'
})

augroup('LspNodeModules', { clear = true })
autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*/node_modules/*',
  command = 'lua vim.diagnostic.disable(0)',
  group = 'LspNodeModules'
})
