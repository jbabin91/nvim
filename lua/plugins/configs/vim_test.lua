local M = {}

M.setup = function()
  vim.g["test#strategy"] = "neovim"
  vim.g["test#neovim#term_position"] = "vsplit"
  vim.api.nvim_set_keymap("n", "<c-space>", "<cmd>TestNearest<cr>", { noremap = true })
end

return M
