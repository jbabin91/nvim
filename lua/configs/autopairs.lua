local present, npairs = pcall(require, 'nvim-autopairs')
if not present then
  return
end

npairs.setup({})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local cmp_present, cmp = pcall(require, 'cmp')
if not cmp_present then
  return
end

-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char { tex = '' }}))
