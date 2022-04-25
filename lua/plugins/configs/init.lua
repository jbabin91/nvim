local configs = {
  'alpha',
  -- 'lualine',
  -- 'comment',
  -- 'blankline',
  -- 'gitsigns',
  -- 'telescope',
  -- 'treesitter',
  -- 'lsp',
}

for _, config in ipairs(configs) do
  pcall(require, 'plugins.configs.' .. config)
end
