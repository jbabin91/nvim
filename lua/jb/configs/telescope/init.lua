if not pcall(require, "telescope") then
  print "Failed loading telescope..."
end

local actions = require "telescope.actions"

local function map_uwu(key, cmd)
  for _, keymap in pairs { "<C-p>" .. key, "<C-p>" .. "<C-" .. key .. ">" } do
    vim.api.nvim_set_keymap("n", keymap, cmd, { noremap = true })
  end
end

local function keymaps()
  map_uwu("r", "<cmd>Telescope resume<cr>")

  map_uwu("f", "<cmd>lua require('jb.configs.telescope.find_files').find()<cr>")
  map_uwu("p", "<cmd>lua require('jb.configs.telescope.find_files').git_files()<cr>")
  map_uwu("a", "<cmd>lua require('jb.configs.telescope.find_files').file_browser()<cr>")
  map_uwu("l", "<cmd>lua require('jb.configs.telescope.find_files').current_buffer_fuzzy_find()<cr>")
  map_uwu("o", "<cmd>lua require('jb.configs.telescope.find_files').project()<cr>")
  map_uwu("q", "<cmd>lua require('jb.configs.telescope.find_files').grep()<cr>")
  map_uwu(".q", "<cmd>lua require('jb.configs.telescope.find_files').grep({use_buffer_cwd = true})<cr>")
  map_uwu("h", "<cmd>lua require('jb.configs.telescope.find_files').oldfiles()<cr>")
  map_uwu("b", "<cmd>lua require('jb.configs.telescope.find_files').buffers()<cr>")

  map_uwu("s", "<cmd>lua require('jb.configs.telescope.git').status()<cr>")
  map_uwu("S", "<cmd>lua require('jb.configs.telescope.git').stash()<cr>")

  map_uwu("ws", "<cmd>lua require('jb.configs.telescope.lsp').workspace_symbols()<cr>")
  map_uwu("wd", "<cmd>lua require('jb.configs.telescope.lsp').workspace_diagnostics()<cr>")
end

require("telescope").load_extension "fzf"

require("telescope").setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    prompt_prefix = "  ",
    selection_caret = "  ",
    selection_strategy = "reset",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 161, -- half 27" monitor, scientifically calculated
      },
      horizontal = {
        preview_cutoff = 0,
        preview_width = 0.6,
      },
      vertical = {
        preview_cutoff = 0,
        preview_height = 0.65,
      },
    },
    path_display = { truncate = 3 },
    color_devicons = true,
    winblend = 5,
    set_env = { ["COLORTERM"] = "truecolor" },
    border = {},
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    mappings = {
      i = {
        ["<c-w>"] = function()
          vim.api.nvim_input "<c-s-w>"
        end,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-p>"] = actions.cycle_history_prev,
        ["<c-n>"] = actions.cycle_history_next,
        ["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
      },
    },
  },
  extensions = {
    project = {
      hidden_files = true,
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

keymaps()
