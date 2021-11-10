local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables

-- Map leader to space
g.mapleader = " "

-- Bootstrap Paq when needed
local install_path = fn.stdpath "data" .. "/site/pack/paqs/start/paq-nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path }
end

-- Plugins
require "paq" {
  "f3fora/cmp-spell",
  "EdenEast/nightfox.nvim",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/nvim-cmp",
  "hrsh7th/vim-vsnip",
  "jose-elias-alvarez/null-ls.nvim",
  -- "kyazdani42/nvim-tree.lua",
  "ms-jpq/chadtree",
  "kyazdani42/nvim-web-devicons",
  "lewis6991/gitsigns.nvim",
  "nathom/filetype.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "norcalli/nvim-colorizer.lua",
  "numToStr/Comment.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope.nvim",
  "luukvbaal/stabilize.nvim",
  "nvim-treesitter/nvim-treesitter",
  "octaltree/cmp-look",
  "onsails/lspkind-nvim",
  "p00f/nvim-ts-rainbow",
  "phaazon/hop.nvim",
  "rmagatti/auto-session",
  "savq/paq-nvim",
  "tami5/lspsaga.nvim",
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "wellle/targets.vim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "winston0410/cmd-parser.nvim",
  "winston0410/range-highlight.nvim",
  "dstein64/vim-startuptime",
}

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

-- CHADTree
-- local chadtree_settings = { ... }
-- vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

-- require("nvim-tree").setup()
require("stabilize").setup()
require("Comment").setup()
require("nvim-autopairs").setup()
require("range-highlight").setup()

require("hop").setup()

require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  autotag = {
    enable = true,
    filetypes = {
      "html",
      "javascript",
      "typesciprt",
      "markdown",
    },
  },
}

-- gitsigns setup
require("gitsigns").setup {
  numhl = true,
  signcolumn = false,
}

-- Session
local sessionopts = {
  log_level = "info",
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = nil,
}
--require("auto-seession").setup(sessionopts)

-- LSP this is needed for LSP completions in CSS along with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

local lsp_installer = require "nvim-lsp-installer"

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- (optional) Customize the options passed to the server
  if server.name == "sumneko_lua" then
    -- Custom lua setup
    -- make runtime files discoverable to the server
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    opts.settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique indentifier
        telemetry = {
          enable = false,
        },
      },
    }
  end

  -- This setup() function is exactly the same as lspconfig's setup function
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
  server:setup(opts)
end)

-- LSP Server config
require("lspconfig").cssls.setup {
  settings = {
    scss = {
      lint = {
        idSelector = "warning",
        zeroUnits = "warning",
        duplicateProperties = "warning",
      },
      completion = {
        completePropertyWithSemicolon = true,
        triggerPropertyValueCompletion = true,
      },
    },
  },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
}
require("lspconfig").tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
}

-- LSP Prevents inline buffer annotations
vim.lsp.diagnostic.show_line_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})

-- LSP Saga config & keys https://github.com/glepnir/lspsaga.nvim
local saga = require "lspsaga"
saga.init_lsp_saga {
  code_action_icon = " ",
  definition_preview_icon = "  ",
  diagnostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = "",
}

-- Setup treesitter
local ts = require "nvim-treesitter.configs"
ts.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}

-- Nightfox config
local nightfox = require "nightfox"
nightfox.setup {
  fox = "nordfox",
  alt_nc = true,
  visual = true,
  search = true,
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold",
  },
}
nightfox.load()

-- Good info on overriding colors: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
-- Note had to add the SpecialKey to keep highlight on yank working alongside the CursorLine override
vim.api.nvim_exec(
  [[
  function! MyHighlights() abort
    highlight CursorLine guifg=NONE guibg=#353A54
    highlight CmpItemAbbr guifg=#9FA4B6
    highlight SpecialKey guibg=NONE
    highlight CmpItemKind guifg=#8289A0
    highlight CmpItemMenu guifg=#8289A0
    highlight PmenuSel guibg=#73daca guifg=#111111
    highlight Pmenu guibg=#2E248
    highlight GitSignsAddNr guifg=#26A07A
    highlight GitSignsDeleteNr guifg=#E87D7D
    highlight GitSignsChangeNr guifg=#AD991F
  endfunction
  augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
  augroup END
]],
  true
)

-- This little monkey has to go after termguicolors is set or gets upset
require("colorizer").setup()

