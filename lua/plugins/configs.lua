vim.api.nvim_exec([[autocmd TermOpen * setlocal nonumber norelativenumber nobuflisted signcolumn=auto]], false)
vim.api.nvim_exec([[autocmd FileType help setlocal signcolumn=auto]], false)

-- Set statusbar
require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    -- component_separators = { "", "" },
    -- section_separators = { "", "" },
    disabled_filetypes = {},
  },
  section = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = {
      { "diagnostics", sources = { "nvim_lsp" } },
      "encoding",
      "file;ormat",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { "chadtree", "fugitive", "quickfix", "toggleterm" },
}

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_char_highlight = "LineNr"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_use_treesitter = true
vim.cmd [[set colorcolumn=99999]]

-- Format
-- vim.api.nvim_exec(
--   [[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost *.lua FormatWrite
--   augroup end
-- ]],
--   false
-- )

local function prettier()
  return {
    exe = "prettier",
    args = { vim.api.nvim_buf_get_name(0) },
    stdin = true,
  }
end

require("formatter").setup {
  logging = false,
  filetype = {
    javascript = { prettier },
    javsscriptreact = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier },
    json = { prettier },
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--config-path " .. os.getenv "XDG_CONFIG_HOME" .. "/nvim/stylua.toml",
            "-",
          },
          stdin = true,
        }
      end,
    },
    css = { prettier },
    scss = { prettier },
    graphql = { prettier },
    markdown = { prettier },
  },
}

-- Setup for format.nvim
-- require("format").setup({
--   ["*"] = {{
--     cmd = { "sed -i 's/[ \t]*$//'" }, -- remove trailing whitespace
--   }},
--   -- vim = {{
--   --   cmd = { "luafmt -w replace" },
--   --   start_pattern = "^lua << EOF$",
--   --   end_pattern = "^EOF$"
--   -- }},
--   vimwiki = {{
--     cmd = { "prettier -w --parser babel" },
--     start_pattern = "^{{{javascript$",
--     end_pattern = "^}}}$",
--   }},
--   -- lua = {{
--   --   cmd = { "stylua --indent-type Spaces --indent-width 2 --quote-style 'AutoPreferSingle' -w" },
--   -- }},
--   lua = {{
--     cmd = {
--       function(file)
--         return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
--       end
--     }
--   }},
--   go = {{
--     cmd = { "gofmt -w", "goimports -w" },
--     tempfile_postfix = ".tmp",
--   }},
--   javascript = {{
--     cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" },
--   }},
--   css = {{
--     cmd = { "prettier -w" },
--   }},
--   html = {{
--     cmd = { "prettier -w" },
--   }},
--   json = {{
--     cmd = { "prettier -w" },
--   }},
--   markdown = {
--     { cmd = { "prettier -w" }},
--     {
--       cmd = { "black" },
--       start_pattern = "^```python$",
--       end_pattern = "^```$",
--       target = "current",
--     }
--   },
-- })

-- CHADTree
vim.g.chadtree_settings = {
  ["theme.text_colour_set"] = "nerdtree_syntax_dark",
  ["view.width"] = 30,
}

-- Toggleterm
require("toggleterm").setup {
  -- size can be a number or function which is passed to the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggle buffers
  shade_filetype = {},
  shade_terminals = true,
  shading_factor = "1", -- the degree by which to darken to terminal color, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "float", -- "horizontal",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "single",
    width = 100,
    height = 25,
    winblend = 3,
    highlight = {
      border = "Normal",
      background = "Normal",
    },
  },
}

-- Autopairs setup
require("nvim-autopairs").setup {
  check_ts = true,
}

-- Gitsigns
-- require("gitsigns").setup {
--   signs = {
--     add = { hl = "GitGutterAdd", text = "+" },
--     change = { hl = "GitGutterChange", text = "~" },
--     delete = { hl = "GitGutterDelete", text = "_" },
--     topdelete = { hl = "GitGutterDelete", text = "‾" },
--     changedelete = { hl = "GitGutterChange", text = "~" },
--   },
-- }
require("gitsigns").setup {
  signs = {
    add = {
      hl = "GitSignsAdd",
      text = "│",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
    change = {
      hl = "GitSignsChange",
      text = "│",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      hl = "GitSignsDelete",
      text = "_",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = "‾",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    changedelete = {
      hl = "GitSignsChange",
      text = "~",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
  numhl = false,
  linehl = false,
  keymaps = {},
  watch_index = { interval = 1000, follow_files = true },
  current_line_blame = false,
  current_line_blame_opts = { delay = 1000 },
  sign_priority = 6,
  update_debounce = 200,
  status_formatter = nil, -- Use default
  word_diff = false,
  use_internal_diff = true, -- If luajit is present
}

-- Telescope
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
}

-- Treesitter configuration
-- PArsers must be installded manually via :TSInstall
require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true, -- false will disable the whole extension
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
  autotag = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
