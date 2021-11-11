JB.utils.plugins.packadd("nvim-treesitter")

require("nvim-treesitter.configs").setup({
  ensure_installed = JB.plugins.treesitter.ensure_installed, -- one of "all", "maintained" (parsers with maintainers), or list of languages
  ignore_install = JB.plugins.treesitter.ignore_install,
  indent = JB.plugins.treesitter.indent,
  highlight = JB.plugins.treesitter.highlight,
  autotag = JB.plugins.treesitter.autotag,
  rainbow = JB.plugins.treesitter.rainbow,
})
