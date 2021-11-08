local map = require("utils").map
local opt = {}
local M = {}

-- {{{ misc mappings
-- Remap space as leader key
map("", "<Space>", "<nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n", "<leader>v", "<Cmd>Vista!!<CR>")
map("n", "<leader>n", "<Cmd>CHADopen<CR>")
map("n", "<leader>~", ":Dashboard<CR>", opt) -- map show dashboard

-- clipboard mappings
map("n", "<leader>ya", ":%y+<CR>", opt) -- Copy content of entire buffer to system clipboard
map("n", "<leader>yl", '"+yy', opt)     -- yank current line into system clipboard
-- }}}

map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Y yank until the end of the line
map("n", "Y", "y$")

-- Sneak
-- map("n", "<leader>s", "<Plug>Sneak_s")
-- map("n", "<leader>S", "<Plug>Sneak_S")
-- map("x", "<leader>s", "<Plug>Sneak_s")
-- map("x", "<leader>S", "<Plug>Sneak_S")
-- map("o", "<leader>s", "<Plug>Sneak_s")
-- map("o", "<leader>S", "<Plug>Sneak_S")

-- map("", "f", "<Plug>Sneak_f")
-- map("", "F", "<Plug>Sneak_F")
-- map("", "t", "<Plug>Sneak_t")
-- map("", "T", "<Plug>Sneak_T")

-- {{{ autocompletion mappings for cmp
local cmp = require("cmp")
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

-- {{{ gitsigns mappings
M.gitsigns_mappings = {
  noremap = true,
  ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require(\"gitsigns.actions\").next_hunk()<CR>'" },
  ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require(\"gitsigns.actions\").prev_hunk()<CR>'" },

  ["n <leader>gs"] = "<cmd>lua require('gitsigns').stage_hunk()<CR>",
  ["v <leader>gs"] = "<cmd>lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>",
	["n <leader>gu"] = "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>",
	["n <leader>gr"] = "<cmd>lua require('gitsigns').reset_hunk()<CR>",
	["v <leader>gr"] = "<cmd>lua require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>",
	["n <leader>gR"] = "<cmd>lua require('gitsigns').reset_buffer()<CR>",
	["n <leader>gp"] = "<cmd>lua require('gitsigns').preview_hunk()<CR>",
	["n <leader>gb"] = "<cmd>lua require('gitsigns').blame_line(true)<CR>",
	["n <leader>gS"] = "<cmd>lua require('gitsigns').stage_buffer()<CR>",
	["n <leader>gU"] = "<cmd>lua require('gitsigns').reset_buffer_index()<CR>",

	-- Text objects
	["o ih"] = ":<C-U>lua require('gitsigns.actions').select_hunk()<CR>",
	["x ih"] = ":<C-U>lua require('gitsigns.actions').select_hunk()<CR>",
}
-- }}}

-- {{{ buffer management
map("n", "<leader>bh", ":br<CR>")
map("n", "<leader>bk", ":bn<CR>")
map("n", "<leader>bj", ":bp<CR>")
map("n", "<leader>bl", ":bl<CR>")
map("n", "<leader>bd", ":bd<CR>")
-- }}}

-- {{{ window management
map("n", "<leader>h", ":wincmd h<CR>")
map("n", "<leader>j", ":wincmd j<CR>")
map("n", "<leader>k", ":wincmd k<CR>")
map("n", "<leader>l", ":wincmd l<CR>")
-- }}}

-- {{ terminal commands
map("n", "<leader><CR>", ":vs | terminal<CR>i")
map("n", "<leader>\\", ":sp | terminal<CR>i")
map("t", "<C-esc>", "<C-\\><C-n>")
-- }}

-- {{{ telescope keymaps
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fF", ":Telescope file_browser<CR>")
map("n", "<leader>fw", ":Telescope live_grep<CR>")
map("n", "<leader>fg", ":Telescope git_commits<CR>")
map("n", "<leader>fG", ":Telescope git_branches<CR>")

-- Telescope
-- map("n", "<leader>ff", [[<cmd>lua require("telescope.builtin").find_files()<CR>]])
-- map("n", "<leader>fg", [[<cmd>lua require("telescope.builtin").live_grep()<CR>]])
-- map("n", "<leader>fb", [[<cmd>lua require("telescope.builtin").buffers()<CR>]])
-- map("n", "<leader>fh", [[<cmd>lua require("telescope.builtin").help_tags()<CR>]])
-- map("n", "<leader>fz", [[<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>]])
-- map("n", "<leader>bi", [[<cmd>lua require("telescope.builtin").builtin()<CR>]])
-- map("n", "<leader>?", [[<cmd>lua require("telescope.builtin").oldfiles()<CR>]])
-- }}}

-- hop.nvim
map("n", "<leader>aH", ":HopWord<CR>", opt)
map("n", "<leader>ah", ":HopLine<CR>", opt)

return M

-- # vim foldmethod=marker
