local M = {}

M.config = {
  ensure_installed = {},
  ignore_installed = {},
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlight = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = { enable = true, disable = {}}, -- EXPERIMENTAL feature
  -- textobjects = { enable = false }, -- TODO: maybe later
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 2000, -- Do not enable for files with more than 2000 lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of color name strings
  },
  autotag = { enable = true },
}

M.setup = function()
  local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")

  if not status_ok then
    error("There was an issue")
    return
  end

  local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

  parser_configs.http = {
    install_info = {
      url = "https://github.com/NTBBloodbath/tree-sitter-http",
      files = { "src/parser.c" },
      branch = "main"
    }
  }

  treesitter_configs.setup(M.config)
end

return M
