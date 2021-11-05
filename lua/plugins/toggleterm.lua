local status_ok, toggle_term = pcall(require, "toggleterm")

if not status_ok then return end

toggle_term.setup({
  hide_nimbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    border = "curved",
    width = 120,
    height = 40,
    winblend = 3,
    highlight = {
      border = "Normal",
      background = "Normal",
    },
  },
})
