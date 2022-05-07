local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
  print("'Telescope' not found.")
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    file_ignore_patterns = {
      ".git",
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
  },
})

-- Enable telescope fzf native
require("telescope").load_extension("fzf")
require("telescope").load_extension("project")
require("telescope").load_extension("frecency")

local keymap = vim.keymap.set

keymap("n", "<leader><space>", require("telescope.builtin").buffers)
keymap("n", "<leader>pf", function()
  require("telescope.builtin").find_files({ previewer = false, hidden = true })
end)
keymap("n", "<leader>sb", require("telescope.builtin").current_buffer_fuzzy_find)
keymap("n", "<leader>sh", require("telescope.builtin").help_tags)
keymap("n", "<leader>st", require("telescope.builtin").tags)
keymap("n", "<leader>sd", require("telescope.builtin").grep_string)
keymap("n", "<leader>sp", require("telescope.builtin").live_grep)
keymap("n", "<leader>pp", ":Telescope project<CR>")
keymap("n", "<leader>so", function()
  require("telescope.builtin").tags({ only_current_buffer = true })
end)
keymap("n", "<leader>bb", ":Telescope frecency<CR>")

