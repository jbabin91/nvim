local configs = {
  'lualine',
  'comment',
  'blankline',
  'gitsigns',
  'telescope',
  'treesitter',
  'lsp',
}

for _, config in ipairs(configs) do
  vim.defer_fn(function()
    pcall(require, 'plugins.configs.' .. config)
  end, 0)
end
