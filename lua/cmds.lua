local cmd = vim.cmd

cmd [[set whichwrap+=<,>,[,],h,l]]
cmd [[set iskeyword+=-]]
-- cmd [[set formatoptions-=cro]]
cmd [[let &fcs='eob: ']]
cmd [[hi SignColumn guibg=NONE]]
cmd [[set fillchars+=vert:\ ]]
cmd [[set laststatus=0]]
