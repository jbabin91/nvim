local present, context = pcall(require, 'treesitter-context')
if not present then
  return
end

context.setup {
  enable = false,
  throttle = true,
  max_lines = 0,
  patterns = {

  },
}
