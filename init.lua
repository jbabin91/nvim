local cmd = vim.cmd
local opt = vim.opt
local fn = vim.fn
local g = vim.g
local o = vim.o

-- {{{ Plugins configs
-- Install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.execute("!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. install_path)
end

cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

require("packer").startup({
  function(use)
    use "wbthomason/packer.nvim" -- Package manager
    use "dstein64/vim-startuptime"
    use "lewis6991/impatient.nvim"
    use "nathom/filetype.nvim"
    -- {{{ editing
    use "tpope/vim-surround"
    use "tpope/vim-commentary"
    use "tpope/vim-ragtag"
    use "tpope/vim-repeat"
    use "tpope/vim-unimpaired"
    use "tpope/vim-vinegar"
    use "tpope/vim-endwise"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb" -- Fugitive-companion to interact with github
    use "tpope/vim-markdown"
    -- }}}
    -- use "numToStr/Comment.nvim" -- "gc" to comment visual regions/lines
    use "ludovicchabant/vim-gutentags" -- Automatic tags management
    -- UI to select things (files, grep results, open buffers...)
    use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }}
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" }}
    -- Add indentation guides even on blank lines
    use "lukas-reineke/indent-blankline.nvim"
    use "romgrk/barbar.nvim"
    use "glepnir/dashboard-nvim"
    use "norcalli/nvim-colorizer.lua"
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
    }
    use "folke/which-key.nvim"
    -- Add git related info in the signs columns and popups
    use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }}
    -- {{{ Highlight, edit, and navigate code using a fast incremental parsing library
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "nvim-treesitter/nvim-treesitter-refactor"
    -- }}}
    -- {{{ lsp/autocompletion/snippets
    -- lsp plugins
    use "neovim/nvim-lspconfig"
    use "tami5/lspsaga.nvim"
    use "onsails/lspkind-nvim"
    use "williamboman/nvim-lsp-installer"
    use "windwp/nvim-autopairs"
    -- autocompletion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        -- "hrsh7th/cmp-vsnip",
        -- "hrsh7th/vim-vsnip",
      },
    }
    use "b0o/SchemaStore.nvim"
    -- snippets
    -- use "sirver/ultisnips"
    -- use "quangnguyen30192/cmp-nvim-ultisnips"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    -- }}}
    -- {{{ Themes
    use "mjlbach/onedark.nvim" -- Theme inspired by Atom
    use "sickill/vim-monokai"
    use "morhetz/gruvbox"
    use "shaunsingh/nord.nvim"
    use "sainnhe/gruvbox-material"
    use "sainnhe/everforest"
    use "relastle/bluewery.vim"
    use "haishanh/night-owl.vim"
    use "folke/tokyonight.nvim"
    -- }}}
    -- {{{ misc
    use "jiangmiao/auto-pairs"
    use "github/copilot.vim"
    use "yuttie/comfortable-motion.vim"
    use "mattn/emmet-vim"
    use "editorconfig/editorconfig-vim"
    use "wakatime/vim-wakatime"
    -- }}}
end,
  -- Display packer prompt in the center in a floating window
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({
          style = "minimal",
          border = "none",
        })
      end,
    },
  },
})
-- }}}
-- {{{ Settings
cmd [[syntax enable]] -- syntax highlighting
-- Set highlight on search
o.hlsearch = false
o.number = true -- Make line numbers default
o.rnu = true -- Relative line numbers
o.mouse = "a" -- Enable mouse mode
o.modeline = true -- Enable modlines for files
o.modelines = 5 -- Number of modelines
o.cursorline = true -- Highlight line cursor is in
-- Tab settings
o.tabstop = 2 -- 2 tabstop
o.shiftwidth = 2
o.expandtab = true -- tabs -> spaces
o.smartindent = true -- nice indenting
o.foldmethod = "marker" -- set fold method to marker
-- Enable break indent
o.breakindent = true
-- Backup/Swap files
opt.swapfile = false -- have files saved to swap
opt.undofile = true -- File undo history preserved outside current session
-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true
-- Decrease update time
o.updatetime = 250
opt.signcolumn = "yes"
o.termguicolors = true
-- New win split options
opt.splitbelow = true
opt.splitright = true
-- Set completeopt to have a better completion experience
o.completeopt = "menuone,noselect"
-- }}}

-- {{{ Themes
-- To access the available color schemes, you can type:
-- And type :colorscheme space and press TAB

-- Colorscheme
-- cmd [[colorscheme palenight]]
-- cmd [[colorscheme gruvbox]]
-- cmd [[colorscheme night-owl]]
cmd [[colorscheme onedark]]
-- }}}

-- Set statusbar
require("lualine").setup {
  options = {
    icons_enabled = false,
    theme = "auto",
    component_separators = "|",
    section_separators = "",
  },
}

-- Enable Comment.nvim
-- require("Comment").setup()

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

local opts = {} -- empty options for maps with no extra options
local M = {}
-- }}}
-- {{{ misc bindings
-- Remap space as leader key
map("", "<Space>", "<Nop>")
g.mapleader = " "
g.maplocalleader = " "
map("n", "<C-n>", ":set rnu!<cr>", opts) -- toggle relative line numbers
map("", "<C-c>", ":CommentToggle<cr>", opts) -- toggle comment on current line or selection
map("", "<C-t>", ":NvimTreeToggle<cr>", options) -- toggle nvimtree
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
map("n", "<leader><CR>", ":vs | terminal<CR>i", opt)
map("n", "<leader>\\", ":sp | terminal<CR>i", opt)
map("t", "<C-esc>", "<C-\\><C-n>", opt)
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
map("n", "<leader>aH", ":HopWord<CR>", opt)
map("n", "<leader>ah", ":HopLine<CR>", opt)
-- }}}

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Map blankline
g.indent_blankline_char = "┊"
g.indent_blankline_filetype_exclude = { "help", "packer" }
g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require("gitsigns").setup {
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  }
}

-- Telescope
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
	      ["<C-d>"] = false,
      },
    },
  },
}

-- Enable telescope fzf native
require("telescope").load_extension "fzf"

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
	      ["af"] = "@function.outer",
	      ["if"] = "@function.inner",
	      ["ac"] = "@class.outer",
	      ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
	      ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
	      ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
	      ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
	      ["[]"] = "@class.outer",
      },
    },
  },
}

-- Diagnostic keymaps
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>")

-- vim: ts=2 sts=2 sw=2 et
