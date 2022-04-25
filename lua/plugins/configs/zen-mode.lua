local present, zen_mode = pcall(require, 'zen-mode')
if not present then
  return
end

zen_mode.setup {
  window = {
    backdrop = 1,
    height = 0.9,
    width = 0.85,
    options = {
      signcolumn = 'no',
      number = false,
      relativenumber = false,
    },
  },
  plugins = {
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    twilight = { enabled = true },
  },
}
