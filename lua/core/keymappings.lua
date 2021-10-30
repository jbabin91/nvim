local utils = require("core.utils")
local map = utils.map

map("", "<space>", "<nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

------------------------------------------------------------------------------------------
----------------------------------- NAVIGATION -------------------------------------------
------------------------------------------------------------------------------------------

-- Rotate between last 2 opened files
map("n", "<leader>ro", "<C-^>")
-- Buffer navigation with hjkl
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

------------------------------------------------------------------------------------------
----------------------------------- BUFFER -----------------------------------------------
------------------------------------------------------------------------------------------

-- Shift buffer size horizontally
map("n", "<C-s>", "<C-w><")
map("n", "<C-a>", "<C-w>>")
-- Remap ESC to also clear search highlight
map("n", "<BS>", ":noh<CR>")
map("n", "<C-n>", ":noh <CR>")
-- Center the next search result in buffer
map("n", "n", "nzzzv")
-- Center the previous search result in buffer
map("n", "N", "Nzzzv")

------------------------------------------------------------------------------------------
----------------------------------- LINE -------------------------------------------------
------------------------------------------------------------------------------------------

-- Go to normal mode with jj
map("i", "jj", "<ESC>")
-- Go to normal mode with jk
map("i", "jk", "<ESC>")
-- Go to normal mode with jk
map("i", "kj", "<ESC>")
-- Go to normal mode with kk
map("i", "kk", "<ESC>")

-- Insert empty line below
map("n", "gj", "o<Esc>'[k")
-- Insert empty line above
map("n", "gk", "O<Esc>j")
-- Delete everything on the line
map("n", "<leader>d", "<S-s><Esc>")
-- Highlight until the end of the line
map("n", "V", "v$")
-- Highlight end of line
map("n", "vv", "V")
-- Remove the line below without visiting it
map("n", "dJ", "jddk")
-- Remove the line above without visiting it
map("n", "dK", "kdd")
-- Inline line by line and keep position
map("n", "J", "mzJ`z")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

------------------------------------------------------------------------------------------
----------------------------------- SPELLCHECK -------------------------------------------
------------------------------------------------------------------------------------------

-- Go to next misspell
map("n", "zn", "]s")
-- Go to previous misspell
map("n", "zp", "[s")
-- Auto select first fix suggestion
map("n", "zf", "z=1<CR> :w<CR> :e<CR>")
-- Opens word fixed suggestions
map("n", "zl", "z=")
-- Go to first misspell, fix it and go back to the end of line in insert mode
map("n", "lf", "[s z=1<CR> :w<CR> :e<CR> A")

------------------------------------------------------------------------------------------
----------------------------------- LSP --------------------------------------------------
------------------------------------------------------------------------------------------

-- Show doc
map("n", "L", "<cmd>lua vim.lsp.buf.hover()<CR>")
-- Show diagnostics
map("n", "K", ":lua vim.diagnostic.open_float(0, { scope='line' })<CR>")
-- Show code actions
map("n", "ga", ":CodeActionMenu<CR>")
-- Rename
map("n", "<leader>rn", " :lua vim.lsp.buf.rename()<CR>")
-- Go to next/previous diagnostic
map("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
map("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")

------------------------------------------------------------------------------------------
----------------------------------- MISC -------------------------------------------------
------------------------------------------------------------------------------------------

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y, or c behaviour
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- ReSource lua file
map("n", "<leader>cw", "g<C-g>")

-- Go to normal mode with ESC in terminal
vim.cmd(":tnoremap <Esc> <C-\\><C-n>")

-- ReSource lua file
map("n", "<leader>rs", ":luafile %<CR>")

-- Resource spell file
map("n", "<leader>sr", ":mkspell ./spell/en.utf-8.add<CR>")

-- Take the word under cursor and put it into a print statement on the line below
function print_word()
    local filetype = vim.bo.filetype

    local current_word = vim.fn.expand("<cword>")
    local current_line = vim.api.nvim_win_get_cursor(0)
    local current_line_number = vim.inspect(current_line[1])

    if filetype == "lua" then
        vim.api.nvim_buf_set_lines(
            0,
            tonumber(current_line_number),
            tonumber(current_line_number),
            false,
            { "print(vim.inspect(" .. current_word .. "))" }
        )

        vim.fn.execute("lua vim.lsp.buf.formatting()")
    elseif
        filetype == "javascript"
        or filetype == "typescript"
        or filetype == "typescriptreact"
        or filetype == "javascriptreact"
    then
        vim.api.nvim_buf_set_lines(
            0,
            tonumber(current_line_number),
            tonumber(current_line_number),
            false,
            { "console.log('" .. tostring(current_word) .. ": ', " .. current_word .. ")" }
        )

        vim.fn.execute("lua vim.lsp.buf.formatting()")
    end
end

map("n", "<leader>wp", ":lua print_word()<CR>")
