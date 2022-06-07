local present, onedark = pcall(require, 'onedark')
if not present then
  return
end

onedark.setup {
  style = 'dark',
}

onedark.load()
