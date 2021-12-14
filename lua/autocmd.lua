local autocmd = {}
local nvim_cmd = vim.api.nvim_command

function autocmd.setup()
  -- set tab display format
  -- nvim_cmd [[
  --   set listchars=tab:\|\ ,trail:▫
  -- ]]

  -- Return to the previous edit position
  nvim_cmd [[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  ]]

  -- enable autosave when exiting insert mode
  -- nvim_cmd [[
  --   autocmd InsertLeave * write
  -- ]]

  -- enable commentstring support
  -- nvim_cmd([[
  -- augroup cmp
  -- autocmd!
  -- autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
  -- augroup END
  -- ]])
end

return autocmd
