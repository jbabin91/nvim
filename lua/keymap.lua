local M = {}
local opts = {} -- empty options for maps with no extra options
local g = vim.g

-- {{{ Map function
--[[
    MAPPING:
      map takes 4 args:
        The First is the type, whether in all, noremal, insert etc. (reference: https://github.com/nanotee/nvim-lua-guide#defining-mappings)
        The Second arg is the keybind. Just like normal vim way
        The Third is the command to execute
        The Fourth is other extra options

      Example: (toggles relative line numbers)
        map("n", "<C-n>", ":set rnu!<CR>", opt)
--]]

local function map(mode, bind, exec, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, bind, exec, options)
end
-- }}}
-- {{{ misc bindings
-- Remap space as leader key
map("", "<Space>", "<Nop>")
g.mapleader = " "
g.maplocalleader = " "
map("n", "<C-n>", ":set rnu!<cr>", opts) -- toggle relative line numbers
map("", "<C-c>", ":CommentToggle<cr>", opts) -- toggle comment on current line or selection
map("", "<C-t>", ":NvimTreeToggle<cr>", opts) -- toggle nvimtree
map("n", "<leader>nf", ":Neoformat<cr>", { noremap = true }) -- format current buffer with neoformat
map("n", "<leader>~", ":Dashboard<cr>", opts) -- map show dashboard

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
-- }}}
-- {{{ Autocompletion Mappings for cmp
local cmp = require "cmp"
M.cmp_mappings = {
  ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
  ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-e>"] = cmp.mapping.close(),
  ["<CR>"] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  }),
}
-- }}}
-- {{{ Gitsigns mappings
M.gitsigns_mappings = {
  noremap = true,
  ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
	["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

	["n <leader>gs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
	["v <leader>gs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
	["n <leader>gu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
	["n <leader>gr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
	["v <leader>gr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
	["n <leader>gR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
	["n <leader>gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
	["n <leader>gb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
	["n <leader>gS"] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
	["n <leader>gU"] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

	-- Text objects
	["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
}
-- }}}
-- {{{ buffer management
map("n", "<leader>bh", ":bf<CR>", { noremap = true })
map("n", "<leader>bk", ":bn<CR>", { noremap = true })
map("n", "<leader>bj", ":bp<CR>", { noremap = true })
map("n", "<leader>bl", ":bl<CR>", { noremap = true })
map("n", "<leader>bd", ":bd<CR>", { noremap = true })
-- }}}
-- {{{ window navigation
map("n", "<leader>h", ":wincmd h<CR>", opts)
map("n", "<leader>j", ":wincmd j<CR>", opts)
map("n", "<leader>k", ":wincmd k<CR>", opts)
map("n", "<leader>l", ":wincmd l<CR>", opts)
-- }}}
-- {{{ terminal commands
map("n", "<leader><CR>", ":vs | terminal<CR>i", opts)
map("n", "<leader>\\", ":sp | terminal<CR>i", opts)
map("t", "<C-esc>", "<C-\\><C-n>", opts)
-- }}}
-- {{{ telescope pullup
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
map("n", "<leader>fF", ":Telescope file_browser<CR>", { noremap = true })
map("n", "<leader>fw", ":Telescope live_grep<CR>", { noremap = true })
map("n", "<leader>fg", ":Telescope git_commits<CR>", { noremap = true })
map("n", "<leader>fG", ":Telescope git_branches<CR>", { noremap = true })
-- Add leader shortcuts
map("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<cr>]])
-- map("n", "<leader>sf", [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<cr>]])
map("n", "<leader>sb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]])
map("n", "<leader>sh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]])
map("n", "<leader>st", [[<cmd>lua require('telescope.builtin').tags()<cr>]])
map("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').grep_string()<cr>]])
-- map("n", "<leader>sp", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]])
map("n", "<leader>so", [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]])
map("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]])
-- }}}
-- {{{ hop.nvim
map("n", "<leader>aH", ":HopWord<CR>", opts)
map("n", "<leader>ah", ":HopLine<CR>", opts)
-- }}}
-- Diagnostic keymaps
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>")

return M
