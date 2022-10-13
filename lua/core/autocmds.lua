local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<cr>
      set nobuflisted
    ]])
  end,
})

autocmd({ "FileType" }, {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
-- autocmd({ "BufEnter" }, {
--   pattern = "*",
--   callback = function()
--     vim.cmd([[
--       ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--     ]])
--   end,
-- })

autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd = ")
  end,
})

autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd("quit")
  end,
})

autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd("hi link illuminatedWord LspReferenceText")
  end,
})
