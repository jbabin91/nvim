local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

function M.setup()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false, -- disable virutal text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set
  keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
  keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
  keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({ buffer = 0 })<cr>", opts)
  keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({ buffer = 0 })<cr>", opts)
  keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
end

function M.on_attach(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == "sumneko_lua" then
    client.server_capabilities.documentFormattingProvider = false
  end

  lsp_keymaps(bufnr)

  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

return M
