local M = {}

local servers = {
  gopls = {},
  html = {},
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
  },
  pyright = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
      },
    },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          globals = { "vim", "PLUGINS" },
          disable =  { "lowercase-globals" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "#VIMRUNTIME/lua/vim/lsp"] = true,
          },
          maxPreload = 2000,
          preloadFileSize = 50000,
        },
        completion = { callSnippet = "Both" },
        telemetry = { enable = false },
      },
    },
  },
  tsserver = { disable_formatting = true },
  vimls = {},
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  -- Configure key mappings
  require("configs.lsp.keymaps").setup(client, bufnr)
  -- Configure highlighting
  require("configs.lsp.highlighter").setup(client)
  -- Configure formatting
  require("configs.lsp.null-ls.formatters").setup(client, bufnr)
  -- Configure for Typescript
  -- if client.name == "tsserver" then
  --   require("configs.lsp.ts-utils").setup(client)
  -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if vim.g.__selected_completion == "cmp" then
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
end

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 250,
  },
}

-- Setup LSP handlers
require("configs.lsp.handlers").setup()

function M.setup()
  -- null-ls
  require("configs.lsp.null-ls").setup(opts)
  -- Installer
  require("configs.lsp.installer").setup(servers, opts)
end

return M
