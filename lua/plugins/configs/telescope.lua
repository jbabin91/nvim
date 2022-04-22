-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

-- Add leader shortcuts
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<Leader><Space>', builtin.buffers)
vim.keymap.set('n', '<Leader>sf', function()
  builtin.find_files { previewer = false }
end)
vim.keymap.set('n', '<Leader>sb', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<Leader>sh', builtin.help_tags)
vim.keymap.set('n', '<Leader>st', builtin.tags)
vim.keymap.set('n', '<Leader>sd', builtin.grep_string)
vim.keymap.set('n', '<Leader>sp', builtin.live_grep)
vim.keymap.set('n', '<Leader>so', function()
  builtin.tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<Leader>?', builtin.oldfiles)
