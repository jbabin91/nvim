local M = {}

M.colorizer = function()
  local present, colorizer = pcall(require, 'colorizer')
  if present then
    colorizer.setup({ '*' }, {
      RGB = true,          -- #RGB hex code
      RRGGBB = true,       -- #RRGGBB hex codes
      names = true,        -- 'Name' codes like Blue
      RRGGBBAA = true,     -- #RRGGBBAA hex codes
      rgb_fn = true,       -- CSS rgb() and rgba() functions
      hsl_fn = true,       -- CSS hsl() and hsla() functions
      css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode = 'foreground', -- Set the display mode.
    })
    vim.cmd [[ColorizerReloadAllBuffers]]
  end
end

M.fineCmdline = function()
  local present, fineCmdline = pcall(require, 'fine-cmdline')
  if present then
    -- remap ex-commands to floating windows
    vim.api.nvim_set_keymap('n', ':', [[:lua require('fine-cmdline').open()<CR>]], { noremap = true, silent = true })
    fineCmdline.setup({
      cmdline = {
        smart_history = true,
      },
      popup = {
        border = {
          style = 'rounded',
          highlight = 'TelescopeResultsBorder',
        },
      },
    })
  end
end

M.searchbox = function()
  local searchbox = pcall(require, 'searchbox')
  if searchbox then
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    map('n', '/', [[:lua require('searchbox').match_all({clear_matches = true})<CR>]], opts)
    map('n', '<leader>/', [[:lua require('searchbox').replace({confirm = 'menu'})<CR>]], opts)
    map('v', '<leader>/', [[<ESC><cmd>lua require('search').replace({exact = true, visual_mode = true, confirm = 'menu'})<CR>]], opts)
  end
end

M.blankline = function()
  require('indent_blankline').setup({
    show_current_context = true,
    context_patterns = {
      'class',
      'return',
      'functions',
      'method',
      '^if',
      '^while',
      'jsx_element',
      '^for',
      '^object',
      '^table',
      'block',
      'arguments',
      'if_statement',
      'else_clause',
      'jsx_self_closing_element',
      'try_statement',
      'catch_clause',
      'import_statement',
      'operation_type',
    },
    filetype_exclude = {
      'help',
      'terminal',
      'dashboard',
      'packer',
      'lspinfo',
      'TelescopePrompt',
      'TelescopeResults',
    },
    buftype_exclude = { 'terminal' },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  })
end

M.luasnip = function()
  local present, luasnip = pcall(require, 'luasnip')
  if not present then
    return
  end

  luasnip.config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
  })
  require('luasnip/loaders/from_vscode').load()
end

M.signature = function()
  local present, lspsignature = pcall(require, 'lsp_signature')
  if present then
    lspsignature.setup({
      bind = true,
      doc_lines = 2,
      floating_window = true,
      fix_pos = true,
      hint_enable = true,
      hint_prefix = ' ',
      hint_scheme = 'String',
      hi_parameter = 'Search',
      max_height = 22,
      max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
      handler_opts = {
        border = 'single', -- double, single, shadow, none
      },
      zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
      padding = '', -- character to pad on left and right of signature can be ' ', or '|' etc
    })
  end
end

M.comment = function()
  local present, comment = pcall(require, 'Comment')
  if present then
    comment.setup({
      padding = true,
    })
  end
end

M.orgmode = function()
  local present, orgmode = pcall(require, 'orgmode')
  if present then
    orgmode.setup({ '*' }, {
      org_highlight_latex_and_related = 'entities',
      org_agenda_files = '~/org/*',
      org_default_notes_file = '~/org/notes.org',
      org_hide_leading_stars = true,
      org_hide_emphasis_markers = true,
      mappings = {
        global = {
          org_agenda = '<leader>oa',
          org_capture = '<leader>oc',
        },
        agenda = {
          org_agenda_later = 'f',
          org_agenda_earlier = 'b',
          org_agenda_goto_today = '.',
          org_agenda_day_view = 'vd',
          org_agenda_week_view = 'vw',
          org_agenda_month_view = 'vm',
          org_agenda_year_view = 'vy',
          org_agenda_quit = 'q',
          org_agenda_switch_to = '<CR>',
          org_agenda_goto = { '<TAB>' },
          org_agenda_goto_date = 'J',
          org_agenda_redo = 'r',
          org_agenda_todo = 't',
          org_agenda_show_help = '?',
        },
        capture = {
          org_capture_finalize = '<C-c>',
          org_capture_refile = '<leader>or',
          org_capture_kill = '<leader>ok',
          org_capture_show_help = '?',
        },
        org = {
          org_increase_date = '<C-a>',
          org_decrease_date = '<C-x>',
          org_toggle_checkbox = '<C-Space>',
          org_open_at_point = '<leader>oo',
          org_cycle = '<TAB>',
          org_global_cycle = '<S-TAB>',
          org_archive_subtree = '<leader>o$',
          org_set_tags_command = '<leader>ot',
          org_toggle_archive_tag = '<leader>oA',
          org_do_promote = '<<',
          org_do_demote = '>>',
          org_promote_subtree = '<s',
          org_demote_subtree = '>s',
          org_meta_return = '<leader><CR>', -- Add heading, item, or row
          org_insert_heading_respect_content = '<leader>oih', -- Add new heading after current heading block with the same level
          org_insert_todo_heading = '<leader>oiT', -- Add new todo heading right after current heading block on same level
          org_insert_todo_heading_respect_content = '<leader>oit', -- Add new todo heading after current heading block on same level
          org_move_subtree_up = '<leader>oK',
          org_move_subtree_down = '<leader>oJ',
          org_export = '<leader>oe',
          org_next_visible_heading = '}',
          org_previous_visible_heading = '{',
          org_forward_heading_same_level = ']]',
          org_backward_heading_same_level = '[[',
        },
      },
    })
  end
end

return M