-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
-- Source: http:--thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
-- Also I'm adding different sources for completion here, if you aren't on Mac you might need to install "look"
vim.api.nvim_exec(
  [[
augroup markdownSpell
  autocmd!
  autocmd FileType markdown,md,txt setlocal spell
  autocmd BufRead,BufNewFile *.md,*.txt,*.markdown setlocal spell
  autocmd FileType markdown,md,txt lua require'cmp'.setup.buffer {
  \   sources = {
  \     { name = 'spell' },
  \     { name = 'buffer' },
  \     { name = 'look', keyword_length=3 },
  \   },
  \ }
augroup END
]],
  false
)

local function getWords()
  if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
    return tostring(vim.fn.wordcount().words) .. " words"
  else
    return ""
  end
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

-- get colors from Nightfox to use in the words count
local nfColors = require("nightfox.colors").init "nordfox"

-- print(vim.inspect(nfColors))
require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "nightfox",
    component_separators = { " ", " " },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = "" },
      {
        "diff",
        source = diff_source,
        color_added = "#a7c080",
        color_modified = "#ffdf1b",
        color_removed = "#ff6666",
      },
    },
    lualine_c = {
      { "diagnostics", sources = { "nvim_lsp" } },
      function()
        return "%="
      end,
      "filename",
      {
        getWords,
        color = { fg = nfColors["bg_alt"] or "#333333", bg = nfColors["fg"] or "#eeeeee" },
        separator = { left = "", right = "" },
      },
    },
    lualine_x = { "filetype" },
    lualine_y = {
      {
        "progress",
      },
    },
    lualine_z = {
      {
        "location",
        icon = "",
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {
    "quickfix",
  },
}

-- Give me some fenced codeblock goodness
g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }

-- Telescope Global remapping
local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"
require("telescope").setup {
  defaults = {
    winblend = 20,
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 120,
      },
      vertical = {
        preview_cutoff = 40,
        prompt_position = "bottom",
      },
      horizontal = {
        width = 0.9,
        height = 0.8,
      },
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<C-w>"] = "delete_buffer",
        },
        n = {
          ["<C-w>"] = "delete_buffer",
        },
      },
    },
    -- https://gitter.im/nvim-telescope/community?at=6113b874025d436054c468e6 Fabian David Schmidt
    find_files = {
      on_input_filter_cb = function(prompt)
        local find_colon = string.find(prompt, ":")
        if find_colon then
          local ret = string.sub(prompt, 1, find_colon - 1)
          vim.schedule(function()
            local prompt_bufnr = vim.api.nvim_get_current_buf()
            local picker = action_state.get_current_picker(prompt_bufnr)
            local lnum = tonumber(prompt:sub(find_colon + 1))
            if type(lnum) == "number" then
              local win = picker.previewer.state.winid
              local bufnr = picker.previewer.state.bufnr
              local line_count = vim.api.nvim_buf_line_count(bufnr)
              vim.api.nvim_win_set_cursor(win, { math.max(1, math.min(lnum, line_count)), 0 })
            end
          end)
          return { prompt = ret }
        end
      end,
      attach_mappings = function()
        actions.select_default:enhance {
          post = function()
            -- if we found something, go to line
            local prompt = action_state.get_current_line()
            local find_colon = string.find(prompt, ":")
            if find_colon then
              local lnum = tonumber(prompt:sub(find_colon + 1))
              vim.api.nvim_win_set_cursor(0, { lnum, 0 })
            end
          end,
        }
        return true
      end,
    },
  },
}

require("telescope").load_extension "fzy_native"

-------------------- COMMANDS ------------------------------
cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = true}"

local lspkind = require "lspkind"
local cmp = require "cmp"

cmp.setup {
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      maxwidth = 50,
      menu = {
        buffer = "",
        nvim_lsp = "",
        spell = "",
        look = "",
      },
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}

-- Setup lspconfig.
-- Here is the formatting config
local null_ls = require "null-ls"
local lSsources = {
  null_ls.builtins.formatting.prettier.with {
    filetypes = {
      "javascript",
      "typescript",
      "css",
      "scss",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql",
      "md",
      "txt",
    },
  },
  null_ls.builtins.formatting.stylua.with {
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  },
}
require("null-ls").config {
  sources = lSsources,
}
require("lspconfig")["null-ls"].setup {}
-- the duration in there is to stop timeouts on massive files
vim.cmd "autocmd BufWritePost * lua vim.lsp.buf.formatting_seq_sync(nil, 7500)"
