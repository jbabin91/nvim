--"Whether Maximizer should set default mappings or not:
vim.g.maximizer_set_default_mapping = 0

-- Mappings
vim.api.nvim_set_keymap('n', '<leader>m', ':MaximizerToggle <CR>', {silent=true, noremap=true})
