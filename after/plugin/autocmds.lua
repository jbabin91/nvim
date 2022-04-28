if vim.fn.has 'nvim-0.7' then
  local api = vim.api
  local agrp = api.nvim_create_augroup
  local acmd = api.nvim_create_autocmd

  -- Highlight on yank
  local yankGrp = agrp('YankHighlight', { clear = true })
  acmd('TextYankPost', {
    group = yankGrp,
    command = 'silent! lua vim.highlight.on_yank({ timeout = 1000 })',
  })

  -- show cursor line only in active window
  local cursorGrp = agrp('CursorLine', { clear = true })
  acmd({ 'InsertLeave', 'WinEnter' }, {
    group = cursorGrp,
    pattern = '*',
    command = 'set cursorline',
  })
  acmd({ 'InsertEnter', 'WinLeave' }, {
    group = cursorGrp,
    pattern = '*',
    command = 'set nocursorline',
  })

  -- go to last loc when opening a buffer
  acmd('BufReadPost', {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
  })

  -- Check if we need to reload the file when it changed
  acmd('FocusGained', {
    command = [[:checktime]],
  })

  -- windows to close with 'q'
  acmd('FileType', {
    pattern = { 'help', 'startuptime', 'qf', 'lspinfo' },
    command = [[nnoremap <buffer><silent> q :close<CR>]],
  })
  acmd('FileType', {
    pattern = 'man',
    command = [[nnoremap <buffer><silent> q :quit<CR>]],
  })

  -- don't auto comment new line
  acmd('BufEnter', {
    command = [[set formatoptions-=cro]],
  })
else
  local cmd = vim.cmd

  -- Highlight on yank
  cmd [[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 1000 })
    augroup END
  ]]

  -- show cursor line only in active window
  cmd [[
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
  ]]

  -- go to last loc when opening a buffer
  cmd [[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
  ]]

  -- Check if we need to reload the file when it changed
  cmd "au FocusGained * :checktime"

  -- windows to close with 'q'
  cmd [[autocmd FileType help,startuptime,qf,lspinfo * nnoremap <buffer><silent> q :close<CR>]]
  cmd [[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]]

  -- don't auto comment new line
  cmd [[autocmd BufEnter * set formatoptions-=cro]]
end
