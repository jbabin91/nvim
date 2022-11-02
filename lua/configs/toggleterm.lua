local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true, buffer = 0 }
  vim.keymap.set("t", "<c-h>", [[<c-\><c-n><c-w>h]], opts)
  vim.keymap.set("t", "<c-j>", [[<c-\><c-n><c-w>j]], opts)
  vim.keymap.set("t", "<c-k>", [[<c-\><c-n><c-w>k]], opts)
  vim.keymap.set("t", "<c-l>", [[<c-\><c-n><c-w>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
