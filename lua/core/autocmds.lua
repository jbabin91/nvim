local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local fmt_grp = augroup('autoformat_settings', { clear = true })

autocmd('BufWritePre', {
  pattern = '*.ts',
  group = fmt_grp,
  command = 'Neoformat',
})

autocmd('BufWritePre', {
  pattern = '*.lua',
  group = fmt_grp,
  command = 'Neoformat',
})

-- format syntax highlight prisma files like typescript
autocmd('BufNewFile,BufRead', {
  pattern = '*.prisma',
  group = fmt_grp,
  command = 'set syntax=typescript',
})

-- delete trailing whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  group = fmt_grp,
  command = ':%s/\\s\\+$//e',
})

-- disable auto commenting new lines
autocmd('BufWinEnter', {
  command = 'set fo-=cro',
})
