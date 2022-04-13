local present, colorizer = pcall(require, 'colorizer')
if not present then
  return
end

colorizer.setup({
  'conf',
  'css',
  'html',
  'javascript',
  'json',
  'jsonc',
  'lua',
  'yaml',
})
