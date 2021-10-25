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

-- Keymappings
-- Remap space as leader key
vim.api.nvim_set_keymap("", "<space>", "<nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

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

-- Y yank until till end of line
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- Sneak F & T
vim.api.nvim_set_keymap("", "f", "<Plug>Sneak_f", {})
vim.api.nvim_set_keymap("", "F", "<Plug>Sneak_F", {})
vim.api.nvim_set_keymap("", "t", "<Plug>Sneak_t", {})
vim.api.nvim_set_keymap("", "T", "<Plug>Sneak_T", {})
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

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>:Format<cr>", { noremap = true, silent = true })

require("formatter").setup {
  filetype = {
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
  },
}

-- vim.api.nvim_exec([[
--   augroup Format
--     autocmd!
--     autocmd BufWritePost * FormatWrite
--   augroup end
-- ]], false)

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
vim.api.nvim_set_keymap("n", "<leader>v", [[<cmd>CHADopen<CR>]], { noremap = true, silent = true })
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

-- Covenience Mappings
vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>nohlsearch<Bar>diffupdate<CR><C-L>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "y", "ygv<esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "kj", "<esc>", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-q>", [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap("t", "jk", [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap("t", "kj", [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true })
vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", [[<C-W>h]], { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", [[<C-W>j]], { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", [[<C-W>k]], { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", [[<C-W>l]], { noremap = true })

-- Autopairs setup
require("nvim-autopairs").setup {
  check_ts = true,
}

-- Gitsigns
require("gitsigns").setup {
  signs = {
    add = { hl = "GitGutterAdd", text = "+" },
    change = { hl = "GitGutterChange", text = "~" },
    delete = { hl = "GitGutterDelete", text = "_" },
    topdelete = { hl = "GitGutterDelete", text = "‾" },
    changedelete = { hl = "GitGutterChange", text = "~" },
  },
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

-- Add telescope shortcuts
vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
  { noremap = true, silent = true }
)
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>fg",
--   [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>fb",
--   [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>fh",
--   [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
--   { noremap = true, silent = true }
-- )
--
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>fz",
--   [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>ft",
--   [[<cmd>lua require('telescope.builtin').tags()<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>fs",
--   [[<cmd>lua require('telescope.builtin').grep_string()CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>fo",
--   [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>?",
--   [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
--   { noremap = true, silent = true }
-- )

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
