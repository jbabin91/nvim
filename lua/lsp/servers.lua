local present1, lspconfig = pcall(require, "lspconfig")

if not present1 then return end

local lsp_signature = require "lsp_signature"
local lsp_status = require "lsp-status"

lsp_status.register_progress()

-- Change lsp icons in gutter
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local function on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Add function signature
  lsp_signature.on_attach({
    bind = true,
    handler_opts = {
      border = "single",
    },
    bufnr,
  })

  -- Add statusline support
  lsp_status.on_attach(client)

  -- Mappings
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gk", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "gT", "<CMD>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "[d", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.documentationFormat = {
  "markdown", "plaintext"
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {
  valueSet = { 1 }
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" }
}

local function setup_server(server, config)
  if not config then return end

  if type(config) ~= "table" then config = {} end

  local custom_attach = on_attach
  if no_lsp_formatting[server] then
    custom_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      on_attach(client)
    end
  end

  config = vim.tbl_deep_extend("force", {
    on_attach = custom_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 }
  }, config)

  lspconfig[server].setup(config)
  lspconfig[server].setup(coq.lsp_ensure_capabilities(config))
end

local function setup_servers()
  local lsp_installer = require "nvim-lsp-installer"
  local servers = require "nvim-lsp-installer.servers"
  -- for _, server in pairs(servers) do
    -- setup_server(server)
    lsp_installer.on_server_ready(function(server)
      local opts = {}
      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
    end)
  -- end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "nvim-lsp-installer".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
