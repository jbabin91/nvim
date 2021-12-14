local wk = require("which-key")
local utils = require("utils")
local map = utils.map
local opts = { noremap = true, silent = true }

local keymaps = {}

function keymaps.setup()
	-- Map leader to space
	vim.g.mapleader = " "

	map("n", "<C-l>", ":noh<CR>") -- Clear highlights

	-- Insert Mode Bindings
	map("i", "jj", "<Esc>:w<CR>") -- Switch to normal mode and save
	map("i", "<C-o>", "<Esc>o") -- Insert a new line

	-- Save, Quit, and Reload
	map("", "s", "<nop>")
	map("n", "S", ":w<CR>") -- Save
	map("n", "Q", ":q<CR>") -- Quit
	map("n", "R", ":source%<CR>") -- Reload

	-- Navigation
	map("n", "<C-e>", "$") -- (N) Move current cursor to the end of the line
	map("n", "<C-a>", "0") -- (N) Move current cursor to the beginning of the line
	map("v", "<C-e>", "$") -- (V) Move current cursor to the end of the line
	map("v", "<C-a>", "0") -- (V) Move current cursor to the beginning of the line
	map("i", "<C-e>", "<C-o>$") -- (I) Move current cursor to the end of the line
	map("i", "<C-a>", "<C-o>0") -- (I) Move current cursor to the beginning of the line

	-- Increment & Decrement
	map("n", "+", "<C-a>") -- Increment
	map("n", "-", "<C-x>") -- Decrement

	-- Move lines around
	map("n", "<S-Up>", ":m-2<CR>") -- (N) Move current line upward
	map("n", "<S-Down>", ":m+<CR>") -- (N) Move current line downward
	map("i", "<S-Up>", ":m-2<CR>") -- (I) Move current line upward
	map("i", "<S-Down>", ":m+<CR>") -- (I) Move current line downward

	-- Spell Check
	map("", "sc", "<cmd>set spell!<CR>") -- Enable spellcheck

	-- Highlight Search
	map("n", "<leader><CR>", ":nohlsearch<CR>") -- Clear all highlight

	-- Folding
	-- map("n", "<C-z>", "za") -- Fold current function

	----------------------------------------------

	-- Tab
	map("", "tt", "<cmd>tabe<CR>") -- New Tab
	map("", "<leader>-", ":BufferPrevious<CR>") -- Jump to the tab on the left
	map("", "<leader>=", ":BufferNext<CR>") -- Jump to the tab on the right

	-- Window
	map("", "s|", ":set splitright<CR>:vsplit<CR>") -- Split window horizontally
	map("", "s-", ":set splitbelow<CR>:split<CR>") -- Split window vertically
	map("n", "<leader>h", "<C-w>h") -- Move cursor to the left window
	map("n", "<leader>j", "<C-w>j") -- Move cursor to the bottom window
	map("n", "<leader>k", "<C-w>k") -- Move cursor to the up window
	map("n", "<leader>l", "<C-w>l") -- Move cursor to the right window

	----------------------------------------------

	-- Terminal
	-- map("n", "<leader>", ":tabe<CR>:term<CR>")
	map("t", "<Esc>", [['<C-\><C-n>']])

	-- FloatTerm
	map("n", "<C-x>", [[:lua require("FTerm").toggle()<CR>clear<CR>]])
	map("t", "<C-x>", [[<C-\\><C-n><cmd>lua require("FTerm").toggle()<CR>]])

	-- Lazygit
	map("n", "<C-g>", [[:lua require("FTerm").toggle()<CR>lazygit<CR>]])
	map("t", "<C-g>", [[q<C-\\><C-n>lua require("FTerm").toggle()<CR>]])

	-- Fugitive
	wk.register({
		g = {
			name = "Git",
			g = { "<cmd>Git<CR>", "Git Status" },
			d = { "<cmd>Gvdiffsplit!<CR>", "Git Diff" },
			p = { "<cmd>Git pull<CR>", "Git Pull" },
			P = { "<cmd>Git push<CR>", "Git Push" },
		},
	}, {
		prefix = "<leader>",
	})

	-- Ranger
	map("n", "<leader>r", ":RnvimrToggle<CR>") -- Toggle Ranger

	-- Barbar
	wk.register({
		name = "Buffer",
		b = { "<cmd>BufferPick<CR>", "BufferPick" },
		q = { "<cmd>BufferClose<CR>", "BufferClose" },
		o = { "<cmd>BufferOrderByBufferNumber<CR>", "BufferOrder ByNumber" },
		O = { "<cmd>BufferCloseAllButCurrent<CR>", "BufferCloseAll ButCurrent" },
		h = { "<cmd>BufferMovePrevious<CR>", "BufferMove Previous" },
		l = { "<cmd>BufferMoveNext<CR>", "BufferMove Next" },
		H = { "<cmd>BufferCloseBuffersLeft<CR>", "BufferClose Left" },
		L = { "<cmd>BufferCloseBuffersRight<CR>", "BufferClose Right" },
	}, {
		prefix = "<leader>",
	})

	----------------------------------------------

	-- Telescope
	wk.register({
		name = "Find",
		a = { "<cmd>Telescope builtin<CR>", "Telescope Builtin" },
		b = { "<cmd>Telescope buffers<CR>", "Telescope Buffers" },
		l = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Telescope Buffer Search" },
		f = { "<cmd>Telescope find_files<CR>", "Telescope Find Files" },
		g = { "<cmd>Telescope git_commits<CR>", "Telescope Git Commits" },
		h = { "<cmd>Telescope help_tags<CR>", "Telescope Help" },
		j = { "<cmd>Telescope jumplist<CR>", "Telescope Jump List" },
		k = { "<cmd>Telescope keymaps<CR>", "Telescope Keymaps" },
		e = { "<cmd>Telescope find_browser<CR>", "Telescope File Browser" },
		m = { "<cmd>Telescope man_pages<CR>", "Telescope Man Pages" },
		s = { "<cmd>Telescope live_grep<CR>", "Telescope Live Grep" },
	}, {
		prefix = "<leader>",
	})

	map("n", "\\", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
	map("n", "<C-f>", [[<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>]])

	-- Formatter
	wk.register({
		p = { "<cmd>Format<CR>", "Format" },
	}, {
		prefix = "<leader>",
	})
end

function keymaps.buf_register(bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	wk.register({
		l = {
			name = "LSP",

			a = "Code Actions",
			aa = { "<cmd>Telescope lsp_code_actions<CR>", "LSP Code Actions" },
			ar = { "<cmd>lua vim.lsp.buf.rename()<CR>", "LSP Rename" },

			g = "Navigation",
			gr = { "<cmd>Telescope lsp_references<CR>", "LSP References" },
			gi = { "<cmd>Telescope lsp_implementations<CR>", "LSP Implementations" },
			gt = { "<cmd>Telescope lsp_type_definitions<CR>", "LSP Type Definitions" },
			gs = { "<cmd>Telescope lsp_document_symbols<CR>", "LSP Document Symbols" },

			e = "Diagnostics",
			ee = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Diagnostics Show Line" },
			el = { "<cmd>Telescope lsp_document_diagnostics<CR>", "Diagnostics Show Document" },
			ew = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "Diagnostics Show Workspace" },

			w = "Workspace",
			wa = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "LSP Add Workspace Folder" },
			wa = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "LSP Remove Workspace Folder" },
			wa = { "<cmd>Telescope lsp_workspace_symbols<CR>", "LSP Workspace Symbols" },
			wa = { "<cmd>lua print(vim.inpect(vim.lsp.buf.list_workspace_folders()))<CR>", "LSP Workspace Folders" },

			f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP Format" },
		},
	}, {
		prefix = "<leader>",
	})

	buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end

return keymaps
