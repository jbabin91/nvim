local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = '' }
    )
  end

  local config = {
    virtual_text = true,
    signs = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  }

  vim.diagnostic.config(config)

  local borderchars = {
    "┌",
    "─",
    "┐",
    "│",
    "┘",
    "─",
    "└",
    "│",
  }

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = borderchars }
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = borderchars }
  )
end

local function lsp_keymaps(bufnr)
  local opts_keymap = { noremap = true, silent = true }

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local map = vim.api.nvim_buf_set_keymap

  map(
    bufnr,
    'n',
    '<Leader>e',
    [[<Cmd>lua vim.diagnostic.open_float(nil, { border = { '┌' , '─' , '┐' , '│' , '┘' , '─' , '└' , '│' } })<Cr>]],
    opts_keymap
  )
  map(bufnr, 'n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<Cr>', opts_keymap)
  map(bufnr, 'n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<Cr>', opts_keymap)
  map(bufnr, 'n', '<Leader>q', '<Cmd>lua vim.diagnostic.setloclist()<Cr>', opts_keymap)
  map(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<Cr>', opts_keymap)
  map(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<Cr>', opts_keymap)
  map(bufnr, 'n', 'J', '<Cmd>lua vim.lsp.buf.hover()<Cr>', opts_keymap)
  map(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<Cr>', opts_keymap)
  map(bufnr, 'n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<Cr>', opts_keymap)
  map(bufnr, 'n', '<Leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<Cr>', opts_keymap)
  map(bufnr, 'n', '<Leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<Cr>', opts_keymap)
  map(bufnr, 'n', '<Leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<Cr>', opts_keymap)
  map(bufnr, 'n', '<Leader>D', '<Cmd>lua vim.lsp.buf.type_definition()<Cr>', opts_keymap)
  map(bufnr, 'n', '<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<Cr>', opts_keymap)
  map(bufnr, 'n', '<Leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<Cr>', opts_keymap)
  map(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<Cr>', opts_keymap)
  map(bufnr, 'n', '<Leader>f', '<Cmd>lua vim.lsp.buf.formatting()<Cr>', opts_keymap)
end

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]]
      ,false
    )
  end
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local present, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not present then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
