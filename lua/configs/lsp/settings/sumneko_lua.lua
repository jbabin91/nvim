-- Autoinstall
local lsp_installer_servers = require('nvim-lsp-installer.servers')

local present, lua = lsp_installer_servers.get_server('sumneko_lua')
if present then
  if not lua:is_installed() then
    lua:install()
  end
end

-- Settings

return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaIT'
      },
      diagnostics = {
        globals = {
          'vim'
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true)
      },
      telemetry = {
        enable = true
      },
    },
  }
}
