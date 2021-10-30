-- Name: Git Signs
-- Description: Git status in sidebar
-- Link: https://github.com/lewis6991/gitsigns.nvim

local git_signs = require("gitsigns")

local colors = require("utils.colors")
local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

git_signs.setup({
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = '│',
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn'
    },
    change = {
      hl = 'GitSignsChange',
      text = '│',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn'
    },
    delete = {
      hl = 'GitSignsDelete',
      text = '_',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn'
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = '‾',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn'
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = '~',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn'
    } 
  },
  numhl = false,
  linehl = false,
  keymaps = {},
  watch_index = { interval = 1000, follow_files = true },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 300,
  },
  sign_priority = 6,
  status_formatter = nil, -- Use default
  word_diff = false,
  use_internal_diff = true, -- If luajit is present
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

vars.remap.fn("n", "<leader>hR", ":lua require('gitsigns').reset_buffer()<CR>", vars.remap.opts)

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[highlight! GitSignsAdd        guifg=]] .. colors.green)
vim.cmd([[highlight! GitSignsChange     guifg=]] .. colors.orange)
vim.cmd([[highlight! GitSignsDelete     guifg=]] .. colors.red)
