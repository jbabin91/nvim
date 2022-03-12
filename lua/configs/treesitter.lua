-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, nt = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

nt.setup {
  highlight = {
    enable = true,
  },
}
