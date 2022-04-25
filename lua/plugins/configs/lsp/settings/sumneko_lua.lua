return {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      version = 'LuaJIT',
      -- Setup your lua path
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      globals = { 'vim', 'PLUGINS' },
    },
    workspace = {
      library = {
        [vim.fn.expand '$VIMRUNTIME/lua'] = true,
        [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
      },
      maxPreload = 2000,
      preloadFileSize = 50000,
    },
    completion = {
      callSnippet = 'both',
    },
    telemetry = {
      enable = false,
    },
  },
}
