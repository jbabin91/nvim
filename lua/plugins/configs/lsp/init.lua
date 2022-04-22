local present, lsp = pcall(require, 'lsp-zero')
if not present then return end

local function organize_imports()
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = '',
  }
  vim.lsp.buf.execute_command(params)
end

lsp.preset 'recommended'
lsp.nvim_workspace()
lsp.ensure_installed {
  'cssls',
  'dockerls',
  'eslint',
  'html',
  'prismals',
  'sumneko_lua',
  'tailwindcss',
  'tsserver',
  'vimls',
}

lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

lsp.configure('tsserver', {
  flags = {
    debounce_text_changes = 200,
  },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = 'Organize Imports',
    },
  },
})

lsp.configure('jsonls', {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
})

lsp.configure('prismals', {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
})

lsp.setup()
local null_ls = require 'null-ls'
local builtins = null_ls.builtins
null_ls.setup {
  sources = {
    builtins.formatting.stylua,
    builtins.formatting.prismaFmt,
    builtins.formatting.prettierd,
    -- builtins.diagnostics.eslint,
    builtins.completion.spell,
  },
}
vim.keymap.set('n', '<Leader>fm', '<cmd>LspZeroFormat<cr>1<cr><cr>')
