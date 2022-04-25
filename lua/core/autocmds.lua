local fn = vim.fn
local agrp = vim.api.nvim_create_augroup
local acmd = vim.api.nvim_create_autocmd

local packer_group = agrp('Packer', { clear = true })
acmd('BufWritePost', {
  command = 'source <afile> | PackerSync',
  group = packer_group,
  pattern = 'plugins/init.lua',
})

local general = agrp('_general_settings', { clear = true })
acmd('FileType', {
  group = general,
  pattern = 'qf,help,man,lspinfo,spectre_panel',
  callback = function()
    vim.keymap.set('n', 'q', ':close<CR>', { noremap = true, silent = true, buffer = true })
  end,
})
-- Don't auto commenting new lines
-- vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
acmd('BufEnter', {
  group = general,
  pattern = '*',
  command = 'set fo-=cro',
})
acmd('FileType', {
  group = general,
  pattern = 'qf',
  command = 'set nobuflisted',
})
acmd('CmdWinEnter', {
  group = general,
  pattern = '*',
  command = 'quit',
})

local bufcheck = agrp('bufcheck', { clear = true })
-- reload config file on change
acmd('BufWritePost', {
  group = bufcheck,
  pattern = vim.env.MYVIMRC,
  command = 'silent source %',
})
-- highlight yanks
acmd('TextYankPost', {
  group = bufcheck,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})
-- sync clipboards
acmd('TextYankPost', {
  group = bufcheck,
  pattern = '*',
  callback = function()
    fn.setreg('+', fn.getreg '*')
  end,
})
-- start terminal in insert mode
acmd('TermOpen', {
  group = bufcheck,
  pattern = '*',
  command = 'startinsert | set winfixheight | setlocl listchars= nonumber norelativenumber nocursorline',
})
-- start git messages in insert mode
acmd('FileType', {
  group = bufcheck,
  pattern = { 'gitcommit', 'gitrebase' },
  command = 'startinsert',
})
-- pager mappings for Manual
acmd('FileType', {
  group = bufcheck,
  pattern = 'man',
  callback = function()
    vim.keymap.set('n', '<Enter>', 'K', { buffer = true })
    vim.keymap.set('n', '<Backspace>', '<C-o>', { buffer = true })
  end,
})
-- Return to last edit position opening files, feedkeys zz centers the buffer, I wonder if there is a better way
acmd('BufReadPost', {
  group = bufcheck,
  pattern = '*',
  callback = function()
    if fn.line '\'"' > 0 and fn.line '\'"' <= fn.line '$' then
      fn.setpos('.', fn.getpos '\'"')
      vim.api.nvim_feedkeys('zz', 'n', true)
    end
  end,
})
-- Remove whitespace
-- vim.cmd [[au BufWritePre * :%s/\s\+$//e]]
-- Strip trailing whitespace
acmd('BufWritePre', {
  group = bufcheck,
  pattern = '*',
  command = '%s/\\s\\+$//e',
})
-- Enable spell checking for certain file types
acmd({ 'BufRead', 'BufNewFile' }, {
  group = bufcheck,
  pattern = { '*.txt', '*.md', '*.tex' },
  command = 'setlocal spell',
})
-- Terminal visual Tweaks
--- enter insert mode when switching to terminal
-- vim.cmd [[
--   autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
-- ]]
-- Git
local git = agrp('_git', { clear = true })
acmd('FileType', {
  group = git,
  pattern = 'gitcommit',
  command = 'setlocal wrap',
})
acmd('FileType', {
  group = git,
  pattern = 'gitcommit',
  command = 'setlocal spell',
})
-- Markdown
local markdown = agrp('_markdown', { clear = true })
acmd('FileType', {
  group = markdown,
  pattern = 'markdown',
  command = 'setlocal wrap',
})
acmd('FileType', {
  group = markdown,
  pattern = 'markdown',
  command = 'setlocal spell',
})
-- vim.cmd [[
--   augroup _auto_resize
--     autocmd!
--     autocmd VimResized * tabdo wincmd =
--   augroup end
--   augroup _alpha
--     autocmd!
--     autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
--   augroup end
--   augroup illuminate_augroup
--     autocmd!
--     autocmd VimEnter * hi link illuminatedWord LspReferenceText
--   augroup END
--  " let ftToEnable = ['java']
--   augroup codelens
--     autocmd!
--     autocmd BufWritePost *.java lua vim.lsp.codelens.refresh()
--   augroup END
--   autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
