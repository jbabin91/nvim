local present, configs = pcall(require, 'nvim-treesitter.configs')
if not present then
  return
end

configs.setup({
  ensure_installed = 'all', -- one of 'all', 'maintained' (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {},
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { '' }, -- list of languages that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = {
      'css',
      'go',
      'html',
      'lua',
      'python',
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
})
