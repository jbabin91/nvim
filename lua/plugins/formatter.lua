require('formatter').setup({
logging = false,

filetype = {
    -- C++
    cpp = { function() return {
            exe = "clang-format",
            args = {'-assume-filename=', vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), '-style="{BasedOnStyle: llvm, IndentWidth: 4}"'},
            stdin = true
        } end
    },

    -- C
    c = { function() return {
            exe = "clang-format",
            args = {'-assume-filename=', vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), '-style="{BasedOnStyle: llvm, IndentWidth: 4}"'},
            stdin = true
        } end
    },

    -- Python
    python = { function() return {
            exe = "yapf",
            stdin = true
        } end
    },

    -- Javascript
    javascript = { function() return {
            exe = "js-beautify",
            args = {'--indent-size 4', '--max-preserve-newlines 3'},
            stdin = true
        } end
    }
}

})

-- Mappings

local keymap = vim.api.nvim_set_keymap
keymap('n', '<Space>fm',    '<ESC>:Format<CR>', { noremap=true, silent=true })
