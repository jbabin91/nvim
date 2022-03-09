-- Keymaps
-- ---
local function map(mode, bind, exec, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, bind, exec, options)
end
local opts = {}

-- Telescope
map("n", "<Leader><Space>", [[<cmd>lua require("telescope.builtin").buffers()<CR>]])
map("n", "<Leader>sf", [[<cmd>lua require("telescope.builtin").find_files({previewer = false})<CR>]])
map("n", "<Leader>sb", [[<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>]])
map("n", "<Leader>sh", [[<cmd>lua require("telescope.builtin").help_tags()<CR>]])
map("n", "<Leader>st", [[<cmd>lua require("telescope.builtin").tags()<CR>]])
map("n", "<Leader>sd", [[<cmd>lua require("telescope.builtin").grep_string()<CR>]])
map("n", "<Leader>sp", [[<cmd>lua require("telescope.builtin").live_grep()<CR>]])
map("n", "<Leader>so", [[<cmd>lua require("telescope.builtin").tags({only_current_buffer = true})<CR>]])
map("n", "<Leader>?", [[<cmd>lua require("telescope.builtin").oldfiles()<CR>]])
