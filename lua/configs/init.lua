local configs = {
  'alpha',
  'autopairs',
  'bufferline',
  'cmp',
  'colorizer',
  'gitsigns',
  'indent',
  'kommentary',
  'lsp',
  'lualine',
  'symbols-outline',
  'telescope',
  'toggleterm',
  'treesitter',
}

for _, source in ipairs(configs) do
  local present, fault = pcall(require, 'configs.' .. source)
  if not present then
    error('Failed to load ' .. source .. '\n\n' .. fault)
  end
end
