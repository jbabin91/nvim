local utils = require "core.utils"

local map = utils.map

vim.g.mapleader = " "

map("n", "<space>", "<nop>")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Don't copy the replaced text after pasting in visual mode
map("v", "p", '"_dP')

-- Comments
map("n", "gcc", "<Plug>kommentary_line_default", {})
map("n", "gc", "<Plug>lommentary_motion_default", {})
map("v", "gcc", "<Plug>kommentary_visual_default", {})

-- Better nav
map("i", "<c-j>", '"\\<c-n>"', { expr = true })
map("i", "<c-k>", '"\\<c-p>"', { expr = true })

-- Buffer nav
map("n", "<Tab>", ":WintabsNext<CR>")
map("n", "<S-Tab>", ":WintabsPrevious<CR>")

-- Window nav
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")
map("n", "<M-h>", ":vertical resize -2<CR>")
map("n", "<M-j>", ":resize -2<CR>")
map("n", "<M-k>", ":resize +2<CR>")
map("n", "<M-l>", ":vertical resize +2<CR>")

-- Use control-c instead of escape
map("n", "<C-c>", "<Esc>")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y, or c behaviour
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- turn off search highlighting
map("n", "<C-n>", ":noh <CR>")

-- you can't stop me!
map("c", "w!!", "w !sudo tee %")
map("c", "ww", "noa w")

-- jumping
map("n", "g[", "<C-o>")
map("n", "g]", "<C-i>")
