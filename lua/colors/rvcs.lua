local cmd = vim.cmd

-- To show whitespace, MUST be inserted BEFORE the colorscheme command
cmd([[autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=grey]])
cmd([[colorscheme rvcs]])


