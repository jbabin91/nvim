local present, installer = pcall(require, 'nvim-lsp-installer')
if not present then
  return
end

installer.setup {
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
}

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local servers = {
  'bashls',
  'cssls',
  'dockerls',
  'eslint',
  'grammarly',
  'graphql',
  'html',
  'jsonls',
  'prismals',
  'pyright',
  'remark_ls',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
  'vimls',
  'yamlls',
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, buffer)
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = buffer }

  -- Enable completion triggered by <C-X><C-O>
  vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions.
  keymap('n', 'gD', function()
    vim.lsp.buf.declaration()
  end, opts)
  keymap('n', 'gd', function()
    vim.lsp.buf.definition()
  end, opts)
  keymap('n', 'K', function()
    vim.lsp.buf.hover()
  end, opts)
  keymap('n', 'gi', function()
    vim.lsp.buf.implementation()
  end, opts)
  keymap('n', '<C-k>', function()
    vim.lsp.buf.signature_help()
  end, opts)
  keymap('n', '<leader>wa', function()
    vim.lsp.buf.add_workspace_folder()
  end, opts)
  keymap('n', '<space>wl', function()
    vim.lsp.buf.remove_workspace_folder()
  end, opts)
  keymap('n', '<space>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  keymap('n', '<leader>D', function()
    vim.lsp.buf.type_definition()
  end, opts)
  keymap('n', '<leader>rn', function()
    vim.lsp.buf.rename()
  end, opts)
  keymap('n', '<leader>ca', function()
    vim.lsp.buf.code_action()
  end, opts)
  keymap('n', 'gr', function()
    vim.lsp.buf.references()
  end, opts)
  keymap('n', '<leader>f', function()
    vim.lsp.buf.formatting()
  end, opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

lspconfig.tsserver.setup {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'non-relative',
    },
  },
}

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}
