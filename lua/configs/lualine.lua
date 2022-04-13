local present, lualine = pcall(require, 'lualine')
if not present then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = '',
    component_separators = '',
    disabled_filetypes = {
      'NvimTree',
      'packer',
      'toggleterm',
      'lsp-installer',
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', icon = '' },
      { 'diff' },
      {
        'diagnostics',
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' ',
        },
      },
    },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})
