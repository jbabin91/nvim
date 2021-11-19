local cmd = vim.cmd
local keymap = vim.api.nvim_set_keymap
local options = { noremap=true, silent=true }

--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━❰ Plugin-Independent Mapping ❱━━━━━━━━━━━━━--
--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--
-- This config file contains the mapping that don't depend


--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━━━━━━━❰ Bufferline Mappings ❱━━━━━━━━━━━━━━━━━━━--
--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--

-- Move to previous/next
keymap('n', '}}',   ':BufferLineCycleNext<CR>',      options)
keymap('n', '{{',   ':BufferLineCyclePrev<CR>',      options)

-- Re-order to previous/next
keymap('n', '<Leader>.',    ':BufferLineMoveNext<CR>',        options)
keymap('n', '<Leader>,',    ':BufferLineMovePrev<CR>',        options)


-- Close buffer
-- nnoremap <silent>    <A-c> :BufferClose<CR>
keymap('n', '<Leader>q',    ':bd<CR>',        options)

-- Magic buffer-picking mode
keymap('n', '<Leader>?',    ':BufferLinePick<CR>',        options)

-- go to buffer number
keymap('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', options)
keymap('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', options)
keymap('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', options)
keymap('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', options)
keymap('n', '<Leader>5', ':BufferLineGoToBuffer 5<CR>', options)
keymap('n', '<Leader>6', ':BufferLineGoToBuffer 6<CR>', options)
keymap('n', '<Leader>7', ':BufferLineGoToBuffer 7<CR>', options)
keymap('n', '<Leader>8', ':BufferLineGoToBuffer 8<CR>', options)
keymap('n', '<Leader>9', ':BufferLineGoToBuffer 9<CR>', options)

