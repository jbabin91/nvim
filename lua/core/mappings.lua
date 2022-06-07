local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- clear search highlighting with <space>+<space>
keymap('n', '<leader><space>', ':nohlsearch<cr>', opts)

-- find files using telescope command-line sugar.
keymap('n', '<leader>ff', ':Telescope find_files<cr>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<cr>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<cr>', opts)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap('n', '<leader>e', function()
  vim.diagnostic.open_float()
end, opts)
keymap('n', '[d', function()
  vim.diagnostic.goto_prev()
end, opts)
keymap('n', ']d', function()
  vim.diagnostic.goto_next()
end, opts)
keymap('n', '<leader>q', function()
  vim.diagnostic.setloclist()
end, opts)
