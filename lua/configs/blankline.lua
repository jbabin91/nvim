-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim

local status_ok, blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

blankline.setup {
  char = "▏",
  show_first_indent_level = false,
  filetype_exclude = {
    "help",
    "git",
    "markdown",
    "text",
    "terminal",
    "lspinfo",
    "packer",
  },
  buftype_exclude = {
    "terminal",
    "nofile",
  },
}
