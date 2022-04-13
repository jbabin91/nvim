local present, komment = pcall(require, 'kommentary.config')
if not present then
  return
end

komment.configure_language(
  'default',
  { prefer_single_line_comments = true }
)

komment.use_extended_mappings()
