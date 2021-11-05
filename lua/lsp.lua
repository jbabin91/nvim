local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then return end

require("lspconfig").sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

lsp_installer.on_server_ready(function(server)
  local opt = {}
  server:setup {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
  vim.cmd [[ do User LspAttachBuffers ]]
end)


