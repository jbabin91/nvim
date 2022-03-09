if not pcall(require, "vim-test") then
  print "Failed loading vim-test..."
end

vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#term_position"] = "vsplit"

vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>TestNearest<cr>", { noremap = false })
