if not pcall(require, "gitsigns") then
  print "Failed loading gitsigns..."
end

require("gitsigns").setup {
  keymaps = {},
  current_line_blame = true,
  current_line_blame_opts = {
    delay = vim.o.updatetime,
  },
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

map("n", "]c", [[<cmd>lua require("gitsigns").next_hunk()<cr>]], opts)
map("n", "[c", [[<cmd>lua require("gitsigns").prev_hunk()<cr>]], opts)


map("n", "<leader>ga", [[<cmd>lua require("gitsigns").stage_hunk()<cr>]], opts)
map("n", "<leader>gr", [[<cmd>lua require("gitsigns").reset_hunk()<cr>]], opts)
map("n", "<leader>gp", [[<cmd>lua require("gitsigns").preview_hunk()<cr>]], opts)
map("n", "<leader>gu", [[<cmd>lua require("gitsigns").undo_stage_hunk()<cr>]], opts)

map("o", "ah", [[<cmd>lua require("gitsigns").select_hunk()<cr>]], opts)
map("v", "ah", [[<cmd>lua require("gitsigns").select_hunk()<cr>]], opts)
