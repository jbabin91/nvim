pcall(require, 'core.globals')
pcall(require, 'core.builtins')
pcall(require, 'core.settings')

vim.defer_fn(function()
  pcall(require, 'core.autocmds')
end, 0)

pcall(require, 'core.keymaps')
