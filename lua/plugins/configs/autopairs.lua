local present, npairs = pcall(require, 'nvim-autopairs')
if not present then
  return
end

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { 'string', 'source' }, -- it will not add a pair on that treesitter node
    javascript = { 'string', 'template_string' },
    java = false,
  },
  disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0, -- Offset from pattern match
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr',
  },
}

-- local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
-- npairs.add_rules({
--   Rule('%', '%', 'lua')
--     :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
--   Rule('$', '$', 'lua')
--     :with_pair(ts_conds.is_not_ts_node({ 'function' })),
-- })
