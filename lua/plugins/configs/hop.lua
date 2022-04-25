local present, hop = pcall(require, 'hop')
if not present then
  return
end

hop.setup()
vim.keymap.set('', 's', ':HopChar2<CR>', { silent = true })
vim.keymap.set('', 'S', ':HopWord<CR>', { silent = true })
